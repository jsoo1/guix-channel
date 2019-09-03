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
  #:use-module (guix packages)
  #:export (ghc-servant
            ghc-servant-server
            ghc-servant-websockets
            ghc-websockets
            ghc-aeson-1.4.2.0
            ghc-conduit-1.3.0.3))

(define ghc-servant-server
  (package
    (name "ghc-servant-server")
    (version "0.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/servant-server/servant-server-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1qlkdgls2z71sx09lbkrqcxwx1wam3hn7dnyps6z2i7qixhlw0wq"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-servant" ,ghc-servant)
       ("ghc-http-api-data" ,ghc-http-api-data-0.4)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-http-media" ,ghc-http-media)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-string-conversions" ,ghc-string-conversions)
       ("ghc-resourcet" ,ghc-resourcet-1.2.2)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-transformers-base" ,ghc-transformers-base)
       ("ghc-wai" ,ghc-wai-3.2.1.2)
       ("ghc-wai-app-static" ,ghc-wai-app-static)
       ("ghc-word8" ,ghc-word8)
       ("ghc-aeson" ,ghc-aeson-1.4.2.0)
       ("ghc-warp" ,ghc-warp-3.2.26)))
    (arguments `(#:tests? #f))
    (native-inputs
     `(("ghc-safe" ,ghc-safe)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-hspec-wai" ,ghc-hspec-wai-0.9.2)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-should-not-typecheck" ,ghc-should-not-typecheck)
       ("ghc-temporary" ,ghc-temporary)
       ("ghc-wai-extra" ,ghc-wai-extra-3.0.25)
       ("ghc-doctest" ,ghc-doctest)
       ("ghc-cabal-doctest" ,ghc-cabal-doctest)))
    (home-page
     "http://haskell-servant.readthedocs.org/")
    (synopsis
     "A family of combinators for defining webservices APIs and serving them")
    (description
     "A family of combinators for defining webservices APIs and serving them

You can learn about the basics in the tutorial at http://haskell-servant.readthedocs.org/en/stable/tutorial/index.html.

https://github.com/haskell-servant/servant/blob/master/servant-server/example/greet.hs 
Here is a runnable example, with comments, that defines a dummy API and implements a webserver that serves this API, using this package.

CHANGELOG: https://github.com/haskell-servant/servant/blob/master/servant-server/CHANGELOG.md")
    (license license:bsd-3)))

(define ghc-servant
  (package
    (name "ghc-servant")
    (version "0.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/servant/servant-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0fgsddg8yn23izk3g4bmax6rlh56qhx13j8h5n6fxr7mq34kagsg"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-http-api-data" ,ghc-http-api-data-0.4)
       ("ghc-singleton-bool" ,ghc-singleton-bool)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-aeson" ,ghc-aeson-1.4.2.0)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-bifunctors" ,ghc-bifunctors-5.5.3)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-http-media" ,ghc-http-media)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-mmorph" ,ghc-mmorph)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-string-conversions" ,ghc-string-conversions)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-vault" ,ghc-vault)))
    ;; TODO FIX CABAL BUILD DEPENDENCIEs
    (arguments `(#:tests? #f))
    ;; (native-inputs
    ;;  `(("ghc-hspec" ,ghc-hspec-2.6.1)
    ;;    ("ghc-quickcheck-instances" ,ghc-quickcheck-instances-0.3.19)
    ;;    ("ghc-doctest" ,ghc-doctest)
    ;;    ("ghc-cabal-doctest" ,ghc-cabal-doctest)))
    (home-page
     "http://haskell-servant.readthedocs.org/")
    (synopsis
     "A family of combinators for defining webservices APIs")
    (description
     "A family of combinators for defining webservices APIs and serving them

You can learn about the basics in the tutorial at http://haskell-servant.readthedocs.org/en/stable/tutorial/index.html

CHANGELOG https://github.com/haskell-servant/servant/blob/master/servant/CHANGELOG.md")
    (license license:bsd-3)))

(define ghc-servant-websockets
  (package
    (name "ghc-servant-websockets")
    (version "1.1.0")
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
     `(("ghc-aeson" ,ghc-aeson-1.4.2.0)
       ("ghc-async" ,ghc-async)
       ("ghc-conduit" ,ghc-conduit-1.3.0.3)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-resourcet" ,ghc-resourcet-1.2.2)
       ("ghc-servant-server" ,ghc-servant-server)
       ("ghc-wai" ,ghc-wai-3.2.1.2)
       ("ghc-wai-websockets" ,ghc-wai-websockets)
       ("ghc-warp" ,ghc-warp-3.2.26)
       ("ghc-websockets" ,ghc-websockets)))
    (home-page
     "https://github.com/moesenle/servant-websockets#readme")
    (synopsis
     "Small library providing WebSocket endpoints for servant.")
    (description
     "Small library providing WebSocket endpoints for servant.")
    (license license:bsd-3)))

;; DEPENDENCIES
(define ghc-cabal-doctest
  (package
    (name "ghc-cabal-doctest")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/cabal-doctest/cabal-doctest-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0bgd4jdmzxq5y465r4sf4jv2ix73yvblnr4c9wyazazafddamjny"))))
    (build-system haskell-build-system)
    (arguments `(#:haskell ,ghc-8.0))
    (home-page "https://github.com/phadej/cabal-doctest")
    (synopsis "A Setup.hs helper for doctests running")
    (description
     "Currently (beginning of 2017), there isn't cabal doctest command. Yet, to properly work doctest needs plenty of configuration. This library provides the common bits for writing custom Setup.hs See Cabal issue 2327 https://github.com/haskell/cabal/issues/2327. For the progress of cabal doctest, i.e. whether this library is obsolete.")
    (license license:bsd-3)))

(define ghc-string-conversions
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
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("hspec-discover" ,ghc-hspec-discover-2.6.1)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances-0.3.19)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)))
    (home-page
     "https://github.com/soenkehahn/string-conversions#readme")
    (synopsis "Simplifies dealing with different types for strings")
    (description
     "Provides a simple type class for converting values of different string types into values of other string types.")
    (license license:bsd-3)))

(define ghc-http-media
  (package
    (name "ghc-http-media")
    (version "0.7.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/http-media/http-media-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0kqjzvh5y8r6x5rw2kgd816w2963c6cbyw2qjvaj2mv59zxzqkrr"))))
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
     "This library is intended to be a comprehensive solution to parsing and selecting quality-indexed values in HTTP headers.  It is capable of parsing both media types and language parameters from the Accept and Content header families, and can be extended to match against other accept headers as well.  Selecting the appropriate header value is achieved by comparing a list of server options against the quality-indexed values supplied by the client.

In the following example, the Accept header is parsed and then matched against a list of server options to serve the appropriate media using 'mapAcceptMedia':

