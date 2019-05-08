(define-module (coin3d)
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages documentation) #:select (doxygen))
  #:use-module ((gnu packages gl) #:select (freeglut))
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module ((gnu packages qt) #:select (qt))
  #:use-module ((gnu packages swig) #:select (swig))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module ((guix git-download) #:select (git-file-name))
  #:use-module (guix hg-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (coin pivy soqt))

(define coin
  (let ((changeset "e74da184f75b9803e80c3feaf52a9cf2527f7cf8")
        (revision "1"))
    (package
      (name "coin")
      (version (string-append "3.1.2-" revision "." (string-take changeset 7)))
      (source
       (origin
         (method hg-fetch)
         (uri (hg-reference (url "https://bitbucket.org/Coin3D/coin")
                            (changeset changeset)))
         (sha256
          (base32 "1429d00zl766ysdchjdrmlylh70g4jqqxas26079lwrwqxzx3x0s"))
         (file-name (git-file-name "coin" version))))
      (build-system cmake-build-system)
      (inputs `(("freeglut" ,freeglut)
                ("doxygen" ,doxygen)))
      (home-page "https://bitbucket.org/Coin3D/coin/wiki/Home")
      (synopsis
       "Coin3D is a high-level, retained-mode toolkit for effective 3D graphics development. It is API compatible with Open Inventor 2.1.")
      (description
       "Coin is a 3D graphics library with an Application Programming Interface
based on the Open Inventor 2.1 API.  For those who are not familiar with
Open Inventor, it is a scene-graph based retain-mode rendering and model
interaction library, written in C++, which has become the de facto
standard graphics library for 3D visualization and visual simulation
software in the scientific and engineering community.")
      (license license:bsd-3))))

(define soqt
  (let ((changeset "ea5cd76460872aa33716993c0642d6bcb77c22bd")
        (revision "1"))
    (package
      (name "soqt")
      (version (string-append "1.5.0-" revision "." (string-take changeset 7)))
      (source
       (origin
         (method hg-fetch)
         (uri (hg-reference (url "https://bitbucket.org/Coin3d/soqt")
                            (changeset changeset)))
         (sha256
          (base32
           "0ap3l4mc6akpkyncp4r44bg2csmdhh9nxbb9ac1j5dd6lqv3vgad"))
         (file-name (git-file-name "soqt" version))))
      (build-system cmake-build-system)
      (inputs `(("coin" ,coin)
                ("doxygen" ,doxygen)
                ("freeglut" ,freeglut)
                ("qt" ,qt)))
      (arguments `(#:tests? #f))
      (home-page "https://bitbucket.org/Coin3D/soqt")
      (synopsis
       "SoQt is a Qt GUI component toolkit library for Coin.")
      (description
       "SoQt is a Qt GUI component toolkit library for Coin.  It is also compatible
with SGI and TGS Open Inventor, and the API is based on the API of the
InventorXt GUI component toolkit.")
      (license license:bsd-3))))

(define pivy
  (let ((changeset "db2e64a4a8803f4fbbcb4e03efaf37e5f988bcec")
        (revision "1"))
    (package
      (name "pivy")
      (version (string-append "0.6.4" revision "." (string-take changeset 7)))
      (source
       (origin
         (method hg-fetch)
         (uri (hg-reference (url "https://bitbucket.org/Coin3D/pivy")
                            (changeset changeset)))
         (sha256
          (base32 "0rmsgf6y9mn6kh0hqn4f1rnif8vf418indbz00czxclh2bd1wb8p"))
         (file-name (git-file-name "pivy" version))))
      (build-system python-build-system)
      (inputs `(("cmake" ,cmake)
                ("coin" ,coin)
                ("qt" ,qt)
                ("soqt" ,soqt)
                ("swig" ,swig)))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'build 'add-missing-fake-headers
             (lambda _
               (let ((missing-fake-headers
                      '("cassert"
                        "cstdarg"
                        "cstddef")))
                 (with-directory-excursion "fake_headers"
                   (for-each (lambda (filename)
                               (call-with-output-file filename
                                 (lambda (p) (display "" p))))
                             missing-fake-headers)))
               #t)))))
      (home-page "https://bitbucket.org/Coin3D/pivy")
      (synopsis "Pivy provides Python bindings to Coin3D.")
      (description "")
      (license license:bsd-3))))
