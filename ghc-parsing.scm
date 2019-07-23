(define-module (ghc-parsing)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-megaparsec-7.0.4))

(define ghc-megaparsec-7.0.4
  (package
    (name "ghc-megaparsec-7.0.4")
    (version "7.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/megaparsec/megaparsec-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1hg83m85f4v78mqdkznd1ddk9y32hnrv0bgva7ir3vydx37aanrj"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-parser-combinators" ,ghc-parser-combinators)
       ("ghc-scientific" ,ghc-scientific) ))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-hspec" ,ghc-hspec)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)))
    (arguments `(#:tests? #f))
    (home-page "https://github.com/mrkkrp/megaparsec")
    (synopsis "Monadic parser combinators")
    (description
     "This is an industrial-strength monadic parser combinator library. Megaparsec is a feature-rich package that strikes a nice balance between speed, flexibility, and quality of parse errors.")
    (license license:bsd-2)))
