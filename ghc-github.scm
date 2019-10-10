(define-module (ghc-github)
  #:use-module (ghc-instances)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages python)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ghc-github
  (package
   (name "ghc-github")
   (version "0.22")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/github/github-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "15py79qcpj0k331i42njgwkirwyiacbc5razmxnm4672dvvip2qk"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-aeson" ,ghc-aeson)
      ("ghc-base-compat" ,ghc-base-compat)
      ("ghc-base16-bytestring" ,ghc-base16-bytestring)
      ("ghc-binary-instances" ,ghc-binary-instances)
      ("ghc-cryptohash-sha1" ,ghc-cryptohash-sha1)
      ("ghc-deepseq-generics" ,ghc-deepseq-generics)
      ("ghc-exceptions" ,ghc-exceptions)
      ("ghc-hashable" ,ghc-hashable)
      ("ghc-http-client" ,ghc-http-client)
      ("ghc-http-link-header" ,ghc-http-link-header)
      ("ghc-http-types" ,ghc-http-types)
      ("ghc-iso8601-time" ,ghc-iso8601-time)
      ("ghc-network-uri" ,ghc-network-uri)
      ("ghc-tagged" ,ghc-tagged)
      ("ghc-transformers-compat" ,ghc-transformers-compat)
      ("ghc-unordered-containers" ,ghc-unordered-containers)
      ("ghc-vector" ,ghc-vector)
      ("ghc-vector-instances" ,ghc-vector-instances)
      ("ghc-http-client-tls" ,ghc-http-client-tls)
      ("ghc-tls" ,ghc-tls)))
   (native-inputs
    `(("ghc-file-embed" ,ghc-file-embed)
      ("ghc-hspec" ,ghc-hspec)))
   (home-page "https://github.com/phadej/github")
   (synopsis "Access to the GitHub API, v3.")
   (description
    "The GitHub API provides programmatic access to the full GitHub
Web site, from Issues to Gists to repos down to the underlying git
data like references and trees. This library wraps all of that,
exposing a basic but Haskell-friendly set of functions and data
structures.

For supported endpoints see GitHub module.

> @code{import qualified GitHub as GH}
>
> @code{main :: IO () > main = do}
>   @code{possibleUser <- GH.executeRequest' $ GH.userInfoForR \"phadej\"}
>   @code{print possibleUser}

For more of an overview please see the README:
<https://github.com/phadej/github/blob/master/README.md>")
   (license license:bsd-3)))

(define-public ghc-http-link-header
  (package
   (name "ghc-http-link-header")
   (version "1.0.3.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/http-link-header/http-link-header-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "0b9a3kax6zvn8aaflys63lanqan65hsv0dr8vwhbpbhyvxrxn9ns"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-errors" ,ghc-errors)
      ("ghc-network-uri" ,ghc-network-uri)
      ("ghc-http-api-data" ,ghc-http-api-data)
      ("ghc-attoparsec" ,ghc-attoparsec)
      ("ghc-bytestring-conversion" ,ghc-bytestring-conversion)))
   (native-inputs
    `(("ghc-hspec" ,ghc-hspec)
      ("ghc-quickcheck" ,ghc-quickcheck)
      ("ghc-hspec-attoparsec" ,ghc-hspec-attoparsec)))
   (home-page
    "https://github.com/myfreeweb/http-link-header")
   (synopsis
    "Parse and write for the HTTP Link headers per RFC 5988")
   (description
    "https://github.com/myfreeweb/http-link-header")
   (license license:public-domain)))

(define-public ghc-iso8601-time
  (package
   (name "ghc-iso8601-time")
   (version "0.1.5")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/iso8601-time/iso8601-time-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "1j7h1xix7vpb88dnksis14rnvw0p528m3d54fg3h51765d5l9kgj"))))
   (build-system haskell-build-system)
   (native-inputs
    `(("ghc-hspec" ,ghc-hspec)
      ("ghc-hunit" ,ghc-hunit)))
   (home-page "https://github.com/nh2/iso8601-time")
   (synopsis
    "Convert to/from the ISO 8601 time format")
   (description
    "Conversion functions between Haskell time types and the ISO 8601 format, which is often used for printing times, e.g. JavaScript's @new Date().toISOString()@.")
   (license license:expat)))

(define-public ghc-bytestring-conversion
  (package
   (name "ghc-bytestring-conversion")
   (version "0.3.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/bytestring-conversion/"
           "bytestring-conversion-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "1y2fhwz632sp7n0iw87lz2g8vks4jgxz2kw99kysgivxfd4fmdqk"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-attoparsec" ,ghc-attoparsec)
      ("ghc-case-insensitive" ,ghc-case-insensitive)
      ("ghc-double-conversion" ,ghc-double-conversion)))
   (native-inputs
    `(("ghc-quickcheck" ,ghc-quickcheck)
      ("ghc-tasty" ,ghc-tasty)
      ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
   (arguments
    `(#:cabal-revision
      ("2"
       "1x8c42cfzb6fdvgkxxdxcpdf16csimlzsgahb1axnplmr6b3ba63")))
   (home-page
    "https://github.com/twittner/bytestring-conversion/")
   (synopsis
    "Type-classes to convert values to and from ByteString")
   (description
    "Defines the type-classes 'ToByteString' and 'FromByteString' to
convert values to and from ByteString.")
   (license #f)))

(define-public ghc-hspec-attoparsec
  (package
   (name "ghc-hspec-attoparsec")
   (version "0.1.0.2")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://hackage.haskell.org/package/hspec-attoparsec/hspec-attoparsec-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "0r7v6x0k5r8jxl0rnsq8h3gqhbiimsic3kiphn6dxaw954zqnypa"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-attoparsec" ,ghc-attoparsec)
      ("ghc-hspec-expectations" ,ghc-hspec-expectations)))
   (native-inputs `(("ghc-hspec" ,ghc-hspec)))
   (home-page
    "http://github.com/alpmestan/hspec-attoparsec")
   (synopsis
    "Test your attoparsec parsers with hspec")
   (description
    "This package provides some helper functions for testing
attoparsec parsers with hspec.

See the documentation in @code{Test.Hspec.Attoparsec} for examples, or
this package's own test suite.")
   (license license:bsd-3)))
