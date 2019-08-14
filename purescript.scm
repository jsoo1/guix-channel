(define-module (purescript)
  #:use-module (dhall)
  #:use-module ((ghc-cborg) #:select (ghc-serialise))
  #:use-module (ghc-microlens)
  #:use-module ((ghc-mtl) #:select (ghc-mtl-compat))
  #:use-module (ghc-parsing)
  #:use-module (ghc-repline)
  #:use-module (ghc-system)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module ((gnu packages python) #:select (python))
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (purescript
            purescript-spago))

(define purescript
  (package
    (name "purescript")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/purescript/purescript-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1y7bcfj6fdlwmisdd75xcdkz7grch0pcmb9xsh6zwyvi6c40a3g2"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-glob" ,ghc-glob)
       ("ghc-aeson" ,ghc-aeson)
       ("ghc-aeson-better-errors" ,ghc-aeson-better-errors)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-base-compat" ,ghc-base-compat)
       ("ghc-blaze-html" ,ghc-blaze-html)
       ("ghc-bower-json" ,ghc-bower-json)
       ("ghc-boxes" ,ghc-boxes)
       ("ghc-cheapskate" ,ghc-cheapskate)
       ("ghc-clock" ,ghc-clock)
       ("ghc-data-ordlist" ,ghc-data-ordlist)
       ("ghc-dlist" ,ghc-dlist)
       ("ghc-edit-distance" ,ghc-edit-distance)
       ("ghc-file-embed" ,ghc-file-embed)
       ("ghc-fsnotify" ,ghc-fsnotify)
       ("ghc-language-javascript" ,ghc-language-javascript)
       ("ghc-lifted-base" ,ghc-lifted-base)
       ("ghc-microlens-platform" ,ghc-microlens-platform-3.11)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-monad-logger" ,ghc-monad-logger)
       ("ghc-parallel" ,ghc-parallel)
       ("ghc-pattern-arrows" ,ghc-pattern-arrows)
       ("ghc-protolude" ,ghc-protolude)
       ("ghc-regex-tdfa" ,ghc-regex-tdfa)
       ("ghc-safe" ,ghc-safe)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-sourcemap" ,ghc-sourcemap)
       ("ghc-split" ,ghc-split)
       ("ghc-stringsearch" ,ghc-stringsearch)
       ("ghc-syb" ,ghc-syb)
       ("ghc-transformers-base" ,ghc-transformers-base)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-utf8-string" ,ghc-utf8-string)
       ("ghc-vector" ,ghc-vector)
       ("ghc-ansi-wl-pprint" ,ghc-ansi-wl-pprint)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-network" ,ghc-network)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-wai" ,ghc-wai)
       ("ghc-wai-websockets" ,ghc-wai-websockets)
       ("ghc-warp" ,ghc-warp)
       ("ghc-websockets" ,ghc-websockets)
       ("ghc-gitrev" ,ghc-gitrev)))
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-hspec" ,ghc-hspec)
       ("ghc-hspec-discover" ,ghc-hspec-discover)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hspec" ,ghc-tasty-hspec)))
    (arguments
     ;; There is no npm yet
     `(#:tests? #f))
    (home-page "http://www.purescript.org/")
    (synopsis
     "PureScript Programming Language Compiler")
    (description
     "A small strongly, statically typed programming language with expressive types, inspired by Haskell and compiling to JavaScript.")
    (license license:bsd-3)))

(define purescript-spago
  (let ((revision "1")
        (commit "838e627461f58181bb69fd3828a161bc88b97e6d"))
    (package
      (name "purescript-spago")
      (version (git-version "0.6.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/spacchetti/spago")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "18pfdhiqn0a3iwvkxzw4lkg8g6h5c60gj917y0n6k08pdi3vv800"))))
      (build-system haskell-build-system)
      (native-inputs
       `(("ghc-hpack" ,ghc-hpack)
         ("python" ,python)))
      (inputs
       `(("dhall" ,dhall)
         ("dhall-json" ,dhall-json)
         ("ghc-aeson" ,ghc-aeson)
         ("ghc-aeson-pretty" ,ghc-aeson-pretty)
         ("ghc-async-pool" ,ghc-async-pool)
         ("ghc-dotgen" ,ghc-dotgen)
         ("ghc-megaparsec-7.0.4" ,ghc-megaparsec-7.0.4)
         ("ghc-process" ,ghc-process)
         ("ghc-repline" ,ghc-repline)
         ("ghc-serialise" ,ghc-serialise)
         ("ghc-turtle" ,ghc-turtle)
         ("ghc-file-embed" ,ghc-file-embed)))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'setup-compiler 'hpack
             (lambda _
               (invoke "hpack")
               (substitute* "spago.cabal"
                 (("filepath") "filepath <= 1.4.2"))
               (substitute* "spago.cabal"
                 (("process") "process <= 1.6.3.0"))
               #t)))))
      (home-page "https://github.com/spacchetti/spago")
      (synopsis "spaghetti PureScript package manager and build tool powered by Dhall and Spacchetti package-sets")
      (description "spago aims to tie together the UX of developing a PureScript project.
In this Pursuit (see what I did there) it is heavily inspired by Rust's Cargo and Haskell's Stack, and builds on top of ideas from existing PureScript infrastructure and tooling, as psc-package, pulp and purp.")
      ;; TODO figure it out
      (license license:bsd-3))))

;; DEPENDENCIES

(define ghc-pattern-arrows
  (package
    (name "ghc-pattern-arrows")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/pattern-arrows/pattern-arrows-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "13q7bj19hd60rnjfc05wxlyck8llxy11z3mns8kxg197wxrdkhkg"))))
    (build-system haskell-build-system)
    (home-page
     "http://blog.functorial.com/posts/2013-10-27-Pretty-Printing-Arrows.html")
    (synopsis "Arrows for Pretty Printing")
    (description
     "A library for generating concise pretty printers based on precedence rules.")
    (license license:expat)))

(define ghc-protolude
  (package
    (name "ghc-protolude")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/protolude/protolude-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0zzkyxz0vmcbncpid7gp72fpjj0fla3gqhlfkij5c5lg12skjgfj"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-async" ,ghc-async)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-mtl-compat" ,ghc-mtl-compat)
       ("ghc-transformers-compat" ,ghc-transformers-compat)))
    (home-page "https://github.com/sdiehl/protolude")
    (synopsis "A small prelude.")
    (description
     "A sensible set of defaults for writing custom Preludes.")
    (license license:expat)))

(define ghc-sourcemap
  (package
    (name "ghc-sourcemap")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/sourcemap/sourcemap-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0ynfm44ym8y592wnzdwa0d05dbkffyyg5sm26y5ylzpynk64r85r"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-utf8-string" ,ghc-utf8-string)))
    (arguments
     `(#:tests? #f))
    (home-page
     "http://hackage.haskell.org/package/sourcemap")
    (synopsis
     "Implementation of source maps as proposed by Google and Mozilla.")
    (description
     "Implementation of source maps, revision 3, proposed by Google and Mozilla here https://wiki.mozilla.org/DevTools/Features/SourceMap and here https://docs.google.com/document/d/1U1RGAehQwRypUTovF1KRlpiOFze0b-_2gc6fAH0KY0k/edit")
    (license license:bsd-3)))

