(define-module (ghc-servant)
  #:use-module (ghc-mtl)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-servant))

(define ghc-servant
  (package
    (name "ghc-servant")
    (version "0.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/servant/servant-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0fgsddg8yn23izk3g4bmax6rlh56qhx13j8h5n6fxr7mq34kagsg"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-mtl" ,ghc-mtl)
       ("ghc-http-api-data" ,ghc-http-api-data-0.4)
       ("ghc-singleton-bool" ,ghc-singleton-bool)
       ("ghc-base-compat" ,ghc-base-compat-0.10.5)
       ("ghc-aeson" ,ghc-aeson-1.4.2.0)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-bifunctors" ,ghc-bifunctors)
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


;; DEPENDENCIES
(define ghc-cabal-doctest
  (package
    (name "ghc-cabal-doctest")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/cabal-doctest/cabal-doctest-"
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
             "https://hackage.haskell.org/package/string-conversions/string-conversions-"
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
             "https://hackage.haskell.org/package/http-media/http-media-"
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
             "https://hackage.haskell.org/package/singleton-bool/singleton-bool-"
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
             "https://hackage.haskell.org/package/QuickCheck/QuickCheck-"
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
             "https://hackage.haskell.org/package/aeson/aeson-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1l4b675nxddim3v30kd7zr3vmrs7i1m81rh8h9bfbm9k9a0p3kkm"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-compat" ,ghc-base-compat)
       ("ghc-contravariant" ,ghc-contravariant)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-tagged" ,ghc-tagged)
       ("ghc-primitive" ,ghc-primitive)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-dlist" ,ghc-dlist)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-th-abstraction" ,ghc-th-abstraction)
       ("ghc-time-locale-compat" ,ghc-time-locale-compat)
       ("ghc-uuid-types" ,ghc-uuid-types)
       ("ghc-vector" ,ghc-vector)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-integer-logarithms" ,ghc-integer-logarithms)
       ("ghc-base-orphans" ,ghc-base-orphans)
       ("ghc-base16-bytestring" ,ghc-base16-bytestring)
       ("ghc-generic-deriving" ,ghc-generic-deriving)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-hashable-time" ,ghc-hashable-time)))
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
             "https://hackage.haskell.org/package/base-compat/base-compat-"
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
             "https://hackage.haskell.org/package/hspec-discover/hspec-discover-"
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
             "https://hackage.haskell.org/package/hspec/hspec-"
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
             "https://hackage.haskell.org/package/hspec-core/hspec-core-"
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
       ("ghc-stm" ,ghc-stm)
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
             "https://hackage.haskell.org/package/quickcheck-io/quickcheck-io-"
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
             "https://hackage.haskell.org/package/hspec-meta/hspec-meta-"
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
       ("ghc-setenv" ,ghc-setenv)
       ("ghc-stm" ,ghc-stm)))
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
             "https://hackage.haskell.org/package/http-api-data/http-api-data-"
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
       ("ghc-tagged" ,ghc-tagged)
       ("ghc-time-locale-compat" ,ghc-time-locale-compat)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-uuid-types" ,ghc-uuid-types)))
    ;; TODO fix, maybe?
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
             "https://hackage.haskell.org/package/hspec/hspec-"
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
             "https://hackage.haskell.org/package/hspec-core/hspec-core-"
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
       ("ghc-quickcheck-io" ,ghc-quickcheck-io)
       ("ghc-random" ,ghc-random)
       ("ghc-setenv" ,ghc-setenv)
       ("ghc-stm" ,ghc-stm)
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
             "https://hackage.haskell.org/package/hspec-discover/hspec-discover-"
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
             "https://hackage.haskell.org/package/quickcheck-instances/quickcheck-instances-"
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
       ("ghc-tagged" ,ghc-tagged)
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
             "https://hackage.haskell.org/package/http-types/http-types-"
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
             "https://hackage.haskell.org/package/attoparsec-iso8601/attoparsec-iso8601-"
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
             "https://hackage.haskell.org/package/doctest/doctest-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "106pc4rs4cfym7754gzdgy36dm9aidwmnqpjm9k7yq1hfd4pallv"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-compat" ,ghc-base-compat)
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
             "https://hackage.haskell.org/package/with-location/with-location-"
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
             "https://hackage.haskell.org/package/tagged/tagged-"
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

