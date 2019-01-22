(define-module (purescript)
  #:use-module (ghc-mtl)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (purescript))

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
       ("ghc-microlens-platform" ,ghc-microlens-platform)
       ("ghc-monad-control" ,ghc-monad-control)
       ("ghc-monad-logger" ,ghc-monad-logger)
       ("ghc-mtl" ,ghc-mtl)
       ("ghc-parallel" ,ghc-parallel)
       ("ghc-parsec" ,ghc-parsec)
       ("ghc-pattern-arrows" ,ghc-pattern-arrows)
       ("ghc-protolude" ,ghc-protolude)
       ("ghc-regex-tdfa" ,ghc-regex-tdfa)
       ("ghc-safe" ,ghc-safe)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-semigroups" ,ghc-semigroups)
       ("ghc-sourcemap" ,ghc-sourcemap)
       ("ghc-split" ,ghc-split)
       ("ghc-stm" ,ghc-stm)
       ("ghc-stringsearch" ,ghc-stringsearch)
       ("ghc-syb" ,ghc-syb)
       ("ghc-transformers-base" ,ghc-transformers-base)
       ("ghc-transformers-compat"
        ,ghc-transformers-compat)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
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
    (home-page "http://www.purescript.org/")
    (synopsis
     "PureScript Programming Language Compiler")
    (description
     "A small strongly, statically typed programming language with expressive types, inspired by Haskell and compiling to JavaScript.")
    (license license:bsd-3)))

(define ghc-mtl-compat
  (package
    (name "ghc-mtl-compat")
    (version "0.2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/mtl-compat/mtl-compat-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "15388p9ybdn6digk6cpdsw6havd0yva8vvwl3p7fnc9sb59wln34"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-mtl" ,ghc-mtl)))
    (home-page
     "https://github.com/haskell-compat/mtl-compat")
    (synopsis
     "Backported Control.Monad.Except module from mtl")
    (description
     "This package backports the \"Control.Monad.Except\" module from @mtl@ (if using @mtl-2.2.0.1@ or earlier), which reexports the @ExceptT@ monad transformer and the @MonadError@ class. . This package should only be used if there is a need to use the @Control.Monad.Except@ module specifically. If you just want the @mtl@ class instances for @ExceptT@, use @transformers-compat@ instead, since @mtl-compat@ does nothing but reexport the instances from that package. . Note that unlike how @mtl-2.2@ or later works, the \"Control.Monad.Except\" module defined in this package exports all of @ExceptT@'s monad class instances. Therefore, you may have to declare @import Control.Monad.Except ()@ at the top of your file to get all of the @ExceptT@ instances in scope.")
    (license license:bsd-3)))

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
    (inputs `(("ghc-mtl" ,ghc-mtl)))
    (home-page
     "http://blog.functorial.com/posts/2013-10-27-Pretty-Printing-Arrows.html")
    (synopsis "Arrows for Pretty Printing")
    (description
     "A library for generating concise pretty printers based on precedence rules.")
    (license license:expat)))

(define ghc-microlens-ghc
  (package
    (name "ghc-microlens-ghc")
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-ghc/microlens-ghc-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "102dbrdsdadxbbhvx8avv1wbk84767a7lkb8ckp3zxk9g7qlly33"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-microlens" ,ghc-microlens)))
    (home-page
     "http://github.com/monadfix/microlens")
    (synopsis
     "microlens + array, bytestring, containers, transformers")
    (description
     "Use this package instead of <http://hackage.haskell.org/package/microlens microlens> if you don't mind depending on all dependencies here â\x80\x93 @Lens.Micro.GHC@ reexports everything from @Lens.Micro@ and additionally provides orphan instances of microlens classes for packages coming with GHC (<http://hackage.haskell.org/package/array array>, <http://hackage.haskell.org/package/bytestring bytestring>, <http://hackage.haskell.org/package/containers containers>, <http://hackage.haskell.org/package/transfromers transformers>). . The minor and major versions of microlens-ghc are incremented whenever the minor and major versions of microlens are incremented, so you can depend on the exact version of microlens-ghc without specifying the version of microlens you need. . This package is a part of the <http://hackage.haskell.org/package/microlens microlens> family; see the readme <https://github.com/monadfix/microlens#readme on Github>.")
    (license license:bsd-3)))

(define ghc-microlens-mtl
  (package
    (name "ghc-microlens-mtl")
    (version "0.1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-mtl/microlens-mtl-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0l6z1gkzwcpv89bxf5vgfrjb6gq2pj7sjjc53nvi5b9alx34zryk"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-microlens" ,ghc-microlens)
       ("ghc-mtl" ,ghc-mtl)
       ("ghc-transformers-compat"
        ,ghc-transformers-compat)))
    (home-page "http://github.com/aelve/microlens")
    (synopsis
     "microlens support for Reader/Writer/State from mtl")
    (description
     "This package contains functions (like 'view' or '+=') which work on 'MonadReader', 'MonadWriter', and 'MonadState' from the mtl package. . This package is a part of the <http://hackage.haskell.org/package/microlens microlens> family; see the readme <https://github.com/aelve/microlens#readme on Github>.")
    (license license:bsd-3)))

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
       ("ghc-stm" ,ghc-stm)
       ("ghc-mtl" ,ghc-mtl)
       ("ghc-mtl-compat" ,ghc-mtl-compat)
       ("ghc-transformers-compat"
        ,ghc-transformers-compat)))
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
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-attoparsec" ,ghc-attoparsec)
       ("ghc-utf8-string" ,ghc-utf8-string)))
    (home-page
     "http://hackage.haskell.org/package/sourcemap")
    (synopsis
     "Implementation of source maps as proposed by Google and Mozilla.")
    (description
     "Implementation of source maps, revision 3, proposed by Google and Mozilla here <https://wiki.mozilla.org/DevTools/Features/SourceMap> and here <https://docs.google.com/document/d/1U1RGAehQwRypUTovF1KRlpiOFze0b-_2gc6fAH0KY0k/edit>")
    (license license:bsd-3)))

(define ghc-microlens-platform
  (package
    (name "ghc-microlens-platform")
    (version "0.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-platform/microlens-platform-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "18950lxgmsg5ksvyyi3zs1smjmb1qf1q73a3p3g44bh21miz0xwb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hashable" ,ghc-hashable)
       ("ghc-microlens" ,ghc-microlens)
       ("ghc-microlens-ghc" ,ghc-microlens-ghc)
       ("ghc-microlens-mtl" ,ghc-microlens-mtl)
       ("ghc-microlens-th" ,ghc-microlens-th)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-vector" ,ghc-vector)))
    (home-page
     "http://github.com/monadfix/microlens")
    (synopsis "Feature-complete microlens")
    (description
     "This package exports a module which is the recommended starting point for using <http://hackage.haskell.org/package/microlens microlens> if you aren't trying to keep your dependencies minimal. By importing @Lens.Micro.Platform@ you get all functions and instances from <http://hackage.haskell.org/package/microlens microlens>, <http://hackage.haskell.org/package/microlens-th microlens-th>, <http://hackage.haskell.org/package/microlens-mtl microlens-mtl>, <http://hackage.haskell.org/package/microlens-ghc microlens-ghc>, as well as instances for @Vector@, @Text@, and @HashMap@. . The minor and major versions of microlens-platform are incremented whenever the minor and major versions of any other microlens package are incremented, so you can depend on the exact version of microlens-platform without specifying the version of microlens (microlens-mtl, etc) you need. . This package is a part of the <http://hackage.haskell.org/package/microlens microlens> family; see the readme <https://github.com/monadfix/microlens#readme on Github>.")
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

#f

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
     `(("ghc-mtl" ,ghc-mtl)
       ("ghc-blaze-builder" ,ghc-blaze-builder)
       ("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-hspec" ,ghc-hspec)
       ("ghc-utf8-light" ,ghc-utf8-light)))
    (home-page
     "https://github.com/erikd/language-javascript https://github.com/erikd/language-javascript")
    (synopsis "Parser for JavaScript")
    (description
     "Parses Javascript into an Abstract Syntax Tree (AST).  Initially intended as frontend to hjsmin. . Note: Version 0.5.0 breaks compatibility with prior versions, the AST has been reworked to allow round trip processing of JavaScript.")
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
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-warp" ,ghc-warp)
       ("ghc-wai-app-static" ,ghc-wai-app-static)
       ("ghc-file-embed" ,ghc-file-embed)))
    (home-page "http://github.com/yesodweb/wai")
    (synopsis
     "Provide a bridge between WAI and the websockets package.")
    (description
     "API docs and the README are available at <http://www.stackage.org/package/wai-websockets>.")
    (license license:expat)))

