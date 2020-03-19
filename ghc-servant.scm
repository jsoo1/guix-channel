(define-module (ghc-servant)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public ghc-servant-server
  (package
    (name "ghc-servant-server")
    (version "0.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/servant-server/servant-server-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1l4kgjg5z775bi76hy7cb70qwvmkai4rxqkgp0ildsjgsvf8qb80"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-base-compat" ,ghc-base-compat)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-http-api-data" ,ghc-http-api-data)
       ("ghc-http-media" ,ghc-http-media)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-network" ,ghc-network)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-resourcet" ,ghc-resourcet)
       ("ghc-safe" ,ghc-safe)
       ("ghc-servant" ,ghc-servant)
       ("ghc-string-conversions" ,ghc-string-conversions)
       ("ghc-tagged" ,ghc-tagged)
       ("ghc-transformers-base" ,ghc-transformers-base)
       ("ghc-wai" ,ghc-wai)
       ("ghc-wai-app-static" ,ghc-wai-app-static)
       ("ghc-warp" ,ghc-warp)
       ("ghc-word8" ,ghc-word8)
       ("ghc-transformers-compat" ,ghc-transformers-compat)))
    (native-inputs
     `(("cabal-doctest" ,cabal-doctest)
       ("ghc-hspec" ,ghc-hspec)
       ("ghc-hspec-wai" ,ghc-hspec-wai)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-should-not-typecheck" ,ghc-should-not-typecheck)
       ("ghc-temporary" ,ghc-temporary)
       ("ghc-wai-extra" ,ghc-wai-extra)
       ("ghc-doctest" ,ghc-doctest)
       ("hspec-discover" ,hspec-discover)))
    (home-page
     "http://haskell-servant.readthedocs.org/")
    (synopsis
     "A family of combinators for defining webservices APIs and serving them")
    (description
     "A family of combinators for defining webservices APIs and serving them

You can learn about the basics in the tutorial at
http://haskell-servant.readthedocs.org/en/stable/tutorial/index.html.

https://github.com/haskell-servant/servant/blob/master/servant-server/example/greet.hs
Here is a runnable example, with comments, that defines a dummy API
and implements a webserver that serves this API, using this package.")
    (license license:bsd-3)))

(define-public ghc-servant
  (package
    (name "ghc-servant")
    (version "0.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/servant/servant-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0yzl1yklbbymlh8jdc4ncrdxkalx2z349v4msbd6wxxrxfkxbz6n"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-http-api-data" ,ghc-http-api-data)
       ("ghc-singleton-bool" ,ghc-singleton-bool)
       ("ghc-base-compat" ,ghc-base-compat)
       ("ghc-aeson" ,ghc-aeson)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-bifunctors" ,ghc-bifunctors)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-http-media" ,ghc-http-media)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-mmorph" ,ghc-mmorph)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-string-conversions" ,ghc-string-conversions)
       ("ghc-tagged" ,ghc-tagged)
       ("ghc-vault" ,ghc-vault)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("ghc-doctest" ,ghc-doctest)
       ("cabal-doctest" ,cabal-doctest)
       ("hspec-discover" ,hspec-discover)))
    (home-page
     "http://haskell-servant.readthedocs.org/")
    (synopsis
     "A family of combinators for defining webservices APIs")
    (description
     "A family of combinators for defining webservices APIs and serving them

You can learn about the basics in the tutorial at
http://haskell-servant.readthedocs.org/en/stable/tutorial/index.html")
    (license license:bsd-3)))

(define ghc-servant-websockets
  (package
    (name "ghc-servant-websockets")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/servant-websockets/servant-websockets-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0l8a5zc6wiwdfxv2kirb7kxky4zwj71rcrrg1zh07gc3vf4lqf33"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-async" ,ghc-async)
       ("ghc-conduit" ,ghc-conduit)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-resourcet" ,ghc-resourcet)
       ("ghc-servant-server" ,ghc-servant-server)
       ("ghc-wai" ,ghc-wai)
       ("ghc-wai-websockets" ,ghc-wai-websockets)
       ("ghc-warp" ,ghc-warp)
       ("ghc-websockets" ,ghc-websockets)))
    (home-page
     "https://github.com/moesenle/servant-websockets#readme")
    (synopsis
     "Small library providing WebSocket endpoints for servant")
    (description
     "Small library providing WebSocket endpoints for servant.")
    (license license:bsd-3)))

;; DEPENDENCIES

(define-public ghc-string-conversions
  (package
    (name "ghc-string-conversions")
    (version "0.4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/string-conversions/string-conversions-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "150rdank90h7v08x0wq4dffjbxv2daf5v9sqfs5mab76kinwxg26"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("hspec-discover" ,hspec-discover)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-quickcheck" ,ghc-quickcheck)))
    (home-page
     "https://github.com/soenkehahn/string-conversions#readme")
    (synopsis "Simplifies dealing with different types for strings")
    (description
     "Provides a simple type class for converting values of different
string types into values of other string types.")
    (license license:bsd-3)))

(define-public ghc-http-media
  (package
    (name "ghc-http-media")
    (version "0.8.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/http-media/http-media-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0lww5cxrc9jlvzsysjv99lca33i4rb7cll66p3c0rdpmvz8pk0ir"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)))
    (home-page "https://github.com/zmthy/http-media")
    (synopsis "Processing HTTP Content-Type and Accept headers")
    (description
     "This library is intended to be a comprehensive solution to
parsing and selecting quality-indexed values in HTTP headers.  It is
capable of parsing both media types and language parameters from the
Accept and Content header families, and can be extended to match
against other accept headers as well.  Selecting the appropriate
header value is achieved by comparing a list of server options against
the quality-indexed values supplied by the client.

In the following example, the Accept header is parsed and then matched
against a list of server options to serve the appropriate media using
@code{mapAcceptMedia}:

@code{getHeader >>= maybe send406Error sendResourceWith . mapAcceptMedia
    [ (\"text/html\",        asHtml)
    , (\"application/json\", asJson)
    ]}

Similarly, the Content-Type header can be used to produce a parser for
request bodies based on the given content type with @code{mapContentMedia}:

@code{getContentType >>= maybe send415Error readRequestBodyWith . mapContentMedia
    [ (\"application/json\", parseJson)
    , (\"text/plain\",       parseText)
    ]}

The API is agnostic to your choice of server.")
    (license license:expat)))

(define-public ghc-singleton-bool
  (package
    (name "ghc-singleton-bool")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/singleton-bool/singleton-bool-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "17w9vv6arn7vvc7kykqcx81q2364ji43khrryl27r1cjx9yxapa0"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-dec" ,ghc-dec)))
    (home-page "https://github.com/phadej/singleton-bool#readme")
    (synopsis "Type level booleans")
    (description
     "Type level booleans.

singletons package provides similar functionality, but it has tight
dependency constraints.")
    (license license:bsd-3)))

(define-public ghc-with-location
  (package
    (name "ghc-with-location")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/with-location/with-location-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1rzxvsyh8x3ql3zh7gyw9hjx9bl4v73h0y5kzgaxcfcdn86dg49c"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("hspec-discover" ,hspec-discover)))
    (home-page
     "https://github.com/sol/with-location#readme")
    (synopsis
     "Backward compatible ImplicitParams-based source locations")
    (description "Use ImplicitParams-based source locations in a
backward compatible way.")
    (license license:expat)))

(define-public ghc-wai-app-static
  (package
    (name "ghc-wai-app-static")
    (version "3.1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/wai-app-static/wai-app-static-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0gnwq6ad5m8w8sqq4dzpz23l5rjdphfsf8h9h27lrvv1prkabc6h"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-blaze-html" ,ghc-blaze-html)
       ("ghc-blaze-markup" ,ghc-blaze-markup)
       ("ghc-cryptonite" ,ghc-cryptonite)
       ("ghc-file-embed" ,ghc-file-embed)
       ("ghc-http-date" ,ghc-http-date)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-memory" ,ghc-memory)
       ("ghc-mime-types" ,ghc-mime-types)
       ("ghc-network" ,ghc-network)
       ("ghc-old-locale" ,ghc-old-locale)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-temporary" ,ghc-temporary)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-wai" ,ghc-wai)
       ("ghc-wai-extra" ,ghc-wai-extra)
       ("ghc-warp" ,ghc-warp)
       ("ghc-zlib" ,ghc-zlib)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("ghc-mocker" ,ghc-mockery)))
    (home-page
     "http://www.yesodweb.com/book/web-application-interface")
    (synopsis "WAI application for static serving")
    (description
     " API docs and the README are available at
http://www.stackage.org/package/wai-app-static.")
    (license license:expat)))

(define-public ghc-hspec-wai
  (package
    (name "ghc-hspec-wai")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-wai/hspec-wai-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0gr8j8x8vvzygxyqc0likam63f3427x4p73g95a387aksr5l2ph5"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-base-compat" ,ghc-base-compat)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-hspec-core" ,ghc-hspec-core)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-wai" ,ghc-wai)
       ("ghc-wai-extra" ,ghc-wai-extra)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("hspec-discover" ,hspec-discover)))
    (home-page
     "https://github.com/hspec/hspec-wai#readme")
    (synopsis
     "Experimental Hspec support for testing WAI applications")
    (description
     "Experimental Hspec support for testing WAI applications")
    (license license:expat)))

(define-public ghc-should-not-typecheck
  (package
    (name "ghc-should-not-typecheck")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/should-not-typecheck/should-not-typecheck-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "14fmv0mv2v4fqzynamlrmdj6d1l65aw1srf1wv19nrq7rrqaqf7m"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-hunit" ,ghc-hunit)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)))
    (home-page
     "http://github.com/CRogers/should-not-typecheck")
    (synopsis
     "A HUnit/hspec assertion library to verify that an expression does not typecheck")
    (description
     "For examples and an introduction to the library please take a
look at the
<https://github.com/CRogers/should-not-typecheck#should-not-typecheck-
README> on github.")
    (license license:bsd-3)))

(define-public ghc-dec
  (package
    (name "ghc-dec")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/dec/dec-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1y8bvlm2371dq2v0jv1srki98nbhbz091wh0g2x58wz78h971f6r"))))
    (build-system haskell-build-system)
    (arguments
     `(#:cabal-revision
       ("1"
        "09dkybwqmayf2a1sn94vmmma2xfvf07bw7grhcyjm7lq9jpxv8y0")))
    (home-page "https://github.com/phadej/vec")
    (synopsis "Decidable propositions")
    (description
     "This package provides a @code{Dec} type.
@code{type Not a = a -> Void}
@code{data Dec a = Yes a
                 | No (Not a) }")
    (license license:bsd-3)))