getHeader >>= maybe send406Error sendResourceWith . mapAcceptMedia
    [ (\"text/html\",        asHtml)
    , (\"application/json\", asJson)
    ]

Similarly, the Content-Type header can be used to produce a parser for request bodies based on the given content type with 'mapContentMedia':

getContentType >>= maybe send415Error readRequestBodyWith . mapContentMedia
    [ (\"application/json\", parseJson)
    , (\"text/plain\",       parseText)
    ]

The API is agnostic to your choice of server.")
    (license license:expat)))

(define ghc-singleton-bool
  (package
    (name "ghc-singleton-bool")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/singleton-bool/singleton-bool-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0apvzb6ym0fnm4rx7paz6ivv72ahzn2bxhvyd1drw50ypvicd581"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/phadej/singleton-bool#readme")
    (synopsis "Type level booleans")
    (description
     "Type level booleans.

singletons package provides similar functionality, but it has tight dependency constraints.")
    (license license:bsd-3)))

(define ghc-quickcheck-2.12.6.1
  (package
    (name "ghc-quickcheck-2.12.6.1")
    (version "2.12.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/QuickCheck/QuickCheck-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0w51zbbvh46g3wllqfmx251xzbnddy94ixgm6rf8gd95qvssfahb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-random" ,ghc-random)
       ("ghc-erf" ,ghc-erf)
       ("ghc-tf-random" ,ghc-tf-random)))
    (home-page
     "https://github.com/nick8325/quickcheck")
    (synopsis
     "Automatic testing of Haskell programs")
    (description
     "QuickCheck is a library for random testing of program properties. The programmer provides a specification of the program, in the form of properties which functions should satisfy, and QuickCheck then tests that the properties hold in a large number of randomly generated cases. Specifications are expressed in Haskell, using combinators provided by QuickCheck. QuickCheck provides combinators to define properties, observe the distribution of test data, and define test data generators.

Most of QuickCheck's functionality is exported by the main \"Test.QuickCheck\" module. The main exception is the monadic property testing library in \"Test.QuickCheck.Monadic\".

If you are new to QuickCheck, you can try looking at the following resources:


* The official QuickCheck manual at http://www.cse.chalmers.se/~rjmh/QuickCheck/manual.html. It's a bit out-of-date in some details and doesn't cover newer QuickCheck features, but is still full of good advice.
* https://begriffs.com/posts/2017-01-14-design-use-quickcheck.html, a detailed tutorial written by a user of QuickCheck.

The quickcheck-instances (see http://hackage.haskell.org/package/quickcheck-instances) companion package provides instances for types in Haskell Platform packages at the cost of additional dependencies.")
    (license license:bsd-3)))

(define ghc-aeson-1.4.2.0
  (package
    (name "ghc-aeson-1.4.2.0")
    (version "1.4.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/aeson/aeson-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1l4b675nxddim3v30kd7zr3vmrs7i1m81rh8h9bfbm9k9a0p3kkm"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-contravariant" ,ghc-contravariant)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-primitive" ,ghc-primitive)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-dlist" ,ghc-dlist)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-th-abstraction" ,ghc-th-abstraction)
       ("ghc-time-locale-compat" ,ghc-time-locale-compat)
       ("ghc-uuid-types" ,ghc-uuid-types)
       ("ghc-vector" ,ghc-vector)))
    ;; TODO: fix quickcheck dependency < 2.12
    (arguments `(#:tests? #f))
    ;; (native-inputs
    ;;  `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
    ;;    ("ghc-integer-logarithms" ,ghc-integer-logarithms)
    ;;    ("ghc-base-orphans" ,ghc-base-orphans)
    ;;    ("ghc-base16-bytestring" ,ghc-base16-bytestring)
    ;;    ("ghc-generic-deriving" ,ghc-generic-deriving)
    ;;    ("ghc-tasty" ,ghc-tasty-1.1.0.3)
    ;;    ("ghc-tasty-hunit" ,ghc-tasty-hunit-0.10.0.1)
    ;;    ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck-0.10)
    ;;    ("ghc-quickcheck-instances" ,ghc-quickcheck-instances-0.3.19)
    ;;    ("ghc-hashable-time" ,ghc-hashable-time)))
    (home-page "https://github.com/bos/aeson")
    (synopsis "Fast JSON parsing and encoding")
    (description
     "A JSON parsing and encoding library optimized for ease of use and high performance.

To get started, see the documentation for the Data.Aeson module below.

(A note on naming: in Greek mythology, Aeson was the father of Jason.)")
    (license license:bsd-3)))

