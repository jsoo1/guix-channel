(define-module (freecad)
  #:use-module ((gnu packages boost) #:prefix boost:)
  #:use-module ((gnu packages compression) #:prefix compression:)
  #:use-module ((gnu packages maths) #:prefix maths:)
  #:use-module ((gnu packages python) #:prefix python:)
  #:use-module ((gnu packages qt) #:prefix qt:)
  #:use-module ((gnu packages xml) #:prefix xml:)
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
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
       (sha256 (base32 "0wf2h1nc34pvq88hfnyv7zlysavxmqdmfmyp5wz9ky3hlhv72xh0"))))
     (build-system cmake-build-system)
     (inputs `(("boost" ,boost:boost)
               ("opencascade" ,maths:opencascade-oce)
               ("python" ,python:python-2)
               ("qt" ,qt:qt)
               ("xerces-c" ,xml:xerces-c)
               ("zlib" ,compression:zlib)))
     (home-page "http://www.freecadweb.org/")
     (synopsis "Your Own 3D Parametric Modeler")
     (description
      "FreeCAD is a general purpose feature-based, parametric 3D modeler for CAD, MCAD, CAx, CAE and PLM, aimed directly at mechanical engineering and product design but also fits a wider range of uses in engineering, such as architecture or other engineering specialties. It is 100% Open Source (LGPL2+ license) and extremely modular, allowing for very advanced extension and customization.

FreeCAD is based on OpenCASCADE, a powerful geometry kernel, features an Open Inventor-compliant 3D scene representation model provided by the Coin 3D library, and a broad Python API. The interface is built with Qt. FreeCAD runs exactly the same way on Windows, Mac OSX, BSD and Linux platforms.")
     (license license:lgpl2.1+))))

