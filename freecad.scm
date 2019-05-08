(define-module (freecad)
  #:use-module ((coin3d) #:select (coin python-pivy))
  #:use-module ((gnu packages algebra) #:select (eigen))
  #:use-module ((gnu packages boost) #:select (boost))
  #:use-module ((gnu packages compression) #:select (zlib))
  #:use-module ((gnu packages documentation) #:select (doxygen))
  #:use-module ((gnu packages fontutils) #:select (freetype))
  #:use-module ((gnu packages gl) #:select (glew))
  #:use-module ((gnu packages graphviz) #:select (graphviz))
  #:use-module ((gnu packages image-processing) #:select (vtk))
  #:use-module ((gnu packages maths) #:select (hdf5 opencascade-oce))
  #:use-module ((gnu packages mpi) #:select (openmpi))
  #:use-module ((gnu packages pkg-config) #:select (pkg-config))
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module ((gnu packages qt)
                #:select (qt
                          qtbase
                          qtsvg
                          qttools
                          qtxmlpatterns))
  #:use-module ((gnu packages swig) #:select (swig))
  #:use-module ((gnu packages xml) #:select (xerces-c))
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module ((libarea) #:select (libarea))
  #:use-module ((python-pyside)
                #:select (python-pyside-2
                          python-pyside-2-tools
                          python-shiboken-2))
  #:use-module ((salome) #:select (medfile))
  #:export (freecad))

(define freecad
  (let ((commit "f7dccfaa909e5b9da26bf50c4a22ccca9bb10c40")
        (revision "1"))
    (package
      (name "freecad")
      (version (git-version "0.18.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/FreeCAD/FreeCAD.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1v8nx58m60nacvqaynnmhq2nxd4nf4nicmb3078l16g3h47005cg"))))
      (build-system cmake-build-system)
      (inputs
       `(("boost" ,boost)
         ("coin" ,coin)
         ("doxygen" ,doxygen)
         ("eigen" ,eigen)
         ("freetype" ,freetype)
         ("glew" ,glew)
         ("graphviz" ,graphviz)
         ("hdf5" ,hdf5)
         ("libarea" ,libarea)
         ("medfile" ,medfile)
         ("openmpi" ,openmpi)
         ("opencascade-oce" ,opencascade-oce)
         ;; TODO uncomment when pivy is fixed
         ;; ("python-pivy" ,python-pivy)
         ("pkg-config" ,pkg-config)
         ("python-pyside-2" ,python-pyside-2)
         ("python-pyside-2-tools" ,python-pyside-2-tools)
         ("python-shiboken-2" ,python-shiboken-2)
         ("python-wrapper" ,python-wrapper)
         ;; TODO Split up qt
         ("qt" ,qt)
         ;; ("qtbase" ,qtbase)
         ;; ("qtsvg" ,qtsvg)
         ;; ("qttools" ,qttools)
         ;; ("qtxmlpatterns" ,qtxmlpatterns)
         ("swig" ,swig)
         ("vtk" ,vtk)
         ("xerces-c" ,xerces-c)
         ("zlib" ,zlib)))
      (arguments
       `(#:tests? #f
         #:configure-flags '("-DBUILD_QT5=ON")))
      (home-page "http://www.freecadweb.org/")
      (synopsis "Your Own 3D Parametric Modeler")
      (description
       "FreeCAD is a general purpose feature-based, parametric 3D modeler for CAD, MCAD, CAx, CAE and PLM, aimed directly at mechanical engineering and product design but also fits a wider range of uses in engineering, such as architecture or other engineering specialties. It is 100% Open Source (LGPL2+ license) and extremely modular, allowing for very advanced extension and customization.

FreeCAD is based on OpenCASCADE, a powerful geometry kernel, features an Open Inventor-compliant 3D scene representation model provided by the Coin 3D library, and a broad Python API. The interface is built with Qt. FreeCAD runs exactly the same way on Windows, Mac OSX, BSD and Linux platforms.")
      ;; TODO is there more?
      (license license:lgpl2.1+))))