(define ghc-wai-app-static
  (package
    (name "ghc-wai-app-static")
    (version "3.1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/wai-app-static/wai-app-static-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0gnwq6ad5m8w8sqq4dzpz23l5rjdphfsf8h9h27lrvv1prkabc6h"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-blaze-html" ,ghc-blaze-html)
       ("ghc-blaze-markup" ,ghc-blaze-markup)
       ("ghc-containers" ,ghc-containers)
       ("ghc-cryptonite" ,ghc-cryptonite)
       ("ghc-directory" ,ghc-directory)
       ("ghc-file-embed" ,ghc-file-embed)
       ("ghc-filepath" ,ghc-filepath)
       ("ghc-http-date" ,ghc-http-date)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-memory" ,ghc-memory)
       ("ghc-mime-types" ,ghc-mime-types)
       ("ghc-old-locale" ,ghc-old-locale)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-time" ,ghc-time)
       ("ghc-transformers" ,ghc-transformers)
       ("ghc-unix-compat" ,ghc-unix-compat)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-wai" ,ghc-wai)
       ("ghc-wai-app-static" ,ghc-wai-app-static)
       ("ghc-wai-extra" ,ghc-wai-extra)
       ("ghc-warp" ,ghc-warp)
       ("ghc-zlib" ,ghc-zlib)))
    (home-page "http://www.yesodweb.com/book/web-application-interface")
    (synopsis "WAI application for static serving")
    (description
     "WAI application for static serving

Also provides some helper functions and datatypes for use outside of WAI.")
    (license #f)))

(define ghc-containers
  (package
    (name "ghc-containers")
    (version "0.6.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/containers/containers-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0smc1g58l968jxcjxhxcd4qpfm4zk7zr6r4q6wf6ay75av9rf4d7"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-chasingbottoms" ,ghc-chasingbottoms)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-chasingbottoms" ,ghc-chasingbottoms)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-chasingbottoms" ,ghc-chasingbottoms)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)
       ("ghc-chasingbottoms" ,ghc-chasingbottoms)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-test-framework" ,ghc-test-framework)
       ("ghc-test-framework-quickcheck2" ,ghc-test-framework-quickcheck2)))
    (home-page
     "http://hackage.haskell.org/package/containers")
    (synopsis "Assorted concrete container types")
    (description
     ". This package contains efficient general-purpose implementations of various immutable container types including sets, maps, sequences, trees, and graphs. . For a walkthrough of what this package provides with examples of common operations see the [containers introduction](https://haskell-containers.readthedocs.io). . The declared cost of each operation is either worst-case or amortized, but remains valid even if structures are shared.")
    (license license:bsd-3)))

(define ghc-directory
  (package
    (name "ghc-directory")
    (version "1.3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/directory/directory-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0nr0lwpi20slgqc22br9ldrs57573irqbck8am0pz0gz3yvmqis3"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/directory")
    (synopsis
     "Platform-agnostic library for filesystem operations")
    (description
     "This library provides a basic set of operations for manipulating files and directories in a portable way.")
    (license license:bsd-3)))

(define ghc-filepath
  (package
    (name "ghc-filepath")
    (version "1.4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/filepath/filepath-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "04jlcaaab4fvlkgpss2mfmr5ixnp1k8f8051nqf8avfg0qan6hqb"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)))
    (home-page
     "https://github.com/haskell/filepath#readme")
    (synopsis
     "Library for manipulating FilePaths in a cross platform way.")
    (description
     "This package provides functionality for manipulating @FilePath@ values, and is shipped with both <https://www.haskell.org/ghc/ GHC> and the <https://www.haskell.org/platform/ Haskell Platform>. It provides three modules: . * \"System.FilePath.Posix\" manipulates POSIX\\/Linux style @FilePath@ values (with @\\/@ as the path separator). . * \"System.FilePath.Windows\" manipulates Windows style @FilePath@ values (with either @\\\\@ or @\\/@ as the path separator, and deals with drives). . * \"System.FilePath\" is an alias for the module appropriate to your platform. . All three modules provide the same API, and the same documentation (calling out differences in the different variants).")
    (license license:bsd-3)))

(define ghc-time
  (package
    (name "ghc-time")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/time/time-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "05d0n44rwpqkjkns9nlgw2gpfv643a0bzp9cx97az0wmn31618nx"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
       ("ghc-random" ,ghc-random)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "https://github.com/haskell/time")
    (synopsis "A time library")
    (description "Time, clocks and calendars")
    (license license:bsd-3)))

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
       ("ghc-bytestring-builder"
        ,ghc-bytestring-builder)
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
       ("ghc-test-framework-hunit"
        ,ghc-test-framework-hunit)
       ("ghc-test-framework-quickcheck2"
        ,ghc-test-framework-quickcheck2)))
    (home-page "http://jaspervdj.be/websockets")
    (synopsis
     "A sensible and clean way to write WebSocket-capable servers in Haskell.")
    (description
     "This library allows you to write WebSocket-capable servers. . An example server: <https://github.com/jaspervdj/websockets/blob/master/example/server.lhs> . An example client: <https://github.com/jaspervdj/websockets/blob/master/example/client.hs> . See also: . * The specification of the WebSocket protocol: <http://www.whatwg.org/specs/web-socket-protocol/> . * The JavaScript API for dealing with WebSockets: <http://www.w3.org/TR/websockets/>")
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
     "Automatically discover and run Hspec tests . <http://hspec.github.io/hspec-discover.html>")
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
       ("ghc-mtl" ,ghc-mtl)
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
    (home-page "https://github.com/hdgarrood/bower-json")
    (synopsis "Read bower.json from Haskell")
    (description "Bower is a package manager for the web (see http://bower.io). This package provides a data type and ToJSON/FromJSON instances for Bower's package manifest file, bower.json.")
    (license #f)))

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
     "A portable library of functor and monad transformers, inspired by the paper \\\"Functional Programming with Overloading and Higher-Order Polymorphism\\\", by Mark P Jones, in /Advanced School of Functional Programming/, 1995 (<http://web.cecs.pdx.edu/~mpj/pubs/springschool.html>). . This package contains: . * the monad transformer class (in \"Control.Monad.Trans.Class\") . * concrete functor and monad transformers, each with associated operations and functions to lift operations associated with other transformers. . The package can be used on its own in portable Haskell code, in which case operations need to be manually lifted through transformer stacks (see \"Control.Monad.Trans.Class\" for some examples). Alternatively, it can be used with the non-portable monad classes in the @mtl@ or @monads-tf@ packages, which automatically lift operations introduced by monad transformers through other transformers.")
    (license license:bsd-3)))



