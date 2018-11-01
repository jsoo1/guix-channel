(define-module (ghc-alsa)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build utils)
  #:use-module (guix build-system haskell)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

;; PUBLIC
(define-public ghc-alsa-core
  (package
   (name "ghc-alsa-core")
   (version "0.5.0.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://hackage.haskell.org/package/alsa-core/alsa-core-" version ".tar.gz"))
     (sha256 (base32 "1avh4a419h9d2zsslg6j8hm87ppgsgqafz8ll037rk2yy1g4jl7b"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-extensible-exceptions" ,ghc-extensible-exceptions)))
   (native-inputs
    `(("pkg-config" ,pkg-config)
      ("alsa-lib" ,alsa-lib)))
   (arguments `(#:tests? #f))
   (home-page
    "http://www.haskell.org/haskellwiki/ALSA")
   (synopsis
    "Binding to the ALSA Library API (Exceptions).")
   (description
    "This package provides access to ALSA infrastructure, that is needed by both alsa-seq and alsa-pcm.")
   (license license:bsd-3)))

(define-public ghc-alsa-mixer
  (package
   (name "ghc-alsa-mixer")
   (version "0.2.0.3")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://hackage.haskell.org/package/alsa-mixer/alsa-mixer-" version ".tar.gz"))
     (sha256 (base32 "13fgd78msqsyzm92cbasm8m3s1rww6r1g83qbrv4mkm2h50fnvgp"))))
   (build-system haskell-build-system)
   (inputs `(("ghc-alsa-core" ,ghc-alsa-core)))
   (native-inputs `(("ghc-c2hs" ,ghc-c2hs)))
   (arguments
    `(#:tests? #f))
   (home-page "https://github.com/ttuegel/alsa-mixer")
   (synopsis "Bindings to the ALSA simple mixer API.")
   (description "This package provides bindings to the ALSA simple mixer API.")
   (license license:bsd-3)))

;; DEPENDENCIES
(define cc
  (package
   (name "cc")
   (version (package-version gcc-8))
   (source #f)
   (build-system trivial-build-system)
   (arguments
    `(#:modules ((guix build utils))
      #:builder (begin
                  (use-modules (guix build utils))
                  (let ((out (assoc-ref %outputs "out"))
                        (in (assoc-ref %build-inputs "gcc")))
                    (mkdir-p (string-append out "/bin"))
                    (symlink (string-append in "/bin/gcc") (string-append out "/bin/cc"))))))
   (native-search-paths (package-native-search-paths gcc-8))
   (search-paths (package-search-paths gcc-8))
   (license (package-license gcc-8))
   (synopsis "CC linked to GCC")
   (description "CC linked to GCC")
   (home-page "https://gcc.gnu.org/")
   (outputs '("out"))
   (inputs `(("gcc" ,gcc-8)))))

(define ghc-language-c-0.8.2
  (package
   (name "ghc-language-c-0.8.2")
   (version "0.8.2")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://hackage.haskell.org/package/language-c/language-c-" version ".tar.gz"))
     (sha256 (base32 "05ff3ywh2lpxgd00nv6y3jnqpdl6bg0f2yn3csd043rv4srd6adp"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-syb" ,ghc-syb)
      ("ghc-alex" ,ghc-alex)
      ("ghc-happy" ,ghc-happy)))
   (arguments `(#:configure-flags '("--flags=-iecFpExtension")))
   (home-page "http://visq.github.io/language-c/")
   (synopsis "Analysis and generation of C code")
   (description
    "Language C is a haskell library for the analysis and generation of C code. It features a complete, well tested parser and pretty printer for all of C99 and a large set of C11 and clang/GNU extensions.")
   (license license:bsd-3)))

(define ghc-c2hs
  (package
   (name "ghc-c2hs")
   (version "0.28.6")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://hackage.haskell.org/package/c2hs/c2hs-" version ".tar.gz"))
     (sha256 (base32 "1nplgxfin139x12sb656f5870rpdclrhzi8mq8pry035qld15pci"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-language-c" ,ghc-language-c-0.8.2)
      ("ghc-dlist" ,ghc-dlist)))
   (native-inputs
    `(("cc" ,cc)
      ("ghc-shelly" ,ghc-shelly)
      ("ghc-hunit" ,ghc-hunit)
      ("ghc-test-framework" ,ghc-test-framework)
      ("ghc-test-framework-hunit" ,ghc-test-framework-hunit)))
   (arguments `(#:tests? #f))
   (home-page "https://github.com/haskell/c2hs")
   (synopsis "C->Haskell FFI tool that gives some cross-language type safety")
   (description
    "C->Haskell assists in the development of Haskell bindings to C libraries. It extracts interface information from C header files and generates Haskell code with foreign imports and marshaling. Unlike writing foreign imports by hand (or using hsc2hs), this ensures that C functions are imported with the correct Haskell types.")
   (license license:gpl2)))
