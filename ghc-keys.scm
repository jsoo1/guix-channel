(define-module (ghc-keys)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check))


(define-public ghc-keys
  (package
   (name "ghc-keys")
   (version "3.12.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "mirror://hackage/package/keys/keys-" version ".tar.gz"))
     (sha256 (base32 "1yqm4gpshsgswx6w78z64c83gpydh6jhgslx2lnc10nzhy0s9kkz"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-comonad" ,ghc-comonad)
      ("ghc-free" ,ghc-free)
      ("ghc-hashable" ,ghc-hashable)
      ("ghc-semigroupoids" ,ghc-semigroupoids)
      ("ghc-semigroups" ,ghc-semigroups)
      ("ghc-tagged" ,ghc-tagged)
      ("ghc-transformers-compat" ,ghc-transformers-compat)
      ("ghc-unordered-containers" ,ghc-unordered-containers)))
   (arguments `(#:tests? #f))
   (home-page "http://github.com/ekmett/keys/")
   (synopsis "Keyed functors and containers")
   (description
    "This package provides a bunch of ad hoc classes for accessing
parts of a container. . In practice this package is largely subsumed
by the <mirror://hackage/package/lens lens package>, but it is
maintained for now as it has much simpler dependencies.")
   (license license:bsd-3)))