(define ghc-base-compat-0.10.5
  (package
    (name "ghc-base-compat-0.10.5")
    (version "0.10.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/base-compat/base-compat-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0hgvlqcr852hfp52jp99snhbj550mvxxpi8qn15d8ml9aqhyl2lr"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/base-compat")
    (synopsis "A compatibility layer for base")
    (description
     "Provides functions available in later versions of base to a wider range of compilers, without requiring you to use CPP pragmas in your code.  See the README at https://github.com/haskell-compat/base-compat/blob/master/base-compat/README.markdown for what is covered. Also see the changelog for recent changes at https://github.com/haskell-compat/base-compat/blob/master/base-compat/CHANGES.markdown.

Note that base-compat does not add any orphan instances. There is a separate package, base-orphans (see <http://hackage.haskell.org/package/base-orphans), for that.

In addition, base-compat does not backport any data types or type classes. See this section of the README for more info: https://github.com/haskell-compat/base-compat/blob/master/base-compat/README.markdown#data-types-and-type-classes.


base-compat is designed to have zero dependencies. For a version of base-compat that depends on compatibility libraries for a wider support window, see the base-compat-batteries package: http://hackage.haskell.org/package/base-compat-batteries. Most of the modules in this library have the same names as in base-compat-batteries to make it easier to switch between the two. There also exist versions of each module with the suffix .Repl, which are distinct from anything in base-compat-batteries, to allow for easier use in GHCi.")
    (license license:expat)))

(define ghc-hspec-discover-2.7.0
  (package
    (name "ghc-hspec-discover")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-discover/hspec-discover-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1n3by0dn3x3kfy7vnyfdz0dr2wwwj82m0ijlm9s1n6aa976xddhw"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck-2.12.6.1" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hspec-meta-2.6.0" ,ghc-hspec-meta-2.6.0)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "Automatically discover and run Hspec tests")
    (description
     "Automatically discover and run Hspec tests . <http://hspec.github.io/hspec-discover.html>")
    (license license:expat)))

(define ghc-hspec-2.7.0
  (package
    (name "ghc-hspec-2.7.0")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec/hspec-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1qbikvd91cimbn439zwsdcrz0hsl7n2w4cl0vlcw8kbf94nm6z7z"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck-2.12.6.1" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hspec-core-2.7.0" ,ghc-hspec-core-2.7.0)
       ("ghc-hspec-discover-2.7.0" ,ghc-hspec-discover-2.7.0)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)))
    (home-page "http://hspec.github.io/")
    (synopsis "A Testing Framework for Haskell")
    (description
     "Hspec is a testing framework for Haskell.  Some of Hspec's distinctive features are:

* a friendly DSL for defining tests
* integration with QuickCheck, SmallCheck, and HUnit
* parallel test execution
* automatic discovery of test files

The Hspec Manual is at http://hspec.github.io/.")
    (license license:expat)))

(define ghc-hspec-core-2.7.0
  (package
    (name "ghc-hspec-core-2.7.0")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-core/hspec-core-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1y4j0ivngz7jrff1riyy2iirnb5kc9p4cr619wdrsrvrm3blgzrz"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck-2.12.6.1" ,ghc-quickcheck-2.12.6.1)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-call-stack" ,ghc-call-stack)
       ("ghc-clock" ,ghc-clock)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-quickcheck-io-0.2.0" ,ghc-quickcheck-io-0.2.0)
       ("ghc-random" ,ghc-random)
       ("ghc-setenv" ,ghc-setenv)
       ("ghc-tf-random" ,ghc-tf-random)))
    (native-inputs
     `(("ghc-hspec-meta-2.6.0" ,ghc-hspec-meta-2.6.0)
       ("ghc-silently" ,ghc-silently)
       ("ghc-temporary" ,ghc-temporary)))
    (home-page "http://hspec.github.io/")
    (synopsis "A Testing Framework for Haskell")
    (description
     "This package exposes internal types and functions that can be used to extend Hspec's functionality.")
    (license license:expat)))

(define ghc-quickcheck-io-0.2.0
  (package
    (name "ghc-quickcheck-io-0.2.0")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/quickcheck-io/quickcheck-io-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "08k4v7pkgjf30pv5j2dfv1gqv6hclxlniyq2sps8zq4zswcr2xzv"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck-2.12.6.1" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hunit" ,ghc-hunit)))
    (home-page
     "https://github.com/hspec/quickcheck-io#readme")
    (synopsis
     "Use HUnit assertions as QuickCheck properties")
    (description
     "This package provides an orphan instance that allows you to use HUnit assertions as QuickCheckproperties.")
    (license license:expat)))

(define ghc-hspec-meta-2.6.0
  (package
    (name "ghc-hspec-meta-2.6.0")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-meta/hspec-meta-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1n1a4633wfivylglji8920f67mx7qz8j4q58n8p7dxk6yg4h3mz6"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-call-stack" ,ghc-call-stack)
       ("ghc-clock" ,ghc-clock)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-quickcheck-io" ,ghc-quickcheck-io-0.2.0)
       ("ghc-random" ,ghc-random)
       ("ghc-setenv" ,ghc-setenv)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "A version of Hspec which is used to test Hspec itself")
    (description
     "A stable version of Hspec which is used to test the in-development version of Hspec.")
    (license license:expat)))

(define ghc-http-api-data-0.4
  (package
    (name "ghc-http-api-data-0.4")
    (version "0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/http-api-data/http-api-data-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "12ja2rrs6dvajw300agp4fms21859a7n193m7nicmwixy8wkyzl3"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-attoparsec-iso8601" ,ghc-attoparsec-iso8601-1.0.1.0)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-cookie" ,ghc-cookie)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-time-locale-compat" ,ghc-time-locale-compat)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-uuid-types" ,ghc-uuid-types)))
    ;; TODO fix, maybe? Cannot find Build_doctests
    (arguments `(#:tests? #f))
    ;; (native-inputs
    ;;  `(("ghc-nats" ,ghc-nats)
    ;;    ("ghc-hunit" ,ghc-hunit)
    ;;    ("ghc-hspec" ,ghc-hspec-2.6.1)
    ;;    ("ghc-hspec-discover" ,ghc-hspec-discover-2.6.1)
    ;;    ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
    ;;    ("ghc-quickcheck-instances" ,ghc-quickcheck-instances-0.3.19)
    ;;    ("ghc-doctest" ,ghc-doctest-0.16.0.1)
    ;;    ("ghc-cabal-doctest" ,ghc-cabal-doctest)))
    (home-page
     "http://github.com/fizruk/http-api-data")
    (synopsis
     "Converting to/from HTTP API data like URL pieces, headers and query parameters.")
    (description
     "This package defines typeclasses used for converting Haskell data types to and from HTTP API data.

Please see README.md")
    (license license:bsd-3)))

(define ghc-hspec-2.6.1
  (package
    (name "ghc-hspec-2.6.1")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec/hspec-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1jkfqhdymr62rzqmlmc22mpla23p67rnls3v3zs30ggxbgs4dxlb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hspec-core" ,ghc-hspec-core-2.6.1)
       ("ghc-hspec-discover" ,ghc-hspec-discover-2.6.1)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)))
    (home-page "http://hspec.github.io/")
    (synopsis "A Testing Framework for Haskell")
    (description
     "Hspec is a testing framework for Haskell.  Some of Hspec's distinctive features are: . * a friendly DSL for defining tests . * integration with QuickCheck, SmallCheck, and HUnit . * parallel test execution . * automatic discovery of test files

The Hspec Manual is at http://hspec.github.io/.")
    (license license:expat)))

(define ghc-hspec-core-2.6.1
  (package
    (name "ghc-hspec-core-2.6.1")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-core/hspec-core-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0xg43kan7p6ahi5827qwcyiic6bq0bp8n0n8h3j4kh87qhdl4avv"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-call-stack" ,ghc-call-stack)
       ("ghc-clock" ,ghc-clock)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-quickcheck-io" ,ghc-quickcheck-io-0.2.0)
       ("ghc-random" ,ghc-random)
       ("ghc-setenv" ,ghc-setenv)
       ("ghc-tf-random" ,ghc-tf-random)))
    (native-inputs
     `(("ghc-hspec-meta" ,ghc-hspec-meta-2.6.0)
       ("ghc-silently" ,ghc-silently)
       ("ghc-temporary" ,ghc-temporary)))
    (home-page "http://hspec.github.io/")
    (synopsis "A Testing Framework for Haskell")
    (description
     "This package exposes internal types and functions that can be used to extend Hspec's functionality.")
    (license license:expat)))

(define ghc-hspec-discover-2.6.1
  (package
    (name "ghc-hspec-discover-2.6.1")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-discover/hspec-discover-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "189gj8drfzdf3j3xm8gbj9hjc1ha95ajhi47s9r440yjhyarlmlx"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hspec-meta" ,ghc-hspec-meta-2.6.0)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "Automatically discover and run Hspec tests")
    (description
     "Automatically discover and run Hspec tests . <http://hspec.github.io/hspec-discover.html>")
    (license license:expat)))

