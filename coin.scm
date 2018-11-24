(define-module (coin)
  #:use-module ((gnu packages version-control) #:prefix vc:)
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (coin))

(define coin
  (let ((commit "e74da184f75b9803e80c3feaf52a9cf2527f7cf8")
        (revision "0"))
    (package
     (name "coin")
     (version (git-version "default" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference (url "https://bitbucket.org/Coin3D/coin")
                           (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kz33gpd77fxfbf6syzr2s2yi9f2jv59ldl5084qz1rlznmgn1ki"))))
     (build-system cmake-build-system)
     (native-inputs `(("mercurial" ,vc:mercurial)))
     (home-page "https://bitbucket.org/Coin3D/coin/wiki/Home")
     (synopsis "Coin3D is a high-level, retained-mode toolkit for effective 3D graphics development. It is API compatible with Open Inventor 2.1.")
     (description
      "Coin is an OpenGL-based, 3D graphics library that has its roots in the
Open Inventor 2.1 API, which Coin still is compatible with.

If you are not familiar with Open Inventor, it is a scene-graph based,
retain-mode, rendering and model manipulation, C++ class library,
originally designed by SGI.  It quickly became the de facto standard
graphics library for 3D visualization and visual simulation software
in the scientific and engineering community after its release.  It
also became the basis for the VRML1 file format standard.  Several
books exists on the subject of Open Inventor, most notably The
Inventor Mentor, and The Inventor Toolmaker, both highly recommended
for those who wants to learn how to use Open Inventor.

Coin is based on the API of this library, but was developed from
scratch independently before SGI Open Inventor became open source.  It
does not share any code with SGI Open Inventor, other than through
random coincidences guided by the Open Inventor API design.  Coin
reached the goal of Open Inventor 2.1 compatibility in the autumn of
the year 2000, and has since then been extended with a huge set of
additional features, ranging from 3D sound support to GLSL shader
support, additional file formats like VRML97, and a large number of
internal changes for keeping up with the newer, more optimized OpenGL
rendering techniques that were not available in the earlier days.

Another term you might find when reading about Coin is \"Coin3D\", which
is the term we use on the larger group of libraries that all fall
under the same license as Coin.  Coin is the core of Coin3D.")
     (license license:bsd-3))))
