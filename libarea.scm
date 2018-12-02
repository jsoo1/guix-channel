(define-module (libarea)
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define libarea
  (let ((revision "1")
        (commit "51e67781b6c5e451b2732941ff88fa65797e4b41"))
   (package
    (name "libarea")
    (version (git-version "" revision commit))
    (source
     (origin
      (method git-fetch)
      (uri (git-reference (url "https://github.com/Heeks/libarea.git")
                          (commit commit)))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0wf2h1nc34pvq88hfnyv7zlysavxmqdmfmyp5wz9ky3hlhv72xh0"))))
    (build-system cmake-build-system)
    (inputs `(("python-wrapper" ,python-wrapper)))
    (home-page "https://github.com/Heeks/libarea")
    (synopsis
     "Library and python module for pocketing and profiling operations")
    (description
     "Area is a CAM-related software for pocketing operation.

This project provides library and associated python-module to compute pocket operations.

Written by Dan Heeks danheeks@gmail.com, derived from the kbool library written by Klaas Holwerda")
    (license license:bsd-3))))
