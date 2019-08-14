(define-module (ghc-system)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-directory
            ghc-optional-args
            ghc-process
            ghc-time
            ghc-turtle))

(define ghc-directory
  (package
    (name "ghc-directory")
    (version "1.3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/directory/directory-"
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

(define-public ghc-optional-args
  (package
    (name "ghc-optional-args")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/optional-args/optional-args-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1r5hhn6xvc01grggxdyy48daibwzi0aikgidq0ahpa6bfynm8d1f"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/optional-args")
    (synopsis "Optional function arguments")
    (description
     "This library provides a type for specifying `Optional` function arguments

Read the tutorial in \"Data.Optional\" to learn more")
    (license license:bsd-3)))

(define ghc-process
  (package
    (name "ghc-process")
    (version "1.6.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/process/process-"
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
             "https://hackage.haskell.org/package/time/time-"
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

(define ghc-turtle
  (package
    (name "ghc-turtle")
    (version "1.5.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/turtle/turtle-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1124yhw0l8924cwkmap1qn2z0hf4vn3r73h4pmi9icahg8zpc1hg"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
       ("ghc-async" ,ghc-async)
       ("ghc-clock" ,ghc-clock)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-foldl" ,ghc-foldl)
       ("ghc-hostname" ,ghc-hostname)
       ("ghc-managed" ,ghc-managed)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-system-filepath" ,ghc-system-filepath)
       ("ghc-system-fileio" ,ghc-system-fileio)
       ("ghc-temporary" ,ghc-temporary)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-optional-args" ,ghc-optional-args)
       ("ghc-unix-compat" ,ghc-unix-compat)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (home-page
     "http://hackage.haskell.org/package/turtle")
    (synopsis "Shell programming, Haskell-style")
    (description
     "turtle is a reimplementation of the Unix command line environment in Haskell so that you can use Haskell as both a shell and a scripting language. Features include:

  * Batteries included: Command an extended suite of predefined utilities.
  * Interoperability: You can still run external shell commands.
  * Portability: Works on Windows, OS X, and Linux.
  * Exception safety: Safely acquire and release resources.
  * Streaming: Transform or fold command output in constant space.
  * Patterns: Use typed regular expressions that can parse structured values.
  * Formatting: Type-safe printf-style text formatting.
  * Modern: Supports text and system-filepath.

Read \"Turtle.Tutorial\" for a detailed tutorial or \"Turtle.Prelude\" for a quick-start guide. turtle is designed to be beginner-friendly, but as a result lacks certain features, like tracing commands.  If you feel comfortable using turtle then you should also check out the Shelly library which provides similar functionality.")
    (license license:bsd-3)))
 
(define-public ghc-managed
  (package
    (name "ghc-managed")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/managed/managed-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1kbrw99yh5x5blykmx2n88mplbbi4ss1ij5j17b7asw6q0ihm9zi"))))
    (build-system haskell-build-system)
    (home-page "http://hackage.haskell.org/package/managed")
    (synopsis "A monad for managed values")
    (description
     "In Haskell you very often acquire values using the with... idiom using functions of type (a -> IO r) -> IO r.  This idiom forms a Monad, which is a special case of the ContT monad (from transformers) or the Codensity monad (from kan-extensions).  The main purpose behind this package is to provide a restricted form of these monads specialized to this unusually common case. . The reason this package defines a specialized version of these types is to:

  * be more beginner-friendly,
  * simplify inferred types and error messages, and:
  * provide some additional type class instances that would otherwise be orphan instances")
    (license license:bsd-3)))
