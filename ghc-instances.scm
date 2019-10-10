(define-module (ghc-instances)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system haskell)
  #:use-module (ghc-keys)
  #:use-module (ghc-pointed)
  #:use-module (ghc-system)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages pkg-config))

(define-public ghc-vector-instances
  (package
   (name "ghc-vector-instances")
   (version "3.4")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "mirror://hackage/package/vector-instances/vector-instances-" version ".tar.gz"))
     (sha256 (base32 "10akvpa5w9bp0d8hflab63r9laa9gy2hv167smhjsdzq1kplc0hv"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-vector" ,ghc-vector)
      ("ghc-semigroupoids" ,ghc-semigroupoids)
      ("ghc-semigroups" ,ghc-semigroups)
      ("ghc-comonad" ,ghc-comonad)
      ("ghc-pointed" ,ghc-pointed)
      ("ghc-keys" ,ghc-keys)
      ("ghc-hashable" ,ghc-hashable)))
   (arguments `(#:tests? #f))
   (home-page "http://github.com/ekmett/vector-instances")
   (synopsis "Orphan Instances for 'Data.Vector'")
   (description "")
   (license license:bsd-3)))

(define-public ghc-binary-instances
  (package
   (name "ghc-binary-instances")
   (version "1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/binary-instances/"
           "binary-instances-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "07y9582vsw94ks8whkd3dcmf4wdwlq8riyk2shmxxprkq0gsv3z0"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-aeson" ,ghc-aeson)
      ("ghc-binary-orphans" ,ghc-binary-orphans)
      ("ghc-case-insensitive" ,ghc-case-insensitive)
      ("ghc-hashable" ,ghc-hashable)
      ("ghc-scientific" ,ghc-scientific)
      ("ghc-tagged" ,ghc-tagged)
      ("ghc-text-binary" ,ghc-text-binary)
      ("ghc-time-compat" ,ghc-time-compat)
      ("ghc-unordered-containers" ,ghc-unordered-containers)
      ("ghc-vector" ,ghc-vector)
      ("ghc-vector-binary-instances" ,ghc-vector-binary-instances)))
   (native-inputs
    `(("ghc-quickcheck" ,ghc-quickcheck)
      ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
      ("ghc-tasty" ,ghc-tasty)
      ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
   (arguments
    `(#:cabal-revision
      ("2"
       "0yawdwm086gk51y5s5zbybiwiv386cx8xyj6kcgj9wwdidcnaxdi")))
   (home-page
    "https://github.com/phadej/binary-orphans#readme")
   (synopsis "Orphan instances for binary")
   (description
    "binary-orphans defines orphan instances for types in some
popular packages.")
   (license license:bsd-3)))

(define-public ghc-binary-orphans
  (package
   (name "ghc-binary-orphans")
   (version "1.0.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/binary-orphans/binary-orphans-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "0gbmn5rpvyxhw5bxjmxwld6918lslv03b2f6hshssaw1il5x86j3"))))
   (build-system haskell-build-system)
   (native-inputs
    `(("ghc-quickcheck" ,ghc-quickcheck)
      ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
      ("ghc-tagged" ,ghc-tagged)
      ("ghc-tasty" ,ghc-tasty)
      ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
   (arguments
    `(#:cabal-revision
      ("2"
       "0b4fafgwhrp4i7vxcynzk5678kn6jvraanmbmf14mxlkipl2fff3")))
   (home-page
    "http://hackage.haskell.org/package/binary-orphans")
   (synopsis
    "Compatibility package for binary; provides instances")
   (description
    "This package provides instances defined in later versions of @binary@ package . Prior version 1 this packages provided instances for other packages. That functionality is moved to [binary-instances](https://hackage.haskell.org/package/binary-instances) package.")
   (license license:bsd-3)))