(define ghc-quickcheck-instances-0.3.19
  (package
    (name "ghc-quickcheck-instances-0.3.19")
    (version "0.3.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/quickcheck-instances/quickcheck-instances-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0mls8095ylk5pq2j787ary5lyn4as64414silq3zn4sky3zsx92p"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-old-time" ,ghc-old-time)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-uuid-types" ,ghc-uuid-types)
       ("ghc-vector" ,ghc-vector)))
    (home-page
     "https://github.com/phadej/qc-instances")
    (synopsis "Common quickcheck instances")
    (description
     "QuickCheck instances.

The goal is to supply QuickCheck instances for types provided by the Haskell Platform.

Since all of these instances are provided as orphans, I recommend that you do not use this library within another library module, so that you don't impose these instances on down-stream consumers of your code.

For information on writing a test-suite with Cabal see https://www.haskell.org/cabal/users-guide/developing-packages.html#test-suites")
    (license license:bsd-3)))

(define ghc-http-types-0.12.2
  (package
    (name "ghc-http-types-0.12.2")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/http-types/http-types-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "01ck5wmzvl5cqd3w2kwkrmp18n78474a3lngk6ry28w9pbbh4caj"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-case-insensitive" ,ghc-case-insensitive)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances-0.3.19)
       ("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-hspec-discover" ,ghc-hspec-discover-2.6.1)
       ("ghc-doctest" ,ghc-doctest-0.16.0.1)))
    (home-page
     "https://github.com/aristidb/http-types")
    (synopsis
     "Generic HTTP types for Haskell (for both client and server code).")
    (description
     "Generic HTTP types for Haskell (for both client and server code).")
    (license license:bsd-3)))

(define ghc-attoparsec-iso8601-1.0.1.0
  (package
    (name "ghc-attoparsec-iso8601-1.0.1.0")
    (version "1.0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/attoparsec-iso8601/attoparsec-iso8601-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0hj10w15qp2z5bz2v4xahhmbgzclpyfi5l2sv97wqycysg9gp7s9"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)))
    (home-page "https://github.com/bos/aeson")
    (synopsis
     "Parsing of ISO 8601 dates, originally from aeson.")
    (description
     "Parsing of ISO 8601 dates, originally from aeson.")
    (license license:bsd-3)))

(define ghc-doctest-0.16.0.1
  (package
    (name "ghc-doctest-0.16.0.1")
    (version "0.16.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/doctest/doctest-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "106pc4rs4cfym7754gzdgy36dm9aidwmnqpjm9k7yq1hfd4pallv"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-code-page" ,ghc-code-page)
       ("ghc-paths" ,ghc-paths)
       ("ghc-syb" ,ghc-syb)))
    ;; TODO fix, maybe
    (arguments `(#:tests? #f))
    (home-page
     "https://github.com/sol/doctest#readme")
    (synopsis "Test interactive Haskell examples")
    (description
     "The doctest program checks examples in source code comments.  It is modeled after doctest for Python (http://docs.python.org/library/doctest.html).

Documentation is at https://github.com/sol/doctest#readme.")
    (license license:expat)))

(define ghc-with-location
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
    (native-inputs `(("ghc-hspec" ,ghc-hspec-2.7.0)
                     ("ghc-hspec-discover" ,ghc-hspec-discover-2.7.0)))
    (home-page
     "https://github.com/sol/with-location#readme")
    (synopsis
     "Use ImplicitParams-based source locations in a backward compatible way")
    (description "")
    (license license:expat)))

(define ghc-tagged-0.8.6
  (package
    (name "ghc-tagged-0.8.6")
    (version "0.8.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/tagged/tagged-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1pciqzxf9ncv954v4r527xkxkn7r5hcr13mfw5dg1xjci3qdw5md"))))
    (build-system haskell-build-system)
    (home-page "http://github.com/ekmett/tagged")
    (synopsis
     "Haskell 98 phantom types to avoid unsafely passing dummy arguments")
    (description
     "Haskell 98 phantom types to avoid unsafely passing dummy arguments.")
    (license license:bsd-3)))

(define ghc-wai-app-static
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
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-memory" ,ghc-memory)
       ("ghc-mime-types" ,ghc-mime-types)
       ("ghc-network" ,ghc-network)
       ("ghc-old-locale" ,ghc-old-locale)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-temporary" ,ghc-temporary)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-wai" ,ghc-wai-3.2.1.2)
       ("ghc-wai-extra" ,ghc-wai-extra-3.0.25)
       ("ghc-warp" ,ghc-warp-3.2.26)
       ("ghc-zlib" ,ghc-zlib)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-mocker" ,ghc-mockery-0.3.5)))
    (home-page
     "http://www.yesodweb.com/book/web-application-interface")
    (synopsis "WAI application for static serving")
    (description
     " API docs and the README are available at http://www.stackage.org/package/wai-app-static.")
    (license license:expat)))

(define ghc-hspec-wai-0.9.2
  (package
    (name "ghc-hspec-wai-0.9.2")
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
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-hspec-core" ,ghc-hspec-core-2.6.1)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-wai" ,ghc-wai-3.2.1.2)
       ("ghc-wai-extra" ,ghc-wai-extra-3.0.25)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-hspec-discover" ,ghc-hspec-discover-2.6.1)))
    (home-page
     "https://github.com/hspec/hspec-wai#readme")
    (synopsis
     "Experimental Hspec support for testing WAI applications")
    (description
     "Experimental Hspec support for testing WAI applications")
    (license license:expat)))

(define ghc-should-not-typecheck
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
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)))
    (home-page
     "http://github.com/CRogers/should-not-typecheck")
    (synopsis
     "A HUnit/hspec assertion library to verify that an expression does not typecheck")
    (description
     "For examples and an introduction to the library please take a look at the <https://github.com/CRogers/should-not-typecheck#should-not-typecheck- README> on github.")
    (license license:bsd-3)))

(define ghc-hspec-discover-2.5.5
  (package
    (name "ghc-hspec-discover-2.5.5")
    (version "2.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-discover/hspec-discover-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "04aidzi91ccr9bygmfkjzshz34z9vh8wvqj4zinx2clxq6r7gqfz"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-hspec-meta" ,ghc-hspec-meta)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "Automatically discover and run Hspec tests")
    (description
     "Automatically discover and run Hspec tests

http://hspec.github.io/hspec-discover.html")
    (license license:expat)))

(define ghc-hspec-2.6.1
  (package
    (name "ghc-hspec-2.6.1")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec/hspec-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1jkfqhdymr62rzqmlmc22mpla23p67rnls3v3zs30ggxbgs4dxlb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-hspec-core" ,ghc-hspec-core-2.6.1)
       ("ghc-hspec-discover" ,ghc-hspec-discover-2.6.1)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)))
    (home-page "http://hspec.github.io/")
    (synopsis "A Testing Framework for Haskell")
    (description
     "Hspec is a testing framework for Haskell.  Some of Hspec's distinctive features are:

* a friendly DSL for defining tests
* integration with QuickCheck, SmallCheck, and HUnit
* parallel test execution
* automatic discovery of test files

The Hspec Manual is at http://hspec.github.io/.")
    (license license:expat)))

