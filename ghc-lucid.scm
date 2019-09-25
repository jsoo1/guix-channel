(define-module (ghc-lucid)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-xyz))

(define-public ghc-lucid
  (package
    (name "ghc-lucid")
    (version "2.9.11")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/lucid/lucid-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "13xz21hf9ywbyqwm33z8pfrjq03rzffhqswi30xsi13rrawj99cc"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-mmorph" ,ghc-mmorph)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-hspec" ,ghc-hspec)
        ("ghc-bifunctors" ,ghc-bifunctors)))
    (arguments
      `(#:cabal-revision
        ("1"
         "10k3x9cn4a23kqk909xiv8phkfgagf7p16qlfpr9swn1dn4xasgf")))
    (home-page "https://github.com/chrisdone/lucid")
    (synopsis
      "Clear to write, read and edit DSL for HTML")
    (description
      "Clear to write, read and edit DSL for HTML.

* Names are consistent, and do not conflict with base or are
keywords (all have suffix _)

* Same combinator can be used for attributes and
elements (e.g. 'style_')

* For more, read <https://chrisdone.com/posts/lucid the blog post>
. See the \"Lucid\" module for more documentation.")
    (license license:bsd-3)))

