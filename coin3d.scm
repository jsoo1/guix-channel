(define-module (coin3d)
  #:use-module ((gnu packages boost) #:select (boost))
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages documentation) #:select (doxygen))
  #:use-module ((gnu packages gl) #:select (freeglut glew))
  #:use-module ((gnu packages graphics) #:select (coin3D soqt))
  #:use-module ((gnu packages graphviz) #:select (graphviz))
  #:use-module ((gnu packages llvm) #:select (libcxx))
  #:use-module ((gnu packages qt) #:select (qtbase))
  #:use-module ((gnu packages swig) #:select (swig))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module ((guix git-download) #:select (git-file-name))
  #:use-module (guix hg-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (python-pivy))

(define python-pivy
  (let ((changeset "db2e64a4a8803f4fbbcb4e03efaf37e5f988bcec")
        (revision "1"))
    (package
      (name "python-pivy")
      (version
       (string-append "0.6.5a0" revision "." (string-take changeset 7)))
      (source
       (origin
         (method hg-fetch)
         (uri (hg-reference (url "https://bitbucket.org/Coin3D/pivy")
                            (changeset changeset)))
         (sha256
          (base32
           "0rmsgf6y9mn6kh0hqn4f1rnif8vf418indbz00czxclh2bd1wb8p"))
         (file-name (git-file-name "pivy" version))))
      (build-system python-build-system)
      (inputs
       `(("coin3D" ,coin3D)
         ("glew" ,glew)
         ("qtbase" ,qtbase)
         ("soqt" ,soqt)))
      (native-inputs
       `(("cmake" ,cmake)
         ("doxygen" ,doxygen)
         ("graphviz" ,graphviz)
         ("swig" ,swig)))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'build 'patch-swig-headers
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((soqt (assoc-ref inputs "soqt"))
                     (coin (assoc-ref inputs "coin3D")))

                 (with-directory-excursion "fake_headers"
                   (for-each
                    (lambda (filename)
                      (call-with-output-file filename
                        (lambda (p) (display "" p))))
                    '("cassert" "cstdarg" "cstddef")))

                 (substitute*
                  "setup.py"
                  (("(^[[:space:]]+)if module == \"soqt\":" all space)
                   (string-append
                    all "\n    " space
                    "INCLUDE_DIR = '" soqt "/include\""
                    " -I\"" coin "/include"
                    "'"))))
               #t)))))
      (home-page "https://bitbucket.org/Coin3D/pivy")
      (synopsis "Python bindings to Coin3D.")
      (description "Pivy provides Python bindings to Coin3D.")
      (license license:bsd-3))))