(define ghc-hspec-discover-2.6.1
  (package
    (name "ghc-hspec-discover-2.6.1")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-discover/hspec-discover-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "189gj8drfzdf3j3xm8gbj9hjc1ha95ajhi47s9r440yjhyarlmlx"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hspec-meta" ,ghc-hspec-meta-2.6.0)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "Automatically discover and run Hspec tests")
    (description
     "Automatically discover and run Hspec tests

http://hspec.github.io/hspec-discover.html")
    (license license:expat)))

(define ghc-hspec-core-2.6.1
  (package
    (name "ghc-hspec-core-2.6.1")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-core/hspec-core-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0xg43kan7p6ahi5827qwcyiic6bq0bp8n0n8h3j4kh87qhdl4avv"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-call-stack" ,ghc-call-stack)
       ("ghc-clock" ,ghc-clock)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-quickcheck-io" ,ghc-quickcheck-io-0.2.0)
       ("ghc-random" ,ghc-random)
       ("ghc-setenv" ,ghc-setenv)
       ("ghc-tf-random" ,ghc-tf-random)))
    (native-inputs
     `(("ghc-hspec-meta" ,ghc-hspec-meta-2.6.0)
       ("ghc-silently" ,ghc-silently)
       ("ghc-temporary" ,ghc-temporary)))
    (home-page "http://hspec.github.io/")
    (synopsis "A Testing Framework for Haskell")
    (description
     "This package exposes internal types and functions that can be used to extend Hspec's functionality.")
    (license license:expat)))

(define ghc-hspec-meta-2.6.0
  (package
    (name "ghc-hspec-meta-2.6.0")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/hspec-meta/hspec-meta-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1n1a4633wfivylglji8920f67mx7qz8j4q58n8p7dxk6yg4h3mz6"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-call-stack" ,ghc-call-stack)
       ("ghc-clock" ,ghc-clock)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-quickcheck-io" ,ghc-quickcheck-io-0.2.0)
       ("ghc-random" ,ghc-random)
       ("ghc-setenv" ,ghc-setenv)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "A version of Hspec which is used to test Hspec itself")
    (description
     "A stable version of Hspec which is used to test the in-development version of Hspec.")
    (license license:expat)))

(define ghc-quickcheck-io-0.2.0
  (package
    (name "ghc-quickcheck-io")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/quickcheck-io/quickcheck-io-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "08k4v7pkgjf30pv5j2dfv1gqv6hclxlniyq2sps8zq4zswcr2xzv"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hunit" ,ghc-hunit)))
    (home-page
     "https://github.com/hspec/quickcheck-io#readme")
    (synopsis
     "Use HUnit assertions as QuickCheck properties")
    (description
     "This package provides an orphan instance that allows you to use HUnit assertions as QuickCheck properties.")
    (license license:expat)))

(define ghc-network-2.8.0.0
  (package
    (name "ghc-network")
    (version "2.8.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/network/network-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "00skcish0xmm67ax999nv1nll9rm3gqmn92099iczd73nxl55468"))))
    (build-system haskell-build-system)
    ;; TODO: What happened here?
    (arguments `(#:tests? #f))
    (home-page "https://github.com/haskell/network")
    (synopsis "Low-level networking interface")
    (description
     "This package provides a low-level networking interface.

In network-2.6 the Network.URI module was split off into its own package, network-uri-2.6. If you're using the Network.URI module you can automatically get it from the right package by adding this to your .cabal file:
    library
        build-depends: network-uri-flag")
    (license license:bsd-3)))

(define ghc-resourcet-1.2.2
  (package
    (name "ghc-resourcet-1.2.2")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/resourcet/resourcet-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1rfbfcv3r1h29y0yqr3x6a1s04lbc3vzm3jqnfg4f9rqp9d448qk"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-exceptions" ,ghc-exceptions)
       ("ghc-unliftio-core" ,ghc-unliftio-core)
       ("ghc-primitive" ,ghc-primitive)))
    (native-inputs `(("ghc-hspec" ,ghc-hspec-2.6.1)))
    (home-page "http://github.com/snoyberg/conduit")
    (synopsis
     "Deterministic allocation and freeing of scarce resources.")
    (description
     "Hackage documentation generation is not reliable. For up to date documentation, please see: http://www.stackage.org/package/resourcet.")
    (license license:bsd-3)))

(define ghc-wai-extra-3.0.25
  (package
    (name "ghc-wai-extra-3.0.25")
    (version "3.0.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/wai-extra/wai-extra-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0caz1miwnyjqg6gdfgv7ibyfdyjzlq2i8v07zhan1nniv9pj3w6y"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-wai" ,ghc-wai-3.2.1.2)
       ("ghc-old-locale" ,ghc-old-locale)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-data-default-class" ,ghc-data-default-class)
       ("ghc-fast-logger" ,ghc-fast-logger)
       ("ghc-wai-logger" ,ghc-wai-logger-2.3.2)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-resourcet" ,ghc-resourcet-1.2.2)
       ("ghc-void" ,ghc-void)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-word8" ,ghc-word8)
       ("ghc-streaming-commons" ,ghc-streaming-commons-0.2.1.0)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-cookie" ,ghc-cookie)
       ("ghc-vault" ,ghc-vault)
       ("ghc-zlib" ,ghc-zlib)
       ("ghc-aeson" ,ghc-aeson-1.4.2.0)
       ("ghc-iproute" ,ghc-iproute-1.7.5)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-hspec-discover" ,ghc-hspec-discover-2.6.1)
       ("ghc-hunit" ,ghc-hunit)))
    (home-page "http://github.com/yesodweb/wai")
    (synopsis
     "Provides some basic WAI handlers and middleware.")
    (description
     "Provides basic WAI handler and middleware functionality: . * WAI Testing Framework . Hspec testing facilities and helpers for WAI. . * Event Source/Event Stream . Send server events to the client. Compatible with the JavaScript EventSource API. . * Accept Override . Override the Accept header in a request. Special handling for the _accept query parameter (which is used throughout WAI override the Accept header). . * Add Headers . WAI Middleware for adding arbitrary headers to an HTTP request. . * Clean Path . Clean a request path to a canonical form. . * GZip Compression . Negotiate HTTP payload gzip compression. . * HTTP Basic Authentication . WAI Basic Authentication Middleware which uses Authorization header. . * JSONP . \\\"JSON with Padding\\\" middleware. Automatic wrapping of JSON responses to convert into JSONP. . * Method Override / Post . Allows overriding of the HTTP request method via the _method query string parameter. . * Request Logging . Request logging middleware for development and production environments . * Request Rewrite . Rewrite request path info based on a custom conversion rules. . * Stream Files . Convert ResponseFile type responses into ResponseStream type. . * Virtual Host . Redirect incoming requests to a new host based on custom rules. . . API docs and the README are available at <http://www.stackage.org/package/wai-extra>.")
    (license license:expat)))

(define ghc-warp-3.2.26
  (package
    (name "ghc-warp-3.2.26")
    (version "3.2.26")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://hackage/package/"
                           "warp-" version "/" "warp-" version
                           ".tar.gz"))
       (sha256
        (base32
         "1s83313cs6w84a8yfwqkixfz4a94aszma4phsqv7x1ivi9b3i8sc"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-async" ,ghc-async)
       ("ghc-auto-update" ,ghc-auto-update)
       ("ghc-bsb-http-chunked" ,ghc-bsb-http-chunked)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-iproute" ,ghc-iproute-1.7.5)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-streaming-commons" ,ghc-streaming-commons-0.2.1.0)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-vault" ,ghc-vault)
       ("ghc-wai" ,ghc-wai-3.2.1.2)
       ("ghc-word8" ,ghc-word8)
       ("ghc-http-date" ,ghc-http-date)
       ("ghc-simple-sendfile" ,ghc-simple-sendfile-0.2.27)
       ("ghc-http2" ,ghc-http2)))
    (native-inputs
     `(("curl" ,curl)
       ("ghc-silently" ,ghc-silently)
       ("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-doctest" ,ghc-doctest)
       ("ghc-lifted-base" ,ghc-lifted-base)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-http-client" ,ghc-http-client-0.5.13.1)
       ("hspec-discover" ,ghc-hspec-discover-2.6.1)))
    (home-page "http://github.com/yesodweb/wai")
    (synopsis "HTTP server library for Haskell's WAI")
    (description "Warp is a server library for HTTP/1.x and HTTP/2
based WAI (Web Application Interface in Haskell).")
    (license license:expat)))

