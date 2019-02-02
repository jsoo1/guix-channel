(define-module (dhall)
  #:use-module (ghc-megaparsec)
  #:use-module (ghc-mtl)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-web)
  #:use-module (guix download)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (dhall
            dhall-json))

(define dhall
  (package
    (name "dhall")
    (version "1.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/dhall/dhall-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1p5whphy666q0h22yq3jb4aipb5bkqp45bp86m7dp12ljksfhxz0"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-aeson-pretty" ,ghc-aeson-pretty)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-case-insensitive" ,ghc-case-insensitive)
       ("ghc-cborg" ,ghc-cborg)
       ("ghc-cborg-json" ,ghc-cborg-json)
       ("ghc-contravariant" ,ghc-contravariant)
       ("ghc-cryptonite" ,ghc-cryptonite)
       ("ghc-diff" ,ghc-diff)
       ("ghc-dotgen" ,ghc-dotgen)
       ("ghc-exceptions" ,ghc-exceptions)
       ("ghc-lens-family-core" ,ghc-lens-family-core)
       ("ghc-megaparsec" ,ghc-megaparsec-7.0.4)
       ("ghc-memory" ,ghc-memory)
       ("ghc-mtl" ,ghc-mtl)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-parsers" ,ghc-parsers)
       ("ghc-prettyprinter" ,ghc-prettyprinter)
       ("ghc-prettyprinter-ansi-terminal" ,ghc-prettyprinter-ansi-terminal)
       ("ghc-repline" ,ghc-repline)
       ("ghc-serialise" ,ghc-serialise)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-uri-encode" ,ghc-uri-encode)
       ("ghc-vector" ,ghc-vector)
       ("ghc-http-types" ,ghc-http-types)
       ("ghc-http-client" ,ghc-http-client)
       ("ghc-http-client-tls" ,ghc-http-client-tls)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
       ("ghc-mockery" ,ghc-mockery)
       ("ghc-doctest" ,ghc-doctest)))
    (arguments `(#:tests? #f))
    (home-page "http://hackage.haskell.org/package/dhall")
    (synopsis "A configuration language guaranteed to terminate")
    (description
     "Dhall is an explicitly typed configuration language that is not Turing complete.  Despite being Turing incomplete, Dhall is a real programming language with a type-checker and evaluator.

Use this library to parse, type-check, evaluate, and pretty-print the Dhall configuration language.  This package also includes an executable which type-checks a Dhall file and reduces the file to a fully evaluated normal form.

Read \"Dhall.Tutorial\" to learn how to use this library")
    (license license:bsd-3)))

(define dhall-json
  (package
    (name "dhall-json")
    (version "1.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/dhall-json/dhall-json-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0f18kn15v8pzkdayj2hql28fbba9i75msbi41yscik40lw2sg2cr"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-dhall" ,dhall)
       ("ghc-optparse-applicative" ,ghc-optparse-applicative)
       ("ghc-text" ,ghc-text)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-aeson-pretty" ,ghc-aeson-pretty)
       ("ghc-yaml" ,ghc-yaml)
       ("ghc-vector" ,ghc-vector)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (home-page "http://hackage.haskell.org/package/dhall-json")
    (synopsis "Compile Dhall to JSON or YAML")
    (description
     "Use this package if you want to compile Dhall expressions to JSON or YAML. You can use this package as a library or an executable:

  * See the \"Dhall.JSON\" module if you want to use this package as a library.
  * Use the dhall-to-json or dhall-to-yaml programs from this package if you want an executable.

The \"Dhall.JSON\" module also contains instructions for how to use this package")
    (license license:bsd-3)))

;; DEPENDENCIES

(define ghc-pgp-wordlist
  (package
    (name "ghc-pgp-wordlist")
    (version "0.1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/pgp-wordlist/pgp-wordlist-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0ri4m4a18kmnpw2a3vcw7zgjagccqr3snw2qgljg3b92abl6z2z2"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-vector" ,ghc-vector)))
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
       ("ghc-doctest" ,ghc-doctest)))
    (home-page
     "https://github.com/quchen/pgp-wordlist")
    (synopsis
     "Translate between binary data and a human-readable collection of words.")
    (description
     "Translate between binary data and a human-readable collection of words.

The PGP Word List consists of two phonetic alphabets, each with one word per possible byte value. A string of bytes is translated with these alphabets, alternating between them at each byte. . The PGP words corresponding to the bytes 5B 1D CA 6E are \"erase breakaway spellbind headwaters\", for example. . For further information, see http://en.wikipedia.org/wiki/PGP_word_list Wikipedia.")
    (license license:bsd-3)))

(define ghc-prettyprinter-ansi-terminal
  (package
    (name "ghc-prettyprinter-ansi-terminal")
    (version "1.1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/prettyprinter-ansi-terminal/prettyprinter-ansi-terminal-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0ha6vz707qzb5ky7kdsnw2zgphg2dnxrpbrxy8gaw119vwhb9q6k"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-prettyprinter" ,ghc-prettyprinter)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (home-page
     "http://github.com/quchen/prettyprinter")
    (synopsis
     "ANSI terminal backend for the prettyprinter package.")
    (description "See README.md")
    (license license:bsd-2)))

(define ghc-repline
  (package
    (name "ghc-repline")
    (version "0.2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/repline/repline-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1ph21kbbanlcs8n5lwk16g9vqkb98mkbz5mzwrp8j2rls2921izc"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-mtl" ,ghc-mtl)))
    (home-page "https://github.com/sdiehl/repline")
    (synopsis "Haskeline wrapper for GHCi-like REPL interfaces.")
    (description
     "Haskeline wrapper for GHCi-like REPL interfaces. Composable with normal mtl transformers.")
    (license license:expat)))

(define ghc-serialise
  (package
    (name "ghc-serialise")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/serialise/serialise-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "19ary6ivzk8z7wcxhm860qmh7pwqj0qjqzav1h42y85l608zqgh4"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-cborg" ,ghc-cborg)
       ("ghc-half" ,ghc-half)
       ("ghc-hashable" ,ghc-hashable)
       ("ghc-primitive" ,ghc-primitive)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-vector" ,ghc-vector)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
       ("ghc-quickcheck-instances"
        ,ghc-quickcheck-instances)))
    (home-page "https://github.com/well-typed/cborg")
    (synopsis "A binary serialisation library for Haskell values.")
    (description
     "This package (formerly binary-serialise-cbor) provides pure, efficient serialization of Haskell values directly into ByteStrings for storage or transmission purposes. By providing a set of type class instances, you can also serialise any custom data type you have as well.

The underlying binary format used is the 'Concise Binary Object Representation', or CBOR, specified in RFC 7049. As a result, serialised Haskell values have implicit structure outside of the Haskell program itself, meaning they can be inspected or analyzed without custom tools.

An implementation of the standard bijection between CBOR and JSON is provided by the https://hackage.haskell.org/package/cborg-json package. Also see https://hackage.haskell.org/package/cbor-tool for a convenient command-line utility for working with CBOR data.")
    (license license:bsd-3)))

(define ghc-prettyprinter
  (package
    (name "ghc-prettyprinter")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/prettyprinter/prettyprinter-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1kvza7jp5n833m8rj0bc35bd2p8wx3fq0iqflm9nbh3wm05kwrg7"))))
    (build-system haskell-build-system)
    (native-inputs
     `(("ghc-doctest" ,ghc-doctest)
       ("ghc-pgp-wordlist" ,ghc-pgp-wordlist)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (home-page "http://github.com/quchen/prettyprinter")
    (synopsis
     "A modern, easy to use, well-documented, extensible pretty-printer.")
    (description
     "A modern, easy to use, well-documented, extensible pretty-printer. For more see README.md")
    (license license:bsd-2)))

