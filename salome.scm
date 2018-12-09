(define-module (salome)
  #:use-module ((gnu packages maths) #:select (hdf5))
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (lib-med-file))

(define lib-med-file
  (package
   (name "lib-med-file")
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
   (home-page "https://www.salome-platform.org")
   (synopsis "")
   (description "")
   (license license:lgpl2.1)))
