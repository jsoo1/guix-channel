(define-module (ghc-aws-lambda-haskell-runtime)
  #:use-module (ghc-system)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public ghc-aws-lambda-haskell-runtime
  (package
    (name "ghc-aws-lambda-haskell-runtime")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/"
             "aws-lambda-haskell-runtime/aws-lambda-haskell-runtime-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0q8x5zqxql403wm9ndii42lac8737i0qhd7p7nsy3i2sswfr5gry"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-http-client" ,ghc-http-client)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-path" ,ghc-path)
       ("ghc-path-io" ,ghc-path-io-1.5)
       ("ghc-safe-exceptions-checked" ,ghc-safe-exceptions-checked)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)))
    (home-page
     "https://github.com/theam/aws-lambda-haskell-runtime#readme")
    (synopsis "Haskell runtime for AWS Lambda")
    (description
     "Please see the README on GitHub at
https://github.com/theam/aws-lambda-haskell-runtime#readme")
    (license license:asl2.0)))

(define-public ghc-safe-exceptions-checked
  (package
    (name "ghc-safe-exceptions-checked")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/"
             "safe-exceptions-checked/safe-exceptions-checked-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0gyaq2pf87dqn0l6n3mi0qamf99y3zj5xxh513c0iqwdh8mma1yq"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-safe-exceptions" ,ghc-safe-exceptions)))
    (native-inputs `(("ghc-hspec" ,ghc-hspec)))
    (arguments
     `(#:cabal-revision
       ("3"
        "004id0k46j545zvkldfcv5qjgxzl35brm9h6fq72y43b9hl2y55f")))
    (home-page
     "https://github.com/mitchellwrosen/safe-exceptions-checked#readme")
    (synopsis "Safe, checked exceptions")
    (description
     "Machinery for throwing and catching both pure and impure
synchronous exceptions. Based on
<https://www.well-typed.com/blog/2015/07/checked-exceptions/
Lightweight Checked Exceptions> by Edsko de Vries and Adam Gundry.")
    (license license:bsd-3)))

(define-public ghc-path-io-1.5
  (package
    (name "ghc-path-io")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/path-io/path-io-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "16zgi2a7g3mc9rslshjm86q4c3rr9vrd8qcjw753ndpar05j41bf"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-directory" ,ghc-directory)
       ("ghc-dlist" ,ghc-dlist)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-path" ,ghc-path)
       ("ghc-temporary" ,ghc-temporary)
       ("ghc-unix-compat" ,ghc-unix-compat)))
    (native-inputs `(("ghc-hspec" ,ghc-hspec)))
    (arguments
     `(#:cabal-revision
       ("1"
        "127x8jhx2illj2r5x8f2g4yfl1idfngxmzphfr45abdf024n3pm8")))
    (home-page "https://github.com/mrkkrp/path-io")
    (synopsis
     "Interface to directory package for users of path")
    (description
     "Interface to directory package for users of path.")
    (license license:bsd-3)))
