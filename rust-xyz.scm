(define-module (rust-xyz)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages rust)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public rust-bitflags-0.9
  (package
    (inherit rust-bitflags-1)
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name
        (string-append (package-name rust-bitflags-1) "-" version ".tar.gz"))
       (sha256
        (base32
         "19dk39gfwmhi3iy1x0wgml1fv1bkb525ywy25zwihbm063i05zaf"))))))

(define-public rust-url-2.0
  (package
    (name "rust-url")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "url" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ij81gib9z2n9r67gin545zr7xvh345pr5bydg2q2sswwr9azpbp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding" ,rust-encoding-0.2)
        ("rust-heapsize" ,rust-heapsize-0.4)
        ("rust-idna" ,rust-idna-0.1)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-percent-encoding" ,rust-percent-encoding-2.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis
     "URL library for Rust, based on the WHATWG URL Standard")
    (description
     "URL library for Rust, based on the WHATWG URL Standard")
    (license #f)))

(define-public rust-base64-0.9
  (package
    (inherit rust-base64-0.10)
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name
        (string-append (package-name rust-base64-0.10) "-" version ".tar.gz"))
       (sha256
        (base32
         "0hs62r35bgxslawyrn1vp9rmvrkkm76fqv0vqcwd048vs876r7a8"))))))

