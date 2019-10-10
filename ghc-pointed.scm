(define-module (ghc-pointed)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check))

(define-public ghc-pointed
  (package
   (name "ghc-pointed")
   (version "5.0.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "mirror://hackage/package/pointed/pointed-" version ".tar.gz"))
     (sha256 (base32 "1p91a762xglckscnhpflxzav8byf49a02mli3983i4kpr2jkaimr"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-data-default-class" ,ghc-data-default-class)
      ("ghc-comonad" ,ghc-comonad)
      ("ghc-kan-extensions" ,ghc-kan-extensions)
      ("ghc-semigroupoids" ,ghc-semigroupoids)
      ("ghc-semigroups" ,ghc-semigroups)
      ("ghc-tagged" ,ghc-tagged)
      ("ghc-transformers-compat" ,ghc-transformers-compat)
      ("ghc-hashable" ,ghc-hashable)
      ("ghc-unordered-containers" ,ghc-unordered-containers)))
   (arguments `(#:tests? #f))
   (home-page "http://github.com/ekmett/pointed/")
   (synopsis "Pointed and copointed data")
   (description "Pointed and copointed data.")
   (license license:bsd-3)))
