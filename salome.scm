(define-module (salome)
  #:use-module (gnu packages)
  #:use-module ((gnu packages boost) #:select (boost-for-mysql))
  #:use-module ((gnu packages check) #:select (cppunit))
  #:use-module ((gnu packages documentation) #:select (doxygen))
  #:use-module ((gnu packages graphviz) #:select (graphviz))
  #:use-module ((gnu packages maths) #:select (hdf5))
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module ((gnu packages python-xyz) #:select (python-numpy
                                                    python-scipy))
  #:use-module ((gnu packages sphinx) #:select (python-sphinx))
  #:use-module ((gnu packages swig) #:select (swig))
  #:use-module ((gnu packages tls) #:select (openssl))
  #:use-module ((gnu packages xml) #:select (libxml2))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (medfile salome-kernel smesh))

(define medfile
  (package
    (name "medfile")
    (version "3.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://files.salome-platform.org/Salome/other/med-"
             version ".tar.gz"))
       (sha256
        (base32
         "1215sal10xp6xirgggdszay2bmx0sxhn9pgh7x0wg2w32gw1wqyx"))))
    (build-system cmake-build-system)
    (inputs `(("hdf5" ,hdf5)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'remove-test-output
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (delete-file-recursively
                (string-append out "/bin/testc"))
               #t))))))
    (home-page "https://www.salome-platform.org")
    (synopsis "Library to read and write MED files")
    (description "Library to read and write MED files")
    (license license:lgpl2.1)))

;; Use outdated version that is included in freecad's source
(define smesh
  (let ((commit "976def5878c6e3905816b97c67d6eadccc39673d")
        (revision "1"))
    (package
      (name "smesh")
      (version "8.3.0")
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url
            (string-append "https://git.salome-platform.org/gitpub/"
                           "modules/smesh.git"))
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1i4qks6v8ydar0nh5i5fz2b7zgnppcssh77vgpv51mvrsq2h9gj7"))))
      (build-system cmake-build-system)
      (inputs
       `(("salome-configuration" ,salome-configuration)
         ("salome-kernel" ,salome-kernel)))
      (arguments
       `(#:configure-flags
         (list
          (string-append
           "-DCONFIGURATION_ROOT_DIR="
           (assoc-ref %build-inputs "salome-configuration"))
          (string-append
           "-DKERNEL_ROOT_DIR="
           (assoc-ref %build-inputs "salome-kernel")))))
      (home-page "https://www.salome-platform.org")
      (synopsis "SALOME Mesh module")
      (description "The goal of this module is to create meshes on the basis of geometrical models created or imported into GEOM. It uses a set of meshing algorithms and their corresponding conditions (hypotheses) to compute meshes. In addition, a new mesher can be easily connected to this module by using the existing plugin mechanism.")
      (license license:lgpl2.1))))

;; ----------------------- PRIVATE DEPENDENCIES -----------------------

(define salome-configuration
  (let ((commit "de7bac0ee58007a9501fffa7c1488de029b19cdc")
        (revision "1"))
    (package
      (name "salome-configuration")
      (version "9.3.0")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url
                (string-append
                 "https://git.salome-platform.org/gitpub/"
                 "tools/configuration.git"))
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ng9igy6fp84hn60ifw5b97ww5gkfbfmk5dxp1z3n09q2vx4jdir"))))
      (build-system trivial-build-system)
      (arguments
       `(#:modules ((guix build union))
         #:builder
         (begin
           (use-modules (guix build union))
           (union-build (assoc-ref %outputs "out")
                        (list (assoc-ref %build-inputs "source")))
           #t)))
      (home-page "https://www.salome-platform.org")
      (synopsis "Configuration files and other utilities for SALOME platform")
      (description "Configuration files and other utilities for SALOME platform")
      (license license:lgpl2.1))))

