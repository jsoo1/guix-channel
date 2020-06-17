(define-module (ghc-system)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-directory
            ghc-optional-args
            ghc-process
            ghc-time))

(define ghc-directory
  (package
    (name "ghc-directory")
    (version "1.3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/directory/directory-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0nr0lwpi20slgqc22br9ldrs57573irqbck8am0pz0gz3yvmqis3"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/directory")
    (synopsis
     "Platform-agnostic library for filesystem operations")
    (description
     "This library provides a basic set of operations for manipulating files and directories in a portable way.")
    (license license:bsd-3)))

(define ghc-process
  (package
    (name "ghc-process")
    (version "1.6.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/process/process-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0a04jch13d0va47yhkf1ni7pk9hxsdr3m4h8645r4qs0mzvsby60"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/process")
    (synopsis "Process libraries")
    (description
     "This package contains libraries for dealing with system processes. The typed-process package is a more recent take on a process API, which uses this package internally. It features better binary support, easier concurrency, and a more composable API. You can read more about it at https://haskell-lang.org/library/typed-process.")
    (license license:bsd-3)))

(define ghc-time
  (package
    (name "ghc-time")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/time/time-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "05d0n44rwpqkjkns9nlgw2gpfv643a0bzp9cx97az0wmn31618nx"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
       ("ghc-random" ,ghc-random)))
    (home-page "https://github.com/haskell/time")
    (synopsis "A time library")
    (description "Time, clocks and calendars")
    (license license:bsd-3)))
