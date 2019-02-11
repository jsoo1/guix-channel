(define-module (salome)
  #:use-module ((gnu packages maths) #:select (hdf5))
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (medfile))

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
               (delete-file-recursively (string-append out "/bin/testc"))
               #t))))))
    (home-page "https://www.salome-platform.org")
    (synopsis "Library to read and write MED files")
    (description "Library to read and write MED files")
    (license license:lgpl2.1)))
