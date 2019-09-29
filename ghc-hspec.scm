(define-module (ghc-hspec)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system haskell)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check))

(define my-ghc-hspec
  (package
    (inherit ghc-hspec)
    (name "my-ghc-hspec")
    (inputs
     `(("ghc-hspec-core" ,my-ghc-hspec-core)
       ("hspec-discover" ,hspec-discover)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-hunit" ,my-ghc-hunit)
       ("ghc-stringbuilder" ,ghc-stringbuilder)
       ("ghc-hspec-meta" ,ghc-hspec-meta)))
    (arguments `(#:haskell ,ghc-8.6))))

(define my-ghc-hspec-core
  (package
    (inherit ghc-hspec-core)
    (name "my-ghc-hspec-core")
    (arguments `(#:tests? #f ; FIXME: testing libraries are missing.
                 #:haskell ,ghc-8.6))
    (inputs
     `(("ghc-setenv" ,ghc-setenv)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-async" ,ghc-async)
       ("ghc-clock" ,ghc-clock)
       ("ghc-quickcheck-io" ,ghc-quickcheck-io)
       ("ghc-hunit" ,my-ghc-hunit)
       ("ghc-quickcheck" ,my-ghc-quickcheck)
       ("ghc-hspec-expectations" ,ghc-hspec-expectations)
       ("ghc-silently" ,ghc-silently)))))

(define my-ghc-hunit
  (package
    (inherit ghc-hunit)
    (name "my-ghc-hunit")
    (build-system haskell-build-system)
    (inputs
     ;; We cannot use ghc-call-stack there, because it depends on
     ;; ghc-nanospec, which depends on ghc-hunit.
     `(("ghc-call-stack" ,my-ghc-call-stack-boot)))
    (arguments
     `(#:haskell ,ghc-8.6))))

(define my-ghc-call-stack-boot
  (hidden-package
   (package
     (inherit ghc-call-stack)
     (name "my-ghc-call-stack-boot")
     (arguments `(#:tests? #f
                  #:haskell ,ghc-8.6))
     (inputs '()))))

(define my-ghc-quickcheck
  (package
    (inherit ghc-quickcheck)
    (name "my-ghc-quickcheck")
    (inputs
     `(("ghc-random" ,my-ghc-random)
       ("ghc-tf-random" ,my-ghc-tf-random)))
    (arguments
     `(#:tests? #f
       #:haskell ,ghc-8.6))))

(define my-ghc-random
  (package
    (inherit ghc-random)
    (name "my-ghc-random")
    (arguments `(#:haskell ,ghc-8.6))))

(define my-ghc-tf-random
  (package
    (inherit ghc-tf-random)
    (name "my-ghc-tf-random")
    (inputs
     `(("ghc-primitive" ,my-ghc-primitive)
       ("ghc-random" ,my-ghc-random)))
    (arguments
     `(#:haskell ,ghc-8.6))))

(define my-ghc-primitive
  (package
    (inherit ghc-primitive)
    (name "my-ghc-primitive")
    (version "0.7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/primitive/primitive-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0xhmin3z2vp8jina1wzxg11nqiz8x63wisv2nw2ggji8lgz48skq"))))
    (inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)))
    (arguments `(#:haskell ,ghc-8.6))))

(define ghc-quickcheck-2.13
  (package
    (name "ghc-quickcheck-2.13")
    (version "2.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/QuickCheck/QuickCheck-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0426j43af8v3qmdjjqxivazsvr3a2brac8yw09vpgpjkb2m0nmkv"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-random" ,my-ghc-random)
       ("ghc-splitmix" ,ghc-splitmix)))
    (native-inputs
     `(("ghc-quickcheck" ,ghc-quickcheck)))
    (arguments
     `(#:haskell ,ghc-8.6))
    (home-page
     "https://github.com/nick8325/quickcheck")
    (synopsis
     "Automatic testing of Haskell programs")
    (description
     "QuickCheck is a library for random testing of program properties.
The programmer provides a specification of the program, in the form
of properties which functions should satisfy, and QuickCheck then
tests that the properties hold in a large number of randomly
generated cases.  Specifications are expressed in Haskell, using
combinators provided by QuickCheck.  QuickCheck provides combinators
to define properties, observe the distribution of test data, and
define test data generators.

Most of QuickCheck's functionality is exported by the main
\"Test.QuickCheck\" module.  The main exception is the monadic property
testing library in \"Test.QuickCheck.Monadic\".

If you are new to QuickCheck, you can try looking at the following resources:
  * The official QuickCheck manual at
    http://www.cse.chalmers.se/~rjmh/QuickCheck/manual.html.
    It's a bit out-of-date in some details and doesn't cover newer
    QuickCheck features, but is still full of good advice.
  * https://begriffs.com/posts/2017-01-14-design-use-quickcheck.html,
    a detailed tutorial written by a user of QuickCheck.

The quickcheck-instances companion package at
https://hackage.haskell.org/package/quickcheck-instances provides instances
for types in Haskell Platform packages at the cost of additional dependencies.")
    (license license:bsd-3)))

(define ghc-splitmix
  (package
    (name "ghc-splitmix")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/splitmix/splitmix-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1k0amgkz7rvyz3lnw7m786ilnr1cibwhx9sc4qynq329gxan5r7w"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-random" ,ghc-random)))
    (native-inputs
     `(("ghc-hunit" ,ghc-hunit)
       ("ghc-async" ,ghc-async)
       ("ghc-base-compat-batteries" ,ghc-base-compat-batteries)
       ("ghc-tf-random" ,ghc-tf-random)
       ("ghc-vector" ,ghc-vector)))
    (arguments `(#:haskell ,ghc-8.6))
    (home-page
     "http://hackage.haskell.org/package/splitmix")
    (synopsis "Fast Splittable PRNG")
    (description
     "Pure Haskell implementation of SplitMix described in

Guy L. Steele, Jr., Doug Lea, and Christine H. Flood. 2014.
Fast splittable pseudorandom number generators.
In Proceedings of the 2014 ACM International Conference on
Object Oriented Programming Systems Languages & Applications (OOPSLA '14).
ACM, New York, NY, USA, 453-472.
DOI: <https://doi.org/10.1145/2660193.2660195>

The paper describes a new algorithm /SplitMix/ for /splittable/
pseudorandom number generator that is quite fast:
9 64 bit arithmetic/logical operations per 64 bits generated.

/SplitMix/ is tested with two standard statistical test suites
(DieHarder and TestU01, this implementation only using the former)
and it appears to be adequate for \"everyday\" use, such as Monte Carlo
algorithms and randomized data structures where speed is important.

In particular, it __should not be used for cryptographic or security
applications__, because generated sequences of pseudorandom values
are too predictable (the mixing functions are easily inverted, and
two successive outputs suffice to reconstruct the internal state).")
    (license license:bsd-3)))

(define ghc-base-compat-batteries
  (package
    (name "ghc-base-compat-batteries")
    (version "0.10.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/"
             "base-compat-batteries/base-compat-batteries-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1vkhc639vqiv5p39jn1v312z32i7yk5q2lf0ap4jxl1v8p8wyp8p"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-base-compat" ,my-ghc-base-compat)
       ("ghc-contravariant" ,ghc-contravariant-1.5)))
    (native-inputs
     `(("ghc-hspec" ,my-ghc-hspec)
       ("hspec-discover" ,hspec-discover)
       ("ghc-quickcheck" ,ghc-quickcheck)))
    (arguments
     `(#:haskell ,ghc-8.6
       #:cabal-revision
       ("1"
        "15sn2qc8k0hxbb2nai341kkrci98hlhzcj2ci087m0zxcg5jcdbp")))
    (home-page
     "http://hackage.haskell.org/package/base-compat-batteries")
    (synopsis "base-compat with extra batteries")
    (description
     "Provides functions available in later versions of base to a wider
range of compilers, without requiring you to use CPP pragmas in your code.

This package provides the same API as the base-compat library at
http://hackage.haskell.org/package/base-compat, but depends on compatibility
packages (such as semigroups) to offer a wider support window than base-compat,
which has no dependencies. Most of the modules in this library have the same
names as in base-compat to make it easier to switch between the two.  There
also exist versions of each module with the suffix .Repl.Batteries, which are
distinct from anything in base-compat, to allow for easier use in GHCi.

See here: https://github.com/haskell-compat/base-compat/blob/master/base-compat/README.markdown#dependencies
for a more comprehensive list of differences between base-compat and
base-compat-batteries.")
    (license license:expat)))

(define my-ghc-base-compat
  (package
    (inherit ghc-base-compat)
    (name "ghc-base-compat")
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
    (native-inputs `())))

(define ghc-contravariant-1.5
  (package
    (inherit ghc-contravariant)
    (name "ghc-contravariant-1.5")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/contravariant/contravariant-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0366gl62wwwdbl9i6kqy60asf60876k55v91la6bmhnwwcj2q9n4"))))))