(define-public rust-rand-pcg-0.1.2
  (package
    (inherit rust-rand-pcg-0.2)
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_pcg" version))
       (file-name
        (string-append (package-name rust-rand-pcg-0.2) "-" version ".tar.gz"))
       (sha256
        (base32
         "0i0bdla18a8x4jn1w0fxsbs3jg7ajllz6azmch1zw33r06dv1ydb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

 (define-public rust-num-complex-0.1
  (package
    (name "rust-num-complex")
    (version "0.1.43")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-complex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mln3h018lar511hadjwfkbyq1561s8kdzfg8aagbakqg0fn725j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1))))
    (home-page
     "https://github.com/rust-num/num-complex")
    (synopsis
     "Complex numbers implementation for Rust")
    (description
     "Complex numbers implementation for Rust")
    (license #f)))

(define-public rust-bindgen-0.47
  (package
    (name "rust-bindgen")
    (version "0.47.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q4j8s4cmjdd1l0qz9q660zlxf76lxdbpbmzivmdahabnmakls6z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cexpr" ,rust-cexpr-0.3)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.26)
        ("rust-clap" ,rust-clap-2)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-fxhash" ,rust-fxhash-0.2)
        ("rust-hashbrown" ,rust-hashbrown-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-peeking-take-while"
         ,rust-peeking-take-while-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-shlex" ,rust-shlex-0.1)
        ("rust-which" ,rust-which-2.0))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))))
    (home-page
     "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license #f)))

(define-public rust-nom-5.0
  (package
    (name "rust-nom")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06snml9wfrvk8k71l4md6gg29jgj4pa8wzsg180q3qr0jf2isxp9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-lexical-core" ,rust-lexical-core-0.4)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-regex" ,rust-regex-1.1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-jemallocator" ,rust-jemallocator-0.3)
        ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/Geal/nom")
    (synopsis
     "A byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library")
    (license #f)))

(define-public rust-bit-vec
  (package
    (name "rust-bit-vec")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bit-vec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xs6yba2jqlmzcm9ahzggrlb933c08ik9ah8zdsybylzhc83llm4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/contain-rs/bit-vec")
    (synopsis "A vector of bits")
    (description
     "This package provides a vector of bits")
    (license #f)))

(define-public rust-http-body
  (package
  (name "rust-http-body")
  (version "0.2.0-alpha.1")
  (source
    (origin
      (method url-fetch)
      (uri (crate-uri "http-body" version))
      (file-name
        (string-append name "-" version ".tar.gz"))
      (sha256
        (base32
          "12nrv6h7amr4lj1k619a6yypphx2q6k5i56kcpbasphmyshxzj0v"))))
  (build-system cargo-build-system)
  (arguments
    `(#:cargo-inputs
      (("rust-bytes" ,rust-bytes-0.4)
       ("rust-http" ,rust-http-0.1))))
  (home-page
    "https://github.com/hyperium/http-body")
  (synopsis
    "Trait representing an HTTP request or response body")
  (description
    "Trait representing an asynchronous, streaming, HTTP request or
response body.")
  (license license:expat)))

(define rust-pin-project
  (package
    (name "rust-pin-project")
    (version "0.4.0-alpha.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x9q9lblbib3hr41828ihr86zkrrndmk7pqhrxn09hww8g301arp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-pin-project-internal"
         ,rust-pin-project-internal))
       #:cargo-development-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs-0.3))))
    (home-page
     "https://github.com/taiki-e/pin-project")
    (synopsis
     "A crate for safe and ergonomic pin-projection")
    (description
     "This package provides a crate for safe and ergonomic pin-projection.")
    (license #f)))

(define-public rust-tower-make
  (package
    (name "rust-tower-make")
    (version "0.1.0-alpha.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-make" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hqhj3zp8ycczq6j2babrzrykxrpc52yclb905qfcaly8415v27s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tower-service" ,rust-tower-service))))
    (home-page "https://github.com/tower-rs/tower")
    (synopsis
     "Trait aliases for Services that produce specific types of Responses")
    (description
     "Trait aliases for Services that produce specific types of Responses.")
    (license license:expat)))

(define-public rust-tower-service
  (package
    (name "rust-tower-service")
    (version "0.3.0-alpha.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-service" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10rbh8ggpsn7mn4rmd3ax1cvw0xpx44dbmmmz6ip97317kw05ckv"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/tower-rs/tower")
    (synopsis
     "Trait representing an asynchronous, request / response based, client or server")
    (description
     "Trait representing an asynchronous, request / response based,
client or server.")
    (license license:expat)))

(define rust-want
  (package
    (name "rust-want")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "want" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "181b2zmwfq389x9n2g1n37cvcvvdand832zz6v8i1l8wrdlaks0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-try-lock" ,rust-try-lock-0.2))
       #:cargo-development-inputs
       (("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1))))
    (home-page "https://github.com/seanmonstar/want")
    (synopsis
     "Detect when another Future wants a result.")
    (description
     "Detect when another Future wants a result.")
    (license license:expat)))

(define rust-want-0.0.6
  (package
    (name "rust-want")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "want" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cznvlky1zbxhwlajdi0kvwq3ma8wsmalaf51j1vip9hbx3n8x3r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-try-lock" ,rust-try-lock-0.2))
       #:cargo-development-inputs
       (("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1))))
    (home-page "https://github.com/seanmonstar/want")
    (synopsis
     "Detect when another Future wants a result.")
    (description
     "Detect when another Future wants a result.")
    (license license:expat)))

(define-public rust-pretty-env-logger
  (package
    (name "rust-pretty-env-logger")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pretty-env-logger" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0x4hyjlnvvhyk9m74iypzybm22w3dl2k8img4b956239n5vf8zki"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/seanmonstar/pretty-env-logger")
    (synopsis "a visually pretty env_logger")
    (description "a visually pretty env_logger")
    (license #f)))

(define-public rust-spmc
  (package
    (name "rust-spmc")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spmc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rgcqgj6b3d0cshi7277akr2xk0cx11rkmviaahy7a3pla6l5a02"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-loom" ,rust-loom-0.1))))
    (home-page "https://github.com/seanmonstar/spmc")
    (synopsis "Simple SPMC channel")
    (description "Simple SPMC channel")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-test
  (package
    (name "rust-tokio-test")
    (version "0.2.0-alpha.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fgzpnkndgn5f0jqwdln0w168dhc5b7sxym5a34vff605py86qbn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-core-preview"
         ,rust-futures-core-preview-0.3)
        ("rust-pin-convert" ,rust-pin-convert)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1)
        ("rust-tokio-timer" ,rust-tokio-timer-0.2))))
    (home-page "https://tokio.rs")
    (synopsis
     "Testing utilities for Tokio- and futures-based code")
    (description
     "Testing utilities for Tokio- and futures-based code.")
    (license license:expat)))

(define-public rust-mach-o-sys
  (package
    (name "rust-mach-o-sys")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mach-o-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09l8p7nmzq37450x2h6nb7dzg1sk6dk36a5rkcrcy81zm21lb19y"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/fitzgen/mach_o_sys")
    (synopsis
     "Bindings to the OSX mach-o system library")
    (description
     "Bindings to the OSX mach-o system library")
    (license #f)))

(define-public rust-partial-io
  (package
    (name "rust-partial-io")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "partial-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b9a2bvqmaj2r4rkbshjsg8zzvp23b67qfvj2y6jwjckrn6zhb38"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-tokio-core" ,rust-tokio-core-0.1))))
    (home-page
     "https://github.com/facebookincubator/rust-partial-io")
    (synopsis
     "Helpers to test partial, interrupted and would-block I/O operations.")
    (description
     "Helpers to test partial, interrupted and would-block I/O operations.")
    (license license:expat)))

(define-public rust-quickcheck-macros
  (package
    (name "rust-quickcheck-macros")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b3mhn0xcrdd3fkbkx3rghhivwzwil8w991ngp6gaj70l72c3pyp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page
     "https://github.com/BurntSushi/quickcheck")
    (synopsis "A macro attribute for quickcheck.")
    (description
     "This package provides a macro attribute for quickcheck.")
    (license #f)))

(define-public rust-web-sys
  (package
    (name "rust-web-sys")
    (version "0.3.27")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "web-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lccdl3ihqh70s48dzvzpm09gpwvdjyw4wksk848dm0a41vw8db4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-sourcefile" ,rust-sourcefile-0.1)
        ("rust-wasm-bindgen-futures"
         ,rust-wasm-bindgen-futures-0.3)
        ("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test-0.2)
        ("rust-wasm-bindgen-webidl"
         ,rust-wasm-bindgen-webidl))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
    (synopsis
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (description
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (license #f)))

(define rust-core-foundation
  (package
    (name "rust-core-foundation")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-foundation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0va97wf49c8dzm9c8pgyk1jn7z21rl0bj1syf2zz5m2z2hzy1f95"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-core-foundation-sys"
         ,rust-core-foundation-sys-0.6)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-uuid" ,rust-uuid-0.7))))
    (home-page
     "https://github.com/servo/core-foundation-rs")
    (synopsis
     "Bindings to Core Foundation for macOS")
    (description
     "Bindings to Core Foundation for macOS")
    (license #f)))

(define-public rust-pin-project-internal
  (package
    (name "rust-pin-project-internal")
    (version "0.4.0-alpha.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project-internal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ccdd4kwz0ksd04hklxf7927dbvfz5av0dmkjjgdhwhwhf757rrj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-proc-macro-crate" ,rust-proc-macro-crate)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/taiki-e/pin-project")
    (synopsis
     "An interal crate to support pin_project - do not use directly")
    (description
     "An interal crate to support pin_project - do not use directly")
    (license #f)))

(define-public rust-string
  (package
    (name "rust-string")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "string" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vaxz85ja52fn66akgvggb29wqa5bpj3y38syykpr1pbrjzi8hfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bytes" ,rust-bytes-0.4))))
    (home-page
     "https://github.com/carllerche/string")
    (synopsis
     "A UTF-8 encoded string with configurable byte storage.")
    (description
     "This package provides a UTF-8 encoded string with configurable byte storage.")
    (license license:expat)))

(define-public rust-wasm-bindgen-webidl
  (package
    (name "rust-wasm-bindgen-webidl")
    (version "0.2.50")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-webidl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "057zak44nyrawipgi37m451fjkxz6ix5rzcw11d699rgpy4x4lxy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-failure" ,rust-failure-0.1)
        ("rust-heck" ,rust-heck-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-wasm-bindgen-backend"
         ,rust-wasm-bindgen-backend-0.2)
        ("rust-weedle" ,rust-weedle))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Support for parsing WebIDL specific to wasm-bindgen")
    (description
     "Support for parsing WebIDL specific to wasm-bindgen")
    (license #f)))

(define-public rust-proc-macro-crate
  (package
    (name "rust-proc-macro-crate")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-crate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07pyc64bxlcz9g4hl0gc8cwqcjxpgh4ssvgxjvxsgj2ly58ln3g1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-toml" ,rust-toml-0.5))
       #:cargo-development-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/bkchr/proc-macro-crate")
    (synopsis
     "Replacement for crate (macro_rules keyword) in proc-macros")
    (description
     "Replacement for crate (macro_rules keyword) in proc-macros")
    (license #f)))

(define-public rust-ascii-canvas
  (package
    (name "rust-ascii-canvas")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ascii-canvas" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a9s8vrbc5jr6ry5ygjyfqmbs9gyya1v6dsxzsczpai8z4nvg3pz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-term" ,rust-term-0.5))))
    (home-page
     "https://github.com/nikomatsakis/ascii-canvas")
    (synopsis
     "simple canvas for drawing lines and styled text and emitting to the terminal")
    (description
     "simple canvas for drawing lines and styled text and emitting to the terminal")
    (license #f)))

(define-public rust-ena
  (package
    (name "rust-ena")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ena" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11wxfhfrywr7pwwqc5kfbfl1mjh2f4hsksrsbaaq98wcw1l1vh1x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dogged" ,rust-dogged)
        ("rust-log" ,rust-log-0.4)
        ("rust-petgraph" ,rust-petgraph-0.4))))
    (home-page "https://github.com/nikomatsakis/ena")
    (synopsis
     "Union-find, congruence closure, and other unification code. Based on code from rustc.")
    (description
     "Union-find, congruence closure, and other unification code.  Based on code from rustc.")
    (license #f)))

(define-public rust-dogged
  (package
    (name "rust-dogged")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dogged" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yk5l6qqidl5y935x15gi9kkd6niim1wb64r1l7kdzl9jw8dyf16"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/nikomatsakis/dogged")
    (synopsis
     "Persistent vector, similar to Clojure")
    (description
     "Persistent vector, similar to Clojure")
    (license #f)))

(define-public rust-pin-convert
  (package
    (name "rust-pin-convert")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-convert" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01j8zskmg91xqk39126a93n82a5xdl0fkirqcd3017mlg271dk90"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/carllerche/pin-convert")
    (synopsis
     "Traits for converting to `Pin` variants.")
    (description
     "Traits for converting to `Pin` variants.")
    (license license:expat)))

(define-public rust-num-rational-0.1
  (package
    (name "rust-num-rational")
    (version "0.1.42")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-rational" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kkqb8j3b3nis9hs4ww4hkrmb4a6v9sr9al08xmwhgvmpms4qcgf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-bigint" ,rust-num-bigint-0.1)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1))))
    (home-page
     "https://github.com/rust-num/num-rational")
    (synopsis
     "Rational numbers implementation for Rust")
    (description
     "Rational numbers implementation for Rust")
    (license #f)))

(define-public rust-strings
  (package
    (name "rust-strings")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strings" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g0z91zazkw1afzl1b4bniqjp3yg8g5zg4az37w3vz22pkhiwj5a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/nrc/strings.rs")
    (synopsis
     "String utilities, including an unbalanced Rope")
    (description
     "String utilities, including an unbalanced Rope")
    (license #f)))

(define-public rust-syntex-errors
  (package
    (name "rust-syntex-errors")
    (version "0.59.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-errors" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pk0cbb6pvrm62javjwzi3s6jxqj5rdbyi98bdf9yv37g68jhcri"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-syntex-pos" ,rust-syntex-pos)
        ("rust-term" ,rust-term-0.5)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of librustc_errors")
    (description "Backport of librustc_errors")
    (license #f)))

(define-public rust-syntex-syntax
  (package
    (name "rust-syntex-syntax")
    (version "0.59.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-syntax" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hnibp8s024hw0y7mdsf27rnw7vfkjilm5ww1mvjhn6r0jgmp083"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.9)
        ("rust-extprim" ,rust-extprim)
        ("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-syntex-errors" ,rust-syntex-errors)
        ("rust-syntex-pos" ,rust-syntex-pos)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax")
    (description "Backport of libsyntax")
    (license #f)))

(define-public rust-syntex-pos
  (package
    (name "rust-syntex-pos")
    (version "0.59.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-pos" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0w3465vz8z08sbcva5hdalr3vk4idp3vnx7qh730ilh3l2gndarh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax_pos")
    (description "Backport of libsyntax_pos")
    (license #f)))

(define-public rust-extprim
  (package
    (name "rust-extprim")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "extprim" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cagbgayqfmdw6zmci14ivs8cqdzn8k3jk9ymlyhnxj9qz81pfng"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-rustc-version" ,rust-rustc-version-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-extprim-literals" ,rust-extprim-literals)
        ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://github.com/kennytm/extprim")
    (synopsis "Extra primitive types")
    (description
     "Extra primitive types @code{(u128, i128)}")
    (license #f)))

(define-public rust-extprim-literals
  (package
    (name "rust-extprim-literals")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "extprim-literals" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09zsy9hzbjvnrzz9zd25xjijlbzp3m36cqc5q3znnqzvxjp02q46"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-extprim-literals-macros"
         ,rust-extprim-literals-macros)
        ("rust-procedural-masquerade"
         ,rust-procedural-masquerade))
       #:cargo-development-inputs
       (("rust-extprim" ,rust-extprim))))
    (home-page "https://github.com/kennytm/extprim")
    (synopsis
     "Plugin for creating extra primitive types literals")
    (description
     "Plugin for creating extra primitive types literals @code{(u128!(n), i128!(n))}")
    (license #f)))

(define-public rust-pulldown-cmark
  (package
    (name "rust-pulldown-cmark")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pulldown-cmark" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1916kszqfa9h8ja7wjbx945qb0qzwzslynxvwrg9c0hp9h6svc45"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-unicase" ,rust-unicase-2.4))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-html5ever" ,rust-html5ever-0.23)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-tendril" ,rust-tendril-0.4))))
    (home-page
     "https://github.com/raphlinus/pulldown-cmark")
    (synopsis "A pull parser for CommonMark")
    (description
     "This package provides a pull parser for CommonMark")
    (license license:expat)))

(define-public rust-colored
  (package
    (name "rust-colored")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "colored" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00vwd3r2jrd6qz4r91bwqhmkl371wyyjvirrc7bzh9r91yv91nvc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-winconsole" ,rust-winconsole))
       #:cargo-development-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.11)
        ("rust-rspec" ,rust-rspec-1))))
    (home-page "https://github.com/mackwic/colored")
    (synopsis
     "The most simple way to add colors in your terminal")
    (description
     "The most simple way to add colors in your terminal")
    (license license:mpl2.0)))

(define-public rust-weedle
  (package
    (name "rust-weedle")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "weedle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0r0i2kllvkn9jil6cjzxdi1zsc6p1gjyk751w8lyclaii1q3zd1v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-nom" ,rust-nom-5.0))))
    (home-page "https://github.com/rustwasm/weedle")
    (synopsis "A WebIDL Parser")
    (description
     "This package provides a WebIDL Parser")
    (license license:expat)))

(define-public rust-derive-new
  (package
    (name "rust-derive-new")
    (version "0.5.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-new" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ncibp4jhpkym7namg3viqyw8hljd32n6abg64af8qjwrn91iwvi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/nrc/derive-new")
    (synopsis
     "Implements simple constructor functions for structs and enums")
    (description
     "@code{#[derive(new)]} implements simple constructor functions for
structs and enums.")
    (license license:expat)))

(define-public rust-ctor
  (package
    (name "rust-ctor")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ctor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rvxl9i9a2j40m00zcjcsfa31n4zzyjvj9vwmk6bp0zgxckif1iy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-libc-print" ,rust-libc-print))))
    (home-page
     "https://github.com/mmastrac/rust-ctor")
    (synopsis
     "@code{__attribute__((constructor))} for Rust")
    (description
     "@code{__attribute__((constructor))} for Rust")
    (license (list license:asl2.0 license:expat))))

(define-public rust-libc-print
  (package
    (name "rust-libc-print")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc-print" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sh4l815w7zxg8w17fvwj63y421sjqxxrdamzwyvg90n6mr70phv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/mmastrac/rust-libc-print")
    (synopsis
     "println! and eprintln! macros on libc without stdlib")
    (description
     "println! and eprintln! macros on libc without stdlib")
    (license (list license:asl2.0 license:expat))))

(define-public rust-derive-builder
  (package
    (name "rust-derive-builder")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-builder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1m34zpj6fw764g7s368r2wgazp154m24d4rshbgn18fdlfk3zi9s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs-0.3)
        ("rust-darling" ,rust-darling)
        ("rust-derive-builder-core"
         ,rust-derive-builder-core)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-skeptic" ,rust-skeptic)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-pretty-assertions"
         ,rust-pretty-assertions-0.6)
        ("rust-skeptic" ,rust-skeptic))))
    (home-page
     "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis
     "Automatically implement builder pattern for arbitrary structs")
    (description
     "Rust macro to automatically implement the builder pattern for
arbitrary structs.")
    (license #f)))

(define-public rust-winconsole
  (package
    (name "rust-winconsole")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winconsole" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "108xk353myxdi5qm6m3v0qky18b1s94i40bhjka4rwmxwfi62h3y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cgmath" ,rust-cgmath-0.17)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-rgb" ,rust-rgb-0.8)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-serde-cbor" ,rust-serde-cbor-0.10)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/omarkmu/winconsole")
    (synopsis
     "Wrapper for console-related functions in the Windows API")
    (description
     "This package provides a wrapper for console-related functions in
the Windows API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-darling
  (package
    (name "rust-darling")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13ia8dx03gy867j3gjqs03zxfnkdz000gysf8lk5bbgg6ajjkriz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-darling-core" ,rust-darling-core)
        ("rust-darling-macro" ,rust-darling-macro-0.10))
       #:cargo-development-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/TedDriggs/darling")
    (synopsis
     "Proc-macro for reading attributes into structs for derives")
    (description
     "This package provides a proc-macro library for reading
attributes into structs when implementing custom derives.")
    (license license:expat)))

(define-public rust-derive-builder-core
  (package
    (name "rust-derive-builder-core")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-builder-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0drbjk6n8ywls8cmhp4r8xkyjsja0wk3854cn5mj8g1km4ys5202"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-darling" ,rust-darling)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-pretty-assertions"
         ,rust-pretty-assertions-0.6))))
    (home-page
     "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis
     "Internal helper library for the derive_builder crate")
    (description
     "Internal helper library for the derive_builder crate.")
    (license #f)))

(define-public rust-skeptic
  (package
    (name "rust-skeptic")
    (version "0.13.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "skeptic" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rai61hbs65nbvbhqlk1nap5hlav5qx3zmjjjzh9rhgxagc8xyyn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytecount" ,rust-bytecount-0.5)
        ("rust-cargo-metadata" ,rust-cargo-metadata-0.9)
        ("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-walkdir" ,rust-walkdir-2.2))
       #:cargo-development-inputs
       (("rust-unindent" ,rust-unindent-0.1))))
    (home-page
     "https://github.com/budziq/rust-skeptic")
    (synopsis
     "Test your Rust markdown documentation via Cargo")
    (description
     "Test your Rust markdown documentation via Cargo")
    (license #f)))

(define-public rust-extprim-literals-macros
  (package
    (name "rust-extprim-literals-macros")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "extprim-literals-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10zgbmikp4d8j5n475kcq6dkb68l92h339zcry2h5616a1ssv6zq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-extprim" ,rust-extprim)
        ("rust-procedural-masquerade"
         ,rust-procedural-masquerade))))
    (home-page "https://github.com/kennytm/extprim")
    (synopsis
     "Internal crate to support extprim_literals")
    (description
     "Internal crate to support @code{extprim_literals}.  You typically
don't need this crate directly.")
    (license #f)))

(define-public rust-procedural-masquerade
  (package
    (name "rust-procedural-masquerade")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "procedural-masquerade" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l098px1hwdzqnxl376a9hfxb9q8kmj2n0y0s8k7plrz3jjp85cs"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/servo/rust-cssparser")
    (synopsis
     "Make proc_macro_derive pretend to be proc_macro")
    (description
     "macro_rules for making proc_macro_derive pretending to be proc_macro")
    (license (list license:expat license:asl2.0))))

(define-public rust-expectest
  (package
    (name "rust-expectest")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "expectest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00dv47irmsyq7brzjhz4xns3p722gm98zp39h9hq2mrzd5marpgq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
     "https://github.com/zummenix/expectest")
    (synopsis
     "Provides matchers and matcher functions for unit testing")
    (description
     "Crate provides matchers and matcher functions for unit
testing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-output-vt100
  (package
    (name "rust-output-vt100")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "output-vt100" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ygqplpxz4gg3i8f3rkan2q69pqll7gv65l2mmd8r9dphnvwbkak"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/Phundrak/output-vt100-rs")
    (synopsis
     "Utility to activate escape codes in Windows' CMD and PowerShell")
    (description
     "Utility to activate escape codes in Windows' CMD and PowerShell")
    (license license:expat)))

(define-public rust-darling-core
  (package
    (name "rust-darling-core")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "119vd2nkgc6phshw4ka9733x9iskvgxds8ks6gr1rd2lxhmm2m7f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-ident-case" ,rust-ident-case)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-strsim" ,rust-strsim-0.9)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/TedDriggs/darling")
    (synopsis
     "Implementation for rust-darling")
    (description
     "Helper crate for proc-macro library for reading attributes into
structs when implementing custom derives.  Use rust-darling in your
code.")
    (license license:expat)))

(define-public rust-ident-case
  (package
    (name "rust-ident-case")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ident-case" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/TedDriggs/ident_case")
    (synopsis
     "Utility for applying case rules to Rust identifiers")
    (description
     "Utility for applying case rules to Rust identifiers.")
    (license #f)))

(define-public rust-darling-macro-0.10
  (package
    (name "rust-darling-macro")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hb2bajmf18kgbg6rzvxa78ph7bbsrlnlacq52vi021cwlrf9lqc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-darling-core" ,rust-darling-core)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/TedDriggs/darling")
    (synopsis
     "Internal support for rust-darling")
    (description
     "Internal support for a proc-macro library for reading attributes
into structs when implementing custom derives.  Use rust-darling in
your code.")
    (license license:expat)))

(define-public rust-rgb-0.8
  (package
    (name "rust-rgb")
    (version "0.8.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rgb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nzg8809n0p7g3giq3ca8wi77kcpzv1cihzq07i2kl8l281y9290"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://lib.rs/crates/rgb")
    (synopsis
     "Share pixels between crates and manipulate colors")
    (description
     "@code{struct RGB/RGBA/etc.} for sharing pixels between crates
and convenience methods for color manipulation.  Allows no-copy
high-level interoperability.  Also adds common convenience methods and
implements standard Rust traits to make RGB/RGBA pixels and slices
first-class Rust objects.")
    (license license:expat)))

(define-public rust-hashbrown-0.1
  (package
    (inherit rust-hashbrown-0.5)
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hashbrown" version))
       (file-name
        (string-append (package-name rust-hashbrown-0.5)
                       "-" version ".tar.gz"))
       (sha256
        (base32
         "1np350nrzysy021ndn2135q5vpzrp5nli78ywz114d1vcnv2kbiv"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-rayon" ,rust-rayon-1.3)
        ("rust-scopeguard" ,rust-scopeguard-0.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.4)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rayon" ,rust-rayon-1.3)
        ("rust-rustc-hash" ,rust-rustc-hash-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))))

(define-public rust-docmatic-0.1
  (package
    (name "rust-docmatic")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "docmatic" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1hx85n266lxswqxrbbinqlhi1qcnjgd4cc7v42abg72kmz7fnn4d"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs (("rust-which" ,rust-which-2.0))))
    (home-page
      "https://github.com/assert-rs/docmatic")
    (synopsis
      "Test Rust examples in your documentation")
    (description
      "Test Rust examples in your documentation.")
    (license license:expat)))

(define-public rust-globwalk-0.7
  (package
    (name "rust-globwalk")
    (version "0.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "globwalk" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0yr6kcm2izsjicisjk5dzy00wh7jmh823zxqlfq9fs2rd01wzjsk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-ignore" ,rust-ignore-0.4)
         ("rust-walkdir" ,rust-walkdir-2.2))
        #:cargo-development-inputs
        (("rust-docmatic" ,rust-docmatic-0.1)
         ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/gilnaa/globwalk")
    (synopsis
      "Glob-matched recursive file system walking")
    (description
      "Glob-matched recursive file system walking.")
    (license license:expat)))

(define-public rust-utime-0.2
  (package
    (name "rust-utime")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "utime" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0akr32rd2qiiwdbnkwd6hs4zfy76791xlqgwh9h5cp515iamhl05"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
      "https://github.com/simnalamburt/utime")
    (synopsis "Missing utime function for Rust")
    (description
      "This package provides a missing utime function for Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-treeline-0.1
  (package
    (name "rust-treeline")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "treeline" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0hcdgyk5xzcx2ylm0fr9czzs9cjznm7l9q5qz51qi97i82r43xx7"))))
    (build-system cargo-build-system)
    (home-page
      "https://github.com/softprops/treeline")
    (synopsis "Visualize tree structured data")
    (description "A library for visualizing tree structured data.")
    (license license:expat)))

(define-public rust-predicates-core-1.0
  (package
    (name "rust-predicates-core")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "predicates-core" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0y3ingf2i4xx7r61f1a8wizs57j8hh32hylyjbw9ymcj7qx5q1q6"))))
    (build-system cargo-build-system)
    (home-page
      "https://github.com/assert-rs/predicates-rs/tree/master/predicates-core")
    (synopsis
      "API for boolean-valued predicate functions.")
    (description
      "An API for boolean-valued predicate functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-predicates-tree-1.0
  (package
    (name "rust-predicates-tree")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "predicates-tree" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "090148qjilm2c722l873z7g31fhzj5j4qhd2xiv8mcqkj22w8qwf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-treeline" ,rust-treeline-0.1))))
    (home-page
      "https://github.com/assert-rs/predicates-rs/tree/master/predicates-tree")
    (synopsis
      "Render boolean-valued predicate functions results as a tree")
    (description
      "Render boolean-valued predicate functions results as a tree.")
    (license (list license:expat license:asl2.0))))

(define-public rust-normalize-line-endings-0.3
  (package
    (name "rust-normalize-line-endings")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "normalize-line-endings" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1gp52dfn2glz26a352zra8h04351icf0fkqzw1shkwrgh1vpz031"))))
    (build-system cargo-build-system)
    (home-page
      "https://github.com/derekdreery/normalize-line-endings")
    (synopsis
      "Turn an iterator over chars and into one with line endings")
    (description
      "Takes an iterator over chars and returns a new iterator with
all line endings.")
    (license license:asl2.0)))

(define-public rust-normalize-line-endings-0.2
  (package
    (inherit rust-normalize-line-endings-0.3)
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "normalize-line-endings" version))
        (file-name
          (string-append (package-name rust-normalize-line-endings-0.3)
                         "-" version ".tar.gz"))
        (sha256
          (base32
           "1a1knz9j1w5a1pl2q6whmjphm3z6p64r5njnam7syp5rx8wil2if"))))))

(define-public rust-float-cmp-0.6
  (package
    (name "rust-float-cmp")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "float-cmp" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0zb1lv3ga18vsnpjjdg87yazbzvmfwwllj3aiid8660rp3qw8qns"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
      "https://github.com/mikedilger/float-cmp")
    (synopsis
      "Floating point approximate comparison traits")
    (description
      "Floating point approximate comparison traits.")
    (license license:expat)))

(define-public rust-predicates-1.0
  (package
    (name "rust-predicates")
    (version "1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "predicates" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "12nsna7zrxf0vygzlvq4ib0i79m8d7091cc3qcl85hc15h4vz20i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-difference" ,rust-difference-2.0)
         ("rust-float-cmp" ,rust-float-cmp-0.6)
         ("rust-normalize-line-endings"
          ,rust-normalize-line-endings-0.2)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-regex" ,rust-regex-1.3))
        #:cargo-development-inputs
        (("rust-predicates-tree" ,rust-predicates-tree-1.0))))
    (home-page
      "https://github.com/assert-rs/predicates-rs")
    (synopsis
      "Implementation of boolean-valued predicate functions")
    (description
      "An implementation of boolean-valued predicate functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-assert-fs-0.13
  (package
    (name "rust-assert-fs")
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "assert_fs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1gzi4s5k5bmd4l9a0vmiank2iflzik4dlv3k4skrpa3lkyhlfnw1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-globwalk" ,rust-globwalk-0.7)
         ("rust-predicates" ,rust-predicates-1.0)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-predicates-tree" ,rust-predicates-tree-1.0)
         ("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page
      "https://github.com/assert-rs/assert_fs")
    (synopsis
      "Filesystem fixtures and assertions for testing")
    (description
      "Filesystem fixtures and assertions for testing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-escargot-0.5
  (package
    (name "rust-escargot")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "escargot" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0vd9phbpd6yrnsksn2as8flvq8ykzvck2zlz143xpp42qaz9dkvl"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-log" ,rust-log-0.4)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))
        #:cargo-development-inputs
        (("rust-assert-fs" ,rust-assert-fs-0.13))))
    (home-page
      "https://github.com/crate-ci/escargot")
    (synopsis "Cargo API written in Paris")
    (description "Cargo API written in Paris.")
    (license (list license:expat license:asl2.0))))

(define-public rust-escargot-0.3
  (package
    (inherit rust-escargot-0.5)
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "escargot" version))
        (file-name
         (string-append (package-name rust-escargot-0.5)
                        "-" version ".tar.gz"))
        (sha256
          (base32
           "19fmn7bz1h6nlqy0mp825xwjwnrjn4xjdpwc06jl51j3fiz1znqr"))))
    (arguments
      `(#:cargo-inputs
        (("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-log" ,rust-log-0.4)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))
        #:cargo-development-inputs
        (("rust-assert-fs" ,rust-assert-fs-0.13))))))

(define-public rust-assert-cmd-0.12
  (package
    (name "rust-assert-cmd")
    (version "0.12.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "assert_cmd" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0k32njzxczq9x7r4fa3sp8gwm97y2rw77i0v946lf9kjvp4bm0v2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-escargot" ,rust-escargot-0.5)
         ("rust-predicates" ,rust-predicates-1.0)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-predicates-tree" ,rust-predicates-tree-1.0))))
    (home-page
      "https://github.com/assert-rs/assert_cmd")
    (synopsis "Test CLI Applications")
    (description "Test CLI Applications.")
    (license (list license:expat license:asl2.0))))

(define-public rust-assert-cmd-0.10
  (package
    (inherit rust-assert-cmd-0.12)
    (version "0.10.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "assert_cmd" version))
        (file-name
          (string-append (package-name rust-assert-cmd-0.12)
                         "-" version ".tar.gz"))
        (sha256
          (base32
           "0rfc8mc13bd7zl3ha6klnqzcpjyfxpk2nd5phyxf9r3m1wk5rb5p"))))
    (arguments
      `(#:cargo-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-escargot" ,rust-escargot-0.5)
         ("rust-predicates" ,rust-predicates-1.0)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-predicates-tree" ,rust-predicates-tree-1.0))))))

(define-public rust-pager-0.15
  (package
    (name "rust-pager")
    (version "0.15.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pager" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0a35mg68s0p63ya2k5hsg620c4llkjw2fx1sfi0laz4pz8myv75n"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-errno" ,rust-errno-0.2)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://gitlab.com/imp/pager-rs.git")
    (synopsis
      "Helps pipe your output through an external pager")
    (description
      "Helps pipe your output through an external pager.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-shell32-sys-0.1
  (package
    (name "rust-shell32-sys")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "shell32-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0b0jjnv8rr4flllvpx9lkfvvxdl3hac53cd2klf14mqz2134pq4y"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3))
        #:cargo-development-inputs
        (("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page
      "https://github.com/retep998/winapi-rs")
    (synopsis
      "Function definitions for the Windows API library shell32")
    (description
      "Contains function definitions for the Windows API library
shell32.  See winapi for types and constants.")
    (license license:expat)))

(define-public rust-ole32-sys-0.2
  (package
    (name "rust-ole32-sys")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ole32-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "134xg38xicrqynx4pfjfxnpp8x83m3gqw5j3s8y27rc22w14jb2x"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3))
        #:cargo-development-inputs
        (("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page
      "https://github.com/retep998/winapi-rs")
    (synopsis
      "Function definitions for the Windows API library ole32")
    (description
      "Contains function definitions for the Windows API library
ole32.  See winapi for types and constants.")
    (license license:expat)))

(define-public rust-app-dirs-1.2
  (package
    (name "rust-app-dirs")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "app_dirs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0g9ijvl4xqbmahy7d7s0wj570wg0kz3ad0jk77b98smxv6x28fp7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-ole32-sys" ,rust-ole32-sys-0.2)
         ("rust-shell32-sys" ,rust-shell32-sys-0.1)
         ("rust-winapi" ,rust-winapi-0.2)
         ("rust-xdg" ,rust-xdg-2.2))))
    (home-page
      "https://github.com/AndyBarron/app-dirs-rs")
    (synopsis
      "Put your app's data in the right place on every platform")
    (description
      "Put your app's data in the right place on every platform.")
    (license license:expat)))

(define-public rust-strsim-0.7
  (package
    (inherit rust-strsim-0.9)
    (name "rust-strsim")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "strsim" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0l7mkwvdk4vgnml67b85mczk466074aj8yf25gjrjslj4l0khkxv"))))))

(define-public rust-docopt-1.0
  (package
    (inherit rust-docopt-1.1)
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docopt" version))
       (file-name
        (string-append (package-name rust-docopt-1.1)
                       "-" version ".tar.gz"))
       (sha256
        (base32
         "09djlzwkdmmic3jfinr29v25v0x8m6b8fchyzh3p4nwvaz10cafv"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-strsim" ,rust-strsim-0.7))))))
