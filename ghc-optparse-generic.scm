(define-module (ghc-optparse-generic)
  #:use-module (gnu packages haskell)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-optparse-generic))

(define ghc-only
  (package
    (name "ghc-only")
    (version "0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/Only/Only-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0rdj3a629fk2vp121jq8mf2smkblrz5w3cxhlsyx6my2x29s2ymb"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/Only")
    (synopsis
      "The 1-tuple type or single-value \"collection\"")
    (description
      "This package provides a canonical anonymous 1-tuple type missing from Haskell for attaching typeclass instances. . NOTE: There is also the </package/OneTuple OneTuple package> which by using a boxed @data@-type provides a 1-tuple type which has laziness properties which are more faithful to the ones of Haskell's native tuples; whereas the primary purpose of 'Only' is to provide the traditionally so named type-wrapper for attaching typeclass instances.")
    (license license:bsd-3)))

(define ghc-optparse-generic
  (package
    (name "ghc-optparse-generic")
    (version "1.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/optparse-generic/optparse-generic-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "13rr3hq26dpmbami8vb6d1ig9ywk6jia22sp5dkp6jkfc1c9k4l0"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-system-filepath" ,ghc-system-filepath)
        ("ghc-only" ,ghc-only)
        ("ghc-optparse-applicative" ,ghc-optparse-applicative)
        ("ghc-void" ,ghc-void)
        ("ghc-semigroups" ,ghc-semigroups)))
    (home-page
      "http://hackage.haskell.org/package/optparse-generic")
    (synopsis
      "Auto-generate a command-line parser for your datatype")
    (description
      "This library auto-generates an optparse-applicative-compatible Parser from any data type that derives the Generic interface.

See the documentation in \"Options.Generic\" for an example of how to use this library")
    (license license:bsd-3)))

