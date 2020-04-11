(define-module (dhall)
  #:use-module (ghc-parsing)
  #:use-module (gnu packages dhall)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module (guix download)
  #:use-module ((guix build-system haskell) #:select (haskell-build-system))
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public dhall-json
  (package
    (name "dhall-json")
    (version "1.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/dhall-json/dhall-json-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0f18kn15v8pzkdayj2hql28fbba9i75msbi41yscik40lw2sg2cr"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-dhall" ,dhall)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-aeson-pretty" ,ghc-aeson-pretty)
       ("ghc-yaml" ,ghc-yaml)
       ("ghc-vector" ,ghc-vector)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page "http://hackage.haskell.org/package/dhall-json")
    (synopsis "Compile Dhall to JSON or YAML")
    (description
     "Use this package if you want to compile Dhall expressions to JSON or YAML. You can use this package as a library or an executable:

  * See the \"Dhall.JSON\" module if you want to use this package as a library.
  * Use the dhall-to-json or dhall-to-yaml programs from this package if you want an executable.

The \"Dhall.JSON\" module also contains instructions for how to use this package")
    (license license:bsd-3)))