(define ghc-lens-family-core
  (package
    (name "ghc-lens-family-core")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/lens-family-core/lens-family-core-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "009rf10pj1cb50v44cc1pq7qvfrmkkk9dikahs9qmvbvgl3mykwi"))))
    (build-system haskell-build-system)
    (home-page
     "http://hackage.haskell.org/package/lens-family-core")
    (synopsis "Haskell 98 Lens Families")
    (description
     "This package provides first class functional references. In addition to the usual operations of getting, setting and composition, plus integration with the state monad, lens families provide some unique features:

  * Polymorphic updating
  * Traversals
  * Cast projection functions to read-only lenses
  * Cast \"toList\" functions to read-only traversals
  * Cast semantic editor combinators to modify-only traversals.

For optimal first-class support use the lens-family package with rank 2/rank N polymorphism. \"Lens.Family.Clone\" allows for first-class support of lenses and traversals for those who require Haskell 98.")
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
    (synopsis "A simple interface for building .dot graph files.")
    (description
     "This package provides a simple interface for building .dot graph files, for input into the dot and graphviz tools. It includes a monadic interface for building graphs.")
    (license license:bsd-3)))

(define ghc-cborg-json
  (package
    (name "ghc-cborg-json")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/cborg-json/cborg-json-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "01i0npbwf6cnjkwwk0l4fnwlbjhsj7vn3d4zd202hcnxdm7bbdiz"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-aeson-pretty" ,ghc-aeson-pretty)
       ("ghc-unordered-containers" ,ghc-unordered-containers)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-vector" ,ghc-vector)
       ("ghc-cborg" ,ghc-cborg)))
    (home-page "https://github.com/well-typed/cborg")
    (synopsis "A library for encoding JSON as CBOR")
    (description
     "This package implements the bijection between JSON and CBOR defined in the CBOR specification, RFC 7049.")
    (license license:bsd-3)))

(define ghc-cborg
  (package
    (name "ghc-cborg")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/cborg/cborg-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "10vlv5mwg9625rmir7mi0zj5ygs3j3vlhm2h8lilkbj5frgp764i"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-half" ,ghc-half)
       ("ghc-primitive" ,ghc-primitive)))
    (native-inputs
     `(("ghc-aeson" ,ghc-aeson)
       ("ghc-base64-bytestring" ,ghc-base64-bytestring)
       ("ghc-base16-bytestring" ,ghc-base16-bytestring)
       ("ghc-fail" ,ghc-fail)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-scientific" ,ghc-scientific)
       ("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)
       ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
       ("ghc-vector" ,ghc-vector)))
    (home-page "http://hackage.haskell.org/package/cborg")
    (synopsis "Concise Binary Object Representation")
    (description
     "This package (formerly binary-serialise-cbor) provides an efficient implementation of the Concise Binary Object Representation (CBOR), as specified by RFC 7049 at https://tools.ietf.org/html/rfc7049.

If you are looking for a library for serialisation of Haskell values, have a look at the https://hackage.haskell.org/package/serialise package, which is built upon this library.

An implementation of the standard bijection between CBOR and JSON is provided by the https://hackage.haskell.org/package/cborg-json package.

Also see https://hackage.haskell.org/package/cbor-tool for a convenient command-line utility for working with CBOR data.")
    (license license:bsd-3)))
