(define-module (coin3d)
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module ((guix git-download) #:select (git-file-name))
  #:use-module (guix hg-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (coin
            pivy))

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
        (base32 "157r08grsnyf8vkdzk48cib2pgjcnp1f4yh2br9wk6p27m9a0gr5"))
       (file-name (git-file-name "coin" version))))
     (build-system cmake-build-system)
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
       (sha256))))))
