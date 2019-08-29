(define-module (ghc-repline)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (ghc-repline))

(define ghc-repline
  (package
    (name "ghc-repline")
    (version "0.2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/repline/repline-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1ph21kbbanlcs8n5lwk16g9vqkb98mkbz5mzwrp8j2rls2921izc"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/sdiehl/repline")
    (synopsis "Haskeline wrapper for GHCi-like REPL interfaces.")
    (description
     "Haskeline wrapper for GHCi-like REPL interfaces. Composable with normal mtl transformers.")
    (license license:expat)))