(define salome-kernel
  (let ((commit "e4e3b4b5f80c31944ba1f62f9f56f43edb9a6c01")
        (revision "1"))
    (package
      (name "salome-kernel")
      (version "9.3.0")
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url
            (string-append
             "https://git.salome-platform.org/gitpub/"
             "modules/kernel.git"))
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1yrgp4k4xwi9ng0wjfahqw2q5b6fdxb0m28rp8v1azvnqrnwcg84"))))
      (build-system cmake-build-system)
      (inputs
       `(;; Salome wants boost 1.58 and this is the closest we have
         ("boost-for-mysql" ,boost-for-mysql)
         ("cppunit" ,cppunit)
         ("doxygen" ,doxygen)
         ("graphviz" ,graphviz)
         ("hdf5" ,hdf5)
         ("libxml2" ,libxml2)
         ("omniorb" ,omniorb)
         ("omniorbpy" ,omniorbpy)
         ("python-numpy" ,python-numpy)
         ("python-scipy" ,python-scipy)
         ("python-sphinx" ,python-sphinx)
         ("python-wrapper" ,python-wrapper)
         ("salome-configuration" ,salome-configuration)
         ("swig" ,swig)))
      (arguments
       `(#:configure-flags
         (list
          (string-append
           "-DBOOST_ROOT_DIR="
           (assoc-ref %build-inputs "boost-for-mysql"))
          (string-append
           "-DLIBXML2_ROOT_DIR="
           (assoc-ref %build-inputs "libxml2"))
          (string-append
           "-DLIBXML2_INCLUDE_DIR="
           (assoc-ref %build-inputs "libxml2")
           "/include")
          (string-append
           "-DPYTHONINTERP_ROOT_DIR="
           (assoc-ref %build-inputs "python-wrapper")
           "/bin")
          (string-append
           "-DPYTHONLIBS_ROOT_DIR="
           (assoc-ref %build-inputs "python-wrapper")
           "/lib")
          (string-append
           "-DCONFIGURATION_ROOT_DIR="
           (assoc-ref %build-inputs "salome-configuration"))
          (string-append
           "-DSWIG_ROOT_DIR="
           (assoc-ref %build-inputs "swig"))
          (string-append
           "-DOMNIORB_ROOT_DIR="
           (assoc-ref %build-inputs "omniorb"))
          (string-append
           "-DOMNIORBPY_ROOT_DIR="
           (assoc-ref %build-inputs "omniorbpy"))
          (string-append
           "-DOMNIORBPY_INCLUDE_DIR="
           (assoc-ref %build-inputs "omniorbpy")
           "/include")
          (string-append
           "-DOMNIORB_PYTHON_BACKEND="
           (assoc-ref %build-inputs "omniorbpy"))
          (string-append
           "-DCPPUNIT_ROOT_DIR="
           (assoc-ref %build-inputs "cppunit"))
          ;; TODO: Patch paths in salome-configuration so sphinx works
          "-DSALOME_BUILD_DOC=OFF"
          (string-append
           "-DSPHINX_ROOT_DIR="
           (assoc-ref %build-inputs "python-sphinx"))
          (string-append
           "-DSPHINX_EXECUTABLE="
           (assoc-ref %build-inputs "python-sphinx")
           "/bin/sphinx-build"))
         ;; FIXME
         #:validate-runpath? #f))
      (home-page "https://www.salome-platform.org")
      (synopsis "SALOME Kernel module")
      (description "SALOME Kernel module")
      (license license:lgpl2.1))))

(define omniorb
  (package
    (name "omniorb")
    (version "4.2.3")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://sourceforge.net/projects/omniorb/files/omniORB/"
         "omniORB-" version "/omniORB-" version ".tar.bz2/download"))
       (sha256
        (base32
         "1jlb0wps6311dmhnphn64gv46z0bl8grch4fd9dcx5dlib02lh96"))))
    (build-system gnu-build-system)
    (inputs
     `(("python-wrapper" ,python-wrapper)
       ("openssl" ,openssl)))
    (arguments
     `(#:tests? #f
       ;; FIXME
       #:validate-runpath? #f))
    (home-page "http://www.omniorb-support.com/index.html")
    (synopsis
     "Robust high performance CORBA ORB for C++ and Python")
    (description
     "omniORB is a robust high performance CORBA ORB for C++ and Python. It is freely available under the terms of the GNU Lesser General Public License (for the libraries), and GNU General Public License (for the tools). omniORB is largely CORBA 2.6 compliant")
    (license license:gpl2+)))

(define omniorbpy
  (package
    (name "omniorbpy")
    (version "4.2.3")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://sourceforge.net/projects/omniorb/files/omniORBpy/"
         "omniORBpy-" version "/omniORBpy-" version ".tar.bz2/download"))
       (sha256
        (base32
         "1jlb0wps6311dmhnphn64gv46z0bl8grch4fd9dcx5dlib02lh96"))))
    (build-system gnu-build-system)
    (inputs
     `(("python-wrapper" ,python-wrapper)))
    (arguments
     `(#:tests? #f
       ;; FIXME
       #:validate-runpath? #f))
    (home-page "http://www.omniorb-support.com/index.html")
    (synopsis
     "Robust high performance CORBA ORB for C++ and Python")
    (description
     "omniORB is a robust high performance CORBA ORB for C++ and Python. It is freely available under the terms of the GNU Lesser General Public License (for the libraries), and GNU General Public License (for the tools). omniORB is largely CORBA 2.6 compliant")
    (license license:lgpl2.0+)))
