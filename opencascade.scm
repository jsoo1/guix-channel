(define-module (opencascade)
  #:use-module (gnu packages)
  #:use-module ((gnu packages fontutils) #:select (freetype))
  #:use-module ((gnu packages image-processing) #:select (vtk))
  #:use-module ((gnu packages maths) #:select (hdf5))
  #:use-module ((gnu packages tcl) #:select (tcl))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (opencascade-occt))

;; Behind login - Probably don't want
(define opencascade-occt
  (let ((revision "1")
        (commit "e1c158598a585694ad769cde5fe705a23dd586f0"))
    (package
      (name "opencascade-occt")
      (version "7.3.0p3")
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "gitolite@git.dev.opencascade.org:occt")
           (commit commit)))
         (file-name (git-file-name name revision))
         (sha256
          (base32
           "0ncnjsx7jyq9vbv86di8bgr632lnbgydvbyh0y71wy396x0ay2lh"))))
      (build-system cmake-build-system)
      (inputs
       `(("freetype" ,freetype)
         ("tcl" ,tcl)))
      (home-page "https://dev.opencascade.org")
      (synopsis "The Open Source 3D Modeling Libraries")
      (description
       "Open CASCADE Technology (OCCT) is a software development kit (SDK) intended for development of applications dealing with 3D CAD data or requiring industrial 3D capabilities. It includes a set of C++ class libraries providing services for 3D surface and solid modeling, CAD data exchange, and visualization. Originally developed as industrial CAD kernel, OCCT is widely used for development of specialized software dealing with 3D models in design (CAD), manufacturing (CAM), numerical simulation (CAE), measurement equipment (CMM), and quality control (CAQ) domains")
      (license license:lgpl2.1+))))