(define ghc-wai-3.2.1.2
  (package
    (name "ghc-wai-3.2.1.2")
    (version "3.2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/wai/wai-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0jr3b2789wa4m6mxkz12ynz4lfsqmgbrcy0am8karyqr3x3528r8"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-bytestring-builder" ,ghc-bytestring-builder)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-vault" ,ghc-vault)
       ("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-http-types" ,ghc-http-types-0.12.2)))
    (native-inputs
     `(("hspec-discover" ,ghc-hspec-discover-2.6.1)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-hspec" ,ghc-hspec-2.6.1)))
    (home-page "mirror://hackage/package/wai")
    (synopsis "Web application interface for Haskell")
    (description "This package provides a Web Application Interface (WAI)
library for the Haskell language.  It defines a common protocol for
communication between web applications and web servers.")
    (license license:bsd-3)))

(define ghc-http-client-0.5.13.1
  (package
    (name "ghc-http-client-0.5.13.1")
    (version "0.5.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://hackage/package/"
                                  "http-client/http-client-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0szwbgvkkdz56lgi91armkagmb7nnfwbpp4j7cm9zhmffv3ba8g1"))))
    (build-system haskell-build-system)
    ;; Tests require access to the web.
    (arguments `(#:tests? #f))
    (inputs
     `(("ghc-async" ,ghc-async)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-cookie" ,ghc-cookie)
       ("ghc-data-default-class" ,ghc-data-default-class)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-memory" ,ghc-memory)
       ("ghc-mime-types" ,ghc-mime-types)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-network-uri" ,ghc-network-uri)
       ("ghc-random" ,ghc-random)
       ("ghc-streaming-commons" ,ghc-streaming-commons-0.2.1.0)
       ("ghc-zlib" ,ghc-zlib)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec-2.6.1)))
    (home-page "https://github.com/snoyberg/http-client")
    (synopsis "HTTP client engine")
    (description
     "This package provides an HTTP client engine, intended as a base layer
for more user-friendly packages.")
    (license license:expat)))

(define ghc-streaming-commons-0.2.1.0
  (package
    (name "ghc-streaming-commons-0.2.1.0")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://hackage/package/"
                           "streaming-commons/streaming-commons-"
                           version ".tar.gz"))
       (sha256
        (base32
         "13fn6qmpiggwpn8lczyydgp77cyzfypwds7wxskrwir4i5cgxlfq"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-async" ,ghc-async)
       ("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-random" ,ghc-random)
       ("ghc-zlib" ,ghc-zlib)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hspec" ,ghc-hspec-2.6.1)
       ("hspec-discover" ,ghc-hspec-discover-2.6.1)))
    (home-page "mirror://hackage/package/streaming-commons")
    (synopsis "Conduit and pipes needed by some streaming data libraries")
    (description "This package provides low-dependency functionality commonly
needed by various Haskell streaming data libraries, such as @code{conduit} and
@code{pipe}s.")
    (license license:expat)))

(define ghc-simple-sendfile-0.2.27
  (package
    (name "ghc-simple-sendfile-0.2.27")
    (version "0.2.27")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://hackage/package/"
                           "simple-sendfile-" version "/"
                           "simple-sendfile-" version ".tar.gz"))
       (sha256
        (base32
         "1bwwqzcm56m2w4ymsa054sxmpbj76h9pvb0jf8zxp8lr41cp51gn"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-conduit" ,ghc-conduit-1.3.0.3)
       ("ghc-conduit-extra" ,ghc-conduit-extra-1.3.0)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-resourcet" ,ghc-resourcet-1.2.2)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("hspec-discover" ,ghc-hspec-discover-2.6.1)))
    (home-page "https://github.com/kazu-yamamoto/simple-sendfile")
    (synopsis "Cross platform library for the sendfile system call")
    (description "This library tries to call minimum system calls which
are the bottleneck of web servers.")
    (license license:bsd-3)))

(define ghc-iproute-1.7.5
  (package
    (name "ghc-iproute-1.7.5")
    (version "1.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/iproute/iproute-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1vw1nm3s8vz1hqnjnqd3wh5rr4q3m2r4izn5ynhf93h9185qwqzd"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f)) ; FIXME: Tests cannot find System.ByteOrder,
                                        ; exported by ghc-byteorder.  Doctest issue.
    (inputs
     `(("ghc-appar" ,ghc-appar)
       ("ghc-byteorder" ,ghc-byteorder)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-safe" ,ghc-safe)))
    (home-page "https://www.mew.org/~kazu/proj/iproute/")
    (synopsis "IP routing table")
    (description "IP Routing Table is a tree of IP ranges to search one of
them on the longest match base.  It is a kind of TRIE with one way branching
removed.  Both IPv4 and IPv6 are supported.")
    (license license:bsd-3)))

(define-public ghc-conduit-1.3.0.3
  (package
    (name "ghc-conduit-1.3.0.3")
    (version "1.3.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://hackage/package/"
                                  "conduit/conduit-" version ".tar.gz"))
              (sha256
               (base32
                "1sangm0qqi9dzlq95746a3kl14k8b09592a423shxjf2a0b1yx5v"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-exceptions" ,ghc-exceptions)
       ("ghc-lifted-base" ,ghc-lifted-base)
       ("ghc-mono-traversable" ,ghc-mono-traversable)
       ("ghc-mmorph" ,ghc-mmorph)
       ("ghc-resourcet" ,ghc-resourcet-1.2.2)
       ("ghc-silently" ,ghc-silently)
       ("ghc-transformers-base" ,ghc-transformers-base)
       ("ghc-unliftio" ,ghc-unliftio)
       ("ghc-unliftio-core" ,ghc-unliftio-core)
       ("ghc-vector" ,ghc-vector)
       ("ghc-void" ,ghc-void)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-safe" ,ghc-safe)
       ("ghc-split" ,ghc-split)))
    (home-page "https://github.com/snoyberg/conduit")
    (synopsis "Streaming data library ")
    (description
     "The conduit package is a solution to the streaming data problem,
allowing for production, transformation, and consumption of streams of data
in constant memory.  It is an alternative to lazy I/O which guarantees
deterministic resource handling, and fits in the same general solution
space as enumerator/iteratee and pipes.")
    (license license:expat)))

(define ghc-conduit-extra-1.3.0
  (package
    (name "ghc-conduit-extra-1.3.0")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://hackage/package/"
                           "conduit-extra/conduit-extra-"
                           version ".tar.gz"))
       (sha256
        (base32
         "1bi2b6kdzy5f9glq46jzsk02has95jkxqz0cchpbmnakzhjwjh9c"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-conduit" ,ghc-conduit-1.3.0.3)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-transformers-base" ,ghc-transformers-base)
       ("ghc-typed-process" ,ghc-typed-process)
       ("ghc-async" ,ghc-async)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-primitive" ,ghc-primitive)
       ("ghc-resourcet" ,ghc-resourcet-1.2.2)
       ("ghc-streaming-commons" ,ghc-streaming-commons-0.2.1.0)
       ("ghc-hspec" ,ghc-hspec-2.6.1)
       ("ghc-bytestring-builder" ,ghc-bytestring-builder)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)))
    (native-inputs
     `(("hspec-discover" ,ghc-hspec-discover-2.6.1)))
    (home-page "https://github.com/snoyberg/conduit")
    (synopsis "Conduit adapters for common libraries")
    (description
     "The @code{conduit} package itself maintains relative small dependencies.
The purpose of this package is to collect commonly used utility functions
wrapping other library dependencies, without depending on heavier-weight
dependencies.  The basic idea is that this package should only depend on
@code{haskell-platform} packages and @code{conduit}.")
    (license license:expat)))

(define ghc-wai-logger-2.3.2
  (package
    (name "ghc-wai-logger-2.3.2")
    (version "2.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/wai-logger/wai-logger-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0w5ldq4gplc16zzk5ikmbbjw79imaqvw8p6lylaw3hlsbn3zzm4d"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f)) ; FIXME: Tests cannot find libraries exported
                                        ; by propagated-inputs.
    (inputs
     `(("ghc-auto-update" ,ghc-auto-update)
       ("ghc-byteorder" ,ghc-byteorder)
       ("ghc-easy-file" ,ghc-easy-file)
       ("ghc-unix-time" ,ghc-unix-time)
       ("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-fast-logger" ,ghc-fast-logger)
       ("ghc-http-types" ,ghc-http-types-0.12.2)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-wai" ,ghc-wai-3.2.1.2)))
    (home-page "mirror://hackage/package/wai-logger")
    (synopsis "Logging system for WAI")
    (description "This package provides the logging system for WAI.")
    (license license:bsd-3)))

(define ghc-tasty-quickcheck-0.10
  (package
    (name "ghc-tasty-quickcheck-0.10")
    (version "0.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/tasty-quickcheck/"
             "tasty-quickcheck-" version ".tar.gz"))
       (sha256
        (base32
         "0vr6szbbz3s5461i0zr8zpq347zfvidfzv5gf3xwxhm0yk731z8h"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-tasty" ,ghc-tasty-1.1.0.3)
       ("ghc-random" ,ghc-random)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit-0.10.0.1)
       ("ghc-pcre-light" ,ghc-pcre-light)))
    (home-page "http://documentup.com/feuerbach/tasty")
    (synopsis "QuickCheck support for the Tasty test framework")
    (description "This package provides QuickCheck support for the Tasty
Haskell test framework.")
    (license license:expat)))

