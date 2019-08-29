(define-module (ghc-cborg)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (ghc-cborg
            ghc-cborg-json
            ghc-serialise))

(define ghc-serialise
  (package
    (name "ghc-serialise")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/serialise/serialise-"
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
       ("ghc-quickcheck-instances" ,ghc-quickcheck-instances)))
    (home-page "https://github.com/well-typed/cborg")
    (synopsis "A binary serialisation library for Haskell values.")
    (description
     "This package (formerly binary-serialise-cbor) provides pure,
efficient serialization of Haskell values directly into ByteStrings
for storage or transmission purposes. By providing a set of type class
instances, you can also serialise any custom data type you have as
well.

The underlying binary format used is the 'Concise Binary Object
Representation', or CBOR, specified in RFC 7049. As a result,
serialised Haskell values have implicit structure outside of the
Haskell program itself, meaning they can be inspected or analyzed
without custom tools.

An implementation of the standard bijection between CBOR and JSON is
provided by the https://hackage.haskell.org/package/cborg-json
package. Also see https://hackage.haskell.org/package/cbor-tool for a
convenient command-line utility for working with CBOR data.")
    (license license:bsd-3)))

(define ghc-cborg-json
  (package
    (name "ghc-cborg-json")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/cborg-json/cborg-json-"
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
     "This package implements the bijection between JSON and CBOR
defined in the CBOR specification, RFC 7049.")
    (license license:bsd-3)))

(define ghc-cborg
  (package
    (name "ghc-cborg")
    (version "0.2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/cborg/cborg-"
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
     "This package (formerly binary-serialise-cbor) provides an
efficient implementation of the Concise Binary Object
Representation (CBOR), as specified by RFC 7049 at
https://tools.ietf.org/html/rfc7049.

If you are looking for a library for serialisation of Haskell values,
have a look at the https://hackage.haskell.org/package/serialise
package, which is built upon this library.

An implementation of the standard bijection between CBOR and JSON is
provided by the https://hackage.haskell.org/package/cborg-json
package.

Also see https://hackage.haskell.org/package/cbor-tool for a
convenient command-line utility for working with CBOR data.")
    (license license:bsd-3)))
