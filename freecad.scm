(define-module (freecad)
  #:use-module ((coin3d) #:select (coin pivy))
  #:use-module ((gnu packages algebra) #:select (eigen))
  #:use-module ((gnu packages boost) #:select (boost))
  #:use-module ((gnu packages compression) #:select (zlib))
  #:use-module ((gnu packages image-processing) #:select (vtk))
  #:use-module ((gnu packages maths) #:select (hdf5 opencascade-oce))
  #:use-module ((gnu packages pkg-config) #:select (pkg-config))
  #:use-module ((gnu packages python) #:select (python-2))
  #:use-module ((gnu packages qt) #:select (qt))
  #:use-module ((gnu packages xml) #:select (xerces-c))
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module ((libarea) #:select (libarea))
  #:use-module ((open-mpi) #:select (open-mpi))
  #:export (freecad))

(define freecad
  (let ((commit "0.18_pre")
        (revision "0"))
    (package
     (name "freecad")
     (version (git-version "0.18_pre" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference (url "https://github.com/FreeCAD/FreeCAD.git")
                           (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wf2h1nc34pvq88hfnyv7zlysavxmqdmfmyp5wz9ky3hlhv72xh0"))))
     (build-system cmake-build-system)
     (inputs `(("boost" ,boost)
               ("coin" ,coin)
               ("eigen" ,eigen)
               ("hdf5" ,hdf5)
               ("libarea" ,libarea)
               ("open-mpi" ,open-mpi)
               ("opencascade-oce" ,opencascade-oce)
               ;; TODO uncomment when pivy is fixed
               ;; ("pivy" ,pivy)
               ("pkg-config" ,pkg-config)
               ("python" ,python-2)
               ("qt" ,qt)
               ("vtk" ,vtk)
               ("xerces-c" ,xerces-c)
               ("zlib" ,zlib)))
     (home-page "http://www.freecadweb.org/")
     (synopsis "Your Own 3D Parametric Modeler")
     (description
      "FreeCAD is a general purpose feature-based, parametric 3D modeler for CAD, MCAD, CAx, CAE and PLM, aimed directly at mechanical engineering and product design but also fits a wider range of uses in engineering, such as architecture or other engineering specialties. It is 100% Open Source (LGPL2+ license) and extremely modular, allowing for very advanced extension and customization.

FreeCAD is based on OpenCASCADE, a powerful geometry kernel, features an Open Inventor-compliant 3D scene representation model provided by the Coin 3D library, and a broad Python API. The interface is built with Qt. FreeCAD runs exactly the same way on Windows, Mac OSX, BSD and Linux platforms.")
     (license license:lgpl2.1+))))