(define ghc-tasty-1.1.0.3
  (package
    (name "ghc-tasty-1.1.0.3")
    (version "1.1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/tasty/tasty-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "14riid753hjqr6lca1kgxpnvq0wykf0k3qc5jpag42hh8bszav22"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-regex-tdfa" ,ghc-regex-tdfa)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-unbounded-delays" ,ghc-unbounded-delays)
       ("ghc-async" ,ghc-async)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-clock-bootstrap" ,ghc-clock-bootstrap-0.5.1)
       ("ghc-wcwidth" ,ghc-wcwidth-bootstrap)))
    (home-page "http://documentup.com/feuerbach/tasty")
    (synopsis "Modern and extensible testing framework")
    (description "Tasty is a modern testing framework for Haskell.  It lets
you combine your unit tests, golden tests, QuickCheck/SmallCheck properties,
and any other types of tests into a single test suite.")
    (license license:expat)))

;; This package builds `clock` without tests, since the tests rely on tasty
;; and tasty-quickcheck, which in turn require clock to build.
(define ghc-clock-bootstrap-0.5.1
  (package
    (name "ghc-clock-bootstrap-0.5.1")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/"
             "clock/"
             "clock-" version ".tar.gz"))
       (sha256
        (base32 "1ncph7vi2q6ywwc8ysxl1ibw6i5dwfvln88ssfazk8jgpj4iyykw"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f)) ;; Testing suite depends on tasty and
    ;; tasty-quickcheck, which need clock to build.
    (home-page "mirror://hackage/package/clock")
    (synopsis "High-resolution clock for Haskell")
    (description "A package for convenient access to high-resolution clock and
timer functions of different operating systems via a unified API.")
    (license license:bsd-3)))

