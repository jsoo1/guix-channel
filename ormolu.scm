(define-module (ormolu)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ormolu
  (package
    (name "ormolu")
    (version "0.0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/ormolu/ormolu-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1p4m9hiavirnhf941fb5pdnrlrknr5rhcvznhqywianvvw6qcm30"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-dlist" ,ghc-dlist)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-paths" ,ghc-paths)
       ("ghc-syb" ,ghc-syb)
       ("ghc-gitrev" ,ghc-gitrev)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("ghc-path" ,ghc-path)
       ("ghc-path-io" ,ghc-path-io)
       ("hspec-discover" ,hspec-discover)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'remove-lib
           (lambda* (#:key outputs #:allow-other-keys)
             (delete-file-recursively
              (string-append (assoc-ref outputs "out") "/lib")))))))
    (home-page "https://github.com/tweag/ormolu")
    (synopsis "A formatter for Haskell source code")
    (description
     "A formatter for Haskell source code.")
    (license license:bsd-3)))