(define ghc-utf8-light
  (package
    (name "ghc-utf8-light")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/utf8-light/utf8-light-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0rwyc5z331yfnm4hpx0sph6i1zvkd1z10vvglhnp0vc9wy644k0q"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/utf8-light")
    (synopsis "Unicode")
    (description "Lightweight UTF8 handling.")
    (license license:bsd-3)))

(define ghc-language-javascript
  (package
    (name "ghc-language-javascript")
    (version "0.6.0.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/language-javascript/language-javascript-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0hv1rj3yarv035mpnnnbqys4sgd0awqlm5hyf29wp051r6dnwxfl"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs
     `(("ghc-alex" ,ghc-alex)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-happy" ,ghc-happy)
       ("ghc-hspec" ,ghc-hspec)
       ("ghc-utf8-light" ,ghc-utf8-light)))
    (home-page
     "https://github.com/erikd/language-javascript https://github.com/erikd/language-javascript")
    (synopsis "Parser for JavaScript")
    (description
     "Parses Javascript into an Abstract Syntax Tree (AST). Initially intended as frontend to hjsmin.

 Note: Version 0.5.0 breaks compatibility with prior versions, the AST has been reworked to allow round trip processing of JavaScript.")
    (license license:bsd-3)))

(define ghc-wai-websockets
  (package
    (name "ghc-wai-websockets")
    (version "3.0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/wai-websockets/wai-websockets-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0b2xmdsrsqpssyib53wbr6r8hf75789ndyyanv37sv99iyqcwz4i"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-wai" ,ghc-wai)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-network" ,ghc-network)
       ("ghc-websockets" ,ghc-websockets)
       ("ghc-http-types" ,ghc-http-types)))
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
             "https://hackage.haskell.org/package/websockets/websockets-"
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
       ("ghc-network" ,ghc-network)
       ("ghc-random" ,ghc-random)
       ("ghc-sha" ,ghc-sha)
       ("ghc-streaming-commons" ,ghc-streaming-commons)
       ("ghc-entropy" ,ghc-entropy)))
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)))
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

(define ghc-hspec-discover
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
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-hspec-meta" ,ghc-hspec-meta)))
    (home-page "http://hspec.github.io/")
    (synopsis
     "Automatically discover and run Hspec tests")
    (description
     "Automatically discover and run Hspec tests.

http://hspec.github.io/hspec-discover.html")
    (license license:expat)))

(define ghc-tasty-hspec
  (package
    (name "ghc-tasty-hspec")
    (version "1.1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/tasty-hspec/tasty-hspec-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0i9kdzjpk750sa078jj3iyhp72k0177zk7vxl131r6dkyz09x27y"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hspec" ,ghc-hspec)
       ("ghc-hspec-core" ,ghc-hspec-core)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-smallcheck" ,ghc-tasty-smallcheck)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page
     "https://github.com/mitchellwrosen/tasty-hspec")
    (synopsis
     "Hspec support for the Tasty test framework.")
    (description
     "This package provides a Tasty provider for Hspec test suites.")
    (license license:bsd-3)))

(define ghc-aeson-better-errors
  (package
    (name "ghc-aeson-better-errors")
    (version "0.9.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/aeson-better-errors/aeson-better-errors-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "09vkyrhwak3bmpfsqcd2az8hfqqkxyhg468hv5avgisy0nzh3w38"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-dlist" ,ghc-dlist)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-vector" ,ghc-vector)
       ("ghc-transformers-compat" ,ghc-transformers-compat)
       ("ghc-void" ,ghc-void)))
    (home-page
     "https://github.com/hdgarrood/aeson-better-errors")
    (synopsis
     "Better error messages when decoding JSON values.")
    (description
     "A small package which gives you the tools to build parsers to decode JSON values, and gives good error messages when parsing fails. See also <http://harry.garrood.me/blog/aeson-better-errors/>.")
    (license license:expat)))

(define ghc-bower-json
  (package
    (name "ghc-bower-json")
    (version "1.0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/bower-json/bower-json-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0wvygg3rdbxzrmr61a9w6ddv9pfric85ih8hnxyk0ydzn7i59abs"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-aeson-better-errors" ,ghc-aeson-better-errors)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-transformers" ,ghc-transformers)
       ("ghc-unordered-containers" ,ghc-unordered-containers)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page "https://github.com/hdgarrood/bower-json")
    (synopsis "Read bower.json from Haskell")
    (description "Bower is a package manager for the web (see http://bower.io). This package provides a data type and ToJSON/FromJSON instances for Bower's package manifest file, bower.json.")
    (license license:expat)))

(define ghc-transformers
  (package
    (name "ghc-transformers")
    (version "0.5.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/transformers/transformers-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "198ric8gr1y58scckr468d11y2g45mzc5pkaa40shj7xgj1bh7mi"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/transformers")
    (synopsis "Concrete functor and monad transformers")
    (description
     "A portable library of functor and monad transformers, inspired by the paper \"Functional Programming with Overloading and Higher-Order Polymorphism\", by Mark P Jones, in Advanced School of Functional Programming, 1995 http://web.cecs.pdx.edu/~mpj/pubs/springschool.html. . This package contains: . * the monad transformer class (in \"Control.Monad.Trans.Class\") . * concrete functor and monad transformers, each with associated operations and functions to lift operations associated with other transformers. . The package can be used on its own in portable Haskell code, in which case operations need to be manually lifted through transformer stacks (see \"Control.Monad.Trans.Class\" for some examples). Alternatively, it can be used with the non-portable monad classes in the mtl or monads-tf packages, which automatically lift operations introduced by monad transformers through other transformers.")
    (license license:bsd-3)))

(define ghc-dotgen
  (package
    (name "ghc-dotgen")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/dotgen/dotgen-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "148q93qsmqgr5pzdwvpjqfd6bdm1pwzcp2rblfwswx2x8c5f43fg"))))
    (build-system haskell-build-system)
    (home-page "https://github.com/ku-fpg/dotgen")
    (synopsis
     "A simple interface for building .dot graph files.")
    (description
     "This package provides a simple interface for building .dot graph files, for input into the dot and graphviz tools. It includes a monadic interface for building graphs.")
    (license license:bsd-3)))

(define ghc-async-pool
  (let ((revision "1")
        (commit "edec25439593093331c89090951399ccdd400124"))
    (package
      (name "ghc-async-pool")
      (version (git-version "0.9.0.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/jwiegley/async-pool")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1pf3dpyi86w99c38d6yi4yjx267rizxhrkrnnqzi7b5qfg7p394b"))))
      (build-system haskell-build-system)
      (inputs
       `(("ghc-fgl" ,ghc-fgl)
         ("ghc-async" ,ghc-async)
         ("ghc-transformers-base" ,ghc-transformers-base)
         ("ghc-monad-control" ,ghc-monad-control)))
      (native-inputs `(("ghc-hspec" ,ghc-hspec)))
      (home-page
       "http://hackage.haskell.org/package/async-pool")
      (synopsis
       "A modified version of async that supports worker groups and many-to-many task dependencies")
      (description
       "This library modifies the async package to allow for task pooling and many-to-many dependencies between tasks.")
      (license license:expat))))