(define ghc-tasty-hunit-0.10.0.1
  (package
    (name "ghc-tasty-hunit-0.10.0.1")
    (version "0.10.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/tasty-hunit/tasty-hunit-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0j3hgga6c3s8h5snzivb8a75h96207ia2rlbxzj07xbf4zpkp44g"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-call-stack" ,ghc-call-stack-boot)
       ("ghc-tasty" ,ghc-tasty-1.1.0.3)))
    (home-page "http://documentup.com/feuerbach/tasty")
    (synopsis "HUnit support for the Tasty test framework")
    (description "This package provides HUnit support for the Tasty Haskell
test framework.")
    (license license:expat)))

(define ghc-bifunctors-5.5.3
  (package
    (name "ghc-bifunctors-5.5.3")
    (version "5.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/bifunctors/bifunctors-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1jn9rxg643xnlhrknmjz88nblcpsr45xwjkwwnn5nxpasa7m4d6l"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-orphans" ,ghc-base-orphans)
       ("ghc-comonad" ,ghc-comonad-5.0.4)
       ("ghc-th-abstraction" ,ghc-th-abstraction)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-semigroups" ,ghc-semigroups)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("hspec-discover" ,ghc-hspec-discover-2.6.1)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)))
    (home-page "https://github.com/ekmett/bifunctors/")
    (synopsis "Bifunctors for Haskell")
    (description "This package provides bifunctors for Haskell.")
    (license license:bsd-3)))

(define ghc-comonad-5.0.4
  (package
    (name "ghc-comonad-5.0.4")
    (version "5.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/comonad/comonad-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "09g870c4flp4k3fgbibsd0mmfjani1qcpbcl685v8x89kxzrva3q"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("cabal-doctest" ,cabal-doctest)
       ("ghc-doctest" ,ghc-doctest-0.16.0.1)))
    (inputs
     `(("ghc-contravariant" ,ghc-contravariant)
       ("ghc-distributive" ,ghc-distributive-0.5.3)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-transformers-compat" ,ghc-transformers-compat)))
    (home-page "https://github.com/ekmett/comonad/")
    (synopsis "Comonads for Haskell")
    (description "This library provides @code{Comonad}s for Haskell.")
    (license license:bsd-3)))

(define ghc-distributive-0.5.3
  (package
    (name "ghc-distributive-0.5.3")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/distributive/distributive-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0y566r97sfyvhsmd4yxiz4ns2mqgwf5bdbp56wgxl6wlkidq0wwi"))))
    (build-system haskell-build-system)
    (arguments
     `(#:cabal-revision
       ("6" "06bd38rf31yrvvy989r44pm0id3dsxwcp6nxg7wk6ccj3n2b8rzk")))
    (inputs
     `(("ghc-tagged" ,ghc-tagged-0.8.6)
       ("ghc-base-orphans" ,ghc-base-orphans)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-generic-deriving" ,ghc-generic-deriving)))
    (native-inputs
     `(("cabal-doctest" ,cabal-doctest)
       ("ghc-doctest" ,ghc-doctest-0.16.0.1)
       ("ghc-hspec" ,ghc-hspec-2.6.1)
       ("hspec-discover" ,ghc-hspec-discover-2.6.1)))
    (home-page "https://github.com/ekmett/distributive/")
    (synopsis "Distributive functors for Haskell")
    (description "This package provides distributive functors for Haskell.
Dual to @code{Traversable}.")
    (license license:bsd-3)))

(define ghc-mockery-0.3.5
  (package
    (name "ghc-mockery-0.3.5")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://hackage/package/"
                                  "mockery/mockery-" version ".tar.gz"))
              (sha256
               (base32
                "09ypgm3z69gq8mj6y66ss58kbjnk15r8frwcwbqcfbfksfnfv8dp"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-temporary" ,ghc-temporary)
       ("ghc-logging-facade" ,ghc-logging-facade)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)))
    (native-inputs
     `(("ghc-hspec" ,ghc-hspec-2.6.1)
       ("hspec-discover" ,ghc-hspec-discover-2.6.1)))
    (home-page "mirror://hackage/package/mockery")
    (synopsis "Support functions for automated testing")
    (description
     "The mockery package provides support functions for automated testing.")
    (license license:expat)))

(define ghc-wai-websockets
  (package
    (name "ghc-wai-websockets")
    (version "3.0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/wai-websockets/wai-websockets-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0b2xmdsrsqpssyib53wbr6r8hf75789ndyyanv37sv99iyqcwz4i"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-wai" ,ghc-wai-3.2.1.2)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-websockets" ,ghc-websockets)
       ("ghc-http-types" ,ghc-http-types-0.12.2)))
    (arguments
     `(#:configure-flags '("--flags=-example")))
    (home-page "http://github.com/yesodweb/wai")
    (synopsis
     "Provide a bridge between WAI and the websockets package.")
    (description
     "API docs and the README are available at http://www.stackage.org/package/wai-websockets.")
    (license license:expat)))

(define ghc-websockets
  (package
    (name "ghc-websockets")
    (version "0.12.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/websockets/websockets-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0wacifjbskkfv6xq1sbmc8p60wn767xcjhz8hn8hyijxrrmjabci"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-bytestring-builder" ,ghc-bytestring-builder)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-network" ,ghc-network-2.8.0.0)
       ("ghc-random" ,ghc-random)
       ("ghc-sha" ,ghc-sha)
       ("ghc-streaming-commons" ,ghc-streaming-commons-0.2.1.0)
       ("ghc-entropy" ,ghc-entropy)))
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2-0.3.0.5)))
    (home-page "http://jaspervdj.be/websockets")
    (synopsis
     "A sensible and clean way to write WebSocket-capable servers in Haskell.")
    (description
     "This library allows you to write WebSocket-capable servers.

An example server: https://github.com/jaspervdj/websockets/blob/master/example/server.lhs
An example client: https://github.com/jaspervdj/websockets/blob/master/example/client.hs

See also:

  * The specification of the WebSocket protocol: http://www.whatwg.org/specs/web-socket-protocol/ .
  * The JavaScript API for dealing with WebSockets: http://www.w3.org/TR/websockets/")
    (license license:bsd-3)))

(define ghc-test-framework-quickcheck2-0.3.0.5
  (package
    (name "ghc-test-framework-quickcheck2-0.3.0.5")
    (version "0.3.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://hackage/package/"
                           "test-framework-quickcheck2/"
                           "test-framework-quickcheck2-" version ".tar.gz"))
       (sha256
        (base32
         "0ngf9vvby4nrdf1i7dxf5m9jn0g2pkq32w48xdr92n9hxka7ixn9"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-extensible-exceptions" ,ghc-extensible-exceptions)
       ("ghc-quickcheck" ,ghc-quickcheck-2.12.6.1)
       ("ghc-random" ,ghc-random)
       ("ghc-test-framework" ,ghc-test-framework)))
    (home-page "https://batterseapower.github.io/test-framework/")
    (synopsis "QuickCheck2 support for test-framework")
    (description
     "This packages provides QuickCheck2 support for the test-framework
package.")
    (license license:bsd-3)))
