(define-module (ormolu)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module ((guix licenses) #:prefix license:))

(define ghc-lib-parser-9
  (package
    (name "ghc-lib-parser")
    (version "9.0.1.20210324")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/ghc-lib-parser/ghc-lib-parser-"
             version
             ".tar.gz"))
       (sha256
        (base32 "1hl20lz8r9yhgh6hlakmbqp637h49mq3sdxciy4vsz3nhzy7nqqm"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-alex" ,ghc-alex)
       ("ghc-happy" ,ghc-happy)))
    (home-page "https://github.com/digital-asset/ghc-lib")
    (synopsis "The GHC API, decoupled from GHC versions")
    (description
     "A package equivalent to the @ghc@ package, but which can be loaded on many compiler versions.")
    (license license:bsd-3)))

(define-public ormolu
  (package
    (name "ormolu")
    (version "0.2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/ormolu/ormolu-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0zivz7vcl4m1rjay5md6cdqac9cnfwz9c844l20byiz5h49bwfhb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-diff" ,ghc-diff)
       ("ghc-dlist" ,ghc-dlist)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-lib-parser" ,ghc-lib-parser-9)
       ("ghc-paths" ,ghc-paths)
       ("ghc-syb" ,ghc-syb)
       ("ghc-gitrev" ,ghc-gitrev)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("ghc-path" ,ghc-path)
       ("ghc-path-io" ,ghc-path-io)
       ("hspec-discover" ,hspec-discover)))
    (home-page "https://github.com/tweag/ormolu")
    (synopsis "A formatter for Haskell source code")
    (description
     "A formatter for Haskell source code.")
    (license license:bsd-3)))

