(define-module (salome)
  #:use-module (gnu packages)
  #:use-module ((gnu packages boost) #:select (boost-for-mysql))
  #:use-module ((gnu packages check) #:select (cppunit))
  #:use-module ((gnu packages compression) #:select (zlib))
  #:use-module ((gnu packages documentation) #:select (doxygen))
  #:use-module ((gnu packages graphviz) #:select (graphviz))
  #:use-module ((gnu packages image-processing) #:select (vtk))
  #:use-module ((gnu packages maths) #:select (hdf5
                                               opencascade-oce))
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module ((gnu packages python-xyz) #:select (python-numpy))
  #:use-module ((gnu packages python-science) #:select (python-scipy))
  #:use-module ((gnu packages qt) #:select (python-pyqt
                                            python-sip
                                            qtbase
                                            qwt))
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
  #:use-module ((guix utils) #:select (version-major+minor))
  #:export (salome-geom salome-smesh))

(define salome-smesh
  (let ((commit "4e9fa6a7f415f8dfa6f72a4b638faf91c3770d01")
        (revision "1"))
    (package
      (name "salome-smesh")
      (version "9.3.0")
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
           "0ncnjsx7jyq9vbv86di8bgr632lnbgydvbyh0y71wy396x0ay2lh"))))
      (build-system cmake-build-system)
      (inputs
       `(("boost-for-mysql" ,boost-for-mysql)
         ("cppunit" ,cppunit)
         ;; TODO: use normal module lookup when merged
         ("gfortran" ,(@ (gnu packages gcc) gfortran))
         ("hdf5" ,hdf5)
         ("libxml2" ,libxml2)
         ("omniorb" ,omniorb)
         ("omniorbpy" ,omniorbpy)
         ("python-wrapper" ,python-wrapper)
         ("salome-configuration" ,salome-configuration)
         ("salome-geom" ,salome-geom)
         ("salome-kernel" ,salome-kernel)
         ("swig" ,swig)
         ("zlib" ,zlib)))
      (arguments
       `(#:configure-flags
         (list
          (string-append
           "-DCONFIGURATION_ROOT_DIR="
           (assoc-ref %build-inputs "salome-configuration"))
          (string-append
           "-DKERNEL_ROOT_DIR="
           (assoc-ref %build-inputs "salome-kernel"))
          (string-append
           "-DGEOM_ROOT_DIR="
           (assoc-ref %build-inputs "salome-geom"))
          ;; not needed for freecad?
          "-DSALOME_BUILD_GUI=OFF"
          ;; TODO: Fix salome-configuration sphinx resolution
          "-DSALOME_BUILD_DOC=OFF"
          )))
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
       `(#:modules ((guix build union)
                    (guix build utils))
         #:builder
         (let ((out (assoc-ref %outputs "out")))
           (use-modules (guix build union)
                        (guix build utils))
           (copy-recursively (assoc-ref %build-inputs "source") out)
           ;; Assume we are using oce for all salome packages
           (substitute*
               (string-append out "/cmake/FindSalomeOpenCASCADE.cmake")
             (("OpenCASCADE") "OCE"))
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
           "/include/libxml2")
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

(define salome-geom
  (let ((commit "aa818f57a9421a3777f1849926f70df77a446c0d")
        (revision "1"))
    (package
      (name "salome-geom")
      (version "9.3.0")
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url
            (string-append
             "https://git.salome-platform.org/gitpub/"
             "modules/geom.git"))
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0phm2xbvhs25hzc081j8zxypl7v8izbsnsw6mxwb7qjz2434nzdr"))))
      (build-system cmake-build-system)
      (inputs
       `(("boost-for-mysql" ,boost-for-mysql)
         ("doxygen" ,doxygen)
         ("graphviz" ,graphviz)
         ("hdf5" ,hdf5)
         ("libxml2" ,libxml2)
         ("omniorb" ,omniorb)
         ("omniorbpy" ,omniorbpy)
         ("opencascade-oce-0.18.3" ,opencascade-oce-0.18.3)
         ("python-wrapper" ,python-wrapper)
         ("qtbase" ,qtbase)
         ("salome-configuration" ,salome-configuration)
         ("salome-kernel" ,salome-kernel)
         ("swig" ,swig)
         ("vtk" ,vtk)))
      (arguments
       `(#:configure-flags
         (list
          (string-append
           "-DCONFIGURATION_ROOT_DIR="
           (assoc-ref %build-inputs "salome-configuration"))
          (string-append
           "-DKERNEL_ROOT_DIR="
           (assoc-ref %build-inputs "salome-kernel"))
          (string-append
           "-DOPENCASCADE_ROOT_DIR="
           (assoc-ref %build-inputs "opencascade-oce-0.18.3")
           "/lib/oce-0.18")
          (string-append
           "-DVTK_DIR="
           (assoc-ref %build-inputs "vtk"))
          "-DSALOME_BUILD_GUI=OFF")))
      (home-page "https://www.salome-platform.org")
      (synopsis "SALOME GEOM module")
      (description "SALOME GEOM module")
      (license license:lgpl2.1))))

(define salome-gui
  (let ((commit "7c60cc16008a1ee6a5c2ab9271ec31e7c8819dd5")
        (revision "1"))
    (package
      (name "salome-gui")
      (version "9.3.0")
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url
            (string-append
             "https://git.salome-platform.org/gitpub/"
             "modules/gui.git"))
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1n9dnvwapy8qaiczckb4svkid7njh8bi9a8j40j2lyi91f263s5i"))))
      (build-system cmake-build-system)
      (inputs
       `(("boost-for-mysql" ,boost-for-mysql)
         ("hdf5" ,hdf5)
         ("libxml2" ,libxml2)
         ("omniorb" ,omniorb)
         ("omniorbpy" ,omniorbpy)
         ("opencascade-oce" ,opencascade-oce)
         ("python-numpy" ,python-numpy)
         ("python-pyqt" ,python-pyqt)
         ("python-sip" ,python-sip)
         ("python-wrapper" ,python-wrapper)
         ("qtbase" ,qtbase)
         ("qwt" ,qwt)
         ("salome-configuration" ,salome-configuration)
         ("salome-kernel" ,salome-kernel)
         ("swig" ,swig)
         ("vtk" ,vtk)))
      (home-page "https://www.salome-platform.org")
      (synopsis "SALOME GUI module")
      (description "SALOME GUI module")
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
         "mirror://sourceforge/omniorb/omniORB/"
         "omniORB-" version "/omniORB-" version ".tar.bz2"))
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
    (home-page "http://www.omniorb-support.com")
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
         "mirror://sourceforge/omniorb/omniORBpy/"
         "omniORBpy-" version "/omniORBpy-" version ".tar.bz2"))
       (sha256
        (base32
         "1rdfq2ghc98sh8lvlvxlay04d73ky98bx8ap8cr68xkwwn41hq2w"))))
    (build-system gnu-build-system)
    (inputs
     `(("omniorb" ,omniorb)
       ("python-wrapper" ,python-wrapper)))
    (arguments
     `(#:tests? #f
       #:configure-flags
       (list
        (string-append
         "--with-omniorb=" (assoc-ref %build-inputs "omniorb")))))
    (home-page "http://www.omniorb-support.com")
    (synopsis
     "Robust high performance CORBA ORB for Python")
    (description
     "omniORB is a robust high performance CORBA ORB for and Python. It is freely available under the terms of the GNU Lesser General Public License (for the libraries), and GNU General Public License (for the tools). omniORB is largely CORBA 2.6 compliant")
    (license license:lgpl2.0+)))

;; TODO: See if this effects us:
;; https://github.com/tpaviot/oce/issues/592
;; Some includes are pointing to the build dir
(define opencascade-oce-0.18.3
  (package
    (inherit opencascade-oce)
    (version "0.18.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tpaviot/oce.git")
             (commit (string-append "OCE-" version))))
       (file-name (git-file-name "opencascade-oce" version))
       (sha256
        (base32 "17wy8dcf44vqisishv1jjf3cmcxyygqq29y9c3wjdj983qi2hsig"))))))
