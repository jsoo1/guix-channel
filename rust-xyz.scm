(define-module (rust-xyz)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public rust-syn
  (package
    (name "rust-syn")
    (version "0.15.39")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syn" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z7vqbx065q28p9y3gp0gcy00b308gdiv1ky2vdmcpm556w61ndl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-unicode-xid" ,rust-unicode-xid))
       #:cargo-development-inputs
       (("rust-insta" ,rust-insta)
        ("rust-rayon" ,rust-rayon)
        ("rust-ref-cast" ,rust-ref-cast)
        ("rust-regex" ,rust-regex)
        ("rust-termcolor" ,rust-termcolor)
        ("rust-walkdir" ,rust-walkdir))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "Parser for Rust source code")
    (license #f)))

;; (define-public rust-quote
;;   (package
;;     (name "rust-quote")
;;     (version "0.6.12")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "quote" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "1nw0klza45hf127kfyrpxsxd5jw2l6h21qxalil3hkr7bnf7kx7s"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2))))
;;     (home-page "https://github.com/dtolnay/quote")
;;     (synopsis "Quasi-quoting macro quote!(...)")
;;     (description "Quasi-quoting macro quote!(...)")
;;     (license #f)))

(define-public rust-serde
  (package
    (name "rust-serde")
    (version "1.0.94")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ns7k7mxza1dcj9wgd8l8h367mpnp1v2aipdpb9ik758vrpnjsh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde-derive" ,rust-serde-derive))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive))))
    (home-page "https://serde.rs")
    (synopsis
     "A generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework.")
    (license #f)))

(define-public rust-serde-derive
  (package
    (name "rust-serde-derive")
    (version "1.0.94")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yzy4wki4v4l39fc42q5lrdigh5pk0vjhvg1z7sj4fs6srwynigg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))
       #:cargo-development-inputs
       (("rust-serde" ,rust-serde))))
    (home-page "https://serde.rs")
    (synopsis
     "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (license #f)))

(define-public rust-serde-test
  (package
    (name "rust-serde-test")
    (version "1.0.94")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ii81dkyd3qmh8q3wjiwlpq6xfby2b0m5wf1f7clg93a7h4qjn3f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page "https://serde.rs")
    (synopsis
     "Token De/Serializer for testing De/Serialize implementations")
    (description
     "Token De/Serializer for testing De/Serialize implementations")
    (license #f)))

(define-public rust-serde-json
  (package
    (name "rust-serde-json")
    (version "1.0.40")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_json" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "010pa89zx07aqx1cwgw2a603wcp3q5n2iy0k71ppqbr8kwi4j705"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-indexmap" ,rust-indexmap)
        ("rust-itoa" ,rust-itoa)
        ("rust-ryu" ,rust-ryu)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-automod" ,rust-automod)
        ("rust-select-rustc" ,rust-select-rustc)
        ("rust-serde-bytes" ,rust-serde-bytes)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-stacker" ,rust-serde-stacker)
        ("rust-trybuild" ,rust-trybuild))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "A JSON serialization file format")
    (description
     "This package provides a JSON serialization file format.")
    (license #f)))

(define-public rust-serde-bytes
  (package
    (name "rust-serde-bytes")
    (version "0.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_bytes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0sc5n336i7q4fiij4l8f892zcirgybrbxzl8bp51qxzqdvdlgzxa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-test" ,rust-serde-test))))
    (home-page "https://github.com/serde-rs/bytes")
    (synopsis
     "Optimized handling of `&[u8]` and `Vec<u8>` for Serde")
    (description
     "Optimized handling of `&[u8]` and `Vec<u8>` for Serde")
    (license #f)))

(define-public rust-serde-stacker
  (package
    (name "rust-serde-stacker")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_stacker" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jn54i5m1mlc6nm47f96k85fgjs9mhpbbqa4dvd5xjbivkdw55ic"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-stacker" ,rust-stacker))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json))))
    (home-page
     "https://github.com/dtolnay/serde-stacker")
    (synopsis
     "Serde adapter that avoids stack overflow")
    (description
     "Serde adapter that avoids stack overflow by dynamically growing the stack")
    (license #f)) )

(define-public rust-serde-yaml
  (package
    (name "rust-serde-yaml")
    (version "0.8.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_yaml" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10mmjpnshgrwij01a13679nxy1hnh5yfr0343kh0y9p5j2d8mc1q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dtoa" ,rust-dtoa)
        ("rust-linked-hash-map" ,rust-linked-hash-map)
        ("rust-serde" ,rust-serde)
        ("rust-yaml-rust" ,rust-yaml-rust))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive)
        ("rust-unindent" ,rust-unindent)
        ("rust-version-sync" ,rust-version-sync))))
    (home-page
     "https://github.com/dtolnay/serde-yaml")
    (synopsis "YAML support for Serde")
    (description "YAML support for Serde")
    (license #f)))

(define-public rust-serde-cbor
  (package
    (name "rust-serde-cbor")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_cbor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jcb4j637vdlqk2z38jixaqmp6f92h36r17kclv5brjay32911ii"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-half" ,rust-half)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive))))
    (home-page "https://github.com/pyfisch/cbor")
    (synopsis "CBOR support for serde.")
    (description "CBOR support for serde.")
    (license #f)))

(define-public rust-serde-big-array
  (package
    (name "rust-serde-big-array")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-big-array" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gkyqxk760mp1lfcg6lhjk95ajc89nr0qdd0vl4ic0g8pyxcy9mr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json))))
    (home-page
     "https://github.com/est31/serde-big-array")
    (synopsis "Big array helper for serde")
    (description "Big array helper for serde.")
    (license #f)))

(define-public rust-bstr
  (package
    (name "rust-bstr")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bstr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0prq6yk3da0k5bg2czcgg1i4ynsq1l59xc89ycsv6v7p08p5gh3c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-memchr" ,rust-memchr)
        ("rust-regex-automata" ,rust-regex-automata)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck)
        ("rust-ucd-parse" ,rust-ucd-parse)
        ("rust-unicode-segmentation"
         ,rust-unicode-segmentation))))
    (home-page "https://github.com/BurntSushi/bstr")
    (synopsis
     "string type that is not required to be valid UTF-8")
    (description
     "This package provides a string type that is not required to be valid UTF-8.")
    (license #f)))

(define-public rust-bstr-0.1
  (package
    (name "rust-bstr")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bstr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nzi9vqhl56ws8gq39f3aj4qjrr4l3g5lbkkcj8xq1x4cb74wq2r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-memchr" ,rust-memchr)
        ("rust-regex-automata" ,rust-regex-automata)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck)
        ("rust-ucd-parse" ,rust-ucd-parse)
        ("rust-unicode-segmentation"
         ,rust-unicode-segmentation))))
    (home-page "https://github.com/BurntSushi/bstr")
    (synopsis
     "string type that is not required to be valid UTF-8")
    (description
     "This package provides a string type that is not required to be valid UTF-8.")
    (license #f)))

(define-public rust-grep
  (package
    (name "rust-grep")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pkhjladybzzciwg0mjk3vjz5fyi76hk0d3hgyzv2jxlyp8v4fyc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-grep-cli" ,rust-grep-cli)
        ("rust-grep-matcher" ,rust-grep-matcher)
        ("rust-grep-pcre2" ,rust-grep-pcre2)
        ("rust-grep-printer" ,rust-grep-printer)
        ("rust-grep-regex" ,rust-grep-regex)
        ("rust-grep-searcher" ,rust-grep-searcher))
       #:cargo-development-inputs
       (("rust-termcolor" ,rust-termcolor)
        ("rust-walkdir" ,rust-walkdir))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "Fast line oriented regex searching as a library")
    (description
     "Fast line oriented regex searching as a library.")
    (license #f)))

(define-public rust-ignore
  (package
    (name "rust-ignore")
    (version "0.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ignore" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00mhksl41dnlsjqmka8c5a0m4spwm70ilm1qd9rngwq552hpzicd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-channel"
         ,rust-crossbeam-channel)
        ("rust-globset" ,rust-globset)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-memchr" ,rust-memchr)
        ("rust-regex" ,rust-regex)
        ("rust-same-file" ,rust-same-file)
        ("rust-thread-local" ,rust-thread-local)
        ("rust-walkdir" ,rust-walkdir)
        ("rust-winapi-util" ,rust-winapi-util))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile))))
    (home-page
     "https://github.com/BurntSushi/ripgrep/tree/master/ignore")
    (synopsis
     "fast library for efficiently matching ignore files such as `.gitignore`")
    (description
     "This package provides a fast library for efficiently matching ignore files such as `.gitignore`
against file paths.")
    (license #f)))

(define-public rust-lazy-static
  (package
    (name "rust-lazy-static")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lazy_static" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "052ac27w189hrf1j3hz7sga46rp84zl2hqnzyihxv78mgzr2jmxw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-spin" ,rust-spin))))
    (home-page
     "https://github.com/rust-lang-nursery/lazy-static.rs")
    (synopsis
     "macro for declaring lazily evaluated statics in Rust")
    (description
     "This package provides a macro for declaring lazily evaluated statics in Rust.")
    (license #f)))

(define-public rust-log
  (package
    (name "rust-log")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "log" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ihpib899i38dlgwvyjy3hfkcn1zpqfv0m4p68xah2lm4ysw8kn8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test))))
    (home-page "https://github.com/rust-lang/log")
    (synopsis
     "lightweight logging facade for Rust")
    (description
     "This package provides a lightweight logging facade for Rust.")
    (license #f)))

(define-public rust-num-cpus
  (package
    (name "rust-num-cpus")
    (version "1.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num_cpus" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wrj3zvj6h3q26sqj9zxpd59frjb54n7jhjwf307clq31ic47vxw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment))))
    (home-page
     "https://github.com/seanmonstar/num_cpus")
    (synopsis "Get the number of CPUs on a machine")
    (description
     "Get the number of CPUs on a machine.")
    (license #f)))

(define-public rust-regex
  (package
    (name "rust-regex")
    (version "1.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pabajpp0wzb7dm2x32gy8w7k0mwykr6zsvzn0fgpr6pww40hbqb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick)
        ("rust-memchr" ,rust-memchr)
        ("rust-regex-syntax" ,rust-regex-syntax)
        ("rust-thread-local" ,rust-thread-local)
        ("rust-utf8-ranges" ,rust-utf8-ranges))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand))))
    (home-page "https://github.com/rust-lang/regex")
    (synopsis
     "implementation of regular expressions for Rust")
    (description
     "An implementation of regular expressions for Rust.  This implementation
uses finite automata and guarantees linear time matching on all inputs.")
    (license #f)))

(define-public rust-termcolor
  (package
    (name "rust-termcolor")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termcolor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vjfsn1a8zvqhnrbygrz1id6yckwv1dncw3w4zj65qdx0f00kmln"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-wincolor" ,rust-wincolor))))
    (home-page
     "https://github.com/BurntSushi/termcolor")
    (synopsis
     "simple cross platform library for writing colored text to a terminal")
    (description
     "This package provides a simple cross platform library for writing
colored text to a terminal.")
    (license #f)))

(define-public rust-spin
  (package
    (name "rust-spin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m9clchsj0rf13bggsgvbv9haiy0f6rhvnvkpvkk8720a5pkydj4"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/mvdnes/spin-rs.git")
    (synopsis
     "Synchronization primitives based on spinning")
    (description
     "Synchronization primitives based on spinning.
They may contain data, are usable without `std`,
and static initializers are available.")
    (license #f)))

;; (define-public rust-proc-macro2
;;   (package
;;     (name "rust-proc-macro2")
;;     (version "0.4.30")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "proc-macro2" version))
;;        (file-name
;;         (string-append name "-" version ".tar.gz"))
;;        (sha256
;;         (base32
;;          "0nd71fl24sys066jrha6j7i34nfkjv44yzw8yww9742wmc8j0gfg"))))
;;     (build-system cargo-build-system)
;;     (arguments
;;      `(#:cargo-inputs
;;        (("rust-unicode-xid" ,rust-unicode-xid))
;;        #:cargo-development-inputs
;;        (("rust-quote" ,rust-quote))))
;;     (home-page
;;      "https://github.com/alexcrichton/proc-macro2")
;;     (synopsis
;;      "stable implementation of the upcoming new `proc_macro` API")
;;     (description
;;      "This package provides a stable implementation of the upcoming new
;; `proc_macro` API.  Comes with an option, off by default, to also reimplement
;; itself in terms of the upstream unstable API.")
;;     (license #f)))

(define-public rust-unicode-xid
  (package
    (name "rust-unicode-xid")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-xid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z57lqh4s18rr4x0j4fw4fmp9hf9346h0kmdgqsqx0fhjr3k0wpw"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/unicode-rs/unicode-xid")
    (synopsis
     "Determine whether characters have the XID_Start or XID_Continue properties")
    (description
     "Determine whether characters have the XID_Start or XID_Continue properties
according to Unicode Standard Annex #31.")
    (license #f)))

(define-public rust-memchr
  (package
    (name "rust-memchr")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memchr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0f8wdra7yaggsr4jzlrvpd8yknnqhd990iijdr6llgc8gk2ppz1f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck))))
    (home-page
     "https://github.com/BurntSushi/rust-memchr")
    (synopsis "Safe interface to memchr")
    (description "Safe interface to memchr.")
    (license #f)))

(define-public rust-regex-automata
  (package
    (name "rust-regex-automata")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-automata" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11hzn3rz02vdgvx3ykhrbzkvs5c5sm59fyi3xwljn9qc48br5l1y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-regex-syntax" ,rust-regex-syntax)
        ("rust-utf8-ranges" ,rust-utf8-ranges))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-regex" ,rust-regex)
        ("rust-serde" ,rust-serde)
        ("rust-serde-bytes" ,rust-serde-bytes)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-toml" ,rust-toml))))
    (home-page
     "https://github.com/BurntSushi/regex-automata")
    (synopsis
     "Automata construction and matching using regular expressions")
    (description
     "Automata construction and matching using regular expressions.")
    (license #f)))

(define-public rust-quickcheck
  (package
    (name "rust-quickcheck")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mkl4wnvvjk4m32aq3an4ayfyvnmbxnzcybfm7n3fbsndb1xjdcw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-env-logger" ,rust-env-logger)
        ("rust-log" ,rust-log)
        ("rust-rand" ,rust-rand)
        ("rust-rand-core" ,rust-rand-core))))
    (home-page
     "https://github.com/BurntSushi/quickcheck")
    (synopsis
     "Automatic property based testing with shrinking")
    (description
     "Automatic property based testing with shrinking.")
    (license #f)))

(define-public rust-ucd-parse
  (package
    (name "rust-ucd-parse")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ucd-parse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13mq6c85r6ak10gjlq74mzdhsi0g0vps2y73by420513gfnipm97"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-regex" ,rust-regex))))
    (home-page
     "https://github.com/BurntSushi/ucd-generate")
    (synopsis
     "library for parsing data files in the Unicode character database")
    (description
     "This package provides a library for parsing data files in the
Unicode character database.")
    (license #f)))

(define-public rust-unicode-segmentation
  (package
    (name "rust-unicode-segmentation")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-segmentation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a9jqg7rb1yq6w2xc9jgxcs111yk5vxm9afjfvykfnrmzk6z8rqr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck))))
    (home-page
     "https://github.com/unicode-rs/unicode-segmentation")
    (synopsis
     "This crate provides Grapheme Cluster, Word and Sentence boundaries")
    (description
     "This crate provides Grapheme Cluster, Word and Sentence boundaries
according to Unicode Standard Annex #29 rules.")
    (license #f)))

(define-public rust-ansi-term
  (package
    (name "rust-ansi-term")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ansi_term" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16wpvrghvd0353584i1idnsgm0r3vchg8fyrm0x8ayv1rgvbljgf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/ogham/rust-ansi-term")
    (synopsis
     "Library for ANSI terminal colours and styles (bold, underline)")
    (description
     "Library for ANSI terminal colours and styles (bold, underline)")
    (license #f)))

(define-public rust-atty
  (package
    (name "rust-atty")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atty" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lln6vaczj521qqjbaqnb81w5p6xk4fjfkg33r0m22cm4f3mnzcs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-termion" ,rust-termion)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/softprops/atty")
    (synopsis "A simple interface for querying atty")
    (description
     "This package provides a simple interface for querying atty")
    (license #f)))

(define-public rust-bitflags
  (package
    (name "rust-bitflags")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zc1qb1hwsnl2d8rhzicsv9kqd5b2hwbrscrcfw5as4sfr35659x"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/bitflags/bitflags")
    (synopsis
     "Macro to generate structures which behave like bitflags")
    (description
     "This package provides a macro to generate structures which behave like bitflags.")
    (license #f)))

(define-public rust-clippy
  (package
    (name "rust-clippy")
    (version "0.0.302")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clippy" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1562x3sq9mgmc8j39gd34wqm7ybrdvpmj7cc1n450gwsawayw4fr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-term" ,rust-term-0.5.1))))
    (home-page
     "https://github.com/rust-lang-nursery/rust-clippy")
    (synopsis
     "A bunch of helpful lints to avoid common pitfalls in Rust.")
    (description
     "This package provides a bunch of helpful lints to avoid common pitfalls in Rust.")
    (license #f)))

(define-public rust-strsim
  (package
    (name "rust-strsim")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strsim" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xphwhf86yxxmcpvm4mikj8ls41f6nf7gqyjm98b74mfk81h6b03"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dguo/strsim-rs")
    (synopsis
     "Implementations of string similarity metrics.
Includes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro, and Jaro-Winkler.
")
    (description
     "Implementations of string similarity metrics.
Includes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro, and Jaro-Winkler.
")
    (license #f)))

(define-public rust-strsim-0.8
  (package
    (name "rust-strsim")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strsim" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0sjsm7hrvjdifz661pjxq5w4hf190hx53fra8dfvamacvff139cf"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dguo/strsim-rs")
    (synopsis
     "Implementations of string similarity metrics")
    (description
     "Implementations of string similarity metrics.
Includes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro, and Jaro-Winkler.")
    (license #f)))

(define-public rust-term-size
  (package
    (name "rust-term-size")
    (version "1.0.0-beta1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "term_size" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13w9cqjhzh3mmx6zami8lxyf42xx53yy866zxhxqcm71k637v8d8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy)
        ("rust-kernel32-sys" ,rust-kernel32-sys)
        ("rust-libc" ,rust-libc)
        ("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/kbknapp/term_size-rs.git")
    (synopsis
     "functions for determining terminal sizes and dimensions")
    (description
     "functions for determining terminal sizes and dimensions")
    (license #f)))

(define-public rust-term-size-0.3
  (package
    (name "rust-term-size")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "term_size" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09wk3173ngmb710qs9rwgibq4w250q8lgnwjvb9cypc1vdk9lnwy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy)
        ("rust-kernel32-sys" ,rust-kernel32-sys)
        ("rust-libc" ,rust-libc)
        ("rust-winapi" ,rust-winapi-0.2.8))))
    (home-page
     "https://github.com/kbknapp/term_size-rs.git")
    (synopsis
     "functions for determining terminal sizes and dimensions")
    (description
     "functions for determining terminal sizes and dimensions")
    (license #f)))

(define-public rust-textwrap
  (package
    (name "rust-textwrap")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textwrap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q5hky03ik3y50s9sz25r438bc4nwhqc6dqwynv4wylc807n29nk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-hyphenation" ,rust-hyphenation)
        ("rust-term-size" ,rust-term-size)
        ("rust-unicode-width" ,rust-unicode-width))
       #:cargo-development-inputs
       (("rust-lipsum" ,rust-lipsum)
        ("rust-rand" ,rust-rand)
        ("rust-rand-xorshift" ,rust-rand-xorshift)
        ("rust-version-sync" ,rust-version-sync))))
    (home-page
     "https://github.com/mgeisler/textwrap")
    (synopsis
     "library for word wrapping, indenting, and dedenting strings")
    (description
     "Textwrap is a small library for word wrapping, indenting, and
dedenting strings.

You can use it to format strings (such as help and error messages) for
display in commandline applications.  It is designed to be efficient
and handle Unicode characters correctly.
")
    (license #f)))

(define-public rust-unicode-width
  (package
    (name "rust-unicode-width")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-width" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09k5lipygardwy0660jhls08fsgknrazzivmn804gps53hiqc8w8"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/unicode-rs/unicode-width")
    (synopsis
     "Determine displayed width of `char` and `str` types")
    (description
     "Determine displayed width of `char` and `str` types
according to Unicode Standard Annex #11 rules.")
    (license #f)))

(define-public rust-vec-map
  (package
    (name "rust-vec-map")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vec_map" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06n8hw4hlbcz328a3gbpvmy0ma46vg1lc0r5wf55900szf3qdiq5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde))))
    (home-page
     "https://github.com/contain-rs/vec-map")
    (synopsis
     "A simple map based on a vector for small integer keys")
    (description
     "This package provides a simple map based on a vector for small integer keys.")
    (license #f)))

(define-public rust-yaml-rust
  (package
    (name "rust-yaml-rust")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yaml-rust" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ka3qhqc5lvk3hz14wmsj32jhmh44blcbfrx5hfxli2gg38kv4k5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-linked-hash-map" ,rust-linked-hash-map))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck))))
    (home-page
     "http://chyh1990.github.io/yaml-rust/")
    (synopsis "The missing YAML 1.2 parser for rust")
    (description
     "The missing YAML 1.2 parser for rust")
    (license #f)))

(define-public rust-yaml-rust-0.3
  (package
    (name "rust-yaml-rust")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yaml-rust" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14m9dzwb8fb05f4jjb4nqp49rxd9c5vcmwpv3a04d2y5iphncqz6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy)
        ("rust-linked-hash-map" ,rust-linked-hash-map))))
    (home-page
     "http://chyh1990.github.io/yaml-rust/")
    (synopsis "The missing YAML 1.2 parser for rust")
    (description
     "The missing YAML 1.2 parser for rust")
    (license #f)))

(define-public rust-version-sync
  (package
    (name "rust-version-sync")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "version-sync" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01pq0ia7ak7d69c3chjgdmaaq271yrspgbzmk6wmrwb74hx3skw4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-itertools" ,rust-itertools)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.4)
        ("rust-regex" ,rust-regex)
        ("rust-semver-parser" ,rust-semver-parser)
        ("rust-syn" ,rust-syn)
        ("rust-toml" ,rust-toml)
        ("rust-url" ,rust-url))))
    (home-page
     "https://github.com/mgeisler/version-sync")
    (synopsis
     "Simple crate for ensuring that version numbers in READMEs are updated")
    (description
     "Simple crate for ensuring that version numbers in README files are
updated when the crate version changes.")
    (license #f)))

(define-public rust-grep-cli
  (package
    (name "rust-grep-cli")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-cli" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05a502x5m4fijwx7zj9icxna2dx86scm76ap80zr89pnvpbfk1hp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty)
        ("rust-bstr" ,rust-bstr)
        ("rust-globset" ,rust-globset)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-regex" ,rust-regex)
        ("rust-same-file" ,rust-same-file)
        ("rust-termcolor" ,rust-termcolor)
        ("rust-winapi-util" ,rust-winapi-util))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "Utilities for search oriented command line applications.
")
    (description
     "Utilities for search oriented command line applications.
")
    (license #f)))

(define-public rust-grep-matcher
  (package
    (name "rust-grep-matcher")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-matcher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03j26zygfgwyam66bl5g922gimrvp4yyzl8qvaykyklnf247bl3r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-memchr" ,rust-memchr))
       #:cargo-development-inputs
       (("rust-regex" ,rust-regex))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "trait for regular expressions, with a focus on line oriented search")
    (description
     "This package provides a trait for regular expressions, with a focus on line oriented search.")
    (license #f)))

(define-public rust-grep-pcre2
  (package
    (name "rust-grep-pcre2")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-pcre2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wjc3gsan20gapga8nji6jcrmwn9n85q5zf2yfq6g50c7abkc2ql"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-grep-matcher" ,rust-grep-matcher)
        ("rust-pcre2" ,rust-pcre2))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis "Use PCRE2 with the 'grep' crate")
    (description "Use PCRE2 with the 'grep' crate.")
    (license #f)))

(define-public rust-grep-printer
  (package
    (name "rust-grep-printer")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-printer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mxc1yx5sx89f00imlm5d3hxwdgglv9rzwdki8ba50gvq8a2nr8m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64)
        ("rust-bstr" ,rust-bstr)
        ("rust-grep-matcher" ,rust-grep-matcher)
        ("rust-grep-searcher" ,rust-grep-searcher)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-termcolor" ,rust-termcolor))
       #:cargo-development-inputs
       (("rust-grep-regex" ,rust-grep-regex))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "provides standard printing of search results")
    (description
     "An implementation of the grep crate's Sink trait that provides standard
printing of search results, similar to grep itself.")
    (license #f)))

(define-public rust-grep-regex
  (package
    (name "rust-grep-regex")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lbb8837gzy25n706mnidaps4jl63ym679zraj8nfy5g02zbz549"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick)
        ("rust-grep-matcher" ,rust-grep-matcher)
        ("rust-log" ,rust-log)
        ("rust-regex" ,rust-regex)
        ("rust-regex-syntax" ,rust-regex-syntax)
        ("rust-thread-local" ,rust-thread-local)
        ("rust-utf8-ranges" ,rust-utf8-ranges))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "Use Rust's regex library with the 'grep' crate")
    (description
     "Use Rust's regex library with the 'grep' crate.")
    (license #f)))

(define-public rust-grep-searcher
  (package
    (name "rust-grep-searcher")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "grep-searcher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pj85m7q6k6jpl3q57v1gwq5jxmqnza2xg7jjcxky3q325z8lcjy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bstr" ,rust-bstr)
        ("rust-bytecount" ,rust-bytecount)
        ("rust-encoding-rs" ,rust-encoding-rs)
        ("rust-encoding-rs-io" ,rust-encoding-rs-io)
        ("rust-grep-matcher" ,rust-grep-matcher)
        ("rust-log" ,rust-log)
        ("rust-memmap" ,rust-memmap))
       #:cargo-development-inputs
       (("rust-grep-regex" ,rust-grep-regex)
        ("rust-regex" ,rust-regex))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "Fast line oriented regex searching as a library")
    (description
     "Fast line oriented regex searching as a library.")
    (license #f)))

(define-public rust-walkdir
  (package
    (name "rust-walkdir")
    (version "2.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "walkdir" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0icbm5chys06kwsglf0p2n9pm8w598h48gvqbv7z1kdk5dz4m467"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-same-file" ,rust-same-file)
        ("rust-winapi" ,rust-winapi)
        ("rust-winapi-util" ,rust-winapi-util))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment)
        ("rust-docopt" ,rust-docopt)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page
     "https://github.com/BurntSushi/walkdir")
    (synopsis "Recursively walk a directory")
    (description "Recursively walk a directory.")
    (license #f)))

(define-public rust-crossbeam-channel
  (package
    (name "rust-crossbeam-channel")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-channel" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0azpymyk0ld4akrjfy69ck5pzfgz1f2gb3smm2ywld92vsjd23hg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-smallvec" ,rust-smallvec))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand)
        ("rust-signal-hook" ,rust-signal-hook))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-channel")
    (synopsis
     "Multi-producer multi-consumer channels for message passing")
    (description
     "Multi-producer multi-consumer channels for message passing")
    (license #f)))

(define-public rust-globset
  (package
    (name "rust-globset")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "globset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wnqxq91liknmr2w93wjq2spyxbrd1pmnhd4nbi3921dr35a4nlj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick)
        ("rust-bstr" ,rust-bstr)
        ("rust-fnv" ,rust-fnv)
        ("rust-log" ,rust-log)
        ("rust-regex" ,rust-regex))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob))))
    (home-page
     "https://github.com/BurntSushi/ripgrep/tree/master/globset")
    (synopsis
     "Cross platform single glob and glob set matching")
    (description
     "Cross platform single glob and glob set matching.  Glob set matching is the
process of matching one or more glob patterns against a single candidate path
simultaneously, and returning all of the globs that matched.
")
    (license #f)))

(define-public rust-same-file
  (package
    (name "rust-same-file")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "same-file" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rsjk8zjppgc083jyx89hxi39xnjf12x2aqv3x6gz8d8afzc884g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi-util" ,rust-winapi-util))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/BurntSushi/same-file")
    (synopsis
     "determine whether two file paths point to the same file")
    (description
     "This package provides a simple crate for determining whether two
file paths point to the same file.")
    (license #f)))

(define-public rust-thread-local
  (package
    (name "rust-thread-local")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thread_local" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06rzik99p8c5js8238yhc8rk6np543ylb1dy9nrw5v80j0r3xdf6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static))))
    (home-page
     "https://github.com/Amanieu/thread_local-rs")
    (synopsis "Per-object thread-local storage")
    (description "Per-object thread-local storage")
    (license #f)))

(define-public rust-winapi-util
  (package
    (name "rust-winapi-util")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winapi-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1j839dc6y8vszvrsb7yk0qvs0w6asnahxzbyans37vnsw6vbls3i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/BurntSushi/winapi-util")
    (synopsis
     "dumping ground for high level safe wrappers over winapi")
    (description
     "This package provides a dumping ground for high level safe wrappers
over winapi.")
    (license #f)))

(define-public rust-tempfile
  (package
    (name "rust-tempfile")
    (version "3.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tempfile" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10k2dxngy414w02macv5rl0dvr9nv3292r3a2qkcq74cf0h2cdwr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-libc" ,rust-libc)
        ("rust-rand" ,rust-rand)
        ("rust-redox-syscall" ,rust-redox-syscall)
        ("rust-remove-dir-all" ,rust-remove-dir-all)
        ("rust-winapi" ,rust-winapi))))
    (home-page
     "http://stebalien.com/projects/tempfile-rs")
    (synopsis
     "library for managing temporary files and directories")
    (description
     "This package provides a library for managing temporary files
and directories.")
    (license #f)))

(define-public rust-cfg-if
  (package
    (name "rust-cfg-if")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cfg-if" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0csygklgz3ybpr0670rkip49zh76m43ar3k7xgypkzbzrwycx1ml"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/alexcrichton/cfg-if")
    (synopsis
     "ergonomically define an item depending on a large number of parameters")
    (description
     "This package provides a macro to ergonomically define an item depending on
a large number of #[cfg] parameters.  Structured like an if-else chain, the first
matching branch is the item that gets emitted.")
    (license #f)))

(define-public rust-libc
  (package
    (name "rust-libc")
    (version "0.2.58")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06d32dv5inxajhibwgz6z6nq0mgkighykrhb01k46pmsjrkvi0b2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rustc-std-workspace-core"
         ,rust-rustc-std-workspace-core))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis
     "Raw FFI bindings to platform libraries like libc")
    (description
     "Raw FFI bindings to platform libraries like libc.")
    (license #f)))

(define-public rust-doc-comment
  (package
    (name "rust-doc-comment")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "doc-comment" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15rsqxgarfpb1yim9sbp9yfgj7p2dq6v51c6bq1a62paii9ylgcj"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/GuillaumeGomez/doc-comment")
    (synopsis "Macro to generate doc comments")
    (description "Macro to generate doc comments")
    (license #f)))

(define-public rust-aho-corasick
  (package
    (name "rust-aho-corasick")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aho-corasick" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k1nqabiz37mnfnlrn084qi9yf8pj6a38qgbb3lc5zlr1jp89x76"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-memchr" ,rust-memchr))))
    (home-page
     "https://github.com/BurntSushi/aho-corasick")
    (synopsis "Fast multiple substring searching")
    (description
     "Fast multiple substring searching.")
    (license #f)))

(define-public rust-regex-syntax
  (package
    (name "rust-regex-syntax")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-syntax" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0j0x5vdz3xvs1j138349pdq5hxf5xkh6528j0rzs3qzrhq342xlx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ucd-util" ,rust-ucd-util))))
    (home-page "https://github.com/rust-lang/regex")
    (synopsis "regular expression parser")
    (description
     "This package provides a regular expression parser.")
    (license #f)))

(define-public rust-utf8-ranges
  (package
    (name "rust-utf8-ranges")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8-ranges" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ppzjsxmv1p1xfid8wwn07ciikk84k30frl28bwsny6za1vall4x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment)
        ("rust-quickcheck" ,rust-quickcheck))))
    (home-page
     "https://github.com/BurntSushi/utf8-ranges")
    (synopsis
     "Convert ranges of Unicode codepoints to UTF-8 byte ranges")
    (description
     "Convert ranges of Unicode codepoints to UTF-8 byte ranges.")
    (license #f)))

(define-public rust-rand
  (package
    (name "rust-rand")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b05gwx8nnxr9bydyjxd1rszdvqnm946ky15z103ssfrhc7anznl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getrandom" ,rust-getrandom)
        ("rust-libc" ,rust-libc)
        ("rust-log" ,rust-log)
        ("rust-packed-simd" ,rust-packed-simd)
        ("rust-rand-chacha" ,rust-rand-chacha)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-rand-hc" ,rust-rand-hc)
        ("rust-rand-pcg" ,rust-rand-pcg))
       #:cargo-development-inputs
       (("rust-rand-hc" ,rust-rand-hc)
        ("rust-rand-isaac" ,rust-rand-isaac)
        ("rust-rand-pcg" ,rust-rand-pcg)
        ("rust-rand-xorshift" ,rust-rand-xorshift)
        ("rust-rand-xoshiro" ,rust-rand-xoshiro))))
    (home-page "https://crates.io/crates/rand")
    (synopsis
     "Random number generators and other randomness functionality")
    (description
     "Random number generators and other randomness functionality.")
    (license #f)))

(define-public rust-rand-chacha
  (package
    (name "rust-rand-chacha")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_chacha" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "178d36jfkc4v95s25scc2vibj2hd2hlk64cs6id4hvzg89whd4z1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-c2-chacha" ,rust-c2-chacha)
        ("rust-rand-core" ,rust-rand-core))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg))))
    (home-page
     "https://crates.io/crates/rand_chacha")
    (synopsis "ChaCha random number generator")
    (description "ChaCha random number generator.")
    (license #f)))

(define-public rust-rand-chacha-0.1.1
  (package
    (inherit rust-rand-chacha)
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_chacha" version))
       (file-name
        (string-append (package-name rust-rand-chacha) "-" version ".tar.gz"))
       (sha256
        (base32
         "1vxwyzs4fy1ffjc8l00fsyygpiss135irjf7nyxgq2v0lqf3lvam"))))
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-c2-chacha)
        ("rust-rand-core" ,rust-rand-core-0.3))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg))))))

(define-public rust-rand-0.6.5
  (package
    (inherit rust-rand)
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand" version))
       (file-name
        (string-append (package-name rust-rand) "-" version ".tar.gz"))
       (sha256
        (base32
         "1jl4449jcl4wgmzld6ffwqj5gwxrp8zvx8w573g1z368qg6xlwbd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-autocfg)
        ("rust-libc" ,rust-libc)
        ("rust-rand-chacha" ,rust-rand-chacha-0.1.1)
        ("rust-rand-core" ,rust-rand-core-0.4.0)
        ("rust-rand-hc" ,rust-rand-hc-0.1.0)
        ("rust-rand-isaac" ,rust-rand-isaac-0.1.1)
        ("rust-rand-jitter" ,rust-rand-jitter-0.1.4)
        ("rust-rand-pcg" ,rust-rand-pcg-0.1.2)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.1.1)
        ("rust-winapi" ,rust-winapi)
        ("rust-log" ,rust-log)
        ("rust-packed-simd" ,rust-packed-simd)
        ("rust-rand-os" ,rust-rand-os-0.1.3))
       #:rust-cargo-rust-development-rust-inputs
       (("rust-average" ,rust-average)
        ("rust-rand-xoshiro" ,rust-rand-xoshiro))))))

(define-public rust-indexmap
  (package
    (name "rust-indexmap")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indexmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13f5k1kl2759y4xfy0vhays35fmrkmhqngbr2ny8smvrbz0ag0by"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv)
        ("rust-itertools" ,rust-itertools)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand)
        ("rust-serde-test" ,rust-serde-test))))
    (home-page "https://github.com/bluss/indexmap")
    (synopsis
     "hash table with consistent order and fast iteration")
    (description
     "This package provides a hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value
pairs is independent of the hash values of the keys.  It has the usual
hash table functionality, it preserves insertion order except after
removals, and it allows lookup of its elements by either hash table key
or numerical index.  A corresponding hash set type is also provided.

This crate was initially published under the name ordermap, but it was renamed to
indexmap.
")
    (license #f)))

(define-public rust-itoa
  (package
    (name "rust-itoa")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zvg2d9qv3avhf3d8ggglh6fdyw8kkwqg3r4622ly5yhxnvnc4jh"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dtolnay/itoa")
    (synopsis
     "Fast functions for printing integer primitives to an io::Write")
    (description
     "Fast functions for printing integer primitives to an io::Write")
    (license #f)))

(define-public rust-ryu
  (package
    (name "rust-ryu")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ryu" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15r9z2wzgbj04pks4jz7y6wif5xqhf1wqkl2nd7qrvn08ys68969"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-no-panic" ,rust-no-panic))
       #:cargo-development-inputs
       (("rust-num-cpus" ,rust-num-cpus)
        ("rust-rand" ,rust-rand))))
    (home-page "https://github.com/dtolnay/ryu")
    (synopsis
     "Fast floating point to string conversion")
    (description
     "Fast floating point to string conversion")
    (license #f)))

(define-public rust-automod
  (package
    (name "rust-automod")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "automod" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pld582piq2d55z0j96zcs8izw3ml46f8h9y7sdyxg093yfvxl2h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page "https://github.com/dtolnay/automod")
    (synopsis
     "Pull in every source file in a directory as a module")
    (description
     "Pull in every source file in a directory as a module.")
    (license #f)))

(define-public rust-select-rustc
  (package
    (name "rust-select-rustc")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "select-rustc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0daqd56smi93g59nz43n4mh3d8whr6j5pa8dmwlf8bd76mdy3cpx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page
     "https://github.com/dtolnay/select-rustc")
    (synopsis
     "Conditional compilation according to rustc compiler version")
    (description
     "Conditional compilation according to rustc compiler version")
    (license #f)))

(define-public rust-trybuild
  (package
    (name "rust-trybuild")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trybuild" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f47r9cg4m2adja6vxr764lpjizkan6n2mfb40lrbnj96kyjnndp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-glob" ,rust-glob)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-termcolor" ,rust-termcolor)
        ("rust-toml" ,rust-toml))))
    (home-page "https://github.com/dtolnay/trybuild")
    (synopsis
     "Test harness for ui tests of compiler diagnostics")
    (description
     "Test harness for ui tests of compiler diagnostics")
    (license #f)))

(define-public rust-wincolor
  (package
    (name "rust-wincolor")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wincolor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fp9sxq63kw3vjjcjrl3f7px082pplzxcr3qza2n2pa6mq0xj7jn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi)
        ("rust-winapi-util" ,rust-winapi-util))))
    (home-page
     "https://github.com/BurntSushi/termcolor/tree/master/wincolor")
    (synopsis
     "simple Windows specific API for controlling text color")
    (description
     "This package provides a simple Windows specific API for controlling text color in a Windows console.")
    (license #f)))

(define-public rust-byteorder
  (package
    (name "rust-byteorder")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byteorder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xbwjlmq2ziqjmjvkqxdx1yh136xxhilxd40bky1w4d7hn4xvhx7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/BurntSushi/byteorder")
    (synopsis
     "Library for reading/writing numbers in big-endian and little-endian.")
    (description
     "Library for reading/writing numbers in big-endian and little-endian.")
    (license #f)))

(define-public rust-toml
  (package
    (name "rust-toml")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fdhfyv20qn29cxq1f9j9wav92c3qhxdm71sxfyzhzpsfdw6vjdq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-linked-hash-map" ,rust-linked-hash-map)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page
     "https://github.com/alexcrichton/toml-rs")
    (synopsis
     "A native Rust encoder and decoder of TOML-formatted files and streams. Provides
implementations of the standard Serialize/Deserialize traits for TOML data to
facilitate deserializing and serializing Rust structures.
")
    (description
     "This package provides a native Rust encoder and decoder of TOML-formatted files and streams.  Provides
implementations of the standard Serialize/Deserialize traits for TOML data to
facilitate deserializing and serializing Rust structures.
")
    (license #f)))

(define-public rust-env-logger
  (package
    (name "rust-env-logger")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "env_logger" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lx2s5nk96xx4i3m4zc4ghqgi8kb07dsnyiv8jk2clhax42dxz5a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty)
        ("rust-humantime" ,rust-humantime)
        ("rust-log" ,rust-log)
        ("rust-regex" ,rust-regex)
        ("rust-termcolor" ,rust-termcolor))))
    (home-page
     "https://github.com/sebasmagri/env_logger/")
    (synopsis
     "logging implementation for `log`")
    (description
     "This package provides a logging implementation for `log` which is configured via an environment
variable.
")
    (license #f)))

(define-public rust-rand-core
  (package
    (name "rust-rand-core")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jis94x9ri8xlxki2w2w5k29sjpfwgzkjylg7paganp74hrnhpk1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getrandom" ,rust-getrandom)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page "https://crates.io/crates/rand_core")
    (synopsis
     "Core random number generator traits and tools for implementation")
    (description
     "Core random number generator traits and tools for implementation.")
    (license #f)))

(define-public rust-rand-core-0.4.0
  (package
    (inherit rust-rand-core)
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_core" version))
       (file-name
        (string-append (package-name rust-rand-core) "-" version ".tar.gz"))
       (sha256
        (base32
         "1h3dbrhi5qgflqnzzd86s48v1dn1l17bmdssi5q170whsm4sbryh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))))

(define-public rust-rand-core-0.3
  (package
    (inherit rust-rand-core)
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_core" version))
       (file-name
        (string-append (package-name rust-rand-core) "-" version ".tar.gz"))
       (sha256
        (base32
         "0jzdgszfa4bliigiy4hi66k7fs3gfwi2qxn8vik84ph77fwdwvvs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))))

(define-public rust-winapi
  (package
    (name "rust-winapi")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winapi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0w7pbhcl087lkggxdflfp2i92rq89ahsfdkjkv44fgmiy9m3h3pi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi-i686-pc-windows-gnu"
         ,rust-winapi-i686-pc-windows-gnu)
        ("rust-winapi-x86-64-pc-windows-gnu"
         ,rust-winapi-x86-64-pc-windows-gnu))))
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Raw FFI bindings for all of Windows API.")
    (description
     "Raw FFI bindings for all of Windows API.")
    (license #f)))

(define-public rust-winapi-0.2.8
  (package
    (name "rust-winapi")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winapi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yh816lh6lf56dpsgxy189c2ai1z3j8mw9si6izqb6wsjkbcjz8n"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Raw FFI bindings for all of Windows API.")
    (description
     "Raw FFI bindings for all of Windows API.")
    (license #f)))

(define-public rust-termion
  (package
    (name "rust-termion")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c634rg520zjjfhwnxrc2jbfjz7db0rcpsjs1qici0nyghpv53va"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-numtoa" ,rust-numtoa-0.1.0)
        ("rust-redox-syscall" ,rust-redox-syscall)
        ("rust-redox-termios" ,rust-redox-termios))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/termion")
    (synopsis
     "A bindless library for manipulating terminals.")
    (description
     "This package provides a bindless library for manipulating terminals.")
    (license #f)))

(define-public rust-term
  (package
    (name "rust-term")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "term" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hkgjrfisj6zjwz525639pmsvzhlc48a0h65nw87qrdp6jihdlgd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-dirs" ,rust-dirs)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/Stebalien/term")
    (synopsis "A terminal formatting library")
    (description
     "This package provides a terminal formatting library")
    (license #f)))

(define-public rust-term-0.5.1
  (package
    (name "rust-term")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "term" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qbmqd8jbjlqr4608qdmvp6yin5ypifzi5s2xyhlw8g8s5ynfssy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-dirs" ,rust-dirs)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/Stebalien/term")
    (synopsis "A terminal formatting library")
    (description
     "This package provides a terminal formatting library")
    (license #f)))

(define-public rust-kernel32-sys
  (package
    (name "rust-kernel32-sys")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "kernel32-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1389av0601a9yz8dvx5zha9vmkd6ik7ax0idpb032d28555n41vm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi)
        ("rust-winapi-build" ,rust-winapi-build))))
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Contains function definitions for the Windows API library kernel32. See winapi for types and constants.")
    (description
     "Contains function definitions for the Windows API library kernel32.  See winapi for types and constants.")
    (license #f)))

(define-public rust-hyphenation
  (package
    (name "rust-hyphenation")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyphenation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k5msv8calmnfd5kw1rmq4bg5hn1vcd39kbsxl57sdld63xwd4q4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atlatl" ,rust-atlatl)
        ("rust-bincode" ,rust-bincode)
        ("rust-hyphenation-commons"
         ,rust-hyphenation-commons)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-atlatl" ,rust-atlatl)
        ("rust-bincode" ,rust-bincode)
        ("rust-hyphenation-commons"
         ,rust-hyphenation-commons)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-pocket-resources" ,rust-pocket-resources)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-serde" ,rust-serde)
        ("rust-unicode-normalization"
         ,rust-unicode-normalization)
        ("rust-unicode-segmentation"
         ,rust-unicode-segmentation))))
    (home-page
     "https://github.com/tapeinosyne/hyphenation")
    (synopsis
     "Knuth-Liang hyphenation for a variety of languages")
    (description
     "Knuth-Liang hyphenation for a variety of languages")
    (license #f)))

(define-public rust-lipsum
  (package
    (name "rust-lipsum")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lipsum" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nlxkz8zjxqmbrxqasr36a5fqn2n33cxy11w0x0a0b6mcx04dr2q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand" ,rust-rand))
       #:cargo-development-inputs
       (("rust-rand-xorshift" ,rust-rand-xorshift)
        ("rust-version-sync" ,rust-version-sync))))
    (home-page "https://github.com/mgeisler/lipsum/")
    (synopsis
     "Lipsum is a lorem ipsum text generation library. Use this if you need
some filler text for your application.

The text is generated using a simple Markov chain, which you can also
instantiate to generate your own pieces of pseudo-random text.
")
    (description
     "Lipsum is a lorem ipsum text generation library.  Use this if you need
some filler text for your application.

The text is generated using a simple Markov chain, which you can also
instantiate to generate your own pieces of pseudo-random text.
")
    (license #f)))

(define-public rust-rand-xorshift
  (package
    (name "rust-rand-xorshift")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_xorshift" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a6wy76lc5fimm1n9n8fzhp4cfjwfwxh4hx63bg3vlh1d2w1dm3p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode))))
    (home-page
     "https://crates.io/crates/rand_xorshift")
    (synopsis "Xorshift random number generator")
    (description
     "Xorshift random number generator")
    (license #f)))

(define-public rust-rand-xorshift-0.1.1
  (package
    (inherit rust-rand-xorshift)
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_xorshift" version))
       (file-name
        (string-append (package-name rust-rand-xorshift) "-" version ".tar.gz"))
       (sha256
        (base32
         "0p2x8nr00hricpi2m6ca5vysiha7ybnghz79yqhhx6sl4gkfkxyb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode))))))


(define-public rust-linked-hash-map
  (package
    (name "rust-linked-hash-map")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "linked-hash-map" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10qgbvh00q36ql0jh00rxh2jlq6qvl11n6mig0cvkpf4xf5bd4df"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy)
        ("rust-heapsize" ,rust-heapsize)
        ("rust-serde" ,rust-serde)
        ("rust-serde-test" ,rust-serde-test))))
    (home-page
     "https://github.com/contain-rs/linked-hash-map")
    (synopsis
     "A HashMap wrapper that holds key-value pairs in insertion order")
    (description
     "This package provides a HashMap wrapper that holds key-value pairs in insertion order")
    (license #f)))

(define-public rust-itertools
  (package
    (name "rust-itertools")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itertools" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0n2k13b6w4x2x6np2lykh9bj3b3z4hwh2r4cn3z2dgnfq7cng12v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-either" ,rust-either))
       #:cargo-development-inputs
       (("rust-permutohedron" ,rust-permutohedron)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/bluss/rust-itertools")
    (synopsis
     "Extra iterator adaptors, iterator methods, free functions, and macros.")
    (description
     "Extra iterator adaptors, iterator methods, free functions, and macros.")
    (license #f)))

(define-public rust-pulldown-cmark-0.4
  (package
    (name "rust-pulldown-cmark")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pulldown-cmark" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1db8vlhm3n72051bkq4am80q28rfrh88796i3y9ajf5hhk3lrdyi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags)
        ("rust-getopts" ,rust-getopts)
        ("rust-memchr" ,rust-memchr)
        ("rust-unicase" ,rust-unicase))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion)
        ("rust-html5ever" ,rust-html5ever)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-regex" ,rust-regex)
        ("rust-tendril" ,rust-tendril))))
    (home-page
     "https://github.com/raphlinus/pulldown-cmark")
    (synopsis "A pull parser for CommonMark")
    (description
     "This package provides a pull parser for CommonMark")
    (license #f)))

(define-public rust-semver-parser
  (package
    (name "rust-semver-parser")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver-parser" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ahqhvgpzhcsd28id7xnrjv4419i9yyalhm7d7zi430qx0hi2vml"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/steveklabnik/semver-parser")
    (synopsis "Parsing of the semver spec.
")
    (description "Parsing of the semver spec.
")
    (license #f)))

(define-public rust-url
  (package
    (name "rust-url")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "url" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nim1c90mxpi9wgdw2xh8dqd72vlklwlzam436akcrhjac6pqknx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding" ,rust-encoding)
        ("rust-heapsize" ,rust-heapsize)
        ("rust-idna" ,rust-idna)
        ("rust-matches" ,rust-matches)
        ("rust-percent-encoding" ,rust-percent-encoding)
        ("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher)
        ("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-rustc-test" ,rust-rustc-test)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis
     "URL library for Rust, based on the WHATWG URL Standard")
    (description
     "URL library for Rust, based on the WHATWG URL Standard")
    (license #f)))

(define-public rust-base64
  (package
    (name "rust-base64")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13k6bvd3n6dm7jqn9x918w65dd9xhx454bqphbnv0bkd6n9dj98b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion)
        ("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/alicemaz/rust-base64")
    (synopsis
     "encodes and decodes base64 as bytes or utf8")
    (description
     "encodes and decodes base64 as bytes or utf8")
    (license #f)))

(define-public rust-bytecount
  (package
    (name "rust-bytecount")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytecount" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z6a280kiy4kg5v3qw97pbyvwycr17fsm41804i8zpq7nmads3xy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-packed-simd" ,rust-packed-simd))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand))))
    (home-page "https://github.com/llogiq/bytecount")
    (synopsis
     "count occurrences of a given byte, or the number of UTF-8 code points, in a byte slice, fast")
    (description
     "count occurrences of a given byte, or the number of UTF-8 code points, in a byte slice, fast")
    (license #f)))

(define-public rust-encoding-rs
  (package
    (name "rust-encoding-rs")
    (version "0.8.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding_rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v902qqnbd37vdq4rjvp6k05wmghrasfdcjy30gp1xpjg5f7hma1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-packed-simd" ,rust-packed-simd)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page "https://docs.rs/encoding_rs/")
    (synopsis
     "A Gecko-oriented implementation of the Encoding Standard")
    (description
     "This package provides a Gecko-oriented implementation of the Encoding Standard")
    (license #f)))

(define-public rust-encoding-rs-io
  (package
    (name "rust-encoding-rs-io")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding_rs_io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b7k9p7inkrcanh7h6q4m278y05gmcwi8p5r43h7grzl5dxfw6cn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-rs" ,rust-encoding-rs))))
    (home-page
     "https://github.com/BurntSushi/encoding_rs_io")
    (synopsis
     "Streaming transcoding for encoding_rs")
    (description
     "Streaming transcoding for encoding_rs")
    (license #f)))

(define-public rust-mmap
  (package
    (name "rust-mmap")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08xqhvr4l3rf1fkz2w4cwz3z5wd0m1jab1d34sxd4v80lr459j0b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/rbranson/rust-mmap")
    (synopsis
     "A library for dealing with memory-mapped I/O
")
    (description
     "This package provides a library for dealing with memory-mapped I/O
")
    (license #f)))

(define-public rust-docopt
  (package
    (name "rust-docopt")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docopt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s9rcpmnnivs502q69lc1h1wrwapkq09ikgbfbgqf31idmc5llkz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-regex" ,rust-regex)
        ("rust-serde" ,rust-serde)
        ("rust-strsim" ,rust-strsim))))
    (home-page "https://github.com/docopt/docopt.rs")
    (synopsis "Command line argument parsing.")
    (description "Command line argument parsing.")
    (license #f)))

(define-public rust-crossbeam-utils
  (package
    (name "rust-crossbeam-utils")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-utils" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p5aa8k3wpsn17md4rx038ac2azm9354knbxdfvn7dd7yk76yc7q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-lazy-static" ,rust-lazy-static))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-utils")
    (synopsis "Utilities for concurrent programming")
    (description
     "Utilities for concurrent programming")
    (license #f)))

(define-public rust-smallvec
  (package
    (name "rust-smallvec")
    (version "0.6.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smallvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dyl43rgzny79jjpgzi07y0ly2ggx1xwsn64csxj0j91bsf6lq5b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode))))
    (home-page
     "https://github.com/servo/rust-smallvec")
    (synopsis
     "'Small vector' optimization: store up to a small number of items on the stack")
    (description
     "'Small vector' optimization: store up to a small number of items on the stack")
    (license #f)))

(define-public rust-signal-hook
  (package
    (name "rust-signal-hook")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signal-hook" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nlw1gwi58ppds5klyy8vp2ickx3majvdp1pcdz8adm4zpqmiavj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-libc" ,rust-libc)
        ("rust-mio" ,rust-mio)
        ("rust-mio-uds" ,rust-mio-uds)
        ("rust-signal-hook-registry"
         ,rust-signal-hook-registry)
        ("rust-tokio-reactor" ,rust-tokio-reactor))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio)
        ("rust-version-sync" ,rust-version-sync))))
    (home-page
     "https://github.com/vorner/signal-hook")
    (synopsis "Unix signal handling")
    (description "Unix signal handling")
    (license #f)))

(define-public rust-fnv
  (package
    (name "rust-fnv")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fnv" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ww56bi1r5b8id3ns9j3qxbi7w5h005rzhiryy0zi9h97raqbb9g"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/servo/rust-fnv")
    (synopsis
     "Fowlerâ\x80\x93Nollâ\x80\x93Vo hash function")
    (description
     "Fowlerâ\x80\x93Nollâ\x80\x93Vo hash function")
    (license #f)))

(define-public rust-glob
  (package
    (name "rust-glob")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glob" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0x25wfr7vg3mzxc9x05dcphvd3nwlcmbnxrvwcvrrdwplcrrk4cv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir))))
    (home-page "https://github.com/rust-lang/glob")
    (synopsis
     "Support for matching file paths against Unix shell style patterns.
")
    (description
     "Support for matching file paths against Unix shell style patterns.
")
    (license #f)))

(define-public rust-redox-syscall
  (package
    (name "rust-redox-syscall")
    (version "0.1.54")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redox_syscall" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lp22pjvmj33a2fa7y1h9cgxmnfd8whbb8s6n0f4yp7nl0a9q8hj"))))
    (build-system cargo-build-system)
    (home-page
     "https://gitlab.redox-os.org/redox-os/syscall")
    (synopsis
     "A Rust library to access raw Redox system calls")
    (description
     "This package provides a Rust library to access raw Redox system calls")
    (license #f)))

(define-public rust-remove-dir-all
  (package
    (name "rust-remove-dir-all")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "remove_dir_all" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bkrlyg26mgizpiy1yb2hhpgscxcag8r5fnckqsvk25608vzm0sa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment))))
    (home-page
     "https://github.com/XAMPPRocky/remove_dir_all.git")
    (synopsis
     "A safe, reliable implementation of remove_dir_all for Windows")
    (description
     "This package provides a safe, reliable implementation of remove_dir_all for Windows")
    (license #f)))

(define-public rust-rustc-std-workspace-core
  (package
    (name "rust-rustc-std-workspace-core")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-std-workspace-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1309xhwyai9xpz128xrfjqkmnkvgjwddznmj7brbd8i8f58zamhr"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis
     "Explicitly empty crate for rust-lang/rust integration
")
    (description
     "Explicitly empty crate for rust-lang/rust integration
")
    (license #f)))

(define-public rust-ucd-util
  (package
    (name "rust-ucd-util")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ucd-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11lgx380zgqsm265cg78w2mcjpmldbwbi01lb5w48hyqwi720p2k"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/BurntSushi/ucd-generate")
    (synopsis
     "A small utility library for working with the Unicode character database.
")
    (description
     "This package provides a small utility library for working with the Unicode character database.
")
    (license #f)))

(define-public rust-getrandom
  (package
    (name "rust-getrandom")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getrandom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0macrjfkgsjn6ikr94agapp4fkxmr8w7y2g7qis4icc4a17cwp76"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-libc" ,rust-libc)
        ("rust-log" ,rust-log)
        ("rust-stdweb" ,rust-stdweb)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen))))
    (home-page
     "https://github.com/rust-random/getrandom")
    (synopsis
     "A small cross-platform library for retrieving random data from system source")
    (description
     "This package provides a small cross-platform library for retrieving random data from system source")
    (license #f)))

(define-public rust-packed-simd
  (package
    (name "rust-packed-simd")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "packed_simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0822wqf6kzw4ig9ykndg348w2bxkhs3x64brzsvdxh2a1pyajpm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-core-arch" ,rust-core-arch)
        ("rust-sleef-sys" ,rust-sleef-sys))
       #:cargo-development-inputs
       (("rust-arrayvec" ,rust-arrayvec)
        ("rust-paste" ,rust-paste)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen)
        ("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test))))
    (home-page
     "https://github.com/rust-lang-nursery/packed_simd")
    (synopsis "Portable Packed SIMD vectors")
    (description "Portable Packed SIMD vectors")
    (license #f)))

(define-public rust-chacha
  (package
    (name "rust-chacha")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chacha" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qj839h7fjkmxlwyx5yqrcj0rlgvw2cfkaj0arhyb8gvnn0w1wyx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-keystream" ,rust-keystream))))
    (home-page "https://github.com/PeterReid/chacha")
    (synopsis "ChaCha stream ciphers")
    (description "ChaCha stream ciphers")
    (license #f)))

(define-public rust-rand-hc
  (package
    (name "rust-rand-hc")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_hc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g31sqwpmsirdlwr0svnacr4dbqyz339im4ssl9738cjgfpjjcfa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core))))
    (home-page "https://crates.io/crates/rand_hc")
    (synopsis "HC128 random number generator")
    (description "HC128 random number generator")
    (license #f)))

(define-public rust-rand-hc-0.1.0
  (package
    (inherit rust-rand-hc)
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_hc" version))
       (file-name
        (string-append (package-name rust-rand-hc) "-" version ".tar.gz"))
       (sha256
        (base32
         "1i0vl8q5ddvvy0x8hf1zxny393miyzxkwqnw31ifg6p0gdy6fh3v"))))))

(define-public rust-rand-pcg
  (package
    (name "rust-rand-pcg")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_pcg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dljwilv3640l1c5vlg4isiq7qz8gqa2cjbvgv3p0p5wrd36669y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg)
        ("rust-bincode" ,rust-bincode))))
    (home-page "https://crates.io/crates/rand_pcg")
    (synopsis
     "Selected PCG random number generators
")
    (description
     "Selected PCG random number generators
")
    (license #f)))

(define-public rust-rand-pcg-0.1.2
  (package
    (inherit rust-rand-pcg)
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_pcg" version))
       (file-name
        (string-append (package-name rust-rand-pcg) "-" version ".tar.gz"))
       (sha256
        (base32
         "0i0bdla18a8x4jn1w0fxsbs3jg7ajllz6azmch1zw33r06dv1ydb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-autocfg)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode))))))

(define-public rust-rand-isaac
  (package
    (name "rust-rand-isaac")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_isaac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xlb9415x518ffkazxhvk8b04i9i548nva4i5l5s34crvjrv1xld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode))))
    (home-page "https://crates.io/crates/rand_isaac")
    (synopsis "ISAAC random number generator")
    (description "ISAAC random number generator")
    (license #f)))

(define-public rust-rand-isaac-0.1.1
  (package
    (inherit rust-rand-isaac)
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_isaac" version))
       (file-name
        (string-append (package-name rust-rand-isaac) "-" version ".tar.gz"))
       (sha256
        (base32
         "027flpjr4znx2csxk7gxb7vrf9c7y5mydmvg5az2afgisp4rgnfy"))))
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode))))))

(define-public rust-rand-xoshiro
  (package
    (name "rust-rand-xoshiro")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_xoshiro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07w3qgrac8r356lz5vqff42rly6yd9vs3g5lx5pbn13rcmb05rqb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode))))
    (home-page
     "https://crates.io/crates/rand_xoshiro")
    (synopsis
     "Xoshiro, xoroshiro and splitmix64 random number generators")
    (description
     "Xoshiro, xoroshiro and splitmix64 random number generators")
    (license #f)))

(define-public rust-no-panic
  (package
    (name "rust-no-panic")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "no-panic" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "089gmyxg7kviimqn5nmghm5kngnmi77a0c6fbv0j67jxx7pjhq3r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile))))
    (home-page "https://github.com/dtolnay/no-panic")
    (synopsis
     "Attribute macro to require that the compiler prove a function can't ever panic.")
    (description
     "Attribute macro to require that the compiler prove a function can't ever panic.")
    (license #f)))

(define-public rust-bincode
  (package
    (name "rust-bincode")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bincode" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xx6bp39irvsndk6prnmmq8m1l9p6q2qj21j6mfks2y81pjsa14z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg)
        ("rust-serde-bytes" ,rust-serde-bytes)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page "https://github.com/TyOverby/bincode")
    (synopsis
     "A binary serialization / deserialization strategy that uses Serde for transforming structs into bytes and vice versa!")
    (description
     "This package provides a binary serialization / deserialization strategy that uses Serde for transforming structs into bytes and vice versa!")
    (license #f)))

(define-public rust-humantime
  (package
    (name "rust-humantime")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "humantime" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "057ilhy6vc9iqhhby5ymh45m051pgxwq2z437gwkbnqhw7rfb9rw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-quick-error" ,rust-quick-error))
       #:cargo-development-inputs
       (("rust-chrono" ,rust-chrono)
        ("rust-rand" ,rust-rand)
        ("rust-time" ,rust-time))))
    (home-page
     "https://github.com/tailhook/humantime")
    (synopsis
     "    A parser and formatter for std::time::{Duration, SystemTime}
")
    (description
     "    A parser and formatter for std::time::{Duration, SystemTime}
")
    (license #f)))

(define-public rust-winapi-i686-pc-windows-gnu
  (package
    (name "rust-winapi-i686-pc-windows-gnu")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winapi-i686-pc-windows-gnu" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.")
    (description
     "Import libraries for the i686-pc-windows-gnu target.  Please don't use this crate directly, depend on winapi instead.")
    (license #f)))

(define-public rust-winapi-x86-64-pc-windows-gnu
  (package
    (name "rust-winapi-x86-64-pc-windows-gnu")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri
             "winapi-x86_64-pc-windows-gnu"
             version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.")
    (description
     "Import libraries for the x86_64-pc-windows-gnu target.  Please don't use this crate directly, depend on winapi instead.")
    (license #f)))

(define-public rust-numtoa
  (package
    (name "rust-numtoa")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "numtoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1c10ndd0wk48blhljqhlwrpni23246jzkg9abpxc3cm0xynvc8g5"))))
    (build-system cargo-build-system)
    (home-page "https://gitlab.com/mmstick/numtoa")
    (synopsis
     "Convert numbers into stack-allocated byte arrays")
    (description
     "Convert numbers into stack-allocated byte arrays")
    (license #f)))

(define-public rust-numtoa-0.1.0
  (package
    (inherit rust-numtoa)
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "numtoa" version))
       (file-name
        (string-append (package-name rust-numtoa) "-" version ".tar.gz"))
       (sha256
        (base32
         "1vs9rhggqbql1p26x8nkha1j06wawwgb2jp5fs88b5gi7prvvy5q"))))))

(define-public rust-redox-termios
  (package
    (name "rust-redox-termios")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redox_termios" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xhgvdh62mymgdl3jqrngl8hr4i8xwpnbsxnldq0l47993z1r2by"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-redox-syscall" ,rust-redox-syscall))))
    (home-page "https://github.com/redox-os/termios")
    (synopsis
     "A Rust library to access Redox termios functions")
    (description
     "This package provides a Rust library to access Redox termios functions")
    (license #f)))

(define-public rust-dirs
  (package
    (name "rust-dirs")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dirs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18aggvhdg6jcgf1gz8z51rzcx4mgfgjpyb1akqrr7lq2p6lgakhw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-dirs-sys" ,rust-dirs-sys))))
    (home-page "https://github.com/soc/dirs-rs")
    (synopsis
     "A tiny low-level library that provides platform-specific standard locations of directories for config, cache and other data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by the XDG base/user directory specifications on Linux, the Known Folder API on Windows, and the Standard Directory guidelines on macOS.")
    (description
     "This package provides a tiny low-level library that provides platform-specific standard locations of directories for config, cache and other data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by the XDG base/user directory specifications on Linux, the Known Folder API on Windows, and the Standard Directory guidelines on macOS.")
    (license #f)))

(define-public rust-atlatl
  (package
    (name "rust-atlatl")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atlatl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18kyvdm56fdb52b1sryi80xgs3nkjdylynsv324aiqnj85l1bfrj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fnv" ,rust-fnv)
        ("rust-num-traits" ,rust-num-traits)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-fst" ,rust-fst)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/tapeinosyne/atlatl")
    (synopsis "Double-array tries.")
    (description "Double-array tries.")
    (license #f)))

(define-public rust-hyphenation-commons
  (package
    (name "rust-hyphenation-commons")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyphenation_commons" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pasnbk3rbdgf30jjjh1h24a9pxpdrnn0ihcivmpnzqha6mn2d4y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atlatl" ,rust-atlatl)
        ("rust-serde" ,rust-serde))))
    (home-page
     "https://github.com/tapeinosyne/hyphenation")
    (synopsis
     "Proemial code for the `hyphenation` library")
    (description
     "Proemial code for the `hyphenation` library")
    (license #f)))

(define-public rust-pocket-resources
  (package
    (name "rust-pocket-resources")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pocket-resources" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n2i5vmi8fdbw89wm5nz1ws1z9f1qax911p6ksg4scmdg23z6df1"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/tomaka/pocket-resources")
    (synopsis
     "Include resources in your applications.")
    (description
     "Include resources in your applications.")
    (license #f)))

(define-public rust-unicode-normalization
  (package
    (name "rust-unicode-normalization")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-normalization" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09i49va90rvia1agvgni4gicnqv50y5zy1naw8mr8bcqifh3j4ql"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-smallvec" ,rust-smallvec))))
    (home-page
     "https://github.com/unicode-rs/unicode-normalization")
    (synopsis
     "This crate provides functions for normalization of
Unicode strings, including Canonical and Compatible
Decomposition and Recomposition, as described in
Unicode Standard Annex #15.
")
    (description
     "This crate provides functions for normalization of
Unicode strings, including Canonical and Compatible
Decomposition and Recomposition, as described in
Unicode Standard Annex #15.
")
    (license #f)))

(define-public rust-heapsize
  (package
    (name "rust-heapsize")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heapsize" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q94q9ppqjgrw71swiyia4hgby2cz6dldp7ij57nkvhd6zmfcy8n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/servo/heapsize")
    (synopsis
     "Infrastructure for measuring the total runtime size of an object on the heap")
    (description
     "Infrastructure for measuring the total runtime size of an object on the heap")
    (license #f)))

(define-public rust-either
  (package
    (name "rust-either")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "either" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yyggfd5yq9hyyp0bd5jj0fgz3rwws42d19ri0znxwwqs3hcy9sm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde))))
    (home-page "https://github.com/bluss/either")
    (synopsis
     "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.
")
    (description
     "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.
")
    (license #f)))

(define-public rust-permutohedron
  (package
    (name "rust-permutohedron")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "permutohedron" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b1pzh48j86v46wxngch6k1kx9cdw3jr3lwa86gd6jd4bmxzz1xn"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/bluss/permutohedron")
    (synopsis
     "Generate permutations of sequences. Either lexicographical order permutations, or a minimal swaps permutation sequence implemented using Heap's algorithm.")
    (description
     "Generate permutations of sequences.  Either lexicographical order permutations, or a minimal swaps permutation sequence implemented using Heap's algorithm.")
    (license #f)))

(define-public rust-getopts
  (package
    (name "rust-getopts")
    (version "0.2.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getopts" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0l74ldicw6gpkly3jdiq8vq8g597x7akvych2cgy7gr8q8apnckj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-width" ,rust-unicode-width))
       #:cargo-development-inputs
       (("rust-log" ,rust-log))))
    (home-page
     "https://github.com/rust-lang/getopts")
    (synopsis "getopts-like option parsing")
    (description "getopts-like option parsing.")
    (license #f)))

(define-public rust-unicase
  (package
    (name "rust-unicase")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicase" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xmpmkakhhblq7dzab1kwyv925kv7fqjkjsxjspg6ix9n88makm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-version-check" ,rust-version-check-0.1))))
    (home-page
     "https://github.com/seanmonstar/unicase")
    (synopsis
     "A case-insensitive wrapper around strings.")
    (description
     "This package provides a case-insensitive wrapper around strings.")
    (license #f)))

(define-public rust-criterion
  (package
    (name "rust-criterion")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1543wlpc4p1kz7sqqa7ylr8bkdr8l4f34hy4bxj7krpkahwhaqq3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty)
        ("rust-cast" ,rust-cast)
        ("rust-clap" ,rust-clap)
        ("rust-criterion-plot" ,rust-criterion-plot)
        ("rust-csv" ,rust-csv)
        ("rust-itertools" ,rust-itertools)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-libc" ,rust-libc)
        ("rust-num-traits" ,rust-num-traits)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-rand-os" ,rust-rand-os)
        ("rust-rand-xoshiro" ,rust-rand-xoshiro)
        ("rust-rayon" ,rust-rayon)
        ("rust-rayon-core" ,rust-rayon-core)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-tinytemplate" ,rust-tinytemplate)
        ("rust-walkdir" ,rust-walkdir))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand)
        ("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis
     "Statistics-driven micro-benchmarking library")
    (description
     "Statistics-driven micro-benchmarking library")
    (license #f)))

(define-public rust-html5ever
  (package
    (name "rust-html5ever")
    (version "0.23.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "html5ever" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dx8k7synrmf3fl6gcfm5q1cybfglvhc9xnvly3s5xcc0b45mrjw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log)
        ("rust-mac" ,rust-mac)
        ("rust-markup5ever" ,rust-markup5ever))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-rustc-test" ,rust-rustc-test)
        ("rust-syn" ,rust-syn)
        ("rust-typed-arena" ,rust-typed-arena))))
    (home-page "https://github.com/servo/html5ever")
    (synopsis
     "High-performance browser-grade HTML5 parser")
    (description
     "High-performance browser-grade HTML5 parser")
    (license #f)))

(define-public rust-tendril
  (package
    (name "rust-tendril")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tendril" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fsx7blrrzgca8aa2yqy8zxyi8s7amskhgkk1ml5sbaqyalyszvh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding" ,rust-encoding)
        ("rust-encoding-rs" ,rust-encoding-rs)
        ("rust-futf" ,rust-futf)
        ("rust-mac" ,rust-mac)
        ("rust-utf-8" ,rust-utf-8))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page "https://github.com/servo/tendril")
    (synopsis
     "Compact buffer/string type for zero-copy parsing")
    (description
     "Compact buffer/string type for zero-copy parsing")
    (license #f)))

(define-public rust-encoding
  (package
    (name "rust-encoding")
    (version "0.2.33")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v1ndmkarh9z3n5hk53da4z56hgk9wa5kcsm7cnx345raqw983bb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-index-japanese"
         ,rust-encoding-index-japanese)
        ("rust-encoding-index-korean"
         ,rust-encoding-index-korean)
        ("rust-encoding-index-simpchinese"
         ,rust-encoding-index-simpchinese)
        ("rust-encoding-index-singlebyte"
         ,rust-encoding-index-singlebyte)
        ("rust-encoding-index-tradchinese"
         ,rust-encoding-index-tradchinese))
       #:cargo-development-inputs
       (("rust-getopts" ,rust-getopts))))
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis "Character encoding support for Rust")
    (description
     "Character encoding support for Rust")
    (license #f)))

(define-public rust-idna
  (package
    (name "rust-idna")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "idna" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kl4gs5kaydn4v07c6ka33spm9qdh2np0x7iw7g5zd8z1c7rxw1q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-matches" ,rust-matches)
        ("rust-unicode-bidi" ,rust-unicode-bidi)
        ("rust-unicode-normalization"
         ,rust-unicode-normalization))
       #:cargo-development-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-rustc-test" ,rust-rustc-test))))
    (home-page "https://github.com/servo/rust-url/")
    (synopsis
     "IDNA (Internationalizing Domain Names in Applications) and Punycode.")
    (description
     "IDNA (Internationalizing Domain Names in Applications) and Punycode.")
    (license #f)))

(define-public rust-matches
  (package
    (name "rust-matches")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "matches" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "020axl4q7rk9vz90phs7f8jas4imxal9y9kxl4z4v7a6719mrz3z"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/SimonSapin/rust-std-candidates")
    (synopsis
     "A macro to evaluate, as a boolean, whether an expression matches a pattern.")
    (description
     "This package provides a macro to evaluate, as a boolean, whether an expression matches a pattern.")
    (license #f)))

(define-public rust-percent-encoding
  (package
    (name "rust-percent-encoding")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "percent-encoding" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cgq08v1fvr6bs5fvy390cz830lq4fak8havdasdacxcw790s09i"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/servo/rust-url/")
    (synopsis "Percent encoding and decoding")
    (description "Percent encoding and decoding")
    (license #f)))

(define-public rust-rustc-serialize
  (package
    (name "rust-rustc-serialize")
    (version "0.3.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-serialize" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nkg3vasg7nk80ffkazizgiyv3hb1l9g3d8h17cajbkx538jiwfw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/rust-lang/rustc-serialize")
    (synopsis
     "Generic serialization/deserialization support corresponding to the
`derive(RustcEncodable, RustcDecodable)` mode in the compiler. Also includes
support for hex, base64, and json encoding and decoding.
")
    (description
     "Generic serialization/deserialization support corresponding to the
`derive(RustcEncodable, RustcDecodable)` mode in the compiler.  Also includes
support for hex, base64, and json encoding and decoding.
")
    (license #f)))

(define-public rust-bencher
  (package
    (name "rust-bencher")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bencher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x8p2xblgqssay8cdykp5pkfc0np0jk5bs5cx4f5av097aav9zbx"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/bencher/")
    (synopsis
     "A port of the libtest (unstable Rust) benchmark runner to Rust stable releases. Supports running benchmarks and filtering based on the name. Benchmark execution works exactly the same way and no more (caveat: black_box is still missing!).")
    (description
     "This package provides a port of the libtest (unstable Rust) benchmark runner to Rust stable releases.  Supports running benchmarks and filtering based on the name.  Benchmark execution works exactly the same way and no more (caveat: black_box is still missing!).")
    (license #f)))

(define-public rust-rustc-test
  (package
    (name "rust-rustc-test")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a27mlcg0ck0hgsdvwk792x9z1k1qq1wj091f1l5yggbdbcsnx5w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getopts" ,rust-getopts)
        ("rust-libc" ,rust-libc)
        ("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-term" ,rust-term)
        ("rust-time" ,rust-time))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version))))
    (home-page
     "https://github.com/SimonSapin/rustc-test")
    (synopsis
     "A fork of Rustâ\x80\x99s `test` crate that doesnâ\x80\x99t require unstable language features.")
    (description
     "This package provides a fork of Rustâ\x80\x99s `test` crate that doesnâ\x80\x99t require unstable language features.")
    (license #f)))

(define-public rust-futures
  (package
    (name "rust-futures")
    (version "0.1.28")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0saq8ffjw1pwf1pzhw3kq1z7dfq6wpd8x93dnni6vbkc799kkp25"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/rust-lang-nursery/futures-rs")
    (synopsis
     "An implementation of futures and streams featuring zero allocations,
composability, and iterator-like interfaces.
")
    (description
     "An implementation of futures and streams featuring zero allocations,
composability, and iterator-like interfaces.
")
    (license #f)))

(define-public rust-mio
  (package
    (name "rust-mio")
    (version "0.6.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08zzs227vrnyz5kvws6awzlgzb8zqpnihs71hkqlw07dlfb1kxc3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fuchsia-zircon" ,rust-fuchsia-zircon)
        ("rust-fuchsia-zircon-sys"
         ,rust-fuchsia-zircon-sys)
        ("rust-iovec" ,rust-iovec)
        ("rust-kernel32-sys" ,rust-kernel32-sys)
        ("rust-libc" ,rust-libc)
        ("rust-log" ,rust-log)
        ("rust-miow" ,rust-miow)
        ("rust-net2" ,rust-net2)
        ("rust-slab" ,rust-slab)
        ("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-env-logger" ,rust-env-logger)
        ("rust-tempdir" ,rust-tempdir))))
    (home-page "https://github.com/carllerche/mio")
    (synopsis "Lightweight non-blocking IO")
    (description "Lightweight non-blocking IO")
    (license #f)))

(define-public rust-mio-uds
  (package
    (name "rust-mio-uds")
    (version "0.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio-uds" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09gimdbnj7b9yca99pk8lxh9jhl79msj795c8fxi2sqr9slmfqln"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-iovec" ,rust-iovec)
        ("rust-libc" ,rust-libc)
        ("rust-mio" ,rust-mio))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/alexcrichton/mio-uds")
    (synopsis
     "Unix domain socket bindings for mio
")
    (description
     "Unix domain socket bindings for mio
")
    (license #f)))

(define-public rust-signal-hook-registry
  (package
    (name "rust-signal-hook-registry")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "signal-hook-registry" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mw5v909fn99h5qb96ma4almlik80lr1c7xbakn24rql6bx4zvfd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-arc-swap" ,rust-arc-swap)
        ("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-signal-hook" ,rust-signal-hook)
        ("rust-version-sync" ,rust-version-sync))))
    (home-page
     "https://github.com/vorner/signal-hook")
    (synopsis "Backend crate for signal-hook")
    (description "Backend crate for signal-hook")
    (license #f)))

(define-public rust-tokio-reactor
  (package
    (name "rust-tokio-reactor")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-reactor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1khip64cn63xvayq1db68kxcnhgw3cb449a4n2lbw4p1qzx6pwba"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-futures" ,rust-futures)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-mio" ,rust-mio)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-parking-lot" ,rust-parking-lot)
        ("rust-slab" ,rust-slab)
        ("rust-tokio-executor" ,rust-tokio-executor)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-sync" ,rust-tokio-sync))
       #:cargo-development-inputs
       (("rust-num-cpus" ,rust-num-cpus)
        ("rust-tokio" ,rust-tokio)
        ("rust-tokio-io-pool" ,rust-tokio-io-pool))))
    (home-page "https://tokio.rs")
    (synopsis
     "Event loop that drives Tokio I/O resources.
")
    (description
     "Event loop that drives Tokio I/O resources.
")
    (license #f)))

(define-public rust-stdweb
  (package
    (name "rust-stdweb")
    (version "0.4.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "094giad1v81rxxs4izf88ijc9c6w3c7cr5a7cwwr86mc22xn4hy3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-discard" ,rust-discard)
        ("rust-futures-channel-preview"
         ,rust-futures-channel-preview)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview)
        ("rust-futures-executor-preview"
         ,rust-futures-executor-preview)
        ("rust-futures-util-preview"
         ,rust-futures-util-preview)
        ("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-stdweb-derive" ,rust-stdweb-derive)
        ("rust-stdweb-internal-macros"
         ,rust-stdweb-internal-macros)
        ("rust-stdweb-internal-runtime"
         ,rust-stdweb-internal-runtime)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-stdweb-internal-test-macro"
         ,rust-stdweb-internal-test-macro)
        ("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis
     "A standard library for the client-side Web")
    (description
     "This package provides a standard library for the client-side Web")
    (license #f)))

(define-public rust-wasm-bindgen
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.47")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xsqz39v8nnlmiflybjpy7hvjdhmdb01j3zi0p5p6135rjc9j0i2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-wasm-bindgen-macro"
         ,rust-wasm-bindgen-macro))))
    (home-page "https://rustwasm.github.io/")
    (synopsis
     "Easy support for interacting between JS and Rust.
")
    (description
     "Easy support for interacting between JS and Rust.
")
    (license #f)))

(define-public rust-tokio
  (package
    (name "rust-tokio")
    (version "0.1.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11ra8jp3fj70a2zrqmd6as7wgpwiiyzjf50gz89i8r7wpksgqbzc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-futures" ,rust-futures)
        ("rust-mio" ,rust-mio)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-tokio-codec" ,rust-tokio-codec)
        ("rust-tokio-current-thread"
         ,rust-tokio-current-thread)
        ("rust-tokio-executor" ,rust-tokio-executor)
        ("rust-tokio-fs" ,rust-tokio-fs)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-reactor" ,rust-tokio-reactor)
        ("rust-tokio-sync" ,rust-tokio-sync)
        ("rust-tokio-tcp" ,rust-tokio-tcp)
        ("rust-tokio-threadpool" ,rust-tokio-threadpool)
        ("rust-tokio-timer" ,rust-tokio-timer)
        ("rust-tokio-trace-core" ,rust-tokio-trace-core)
        ("rust-tokio-udp" ,rust-tokio-udp)
        ("rust-tokio-uds" ,rust-tokio-uds))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger)
        ("rust-flate2" ,rust-flate2)
        ("rust-futures-cpupool" ,rust-futures-cpupool)
        ("rust-http" ,rust-http)
        ("rust-httparse" ,rust-httparse)
        ("rust-libc" ,rust-libc)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-time" ,rust-time))))
    (home-page "https://tokio.rs")
    (synopsis
     "An event-driven, non-blocking I/O platform for writing asynchronous I/O
backed applications.
")
    (description
     "An event-driven, non-blocking I/O platform for writing asynchronous I/O
backed applications.
")
    (license #f)))

(define-public rust-core-arch
  (package
    (name "rust-core-arch")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core_arch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04vdvr9vj0f1cv2p54nsszmrrk9w1js4c0z4i0bdlajl1lydslim"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test))))
    (home-page
     "https://github.com/rust-lang-nursery/stdsimd")
    (synopsis
     "`core::arch` - Rust's core library architecture-specific intrinsics.")
    (description
     "`core::arch` - Rust's core library architecture-specific intrinsics.")
    (license #f)))

(define-public rust-sleef-sys
  (package
    (name "rust-sleef-sys")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sleef-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1881q2yc17j2m1yvh01447c93ws1mspnrj3k2nbvwbvcm8z81kkv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-bindgen" ,rust-bindgen)
        ("rust-cmake" ,rust-cmake)
        ("rust-env-logger" ,rust-env-logger))))
    (home-page "https://github.com/gnzlbg/sleef-sys")
    (synopsis
     "Rust FFI bindings to the SLEEF Vectorized Math Library
")
    (description
     "Rust FFI bindings to the SLEEF Vectorized Math Library
")
    (license #f)))

(define-public rust-arrayvec
  (package
    (name "rust-arrayvec")
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrayvec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wcch3ca9qvkixgdbd2afrv1xa27l83vpraf7frsh9l8pivgpiwj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nodrop" ,rust-nodrop)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher)
        ("rust-matches" ,rust-matches)
        ("rust-serde-test" ,rust-serde-test))))
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis
     "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.")
    (description
     "This package provides a vector with fixed capacity, backed by an array (it can be stored on the stack too).  Implements fixed capacity ArrayVec and ArrayString.")
    (license #f)))

(define-public rust-paste
  (package
    (name "rust-paste")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "paste" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ygs077hlq8qlx5y46sfgrmhlqqgkmvvhn4x3y10arawalf4ljhz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-paste-impl" ,rust-paste-impl)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack))))
    (home-page "https://github.com/dtolnay/paste")
    (synopsis
     "Macros for all your token pasting needs")
    (description
     "Macros for all your token pasting needs")
    (license #f)))

(define-public rust-wasm-bindgen-test
  (package
    (name "rust-wasm-bindgen-test")
    (version "0.2.47")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1w699jyhi3njdccbqsfdz5dq68fqwsm38xlw2dm2hgd3hvvfzk3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-console-error-panic-hook"
         ,rust-console-error-panic-hook)
        ("rust-futures" ,rust-futures)
        ("rust-js-sys" ,rust-js-sys)
        ("rust-scoped-tls" ,rust-scoped-tls)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen)
        ("rust-wasm-bindgen-futures"
         ,rust-wasm-bindgen-futures)
        ("rust-wasm-bindgen-test-macro"
         ,rust-wasm-bindgen-test-macro))))
    (home-page
     "https://github.com/rustwasm/wasm-bindgen")
    (synopsis
     "Internal testing crate for wasm-bindgen")
    (description
     "Internal testing crate for wasm-bindgen")
    (license #f)))

(define-public rust-keystream
  (package
    (name "rust-keystream")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "keystream" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a4b2g4i1bxkh8ngbpcnplwbsliif8zw9q3d6mk25q4y7j1p0c63"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/PeterReid/keystream")
    (synopsis "Cryptographic keystream traits")
    (description "Cryptographic keystream traits")
    (license #f)))

(define-public rust-autocfg
  (package
    (name "rust-autocfg")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "autocfg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gvpf03pdl08k29j9hjv7r7cs5zn39ib97f7wwvzv9992fjyyj8f"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/cuviper/autocfg")
    (synopsis
     "Automatic cfg for Rust compiler features")
    (description
     "Automatic cfg for Rust compiler features")
    (license #f)))

(define-public rust-quick-error
  (package
    (name "rust-quick-error")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quick-error" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1w6kgwwv7p7zr0yyg5rb315lkk24bimywklwx7fsvsbwi10bjx4j"))))
    (build-system cargo-build-system)
    (home-page
     "http://github.com/tailhook/quick-error")
    (synopsis
     "    A macro which makes error types pleasant to write.
")
    (description
     "    A macro which makes error types pleasant to write.
")
    (license #f)))

(define-public rust-chrono
  (package
    (name "rust-chrono")
    (version "0.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chrono" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1glam3iqhshbamzgf0npn7hgghski92r31lm7gg8841hnxc1zn3p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-num-integer" ,rust-num-integer)
        ("rust-num-traits" ,rust-num-traits)
        ("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-serde" ,rust-serde)
        ("rust-time" ,rust-time))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode)
        ("rust-doc-comment" ,rust-doc-comment)
        ("rust-num-iter" ,rust-num-iter)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page
     "https://github.com/chronotope/chrono")
    (synopsis "Date and time library for Rust")
    (description "Date and time library for Rust")
    (license #f)))

(define-public rust-time
  (package
    (name "rust-time")
    (version "0.1.42")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "time" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vsbvsz0ryxb35dy9j4anxvy8zlaplmjmi0a4z4l64bc135cz3fv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-redox-syscall" ,rust-redox-syscall)
        ("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-log" ,rust-log)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/rust-lang/time")
    (synopsis
     "Utilities for working with time-related functions in Rust.
")
    (description
     "Utilities for working with time-related functions in Rust.
")
    (license #f)))

(define-public rust-dirs-sys
  (package
    (name "rust-dirs-sys")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dirs-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b8ynb5g8hjf6qndfy8l2ai0klb7k3bcjfnwv4niyzf75qwmcxwk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-libc" ,rust-libc)
        ("rust-redox-users" ,rust-redox-users)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/soc/dirs-sys-rs")
    (synopsis
     "System-level helper functions for the dirs and directories crates.")
    (description
     "System-level helper functions for the dirs and directories crates.")
    (license #f)))

(define-public rust-num-traits
  (package
    (name "rust-num-traits")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-traits" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0clvrm34rrqc8p6gq5ps5fcgws3kgq5knh7nlqxf2ayarwks9abb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg))))
    (home-page
     "https://github.com/rust-num/num-traits")
    (synopsis
     "Numeric traits for generic mathematics")
    (description
     "Numeric traits for generic mathematics")
    (license #f)))

(define-public rust-fst
  (package
    (name "rust-fst")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fst" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pwb4gqpdwa1h4cjp1nkv6blhm4ccr2aym6xpg6ndxfzlxn14wnv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-memmap" ,rust-memmap))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv)
        ("rust-fst-levenshtein" ,rust-fst-levenshtein)
        ("rust-fst-regex" ,rust-fst-regex)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
     "Use finite state transducers to compactly represents sets or maps of many
strings (> 1 billion is possible).
")
    (description
     "Use finite state transducers to compactly represents sets or maps of many
strings (> 1 billion is possible).
")
    (license #f)))

(define-public rust-cast
  (package
    (name "rust-cast")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09yl2700crxa4n860b080msij25klvs1kfzazhp2aihchvr16q4j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck))))
    (home-page "https://github.com/japaric/cast.rs")
    (synopsis
     "Ergonomic, checked cast functions for primitive types")
    (description
     "Ergonomic, checked cast functions for primitive types")
    (license #f)))

(define-public rust-criterion-plot
  (package
    (name "rust-criterion-plot")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "criterion-plot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13pv09z4ryp70qyzablkibwa2mh6c2852qq1sjr9wjigvwnj3ybn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-cast" ,rust-cast)
        ("rust-itertools" ,rust-itertools))
       #:cargo-development-inputs
       (("rust-itertools-num" ,rust-itertools-num)
        ("rust-num-complex" ,rust-num-complex)
        ("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/bheisler/criterion.rs")
    (synopsis "Criterion's plotting library")
    (description "Criterion's plotting library")
    (license #f)))

(define-public rust-csv
  (package
    (name "rust-csv")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csv" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qxvzq030hi915dszazv6a7f0apzzi7gn193ni0g2lzkawjxck55"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bstr" ,rust-bstr)
        ("rust-csv-core" ,rust-csv-core)
        ("rust-itoa" ,rust-itoa)
        ("rust-ryu" ,rust-ryu)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde" ,rust-serde))))
    (home-page
     "https://github.com/BurntSushi/rust-csv")
    (synopsis
     "Fast CSV parsing with support for serde.")
    (description
     "Fast CSV parsing with support for serde.")
    (license #f)))

(define-public rust-rand-os
  (package
    (name "rust-rand-os")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_os" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06is69f8rfzs620g5b54k6cgy5yaycrsyqg55flyfrsf8g88733f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getrandom" ,rust-getrandom)
        ("rust-rand-core" ,rust-rand-core))))
    (home-page "https://crates.io/crates/rand_os")
    (synopsis "OS backed Random Number Generator")
    (description "OS backed Random Number Generator")
    (license #f)))

(define-public rust-rand-os-0.1.3
  (package
    (inherit rust-rand-os)
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_os" version))
       (file-name
        (string-append (package-name rust-rand-os) "-" version ".tar.gz"))
       (sha256
        (base32
         "0wahppm0s64gkr2vmhcgwc0lij37in1lgfxg5rbgqlz0l5vgcxbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cloudabi" ,rust-cloudabi)
        ("rust-fuchsia-cprng" ,rust-fuchsia-cprng)
        ("rust-libc" ,rust-libc)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-rdrand" ,rust-rdrand-0.4)
        ("rust-winapi" ,rust-winapi)
        ("rust-log" ,rust-log)
        ("rust-stdweb" ,rust-stdweb)
        ("rust-wasm" ,rust-wasm))))))

(define-public rust-rayon
  (package
    (name "rust-rayon")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "190hkbcdfvcphyyzkdg52zdia2y9d9yanpm072bmnzbn49p1ic54"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque)
        ("rust-either" ,rust-either)
        ("rust-rayon-core" ,rust-rayon-core))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment)
        ("rust-docopt" ,rust-docopt)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-rand" ,rust-rand)
        ("rust-rand-xorshift" ,rust-rand-xorshift)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page "https://github.com/rayon-rs/rayon")
    (synopsis
     "Simple work-stealing parallelism for Rust")
    (description
     "Simple work-stealing parallelism for Rust")
    (license #f)))

(define-public rust-rayon-core
  (package
    (name "rust-rayon-core")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rayon-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ljva6blaf1wmzvg77h1i9pd0hsmsbbcmdk7sjbw7h2s8gw0vgpb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-num-cpus" ,rust-num-cpus))
       #:cargo-development-inputs
       (("rust-libc" ,rust-libc)
        ("rust-rand" ,rust-rand)
        ("rust-rand-xorshift" ,rust-rand-xorshift)
        ("rust-scoped-tls" ,rust-scoped-tls))))
    (home-page "https://github.com/rayon-rs/rayon")
    (synopsis "Core APIs for Rayon")
    (description "Core APIs for Rayon")
    (license #f)))

(define-public rust-tinytemplate
  (package
    (name "rust-tinytemplate")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tinytemplate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "084w41m75i95sdid1wwlnav80jsl1ggyryl4nawxvb6amigvfx25"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page
     "https://github.com/bheisler/TinyTemplate")
    (synopsis "Simple, lightweight template engine")
    (description
     "Simple, lightweight template engine")
    (license #f)))

(define-public rust-approx
  (package
    (name "rust-approx")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "approx" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hx580xjdxl3766js9b49rnbnmr8gw8c060809l43k9f0xshprph"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-complex" ,rust-num-complex)
        ("rust-num-traits" ,rust-num-traits))))
    (home-page
     "https://github.com/brendanzab/approx")
    (synopsis
     "Approximate floating point equality comparisons and assertions.")
    (description
     "Approximate floating point equality comparisons and assertions.")
    (license #f)))

(define-public rust-mac
  (package
    (name "rust-mac")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "194vc7vrshqff72rl56f9xgb0cazyl4jda7qsv31m5l6xx7hq7n4"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/reem/rust-mac.git")
    (synopsis
     "A collection of great and ubiqutitous macros.")
    (description
     "This package provides a collection of great and ubiqutitous macros.")
    (license #f)))

(define-public rust-markup5ever
  (package
    (name "rust-markup5ever")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "markup5ever" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08ayl9aqjnmf7ly1ipy6dk3wjvyfn4w51l40jzh1fh984ykldbzi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log)
        ("rust-phf" ,rust-phf)
        ("rust-string-cache" ,rust-string-cache)
        ("rust-tendril" ,rust-tendril))
       #:cargo-development-inputs
       (("rust-phf-codegen" ,rust-phf-codegen)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-string-cache-codegen"
         ,rust-string-cache-codegen))))
    (home-page "https://github.com/servo/html5ever")
    (synopsis
     "Common code for xml5ever and html5ever")
    (description
     "Common code for xml5ever and html5ever")
    (license #f)))

(define-public rust-typed-arena
  (package
    (name "rust-typed-arena")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typed-arena" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i8yczhwcy0nnrxqck1lql3i7hvg95l0vw0dbgfb92zkms96mh66"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/SimonSapin/rust-typed-arena")
    (synopsis
     "The arena, a fast but limited type of allocator")
    (description
     "The arena, a fast but limited type of allocator")
    (license #f)))

(define-public rust-futf
  (package
    (name "rust-futf")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futf" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fxc18bnabird5jl941nsd6d25vq8cn8barmz4d30dlkzbiir73w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-mac" ,rust-mac)
        ("rust-new-debug-unreachable"
         ,rust-new-debug-unreachable))))
    (home-page "https://github.com/servo/futf")
    (synopsis "Handling fragments of UTF-8")
    (description "Handling fragments of UTF-8")
    (license #f)))

(define-public rust-utf-8
  (package
    (name "rust-utf-8")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf-8" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1iw5rp4i3mfi9k51picbr5bgjqhjcmnxx7001clh5ydq31y2zr05"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/SimonSapin/rust-utf8")
    (synopsis
     "Incremental, zero-copy UTF-8 decoding with error handling")
    (description
     "Incremental, zero-copy UTF-8 decoding with error handling")
    (license #f)))

(define-public rust-encoding-index-japanese
  (package
    (name "rust-encoding-index-japanese")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-japanese" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "148c1lmd640p1d7fzk0nv7892mbyavvwddgqvcsm78798bzv5s04"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-index-tests"
         ,rust-encoding-index-tests))))
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis
     "Index tables for Japanese character encodings")
    (description
     "Index tables for Japanese character encodings")
    (license #f)))

(define-public rust-encoding-index-korean
  (package
    (name "rust-encoding-index-korean")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-korean" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10cxabp5ppygbq4y6y680856zl9zjvq7ahpiw8zj3fmwwsw3zhsd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-index-tests"
         ,rust-encoding-index-tests))))
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis
     "Index tables for Korean character encodings")
    (description
     "Index tables for Korean character encodings")
    (license #f)))

(define-public rust-encoding-index-simpchinese
  (package
    (name "rust-encoding-index-simpchinese")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-simpchinese" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xria2i7mc5dqdrpqxasdbxv1qx46jjbm53if3y1i4cvj2a72ynq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-index-tests"
         ,rust-encoding-index-tests))))
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis
     "Index tables for simplified Chinese character encodings")
    (description
     "Index tables for simplified Chinese character encodings")
    (license #f)))

(define-public rust-encoding-index-singlebyte
  (package
    (name "rust-encoding-index-singlebyte")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-singlebyte" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jp85bz2pprzvg9m95w4q0vibh67b6w3bx35lafay95jzyndal9k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-index-tests"
         ,rust-encoding-index-tests))))
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis
     "Index tables for various single-byte character encodings")
    (description
     "Index tables for various single-byte character encodings")
    (license #f)))

(define-public rust-encoding-index-tradchinese
  (package
    (name "rust-encoding-index-tradchinese")
    (version "1.20141219.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding-index-tradchinese" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "060ci4iz6xfvzk38syfbjvs7pix5hch3mvxkksswmqwcd3aj03px"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding-index-tests"
         ,rust-encoding-index-tests))))
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis
     "Index tables for traditional Chinese character encodings")
    (description
     "Index tables for traditional Chinese character encodings")
    (license #f)))

(define-public rust-unicode-bidi
  (package
    (name "rust-unicode-bidi")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-bidi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1malx8ljgm7v1gbaazkn7iicy5wj0bwcyadj3l727a38ch6bvwj9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-flame" ,rust-flame)
        ("rust-flamer" ,rust-flamer)
        ("rust-matches" ,rust-matches)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test))))
    (home-page
     "https://github.com/servo/unicode-bidi")
    (synopsis
     "Implementation of the Unicode Bidirectional Algorithm")
    (description
     "Implementation of the Unicode Bidirectional Algorithm")
    (license #f)))

(define-public rust-redox-users
  (package
    (name "rust-redox-users")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redox_users" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a1q5jv76vj1mwmqf2mmhknmkpw5wndx91gjfgg7vs8p79621r9z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-argon2rs" ,rust-argon2rs)
        ("rust-failure" ,rust-failure)
        ("rust-rand-os" ,rust-rand-os)
        ("rust-redox-syscall" ,rust-redox-syscall))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/users")
    (synopsis
     "A Rust library to access Redox users and groups functionality")
    (description
     "This package provides a Rust library to access Redox users and groups functionality")
    (license #f)))

(define-public rust-fuchsia-zircon
  (package
    (name "rust-fuchsia-zircon")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fuchsia-zircon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10jxc5ks1x06gpd0xg51kcjrxr35nj6qhx2zlc5n7bmskv3675rf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags)
        ("rust-fuchsia-zircon-sys"
         ,rust-fuchsia-zircon-sys))))
    (home-page
     "https://fuchsia.googlesource.com/garnet/")
    (synopsis "Rust bindings for the Zircon kernel")
    (description
     "Rust bindings for the Zircon kernel")
    (license #f)))

(define-public rust-fuchsia-zircon-sys
  (package
    (name "rust-fuchsia-zircon-sys")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fuchsia-zircon-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19zp2085qsyq2bh1gvcxq1lb8w6v6jj9kbdkhpdjrl95fypakjix"))))
    (build-system cargo-build-system)
    (home-page
     "https://fuchsia.googlesource.com/garnet/")
    (synopsis
     "Low-level Rust bindings for the Zircon kernel")
    (description
     "Low-level Rust bindings for the Zircon kernel")
    (license #f)))

(define-public rust-iovec
  (package
    (name "rust-iovec")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "iovec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "025vi072m22299z3fg73qid188z2iip7k41ba6v5v5yhwwby9rnv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/carllerche/iovec")
    (synopsis
     "Portable buffer type for scatter/gather I/O operations
")
    (description
     "Portable buffer type for scatter/gather I/O operations
")
    (license #f)))

(define-public rust-miow
  (package
    (name "rust-miow")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miow" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09ljvx6wg30f2xlv7b7hhpkw7k312n3hjgmrbhwzhz9x03ra0sir"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-socket2" ,rust-socket2)
        ("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/alexcrichton/miow")
    (synopsis
     "A zero overhead I/O library for Windows, focusing on IOCP and Async I/O
abstractions.
")
    (description
     "This package provides a zero overhead I/O library for Windows, focusing on IOCP and Async I/O
abstractions.
")
    (license #f)))

(define-public rust-net2
  (package
    (name "rust-net2")
    (version "0.2.33")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "net2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "126g3fgfxp06zimc1l9iyxnn9cif1hjsg7sd81nlls5nnyghsma2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-libc" ,rust-libc)
        ("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/rust-lang-nursery/net2-rs")
    (synopsis
     "Extensions to the standard library's networking types as proposed in RFC 1158.
")
    (description
     "Extensions to the standard library's networking types as proposed in RFC 1158.
")
    (license #f)))

(define-public rust-slab
  (package
    (name "rust-slab")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slab" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1y59xsa27jk84sxzswjk60xcjf8b4fm5960jwpznrrcmasyva4f1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/carllerche/slab")
    (synopsis
     "Pre-allocated storage for a uniform data type")
    (description
     "Pre-allocated storage for a uniform data type")
    (license #f)))

(define-public rust-arc-swap
  (package
    (name "rust-arc-swap")
    (version "0.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arc-swap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ha8724dpki985v52ifq5sd98xvpa5q51hyma52di75dbqbn4imw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-crossbeam" ,rust-crossbeam)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-itertools" ,rust-itertools)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-model" ,rust-model)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-parking-lot" ,rust-parking-lot)
        ("rust-proptest" ,rust-proptest)
        ("rust-version-sync" ,rust-version-sync))))
    (home-page "https://github.com/vorner/arc-swap")
    (synopsis "Atomically swappable Arc")
    (description "Atomically swappable Arc")
    (license #f)))

(define-public rust-parking-lot
  (package
    (name "rust-parking-lot")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rrcdalr8l5zx3bw28l376321l6dnd6rqnsqsl0ygk01fy0nfxzs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lock-api" ,rust-lock-api)
        ("rust-parking-lot-core" ,rust-parking-lot-core))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-rand" ,rust-rand)
        ("rust-rustc-version" ,rust-rustc-version))))
    (home-page
     "https://github.com/Amanieu/parking_lot")
    (synopsis
     "More compact and efficient implementations of the standard synchronization primitives.")
    (description
     "More compact and efficient implementations of the standard synchronization primitives.")
    (license #f)))

(define-public rust-tokio-executor
  (package
    (name "rust-tokio-executor")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-executor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pjmgpg58k3hf5q9w6xjljsv8xy66lf734qnfwsc0g3pq3349sl3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-futures" ,rust-futures))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis "Future execution primitives
")
    (description "Future execution primitives
")
    (license #f)))

(define-public rust-tokio-io
  (package
    (name "rust-tokio-io")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09jrz1hh4h1vj45qy09y7m7m8jsy1hl6g32clnky25mdim3dp42h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-futures" ,rust-futures)
        ("rust-log" ,rust-log))
       #:cargo-development-inputs
       (("rust-tokio-current-thread"
         ,rust-tokio-current-thread))))
    (home-page "https://tokio.rs")
    (synopsis
     "Core I/O primitives for asynchronous I/O in Rust.
")
    (description
     "Core I/O primitives for asynchronous I/O in Rust.
")
    (license #f)))

(define-public rust-tokio-sync
  (package
    (name "rust-tokio-sync")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-sync" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ryalh7dcmnz46xj1va8aaw3if6vd4mj87r67dqvrqhpyf7j8qi1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fnv" ,rust-fnv)
        ("rust-futures" ,rust-futures))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger)
        ("rust-loom" ,rust-loom)
        ("rust-tokio" ,rust-tokio)
        ("rust-tokio-mock-task" ,rust-tokio-mock-task))))
    (home-page "https://tokio.rs")
    (synopsis "Synchronization utilities.
")
    (description "Synchronization utilities.
")
    (license #f)))

(define-public rust-tokio-io-pool
  (package
    (name "rust-tokio-io-pool")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-io-pool" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17lrjj7lcw13wchpbvr8cynmypd29h40clf9qxabh6fxva40kwm5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-tokio" ,rust-tokio)
        ("rust-tokio-executor" ,rust-tokio-executor))
       #:cargo-development-inputs
       (("rust-tokio-current-thread"
         ,rust-tokio-current-thread))))
    (home-page
     "https://github.com/jonhoo/tokio-io-pool")
    (synopsis
     "Alternative tokio thread pool for executing short, I/O-heavy futures efficiently")
    (description
     "Alternative tokio thread pool for executing short, I/O-heavy futures efficiently")
    (license #f)))

(define-public rust-discard
  (package
    (name "rust-discard")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "discard" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h67ni5bxvg95s91wgicily4ix7lcw7cq0a5gy9njrybaibhyb91"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/Pauan/rust-discard")
    (synopsis
     "Discard trait which allows for intentionally leaking memory")
    (description
     "Discard trait which allows for intentionally leaking memory")
    (license #f)))

(define-public rust-futures-channel-preview
  (package
    (name "rust-futures-channel-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-channel-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yph1k6xbh67rpy9nh3ybddfxsrdhfi6b4b62jvyjwn25xqj7mac"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-core-preview"
         ,rust-futures-core-preview))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "Channels for asynchronous communication using futures-rs.
")
    (description
     "Channels for asynchronous communication using futures-rs.
")
    (license #f)))

(define-public rust-futures-executor-preview
  (package
    (name "rust-futures-executor-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-executor-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00yy60rkbymj9wwwvkw26d1k6n8qrn39nckaaxcx0dc5j26cap9i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-channel-preview"
         ,rust-futures-channel-preview)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview)
        ("rust-futures-util-preview"
         ,rust-futures-util-preview)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-pin-utils" ,rust-pin-utils))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "Executors for asynchronous tasks based on the futures-rs library.
")
    (description
     "Executors for asynchronous tasks based on the futures-rs library.
")
    (license #f)))

(define-public rust-futures-util-preview
  (package
    (name "rust-futures-util-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-util-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cildqfd9ys5rmvvj11wx48ma5lk0zymyhlkmfww4ishkhdlb87p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-futures-channel-preview"
         ,rust-futures-channel-preview)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview)
        ("rust-futures-io-preview"
         ,rust-futures-io-preview)
        ("rust-futures-select-macro-preview"
         ,rust-futures-select-macro-preview)
        ("rust-futures-sink-preview"
         ,rust-futures-sink-preview)
        ("rust-memchr" ,rust-memchr)
        ("rust-pin-utils" ,rust-pin-utils)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack)
        ("rust-proc-macro-nested"
         ,rust-proc-macro-nested)
        ("rust-rand" ,rust-rand)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-slab" ,rust-slab)
        ("rust-tokio-io" ,rust-tokio-io))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "Common utilities and extension traits for the futures-rs library.
")
    (description
     "Common utilities and extension traits for the futures-rs library.
")
    (license #f)))

(define-public rust-stdweb-derive
  (package
    (name "rust-stdweb-derive")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c1rxx6rqcc4iic5hx320ki3vshpi8k58m5600iqzq4x2zcyn88f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-syn" ,rust-syn))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "Derive macros for the `stdweb` crate")
    (description
     "Derive macros for the `stdweb` crate")
    (license #f)))

(define-public rust-stdweb-internal-macros
  (package
    (name "rust-stdweb-internal-macros")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb-internal-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yjrmkc6sb1035avic383pa3avk2s9k3n17yjcza8yb9nw47v3z6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base-x" ,rust-base-x)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-sha1" ,rust-sha1)
        ("rust-syn" ,rust-syn))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis
     "Internal procedural macros for the `stdweb` crate")
    (description
     "Internal procedural macros for the `stdweb` crate")
    (license #f)))

(define-public rust-stdweb-internal-runtime
  (package
    (name "rust-stdweb-internal-runtime")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb-internal-runtime" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nhpyra7glbwcpakhpj5a3d7h7kx1ynif473nzshmk226m91f8ym"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/koute/stdweb")
    (synopsis
     "Internal runtime for the `stdweb` crate")
    (description
     "Internal runtime for the `stdweb` crate")
    (license #f)))

(define-public rust-rustc-version
  (package
    (name "rust-rustc-version")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc_version" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02h3x57lcr8l2pm0a645s9whdh33pn5cnrwvn5cb57vcrc53x3hk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-semver" ,rust-semver))))
    (home-page
     "https://github.com/Kimundi/rustc-version-rs")
    (synopsis
     "A library for querying the version of a installed rustc compiler")
    (description
     "This package provides a library for querying the version of a installed rustc compiler")
    (license #f)))

(define-public rust-stdweb-internal-test-macro
  (package
    (name "rust-stdweb-internal-test-macro")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stdweb-internal-test-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12rrm7p77xnm3xacgn3rgniiyyjb4gq7902wpbljsvbx045z69l2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "Internal crate of the `stdweb` crate")
    (description
     "Internal crate of the `stdweb` crate")
    (license #f)))

(define-public rust-tokio-codec
  (package
    (name "rust-tokio-codec")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-codec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17y3hi3dd0bdfkrzshx9qhwcf49xv9iynszj7iwy3w4nmz71wl2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-futures" ,rust-futures)
        ("rust-tokio-io" ,rust-tokio-io))))
    (home-page "https://tokio.rs")
    (synopsis
     "Utilities for encoding and decoding frames.
")
    (description
     "Utilities for encoding and decoding frames.
")
    (license #f)))

(define-public rust-tokio-current-thread
  (package
    (name "rust-tokio-current-thread")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-current-thread" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hx4c8v88kk0ih8x5s564gsgwwf8n11kryvxm72l1f7isz51fqni"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-tokio-executor" ,rust-tokio-executor))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "Single threaded executor which manage many tasks concurrently on the current thread.
")
    (description
     "Single threaded executor which manage many tasks concurrently on the current thread.
")
    (license #f)))

(define-public rust-tokio-fs
  (package
    (name "rust-tokio-fs")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-fs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bxp8585pi4j5g39ci2gkk99qnyilyhhila7cs8r6scdn0idrriz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-threadpool" ,rust-tokio-threadpool))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand)
        ("rust-tempdir" ,rust-tempdir)
        ("rust-tempfile" ,rust-tempfile)
        ("rust-tokio" ,rust-tokio)
        ("rust-tokio-codec" ,rust-tokio-codec)
        ("rust-tokio-io" ,rust-tokio-io))))
    (home-page "https://tokio.rs")
    (synopsis "Filesystem API for Tokio.
")
    (description "Filesystem API for Tokio.
")
    (license #f)))

(define-public rust-tokio-reactor
  (package
    (name "rust-tokio-reactor")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-reactor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1khip64cn63xvayq1db68kxcnhgw3cb449a4n2lbw4p1qzx6pwba"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-futures" ,rust-futures)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-mio" ,rust-mio)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-parking-lot" ,rust-parking-lot)
        ("rust-slab" ,rust-slab)
        ("rust-tokio-executor" ,rust-tokio-executor)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-sync" ,rust-tokio-sync))
       #:cargo-development-inputs
       (("rust-num-cpus" ,rust-num-cpus)
        ("rust-tokio" ,rust-tokio)
        ("rust-tokio-io-pool" ,rust-tokio-io-pool))))
    (home-page "https://tokio.rs")
    (synopsis
     "Event loop that drives Tokio I/O resources.
")
    (description
     "Event loop that drives Tokio I/O resources.
")
    (license #f)))

(define-public rust-tokio-tcp
  (package
    (name "rust-tokio-tcp")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tcp" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06a15vg8bcd33ng3h9ldzlq7wl4jsw0p9qpy7v22ls5yah3b250x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-futures" ,rust-futures)
        ("rust-iovec" ,rust-iovec)
        ("rust-mio" ,rust-mio)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-reactor" ,rust-tokio-reactor))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger)
        ("rust-tokio" ,rust-tokio))))
    (home-page "https://tokio.rs")
    (synopsis "TCP bindings for tokio.
")
    (description "TCP bindings for tokio.
")
    (license #f)))

(define-public rust-tokio-threadpool
  (package
    (name "rust-tokio-threadpool")
    (version "0.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-threadpool" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wkj3wixicsqvllm8w74b24knw6mdn00zslm8l9fm1p81gr8lmbj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-futures" ,rust-futures)
        ("rust-log" ,rust-log)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-rand" ,rust-rand)
        ("rust-slab" ,rust-slab)
        ("rust-tokio-executor" ,rust-tokio-executor))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger)
        ("rust-futures-cpupool" ,rust-futures-cpupool)
        ("rust-threadpool" ,rust-threadpool))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "A task scheduler backed by a work-stealing thread pool.
")
    (description
     "This package provides a task scheduler backed by a work-stealing thread pool.
")
    (license #f)))

(define-public rust-tokio-timer
  (package
    (name "rust-tokio-timer")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-timer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03m68ainkdy3b5pf20rjyknhk2ppx35bjdc2yfj2bv80sl96h47j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-futures" ,rust-futures)
        ("rust-slab" ,rust-slab)
        ("rust-tokio-executor" ,rust-tokio-executor))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand)
        ("rust-tokio" ,rust-tokio)
        ("rust-tokio-mock-task" ,rust-tokio-mock-task))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis "Timer facilities for Tokio
")
    (description "Timer facilities for Tokio
")
    (license #f)))

(define-public rust-tokio-trace-core
  (package
    (name "rust-tokio-trace-core")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-trace-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04y6c2r4ddzk02xb3hn60s9a1w92h0g8pzmxwaspqvwmsrba5j59"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static))))
    (home-page "https://tokio.rs")
    (synopsis "Core primitives for tokio-trace.
")
    (description
     "Core primitives for tokio-trace.
")
    (license #f)))

(define-public rust-tokio-udp
  (package
    (name "rust-tokio-udp")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-udp" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14kfj35s465czcspayacnzlxrazfvxzhhggq1rqlljhgp1sqa9k6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-futures" ,rust-futures)
        ("rust-log" ,rust-log)
        ("rust-mio" ,rust-mio)
        ("rust-tokio-codec" ,rust-tokio-codec)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-reactor" ,rust-tokio-reactor))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger))))
    (home-page "https://tokio.rs")
    (synopsis "UDP bindings for tokio.
")
    (description "UDP bindings for tokio.
")
    (license #f)))

(define-public rust-tokio-uds
  (package
    (name "rust-tokio-uds")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-uds" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0i94kxma6l7iy5hd5k7nvn7v9pnyw0s54bm9mjs0lap1l0xzqzq3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-futures" ,rust-futures)
        ("rust-iovec" ,rust-iovec)
        ("rust-libc" ,rust-libc)
        ("rust-log" ,rust-log)
        ("rust-mio" ,rust-mio)
        ("rust-mio-uds" ,rust-mio-uds)
        ("rust-tokio-codec" ,rust-tokio-codec)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-reactor" ,rust-tokio-reactor))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile)
        ("rust-tokio" ,rust-tokio))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis "Unix Domain sockets for Tokio
")
    (description "Unix Domain sockets for Tokio
")
    (license #f)))

(define-public rust-flate2
  (package
    (name "rust-flate2")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flate2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n639gc7sbmrkir6pif608xqpwcv60kigmp5cn9x7m8892nk82am"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crc32fast" ,rust-crc32fast)
        ("rust-futures" ,rust-futures)
        ("rust-libc" ,rust-libc)
        ("rust-libz-sys" ,rust-libz-sys)
        ("rust-miniz-sys" ,rust-miniz-sys)
        ("rust-miniz-oxide-c-api"
         ,rust-miniz-oxide-c-api)
        ("rust-miniz-oxide-c-api"
         ,rust-miniz-oxide-c-api)
        ("rust-tokio-io" ,rust-tokio-io))
       #:cargo-development-inputs
       (("rust-futures" ,rust-futures)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-tcp" ,rust-tokio-tcp)
        ("rust-tokio-threadpool" ,rust-tokio-threadpool))))
    (home-page
     "https://github.com/alexcrichton/flate2-rs")
    (synopsis
     "Bindings to miniz.c for DEFLATE compression and decompression exposed as
Reader/Writer streams. Contains bindings for zlib, deflate, and gzip-based
streams.
")
    (description
     "Bindings to miniz.c for DEFLATE compression and decompression exposed as
Reader/Writer streams.  Contains bindings for zlib, deflate, and gzip-based
streams.
")
    (license #f)))

(define-public rust-futures-cpupool
  (package
    (name "rust-futures-cpupool")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-cpupool" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1r32456gpblzfvnkf60545v8acqk7gh5zhyhi1jn669k9gicv45b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-num-cpus" ,rust-num-cpus))))
    (home-page
     "https://github.com/alexcrichton/futures-rs")
    (synopsis
     "An implementation of thread pools which hand out futures to the results of the
computation on the threads themselves.
")
    (description
     "An implementation of thread pools which hand out futures to the results of the
computation on the threads themselves.
")
    (license #f)))

(define-public rust-http
  (package
    (name "rust-http")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06icxvrd26r6s7dzjavja7r47hgjb9851wblqh8frxnsy3q29lzf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-fnv" ,rust-fnv)
        ("rust-itoa" ,rust-itoa))
       #:cargo-development-inputs
       (("rust-indexmap" ,rust-indexmap)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand)
        ("rust-seahash" ,rust-seahash)
        ("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page "https://github.com/hyperium/http")
    (synopsis
     "A set of types for representing HTTP requests and responses.
")
    (description
     "This package provides a set of types for representing HTTP requests and responses.
")
    (license #f)))

(define-public rust-httparse
  (package
    (name "rust-httparse")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "httparse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10vsfx1b8drhif08fbi0ha9d3v1f3h80w42rxh0y3hrvzl64nwz8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-pico-sys" ,rust-pico-sys))))
    (home-page
     "https://github.com/seanmonstar/httparse")
    (synopsis
     "A tiny, safe, speedy, zero-copy HTTP/1.x parser.")
    (description
     "This package provides a tiny, safe, speedy, zero-copy HTTP/1.x parser.")
    (license #f)))

(define-public rust-nodrop
  (package
    (name "rust-nodrop")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nodrop" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0if9ifn6rvar5jirx4b3qh4sl5kjkmcifycvzhxa9j3crkfng5ig"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nodrop-union" ,rust-nodrop-union))))
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis
     "A wrapper type to inhibit drop (destructor). Use std::mem::ManuallyDrop instead!")
    (description
     "This package provides a wrapper type to inhibit drop (destructor).  Use std::mem::ManuallyDrop instead!")
    (license #f)))

(define-public rust-paste-impl
  (package
    (name "rust-paste-impl")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "paste-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rkh8nixmb7r1y0mjnsz62p6r1bqah5ciri7bwhmgcmq4gk9drr6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page "https://github.com/dtolnay/paste")
    (synopsis
     "Implementation detail of the `paste` crate")
    (description
     "Implementation detail of the `paste` crate")
    (license #f)))

(define-public rust-proc-macro-hack
  (package
    (name "rust-proc-macro-hack")
    (version "0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-hack" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1www5lrvsk7pq04clgfmjlnnrshikgs1h51l17vrc7qy58bx878c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))
       #:cargo-development-inputs
       (("rust-demo-hack" ,rust-demo-hack)
        ("rust-demo-hack-impl" ,rust-demo-hack-impl))))
    (home-page
     "https://github.com/dtolnay/proc-macro-hack")
    (synopsis
     "Procedural macros in expression position")
    (description
     "Procedural macros in expression position")
    (license #f)))

(define-public rust-console-error-panic-hook
  (package
    (name "rust-console-error-panic-hook")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "console_error_panic_hook" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04d2narcrzk9bnddz17rr2l819l82pr0h6d98s2w9q236n87dndq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen))))
    (home-page
     "https://github.com/rustwasm/console_error_panic_hook")
    (synopsis
     "A panic hook for `wasm32-unknown-unknown` that logs panics to `console.error`")
    (description
     "This package provides a panic hook for `wasm32-unknown-unknown` that logs panics to `console.error`")
    (license #f)))

(define-public rust-js-sys
  (package
    (name "rust-js-sys")
    (version "0.3.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "js-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "045fgafggkjdfg4f33vb87silyl9xpbifrhx1ciqi4wvm90nzhga"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-wasm-bindgen" ,rust-wasm-bindgen))
       #:cargo-development-inputs
       (("rust-futures" ,rust-futures)
        ("rust-wasm-bindgen-futures"
         ,rust-wasm-bindgen-futures)
        ("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.
")
    (description
     "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.
")
    (license #f)))

(define-public rust-scoped-tls
  (package
    (name "rust-scoped-tls")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scoped-tls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hj8lifzvivdb1z02lfnzkshpvk85nkgzxsy2hc0zky9wf894spa"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/alexcrichton/scoped-tls")
    (synopsis
     "Library implementation of the standard library's old `scoped_thread_local!`
macro for providing scoped access to thread local storage (TLS) so any type can
be stored into TLS.
")
    (description
     "Library implementation of the standard library's old `scoped_thread_local!`
macro for providing scoped access to thread local storage (TLS) so any type can
be stored into TLS.
")
    (license #f)))

(define-public rust-wasm-bindgen-futures
  (package
    (name "rust-wasm-bindgen-futures")
    (version "0.3.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-futures" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bf9x6qfjczspc4zs605z1n4j15cdd8kk2z7rah0yggw8b6zl5nc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-futures-channel-preview"
         ,rust-futures-channel-preview)
        ("rust-futures-util-preview"
         ,rust-futures-util-preview)
        ("rust-js-sys" ,rust-js-sys)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen))
       #:cargo-development-inputs
       (("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Bridging the gap between Rust Futures and JavaScript Promises")
    (description
     "Bridging the gap between Rust Futures and JavaScript Promises")
    (license #f)))

(define-public rust-num-integer
  (package
    (name "rust-num-integer")
    (version "0.1.41")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-integer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02dwjjpfbi16c71fq689s4sw3ih52cvfzr5z5gs6qpr5z0g58pmq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg))))
    (home-page
     "https://github.com/rust-num/num-integer")
    (synopsis "Integer traits and functions")
    (description "Integer traits and functions")
    (license #f)))

(define-public rust-num-iter
  (package
    (name "rust-num-iter")
    (version "0.1.39")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-iter" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bhk2qbr3261r6zvfc58lz4spfqjhvdripxgz5mks5rd85r55gbn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-integer" ,rust-num-integer)
        ("rust-num-traits" ,rust-num-traits))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg))))
    (home-page
     "https://github.com/rust-num/num-iter")
    (synopsis
     "External iterators for generic mathematics")
    (description
     "External iterators for generic mathematics")
    (license #f)))

(define-public rust-fst-levenshtein
  (package
    (name "rust-fst-levenshtein")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fst-levenshtein" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1s5ml10442bbnpmilmwjh4pfixsj6837rg68vjzg63i3djd4524y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fst" ,rust-fst)
        ("rust-utf8-ranges" ,rust-utf8-ranges))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
     "Search finite state transducers with fuzzy queries using Levenshtein automata.
")
    (description
     "Search finite state transducers with fuzzy queries using Levenshtein automata.
")
    (license #f)))

(define-public rust-fst-regex
  (package
    (name "rust-fst-regex")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fst-regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "126xrv3s8mrq8nqsahmpy0nlks6l3wlivqyf6a0i4g7d3vcs3b47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fst" ,rust-fst)
        ("rust-regex-syntax" ,rust-regex-syntax)
        ("rust-utf8-ranges" ,rust-utf8-ranges))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
     "Search finite state transducers with regular expression.
")
    (description
     "Search finite state transducers with regular expression.
")
    (license #f)))

(define-public rust-itertools-num
  (package
    (name "rust-itertools-num")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itertools-num" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rr7ig9nkpampcas23s91x7yac6qdnwssq3nap522xbgkqps4wm8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits))
       #:cargo-development-inputs
       (("rust-itertools" ,rust-itertools)
        ("rust-quickcheck" ,rust-quickcheck))))
    (home-page
     "https://github.com/bluss/itertools-num")
    (synopsis
     "Numerical iterator tools. Extra iterators and iterator methods and functions.
")
    (description
     "Numerical iterator tools.  Extra iterators and iterator methods and functions.
")
    (license #f)))

(define-public rust-num-complex
  (package
    (name "rust-num-complex")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-complex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z6zjdzx1g1hj4y132ddy83d3p3zvw06igbf59npxxrzzcqwzc7w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits)
        ("rust-rand" ,rust-rand)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg))))
    (home-page
     "https://github.com/rust-num/num-complex")
    (synopsis
     "Complex numbers implementation for Rust")
    (description
     "Complex numbers implementation for Rust")
    (license #f)))

(define-public rust-csv-core
  (package
    (name "rust-csv-core")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "csv-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k5zs0x0qmmn27pa5kcg86lg84s29491fw5sh3zswxswnavasp4v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-memchr" ,rust-memchr))
       #:cargo-development-inputs
       (("rust-arrayvec" ,rust-arrayvec))))
    (home-page
     "https://github.com/BurntSushi/rust-csv")
    (synopsis
     "Bare bones CSV parsing with no_std support.")
    (description
     "Bare bones CSV parsing with no_std support.")
    (license #f)))

(define-public rust-crossbeam-deque
  (package
    (name "rust-crossbeam-deque")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-deque" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0was9x71cz5g1y3670cyy6jdmsdfg6k9mbf0ddz2k1mdd7hx535i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-epoch" ,rust-crossbeam-epoch)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-deque")
    (synopsis "Concurrent work-stealing deque")
    (description "Concurrent work-stealing deque")
    (license #f)))

(define-public rust-crossbeam-queue
  (package
    (name "rust-crossbeam-queue")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-queue" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jsa9dbxnwqcxfws09vaschf92d4imlbbikmcn4ka8z7rzb9r5vw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-utils" ,rust-crossbeam-utils))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-utils")
    (synopsis "Concurrent queues")
    (description "Concurrent queues")
    (license #f)))

(define-public rust-phf
  (package
    (name "rust-phf")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "066xwv4dr6056a9adlkarwp4n94kbpwngbmd47ngm3cfbyw49nmk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf-macros" ,rust-phf-macros)
        ("rust-phf-shared" ,rust-phf-shared))))
    (home-page
     "https://github.com/sfackler/rust-phf")
    (synopsis
     "Runtime support for perfect hash function data structures")
    (description
     "Runtime support for perfect hash function data structures")
    (license #f)))

(define-public rust-string-cache
  (package
    (name "rust-string-cache")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "string_cache" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08sly9s92l0g0ai1iyj9pawl05xbwm4m8kl3zqkv2wkijw4h3mr5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-new-debug-unreachable"
         ,rust-new-debug-unreachable)
        ("rust-phf-shared" ,rust-phf-shared)
        ("rust-precomputed-hash" ,rust-precomputed-hash)
        ("rust-serde" ,rust-serde)
        ("rust-string-cache-shared"
         ,rust-string-cache-shared))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand)
        ("rust-string-cache-codegen"
         ,rust-string-cache-codegen))))
    (home-page
     "https://github.com/servo/string-cache")
    (synopsis
     "A string interning library for Rust, developed as part of the Servo project.")
    (description
     "This package provides a string interning library for Rust, developed as part of the Servo project.")
    (license #f)))

(define-public rust-encoding-index-tests
  (package
    (name "rust-encoding-index-tests")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encoding_index_tests" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s85y091gl17ixass49bzaivng7w8p82p6nyvz2r3my9w4mxhim2"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/lifthrasiir/rust-encoding")
    (synopsis
     "Helper macros used to test index tables for character encodings")
    (description
     "Helper macros used to test index tables for character encodings")
    (license #f)))

(define-public rust-flame
  (package
    (name "rust-flame")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flame" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c5bmhyimzxch3pmh0w3z9n57saasgix4bmbbksr9vp1c5j71hhz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-thread-id" ,rust-thread-id))))
    (home-page "https://github.com/TyOverby/flame")
    (synopsis "a profiling / flamegraph library")
    (description "a profiling / flamegraph library")
    (license #f)))

(define-public rust-flamer
  (package
    (name "rust-flamer")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flamer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b2d7jx80f3p7hqpgdi7wksaiq18k9w23p0cs2sxf7jbx2jx3bgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-flame" ,rust-flame)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page "https://github.com/llogiq/flamer")
    (synopsis
     "a procedural macro to insert `flame::start_guard(_)` calls")
    (description
     "a procedural macro to insert `flame::start_guard(_)` calls")
    (license #f)))

(define-public rust-argon2rs
  (package
    (name "rust-argon2rs")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "argon2rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14mkgkrjd4b4zy92pflz6yb4j1wn2chbd8jczxknxbkdm2vb0rrz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-blake2-rfc" ,rust-blake2-rfc)
        ("rust-scoped-threadpool"
         ,rust-scoped-threadpool))
       #:cargo-development-inputs
       (("rust-cargon" ,rust-cargon))))
    (home-page "https://github.com/bryant/argon2rs")
    (synopsis
     "The pure Rust password hashing library that runs on Argon2.")
    (description
     "The pure Rust password hashing library that runs on Argon2.")
    (license #f)))

(define-public rust-failure
  (package
    (name "rust-failure")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "failure" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qppmgv4i5jj6vrss91qackqnl0a12h7lnby4l7j5fdy78yxhnvr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace)
        ("rust-failure-derive" ,rust-failure-derive))))
    (home-page
     "https://rust-lang-nursery.github.io/failure/")
    (synopsis
     "Experimental error handling abstraction.")
    (description
     "Experimental error handling abstraction.")
    (license #f)))

(define-public rust-socket2
  (package
    (name "rust-socket2")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "socket2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0y48mglxl4zkvzqzwwzb7llfgl54xz4mzgqlgxa0fcjrsdr6jqjf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-libc" ,rust-libc)
        ("rust-redox-syscall" ,rust-redox-syscall)
        ("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/alexcrichton/socket2-rs")
    (synopsis
     "Utilities for handling networking sockets with a maximal amount of configuration
possible intended.
")
    (description
     "Utilities for handling networking sockets with a maximal amount of configuration
possible intended.
")
    (license #f)))

(define-public rust-model
  (package
    (name "rust-model")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "model" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kx6hy5i1fn2qs4x6hpng9jixpm68g83vm24z8bqqscr317yinb6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-permutohedron" ,rust-permutohedron)
        ("rust-proptest" ,rust-proptest))))
    (home-page "https://github.com/spacejam/model")
    (synopsis
     "model-based testing for data structures, with linearizability checking")
    (description
     "model-based testing for data structures, with linearizability checking")
    (license #f)))

(define-public rust-proptest
  (package
    (name "rust-proptest")
    (version "0.9.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proptest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17sjg8isas4qk85807c4panih9k0lwa4k1mbajhciw5c5q17w56g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bit-set" ,rust-bit-set)
        ("rust-bitflags" ,rust-bitflags)
        ("rust-byteorder" ,rust-byteorder)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-num-traits" ,rust-num-traits)
        ("rust-quick-error" ,rust-quick-error)
        ("rust-rand" ,rust-rand)
        ("rust-rand-chacha" ,rust-rand-chacha)
        ("rust-rand-xorshift" ,rust-rand-xorshift)
        ("rust-regex-syntax" ,rust-regex-syntax)
        ("rust-rusty-fork" ,rust-rusty-fork)
        ("rust-tempfile" ,rust-tempfile))
       #:cargo-development-inputs
       (("rust-regex" ,rust-regex))))
    (home-page
     "https://altsysrq.github.io/proptest-book/proptest/index.html")
    (synopsis
     "Hypothesis-like property-based testing and shrinking.
")
    (description
     "Hypothesis-like property-based testing and shrinking.
")
    (license #f)))

(define-public rust-lock-api
  (package
    (name "rust-lock-api")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lock_api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zx7pksmgyggpczgw4qrr4vj2nkdk5lipgiysvr20slm552nv57d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-owning-ref" ,rust-owning-ref)
        ("rust-scopeguard" ,rust-scopeguard)
        ("rust-serde" ,rust-serde))))
    (home-page
     "https://github.com/Amanieu/parking_lot")
    (synopsis
     "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.")
    (description
     "Wrappers to create fully-featured Mutex and RwLock types.  Compatible with no_std.")
    (license #f)))

(define-public rust-parking-lot-core
  (package
    (name "rust-parking-lot-core")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parking_lot_core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1317j5a1yd03baza2kqqrxb4kr1vxa7rckw4frksl2vrncfcp26b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace)
        ("rust-cfg-if" ,rust-cfg-if)
        ("rust-cloudabi" ,rust-cloudabi)
        ("rust-libc" ,rust-libc)
        ("rust-petgraph" ,rust-petgraph)
        ("rust-rand" ,rust-rand)
        ("rust-redox-syscall" ,rust-redox-syscall)
        ("rust-smallvec" ,rust-smallvec)
        ("rust-thread-id" ,rust-thread-id)
        ("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version))))
    (home-page
     "https://github.com/Amanieu/parking_lot")
    (synopsis
     "An advanced API for creating custom synchronization primitives.")
    (description
     "An advanced API for creating custom synchronization primitives.")
    (license #f)))

(define-public rust-loom
  (package
    (name "rust-loom")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "loom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jmp5mffwwyqgp914cwz92ij2s6vk1hsnkvgndvzw74xrcfraibj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-futures" ,rust-futures)
        ("rust-generator" ,rust-generator)
        ("rust-scoped-tls" ,rust-scoped-tls)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page "https://github.com/carllerche/loom")
    (synopsis "Model checker for concurrent code")
    (description "Model checker for concurrent code")
    (license #f)))

(define-public rust-tokio-mock-task
  (package
    (name "rust-tokio-mock-task")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-mock-task" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1y7q83qfk9ljjfvs82b453pmz9x1v3d6kr4x55j8mal01s6790dw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-futures" ,rust-futures))))
    (home-page
     "https://github.com/carllerche/tokio-mock-task")
    (synopsis "Mock a Tokio task
")
    (description "Mock a Tokio task
")
    (license #f)))

(define-public rust-futures-core-preview
  (package
    (name "rust-futures-core-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-core-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dlclp85bbay5q900c5vsn6m7fbxc1dbnmlqhixnaav453rp15vi"))))
    (build-system cargo-build-system)
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "The core traits and types in for the `futures` library.
")
    (description
     "The core traits and types in for the `futures` library.
")
    (license #f)))

(define-public rust-futures-channel-preview
  (package
    (name "rust-futures-channel-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-channel-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yph1k6xbh67rpy9nh3ybddfxsrdhfi6b4b62jvyjwn25xqj7mac"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-core-preview"
         ,rust-futures-core-preview))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "Channels for asynchronous communication using futures-rs.
")
    (description
     "Channels for asynchronous communication using futures-rs.
")
    (license #f)))

(define-public rust-futures-util-preview
  (package
    (name "rust-futures-util-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-util-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cildqfd9ys5rmvvj11wx48ma5lk0zymyhlkmfww4ishkhdlb87p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures)
        ("rust-futures-channel-preview"
         ,rust-futures-channel-preview)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview)
        ("rust-futures-io-preview"
         ,rust-futures-io-preview)
        ("rust-futures-select-macro-preview"
         ,rust-futures-select-macro-preview)
        ("rust-futures-sink-preview"
         ,rust-futures-sink-preview)
        ("rust-memchr" ,rust-memchr)
        ("rust-pin-utils" ,rust-pin-utils)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack)
        ("rust-proc-macro-nested"
         ,rust-proc-macro-nested)
        ("rust-rand" ,rust-rand)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-slab" ,rust-slab)
        ("rust-tokio-io" ,rust-tokio-io))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "Common utilities and extension traits for the futures-rs library.
")
    (description
     "Common utilities and extension traits for the futures-rs library.
")
    (license #f)))

(define-public rust-pin-utils
  (package
    (name "rust-pin-utils")
    (version "0.1.0-alpha.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-utils" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11xmyx00n4m37d546by2rxb8ryxs12v55cc172i3yak1rqccd52q"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/rust-lang-nursery/pin-utils")
    (synopsis "Utilities for pinning
")
    (description "Utilities for pinning
")
    (license #f)))

(define-public rust-futures-io-preview
  (package
    (name "rust-futures-io-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-io-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18sry5ynzb4vaimsssi3jqbsfalksn9yy3bvg4mx7j9r3xxbz86c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-core-preview"
         ,rust-futures-core-preview))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "The `AsyncRead` and `AsyncWrite` traits for the futures-rs library.
")
    (description
     "The `AsyncRead` and `AsyncWrite` traits for the futures-rs library.
")
    (license #f)))

(define-public rust-futures-select-macro-preview
  (package
    (name "rust-futures-select-macro-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri
             "futures-select-macro-preview"
             version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1c7h57y5id6i2i31276zqkgvgr5c8kh21frhjm9adj67md22dvmg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "The `select!` macro for waiting on multiple different `Future`s at once and handling the first one to complete.
")
    (description
     "The `select!` macro for waiting on multiple different `Future`s at once and handling the first one to complete.
")
    (license #f)))

(define-public rust-futures-sink-preview
  (package
    (name "rust-futures-sink-preview")
    (version "0.3.0-alpha.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-sink-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1r44nzspkql2vz1kb5qp0q1dlw8hzn7w72xpp6h4r5xmssngvp29"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-channel-preview"
         ,rust-futures-channel-preview)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "The asynchronous `Sink` trait for the futures-rs library.
")
    (description
     "The asynchronous `Sink` trait for the futures-rs library.
")
    (license #f)))

(define-public rust-proc-macro-nested
  (package
    (name "rust-proc-macro-nested")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-nested" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bmlksm8vl44wkwihmwr7jsjznhbg0n7aibcw1cs2jgjcp86x6in"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/dtolnay/proc-macro-hack")
    (synopsis
     "Support for nested proc-macro-hack invocations")
    (description
     "Support for nested proc-macro-hack invocations")
    (license #f)))

(define-public rust-base-x
  (package
    (name "rust-base-x")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base-x" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hv4y5cdhv6bk0ghk2434clw8v4mmk5cc9lsh6qrpri92zlfmx3n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-bencher" ,rust-bencher)
        ("rust-json" ,rust-json)
        ("rust-rand" ,rust-rand))))
    (home-page "https://github.com/OrKoN/base-x-rs")
    (synopsis "Encode/decode any base")
    (description "Encode/decode any base")
    (license #f)))

(define-public rust-openssl
  (package
    (name "rust-openssl")
    (version "0.10.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05dg25rmg17rl3ykfl2yf69ghfd5z6zf6di38qw1awjvkddbnll1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags)
        ("rust-cfg-if" ,rust-cfg-if)
        ("rust-foreign-types" ,rust-foreign-types)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-libc" ,rust-libc)
        ("rust-openssl-sys" ,rust-openssl-sys))
       #:cargo-development-inputs
       (("rust-hex" ,rust-hex)
        ("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/sfackler/rust-openssl")
    (synopsis "OpenSSL bindings")
    (description "OpenSSL bindings")
    (license #f)))

(define-public rust-sha1
  (package
    (name "rust-sha1")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha1" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03gs2q4m67rn2p8xcdfxhip6mpgahdwm12bnb3vh90ahv9grhy95"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-openssl" ,rust-openssl)
        ("rust-rand" ,rust-rand)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page
     "https://github.com/mitsuhiko/rust-sha1")
    (synopsis
     "Minimal implementation of SHA1 for Rust.")
    (description
     "Minimal implementation of SHA1 for Rust.")
    (license #f)))

(define-public rust-semver
  (package
    (name "rust-semver")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00q4lkcj0rrgbhviv9sd4p6qmdsipkwkbra7rh11jrhq5kpvjzhx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-semver-parser" ,rust-semver-parser)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-crates-index" ,rust-crates-index)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-tempdir" ,rust-tempdir))))
    (home-page "https://docs.rs/crate/semver/")
    (synopsis
     "Semantic version parsing and comparison.
")
    (description
     "Semantic version parsing and comparison.
")
    (license #f)))

(define-public rust-tempdir
  (package
    (name "rust-tempdir")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tempdir" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n5n86zxpgd85y0mswrp5cfdisizq2rv3la906g6ipyc03xvbwhm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand" ,rust-rand)
        ("rust-remove-dir-all" ,rust-remove-dir-all))))
    (home-page
     "https://github.com/rust-lang/tempdir")
    (synopsis
     "A library for managing a temporary directory and deleting all contents when it's
dropped.
")
    (description
     "This package provides a library for managing a temporary directory and deleting all contents when it's
dropped.
")
    (license #f)))

(define-public rust-crc32fast
  (package
    (name "rust-crc32fast")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crc32fast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1c9dhkvf3brrzzplcijaywxi2w8wv5578i0ryhcm7x8dmzi5s4ms"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/srijs/rust-crc32fast")
    (synopsis
     "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation")
    (description
     "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation")
    (license #f)))

(define-public rust-libz-sys
  (package
    (name "rust-libz-sys")
    (version "1.0.25")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libz-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gjycyl2283525abks98bhxa4r259m617xfm5z52p3p3c8ry9d9f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc)
        ("rust-pkg-config" ,rust-pkg-config)
        ("rust-vcpkg" ,rust-vcpkg))))
    (home-page
     "https://github.com/alexcrichton/libz-sys")
    (synopsis
     "Bindings to the system libz library (also known as zlib).
")
    (description
     "Bindings to the system libz library (also known as zlib).
")
    (license #f)))

(define-public rust-miniz-sys
  (package
    (name "rust-miniz-sys")
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00l2r4anm8g35x0js2zfdnwfbrih9m43vphdpb77c5ga3kjkm7hy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/alexcrichton/flate2-rs")
    (synopsis "Bindings to the miniz.c library.
")
    (description
     "Bindings to the miniz.c library.
")
    (license #f)))

(define-public rust-miniz-oxide-c-api
  (package
    (name "rust-miniz-oxide-c-api")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide_c_api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1514mvlj8vl723xqxnww5cfqr2mhnqqqf18fn3df17yx8racly2v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crc32fast" ,rust-crc32fast)
        ("rust-libc" ,rust-libc)
        ("rust-miniz-oxide" ,rust-miniz-oxide))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/Frommi/miniz_oxide/")
    (synopsis
     "DEFLATE compression and decompression API designed to be Rust drop-in replacement for miniz")
    (description
     "DEFLATE compression and decompression API designed to be Rust drop-in replacement for miniz")
    (license #f)))

(define-public rust-tokio-tcp
  (package
    (name "rust-tokio-tcp")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tcp" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06a15vg8bcd33ng3h9ldzlq7wl4jsw0p9qpy7v22ls5yah3b250x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes)
        ("rust-futures" ,rust-futures)
        ("rust-iovec" ,rust-iovec)
        ("rust-mio" ,rust-mio)
        ("rust-tokio-io" ,rust-tokio-io)
        ("rust-tokio-reactor" ,rust-tokio-reactor))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger)
        ("rust-tokio" ,rust-tokio))))
    (home-page "https://tokio.rs")
    (synopsis "TCP bindings for tokio.
")
    (description "TCP bindings for tokio.
")
    (license #f)))

(define-public rust-seahash
  (package
    (name "rust-seahash")
    (version "3.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "seahash" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pr8ijnxnp68ki4m4740yc5mr01zijf86yx07wbsqzwiyhghdmhq"))))
    (build-system cargo-build-system)
    (home-page
     "https://gitlab.redox-os.org/redox-os/seahash")
    (synopsis
     "A blazingly fast, portable hash function with proven statistical guarantees.")
    (description
     "This package provides a blazingly fast, portable hash function with proven statistical guarantees.")
    (license #f)))

(define-public rust-pico-sys
  (package
    (name "rust-pico-sys")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pico-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q5pg0ms6szz6b5h26h4k40zb76zbwwjgyigac4wly9qngdj4yl5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-gcc" ,rust-gcc))))
    (home-page
     "https://github.com/reem/rust-pico-sys.git")
    (synopsis "Bindings to the PicoHTTPParser.")
    (description "Bindings to the PicoHTTPParser.")
    (license #f)))

(define-public rust-demo-hack
  (package
    (name "rust-demo-hack")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "demo-hack" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m0114p1g0zzrdph5bg03i8m8p70vrwn3whs191jrbjcrmh5lmnp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-demo-hack-impl" ,rust-demo-hack-impl)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack))))
    (home-page
     "https://github.com/dtolnay/proc-macro-hack")
    (synopsis "Demo of proc-macro-hack")
    (description "Demo of proc-macro-hack")
    (license #f)))

(define-public rust-demo-hack-impl
  (package
    (name "rust-demo-hack-impl")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "demo-hack-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f1fdl60xjas9wlmcl9v6f56vgm3mzwr019kcifav5464rx3w3ld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page
     "https://github.com/dtolnay/proc-macro-hack")
    (synopsis "Demo of proc-macro-hack")
    (description "Demo of proc-macro-hack")
    (license #f)))

(define-public rust-utf8-ranges
  (package
    (name "rust-utf8-ranges")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8-ranges" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ppzjsxmv1p1xfid8wwn07ciikk84k30frl28bwsny6za1vall4x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment)
        ("rust-quickcheck" ,rust-quickcheck))))
    (home-page
     "https://github.com/BurntSushi/utf8-ranges")
    (synopsis
     "Convert ranges of Unicode codepoints to UTF-8 byte ranges.")
    (description
     "Convert ranges of Unicode codepoints to UTF-8 byte ranges.")
    (license #f)))

(define-public rust-crossbeam-epoch
  (package
    (name "rust-crossbeam-epoch")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-epoch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1d408b9x82mdbnb405gw58v5mmdbj2rl28a1h7b9rmn25h8f7j84"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec)
        ("rust-cfg-if" ,rust-cfg-if)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-memoffset" ,rust-memoffset)
        ("rust-scopeguard" ,rust-scopeguard))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-epoch")
    (synopsis "Epoch-based garbage collection")
    (description "Epoch-based garbage collection")
    (license #f)))

(define-public rust-phf-macros
  (package
    (name "rust-phf-macros")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf_macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dzylcy14ksy60h265l433j9ra8xhg8xlq3pd5qk658m6f1mxd5x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf-generator" ,rust-phf-generator)
        ("rust-phf-shared" ,rust-phf-shared)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))
       #:cargo-development-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs))))
    (home-page
     "https://github.com/sfackler/rust-phf")
    (synopsis
     "Macros to generate types in the phf crate")
    (description
     "Macros to generate types in the phf crate")
    (license #f)))

(define-public rust-phf-macros
  (package
    (name "rust-phf-shared")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf_shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18371fla0vsj7d6d5rlfb747xbr2in11ar9vgv5qna72bnhp2kr3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-siphasher" ,rust-siphasher)
        ("rust-unicase" ,rust-unicase))))
    (home-page
     "https://github.com/sfackler/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description
     "Support code shared by PHF libraries")
    (license #f)))

(define-public rust-new-debug-unreachable
  (package
    (name "rust-new-debug-unreachable")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "new_debug_unreachable" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c1br326qa0rrzxrn2rd5ah7xaprig2i9r4rwsx06vnvc1f003zl"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/mbrubeck/rust-debug-unreachable")
    (synopsis
     "panic in debug, intrinsics::unreachable() in release (fork of debug_unreachable)")
    (description
     "panic in debug, intrinsics::unreachable() in release (fork of debug_unreachable)")
    (license #f)))

(define-public rust-precomputed-hash
  (package
    (name "rust-precomputed-hash")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "precomputed-hash" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "075k9bfy39jhs53cb2fpb9klfakx2glxnf28zdw08ws6lgpq6lwj"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/emilio/precomputed-hash")
    (synopsis
     "A library intending to be a base dependency to expose a precomputed hash")
    (description
     "This package provides a library intending to be a base dependency to expose a precomputed hash")
    (license #f)))

(define-public rust-thread-id
  (package
    (name "rust-thread-id")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thread-id" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h90v19fjz3x9b25ywh68z5yf2zsmm6h5zb4rl302ckbsp4z9yy7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-redox-syscall" ,rust-redox-syscall)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/ruuda/thread-id")
    (synopsis "Get a unique thread ID")
    (description "Get a unique thread ID")
    (license #f)))

(define-public rust-blake2-rfc
  (package
    (name "rust-blake2-rfc")
    (version "0.2.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blake2-rfc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0034g47hyq2bzmk40895ill1mbnpmmjakdq3dmm9clidvl5m6vax"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec)
        ("rust-clippy" ,rust-clippy)
        ("rust-constant-time-eq" ,rust-constant-time-eq))
       #:cargo-development-inputs
       (("rust-data-encoding" ,rust-data-encoding))))
    (home-page
     "https://github.com/cesarb/blake2-rfc")
    (synopsis
     "A pure Rust implementation of BLAKE2 based on RFC 7693.")
    (description
     "This package provides a pure Rust implementation of BLAKE2 based on RFC 7693.")
    (license #f)))

(define-public rust-scoped-threadpool
  (package
    (name "rust-scoped-threadpool")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scoped_threadpool" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a26d3lk40s9mrf4imhbik7caahmw2jryhhb6vqv6fplbbgzal8x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static))))
    (home-page
     "https://github.com/Kimundi/scoped-threadpool-rs")
    (synopsis
     "A library for scoped and cached threadpools.")
    (description
     "This package provides a library for scoped and cached threadpools.")
    (license #f)))

(define-public rust-cargon
  (package
    (name "rust-cargon")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cargon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cszlab7jk736p0lb50ag4l9nv72m7j41bwrmygl0lr4iz0350w2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-gcc" ,rust-gcc))))
    (home-page "https://github.com/bryant/argon2rs")
    (synopsis
     "Thin wrapper around the Argon2 C library. Used in argon2rs' bench suite.")
    (description
     "Thin wrapper around the Argon2 C library.  Used in argon2rs' bench suite.")
    (license #f)))

(define-public rust-backtrace
  (package
    (name "rust-backtrace")
    (version "0.3.32")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "backtrace" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rgsaha3b6wxh564s4jqn5hl5pkmg214blyjjs1svafib190zd8q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-addr2line" ,rust-addr2line)
        ("rust-backtrace-sys" ,rust-backtrace-sys)
        ("rust-cfg-if" ,rust-cfg-if)
        ("rust-compiler-builtins"
         ,rust-compiler-builtins)
        ("rust-cpp-demangle" ,rust-cpp-demangle)
        ("rust-findshlibs" ,rust-findshlibs)
        ("rust-goblin" ,rust-goblin)
        ("rust-libc" ,rust-libc)
        ("rust-memmap" ,rust-memmap)
        ("rust-rustc-demangle" ,rust-rustc-demangle)
        ("rust-rustc-serialize" ,rust-rustc-serialize)
        ("rust-rustc-std-workspace-core"
         ,rust-rustc-std-workspace-core)
        ("rust-serde" ,rust-serde)
        ("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/rust-lang/backtrace-rs")
    (synopsis
     "A library to acquire a stack trace (backtrace) at runtime in a Rust program.
")
    (description
     "This package provides a library to acquire a stack trace (backtrace) at runtime in a Rust program.
")
    (license #f)))

(define-public rust-failure-derive
  (package
    (name "rust-failure-derive")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "failure_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q97n7dp51j5hndzic9ng2fgn6f3z5ya1992w84l7vypby8n647a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn)
        ("rust-synstructure" ,rust-synstructure))
       #:cargo-development-inputs
       (("rust-failure" ,rust-failure))))
    (home-page
     "https://rust-lang-nursery.github.io/failure/")
    (synopsis "derives for the failure crate")
    (description "derives for the failure crate")
    (license #f)))

(define-public rust-crates-index
  (package
    (name "rust-crates-index")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crates-index" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n7pp6mk59hw3nqlh8irxc9pp0g5ziw7bprqsw2lxvg13cvdp76s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-error-chain" ,rust-error-chain)
        ("rust-git2" ,rust-git2)
        ("rust-glob" ,rust-glob)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/frewsxcv/rust-crates-index")
    (synopsis
     "Library for retrieving and interacting with the crates.io index")
    (description
     "Library for retrieving and interacting with the crates.io index")
    (license #f)))

(define-public rust-cc
  (package
    (name "rust-cc")
    (version "1.0.37")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zby3adq7zdxpn4dnx1q2mv9rzs9ss7z4s111mb5gbxvsx25bxrr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rayon" ,rust-rayon))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/alexcrichton/cc-rs")
    (synopsis
     "A build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.
")
    (description
     "This package provides a build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.
")
    (license #f)))

(define-public rust-pkg-config
  (package
    (name "rust-pkg-config")
    (version "0.3.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pkg-config" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "135ia995lqzr0gxpk85h0bjxf82kj6hbxdx924sh9jdln6r8wvk7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static))))
    (home-page
     "https://github.com/alexcrichton/pkg-config-rs")
    (synopsis
     "A library to run the pkg-config system tool at build time in order to be used in
Cargo build scripts.
")
    (description
     "This package provides a library to run the pkg-config system tool at build time in order to be used in
Cargo build scripts.
")
    (license #f)))

(define-public rust-vcpkg
  (package
    (name "rust-vcpkg")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vcpkg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15dzk1b96q946v9aisbd1bbhi33n93wvgziwh1shmscn1xflbp9k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-tempdir" ,rust-tempdir))))
    (home-page "https://github.com/mcgoo/vcpkg-rs")
    (synopsis
     "A library to find native dependencies in a vcpkg tree at build
time in order to be used in Cargo build scripts.
")
    (description
     "This package provides a library to find native dependencies in a vcpkg tree at build
time in order to be used in Cargo build scripts.
")
    (license #f)))

(define-public rust-gcc
  (package
    (name "rust-gcc")
    (version "0.3.55")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gcc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hng1sajn4r67hndvhjysswz8niayjwvcj42zphpxzhbz89kjpwg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rayon" ,rust-rayon))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/alexcrichton/gcc-rs")
    (synopsis
     "**Deprecated** crate, renamed to `cc`

A build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.
")
    (description
     "**Deprecated** crate, renamed to `cc`

A build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.
")
    (license #f)))

(define-public rust-memoffset
  (package
    (name "rust-memoffset")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memoffset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cvm2z7dy138s302ii7wlzcxbka5a8yfl5pl5di7lbdnw9hw578g"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/Gilnaa/memoffset")
    (synopsis
     "offset_of functionality for Rust structs.")
    (description
     "offset_of functionality for Rust structs.")
    (license #f)))

(define-public rust-phf-generator
  (package
    (name "rust-phf-generator")
    (version "0.7.24")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "phf_generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qi62gxk3x3whrmw5c4i71406icqk11qmpgln438p6qm7k4lqdh9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-phf-shared" ,rust-phf-shared)
        ("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/sfackler/rust-phf")
    (synopsis "PHF generation logic")
    (description "PHF generation logic")
    (license #f)))

(define-public rust-miniz-oxide
  (package
    (name "rust-miniz-oxide")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17f92krv9hhsyc38prpfyn99m2hqhr4fgszpsla66a6gcrnpbhxn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-adler32" ,rust-adler32))))
    (home-page
     "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
    (synopsis
     "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (description
     "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (license #f)))

(define-public rust-siphasher
  (package
    (name "rust-siphasher")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "siphasher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a03vzazh0wpds6nmclpnkq3z1mj1dmh3738z81lmn2pyrfwf4wr"))))
    (build-system cargo-build-system)
    (home-page "https://docs.rs/siphasher")
    (synopsis
     "SipHash functions from rust-core < 1.13")
    (description
     "SipHash functions from rust-core < 1.13")
    (license #f)))

(define-public rust-constant-time-eq
  (package
    (name "rust-constant-time-eq")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "constant_time_eq" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17janp8n9dd6kjbbgqiayrh9fw81v4cq9rz04926s5nf4pi15w4g"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/cesarb/constant_time_eq")
    (synopsis
     "Compares two equal-sized byte strings in constant time.")
    (description
     "Compares two equal-sized byte strings in constant time.")
    (license #f)))

(define-public rust-addr2line
  (package
    (name "rust-addr2line")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "addr2line" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17rlf04nx3g3rcy661v24ksnmpk6vqn680g5b5sp8lk20iih2xnx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cpp-demangle" ,rust-cpp-demangle)
        ("rust-fallible-iterator"
         ,rust-fallible-iterator)
        ("rust-gimli" ,rust-gimli)
        ("rust-intervaltree" ,rust-intervaltree)
        ("rust-lazycell" ,rust-lazycell)
        ("rust-object" ,rust-object)
        ("rust-rustc-demangle" ,rust-rustc-demangle)
        ("rust-smallvec" ,rust-smallvec))
       #:cargo-development-inputs
       (("rust-backtrace" ,rust-backtrace)
        ("rust-clap" ,rust-clap)
        ("rust-findshlibs" ,rust-findshlibs)
        ("rust-memmap" ,rust-memmap)
        ("rust-rustc-test" ,rust-rustc-test))))
    (home-page
     "https://github.com/gimli-rs/addr2line")
    (synopsis
     "A cross-platform symbolication library written in Rust, using `gimli`")
    (description
     "This package provides a cross-platform symbolication library written in Rust, using `gimli`")
    (license #f)))

(define-public rust-backtrace-sys
  (package
    (name "rust-backtrace-sys")
    (version "0.1.30")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "backtrace-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q9yxdhq1sgjcqw068g4m75ba11v83ycn0dwc6pm6dalkh5h0fjv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-compiler-builtins"
         ,rust-compiler-builtins)
        ("rust-libc" ,rust-libc)
        ("rust-rustc-std-workspace-core"
         ,rust-rustc-std-workspace-core))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/alexcrichton/backtrace-rs")
    (synopsis
     "Bindings to the libbacktrace gcc library
")
    (description
     "Bindings to the libbacktrace gcc library
")
    (license #f)))

(define-public rust-compiler-builtins
  (package
    (name "rust-compiler-builtins")
    (version "0.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "compiler_builtins" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kv1fhj28df7mywai0cb84yvn2cl871hhvnphsrp35y9jfbx37p7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rustc-std-workspace-core"
         ,rust-rustc-std-workspace-core))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/rust-lang-nursery/compiler-builtins")
    (synopsis
     "Compiler intrinsics used by the Rust compiler. Also available for other targets
if necessary!
")
    (description
     "Compiler intrinsics used by the Rust compiler.  Also available for other targets
if necessary!
")
    (license #f)))

(define-public rust-cpp-demangle
  (package
    (name "rust-cpp-demangle")
    (version "0.2.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpp_demangle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a4hqsfc0sfdwy7pcr0rc1fjp2j47fxbkqfc2lfrbi4zlm5hq36k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-afl" ,rust-afl)
        ("rust-cfg-if" ,rust-cfg-if))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap)
        ("rust-diff" ,rust-diff)
        ("rust-glob" ,rust-glob))))
    (home-page
     "https://github.com/gimli-rs/cpp_demangle")
    (synopsis "A crate for demangling C++ symbols")
    (description
     "This package provides a crate for demangling C++ symbols")
    (license #f)))

(define-public rust-findshlibs
  (package
    (name "rust-findshlibs")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "findshlibs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n2vagn0q5yim32hxkwi1cjgp3yn1dm45p7z8nw6lapywihhs9mi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-libc" ,rust-libc))))
    (home-page
     "https://github.com/gimli-rs/findshlibs")
    (synopsis
     "Find the set of shared libraries loaded in the current process with a cross platform API")
    (description
     "Find the set of shared libraries loaded in the current process with a cross platform API")
    (license #f)))

(define-public rust-goblin
  (package
    (name "rust-goblin")
    (version "0.0.23")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "goblin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g92bl76dgc3v3rins61l811pkwsl3jif1x35h2jx33b7dsv8mmc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log)
        ("rust-plain" ,rust-plain)
        ("rust-scroll" ,rust-scroll))))
    (home-page "https://github.com/m4b/goblin")
    (synopsis
     "An impish, cross-platform, ELF, Mach-o, and PE binary parsing and loading crate")
    (description
     "An impish, cross-platform, ELF, Mach-o, and PE binary parsing and loading crate")
    (license #f)))

(define-public rust-rustc-demangle
  (package
    (name "rust-rustc-demangle")
    (version "0.1.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-demangle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1brqf2bknkxsdzn3kd3wfifvzfc33bmvdy9r1k6fp4a8dz7xrx57"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-compiler-builtins"
         ,rust-compiler-builtins)
        ("rust-rustc-std-workspace-core"
         ,rust-rustc-std-workspace-core))))
    (home-page
     "https://github.com/alexcrichton/rustc-demangle")
    (synopsis "Rust compiler symbol demangling.
")
    (description
     "Rust compiler symbol demangling.
")
    (license #f)))

(define-public rust-synstructure
  (package
    (name "rust-synstructure")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synstructure" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0grirdkgh2wl4hf9a3nbiazpgccxgq54kn52ms0xrr6njvgkwd82"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn)
        ("rust-unicode-xid" ,rust-unicode-xid))
       #:cargo-development-inputs
       (("rust-synstructure-test-traits"
         ,rust-synstructure-test-traits))))
    (home-page
     "https://github.com/mystor/synstructure")
    (synopsis
     "Helper methods and macros for custom derives")
    (description
     "Helper methods and macros for custom derives")
    (license #f)))

(define-public rust-error-chain
  (package
    (name "rust-error-chain")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "error-chain" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ndpw1ny2kxqpw6k1shq8k56z4vfpk4xz9zr8ay988k0rffrxd1s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace))
       #:cargo-development-inputs
       (("rust-version-check" ,rust-version-check))))
    (home-page
     "https://github.com/rust-lang-nursery/error-chain")
    (synopsis
     "Yet another error boilerplate library.")
    (description
     "Yet another error boilerplate library.")
    (license #f)))

(define-public rust-git2
  (package
    (name "rust-git2")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cayf5w7wkvclvs8brbi7lyfxbdklwls9s49mpf2brl655yjwjwj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags)
        ("rust-libc" ,rust-libc)
        ("rust-libgit2-sys" ,rust-libgit2-sys)
        ("rust-log" ,rust-log)
        ("rust-openssl-probe" ,rust-openssl-probe)
        ("rust-openssl-sys" ,rust-openssl-sys)
        ("rust-url" ,rust-url))
       #:cargo-development-inputs
       (("rust-docopt" ,rust-docopt)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-tempdir" ,rust-tempdir)
        ("rust-thread-id" ,rust-thread-id)
        ("rust-time" ,rust-time))))
    (home-page
     "https://github.com/rust-lang/git2-rs")
    (synopsis
     "Bindings to libgit2 for interoperating with git repositories. This library is
both threadsafe and memory safe and allows both reading and writing git
repositories.
")
    (description
     "Bindings to libgit2 for interoperating with git repositories.  This library is
both threadsafe and memory safe and allows both reading and writing git
repositories.
")
    (license #f)))

(define-public rust-adler32
  (package
    (name "rust-adler32")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "adler32" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p7fxlnks9l7p7rwfqi7aqgnk2bps5zc0rjiw00mdw19nnbjjlky"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/remram44/adler32-rs")
    (synopsis
     "Minimal Adler32 implementation for Rust.")
    (description
     "Minimal Adler32 implementation for Rust.")
    (license #f)))

(define-public rust-fallible-iterator
  (package
    (name "rust-fallible-iterator")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fallible-iterator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xq759lsr8gqss7hva42azn3whgrbrs2sd9xpn92c5ickxm1fhs4"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/sfackler/rust-fallible-iterator")
    (synopsis "Fallible iterator traits")
    (description "Fallible iterator traits")
    (license #f)))

(define-public rust-gimli
  (package
    (name "rust-gimli")
    (version "0.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gimli" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ma1zg2klqr47rasm7jn3zzd1j1pj2a8wkfbv5zsx10qh43phy4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec)
        ("rust-byteorder" ,rust-byteorder)
        ("rust-fallible-iterator"
         ,rust-fallible-iterator)
        ("rust-indexmap" ,rust-indexmap)
        ("rust-stable-deref-trait"
         ,rust-stable-deref-trait))
       #:cargo-development-inputs
       (("rust-crossbeam" ,rust-crossbeam)
        ("rust-getopts" ,rust-getopts)
        ("rust-memmap" ,rust-memmap)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-object" ,rust-object)
        ("rust-rayon" ,rust-rayon)
        ("rust-regex" ,rust-regex)
        ("rust-test-assembler" ,rust-test-assembler)
        ("rust-typed-arena" ,rust-typed-arena))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis
     "A library for reading and writing the DWARF debugging format.")
    (description
     "This package provides a library for reading and writing the DWARF debugging format.")
    (license #f)))

(define-public rust-intervaltree
  (package
    (name "rust-intervaltree")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intervaltree" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10k40gsv79kwnsqrzwmnmm6psa5fqws8yggavmbggvymv16hffdg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-smallvec" ,rust-smallvec))))
    (home-page
     "https://github.com/main--/rust-intervaltree")
    (synopsis
     "A simple and generic implementation of an immutable interval tree.")
    (description
     "This package provides a simple and generic implementation of an immutable interval tree.")
    (license #f)))

(define-public rust-lazycell
  (package
    (name "rust-lazycell")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lazycell" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gvqycmpv7parc98i6y64ai7rvxrn1947z2a6maa02g4kvxdd55j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-clippy" ,rust-clippy))))
    (home-page "https://github.com/indiv0/lazycell")
    (synopsis
     "A library providing a lazily filled Cell struct")
    (description
     "This package provides a library providing a lazily filled Cell struct")
    (license #f)))

(define-public rust-object
  (package
    (name "rust-object")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "object" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dch1ajjp05d16lig1dnvisfis0hrlrvw9lcwy1hwgdcym3z6jnz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-flate2" ,rust-flate2)
        ("rust-goblin" ,rust-goblin)
        ("rust-parity-wasm" ,rust-parity-wasm)
        ("rust-scroll" ,rust-scroll)
        ("rust-uuid" ,rust-uuid))
       #:cargo-development-inputs
       (("rust-memmap" ,rust-memmap))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis
     "A unified interface for parsing object file formats.")
    (description
     "This package provides a unified interface for parsing object file formats.")
    (license #f)))

(define-public rust-afl
  (package
    (name "rust-afl")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "afl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g2chc18ji7qxi0d03n2ai140qdcww958v5si6rcjnnhmri1vyfb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cc" ,rust-cc)
        ("rust-clap" ,rust-clap)
        ("rust-rustc-version" ,rust-rustc-version)
        ("rust-xdg" ,rust-xdg))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version)
        ("rust-xdg" ,rust-xdg))))
    (home-page "https://github.com/rust-fuzz/afl.rs")
    (synopsis
     "Fuzzing Rust code with american-fuzzy-lop")
    (description
     "Fuzzing Rust code with american-fuzzy-lop")
    (license #f)))

(define-public rust-diff
  (package
    (name "rust-diff")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "diff" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fhavni46a2rib93ig5fgbqmm48ysms5sxzb3h9bp7vp2bwnjarw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck)
        ("rust-speculate" ,rust-speculate))))
    (home-page
     "https://github.com/utkarshkukreti/diff.rs")
    (synopsis
     "An LCS based slice and string diffing implementation.")
    (description
     "An LCS based slice and string diffing implementation.")
    (license #f)))

(define-public rust-plain
  (package
    (name "rust-plain")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "plain" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19n1xbxb4wa7w891268bzf6cbwq4qvdb86bik1z129qb0xnnnndl"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/randomites/plain")
    (synopsis
     "A small Rust library that allows users to reinterpret data of certain types safely.")
    (description
     "This package provides a small Rust library that allows users to reinterpret data of certain types safely.")
    (license #f)))

(define-public rust-scroll
  (package
    (name "rust-scroll")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scroll" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10q3w86bn22xrjlfg1c90dfi9c26qjkzn26nad0i9z8pxwad311g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-scroll-derive" ,rust-scroll-derive))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-rayon" ,rust-rayon)
        ("rust-rustc-version" ,rust-rustc-version))))
    (home-page "https://github.com/m4b/scroll")
    (synopsis
     "A suite of powerful, extensible, generic, endian-aware Read/Write traits for byte buffers")
    (description
     "This package provides a suite of powerful, extensible, generic, endian-aware Read/Write traits for byte buffers")
    (license #f)))

(define-public rust-synstructure-test-traits
  (package
    (name "rust-synstructure-test-traits")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "synstructure_test_traits" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b3fs2b9kc1gy9dilaxqjbdl4z0mlrbbxjzkprdx953rif1c3q66"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis
     "Helper test traits for synstructure doctests")
    (description
     "Helper test traits for synstructure doctests")
    (license #f)))

(define-public rust-libgit2-sys
  (package
    (name "rust-libgit2-sys")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libgit2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xwzkl2asfvxfns1i307fv0xyfgfr6p1iq9fkn63nckp7zi426ll"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-libssh2-sys" ,rust-libssh2-sys)
        ("rust-libz-sys" ,rust-libz-sys)
        ("rust-openssl-sys" ,rust-openssl-sys))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc)
        ("rust-pkg-config" ,rust-pkg-config))))
    (home-page
     "https://github.com/rust-lang/git2-rs")
    (synopsis
     "Native bindings to the libgit2 library")
    (description
     "Native bindings to the libgit2 library")
    (license #f)))

(define-public rust-openssl-probe
  (package
    (name "rust-openssl-probe")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-probe" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pijrdifgsdwd45b08c2g0dsmnhz7c3kmagb70839ngrd7d29bvp"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/alexcrichton/openssl-probe")
    (synopsis
     "Tool for helping to find SSL certificate locations on the system for OpenSSL")
    (description
     "Tool for helping to find SSL certificate locations on the system for OpenSSL")
    (license #f)))

(define-public rust-openssl-sys
  (package
    (name "rust-openssl-sys")
    (version "0.9.47")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1k2shs8l6l5ffdsd7iax43fb87md8y439lm18y7d6n29pgdxdgbm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg)
        ("rust-cc" ,rust-cc)
        ("rust-openssl-src" ,rust-openssl-src)
        ("rust-pkg-config" ,rust-pkg-config)
        ("rust-vcpkg" ,rust-vcpkg))))
    (home-page
     "https://github.com/sfackler/rust-openssl")
    (synopsis "FFI bindings to OpenSSL")
    (description "FFI bindings to OpenSSL")
    (license #f)))

(define-public rust-stable-deref-trait
  (package
    (name "rust-stable-deref-trait")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stable_deref_trait" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1j2lkgakksmz4vc5hfawcch2ipiskrhjs1sih0f3br7s7rys58fv"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/storyyeller/stable_deref_trait")
    (synopsis
     "An unsafe marker trait for types like Box and Rc that dereference to a stable address even when moved, and hence can be used with libraries such as owning_ref and rental.")
    (description
     "An unsafe marker trait for types like Box and Rc that dereference to a stable address even when moved, and hence can be used with libraries such as owning_ref and rental.")
    (license #f)))

(define-public rust-test-assembler
  (package
    (name "rust-test-assembler")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "test-assembler" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sdx9hk0dk3z9crm8834ysyxsi92chls8arpd0gs796kis6lik2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder))))
    (home-page
     "https://github.com/luser/rust-test-assembler")
    (synopsis
     "A set of types for building complex binary streams.")
    (description
     "This package provides a set of types for building complex binary streams.")
    (license #f)))

(define-public rust-typed-arena
  (package
    (name "rust-typed-arena")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typed-arena" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i8yczhwcy0nnrxqck1lql3i7hvg95l0vw0dbgfb92zkms96mh66"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/SimonSapin/rust-typed-arena")
    (synopsis
     "The arena, a fast but limited type of allocator")
    (description
     "The arena, a fast but limited type of allocator")
    (license #f)))

(define-public rust-parity-wasm
  (package
    (name "rust-parity-wasm")
    (version "0.38.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "parity-wasm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qpfwb9adyi6g98q1w0xiqdzkv4r1p7b2w19wd5cr57rlwifbmr0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-time" ,rust-time))))
    (home-page
     "https://github.com/paritytech/parity-wasm")
    (synopsis
     "WebAssembly binary format serialization/deserialization/interpreter")
    (description
     "WebAssembly binary format serialization/deserialization/interpreter")
    (license #f)))

(define-public rust-uuid
  (package
    (name "rust-uuid")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ank4xk20x3nrz926w8j9mz53bi3v8bykxmhlq2pffa8xc8wdnwh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-md5" ,rust-md5)
        ("rust-rand" ,rust-rand-0.6.5)
        ("rust-serde" ,rust-serde)
        ("rust-sha1" ,rust-sha1)
        ("rust-slog" ,rust-slog)
        ("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-serde-test" ,rust-serde-test))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis
     "A library to generate and parse UUIDs.")
    (description
     "This package provides a library to generate and parse UUIDs.")
    (license #f)))

(define-public rust-xdg
  (package
    (name "rust-xdg")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xdg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mws8a0fr3cqk5nh7aq9lmkmhzghvasqy4mhw6nnza06l4d6i2fh"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/whitequark/rust-xdg")
    (synopsis
     "A library for storing and retrieving files according to XDG Base Directory specification")
    (description
     "This package provides a library for storing and retrieving files according to XDG Base Directory specification")
    (license #f)))

(define-public rust-speculate
  (package
    (name "rust-speculate")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "speculate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ph01n3fqkmnfr1wd13dqsi4znv06xy6p4h3hqqdzk81r0r5vd1w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn)
        ("rust-unicode-xid" ,rust-unicode-xid))))
    (home-page
     "https://github.com/utkarshkukreti/speculate.rs")
    (synopsis
     "An RSpec inspired minimal testing framework for Rust.")
    (description
     "An RSpec inspired minimal testing framework for Rust.")
    (license #f)))

(define-public rust-scroll-derive
  (package
    (name "rust-scroll-derive")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scroll_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jqg5mm8nvii6avl1z1rc89agzh2kwkppgpsnwfakxg78mnaj6lg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))
       #:cargo-development-inputs
       (("rust-scroll" ,rust-scroll))))
    (home-page
     "https://github.com/m4b/scroll_derive")
    (synopsis
     "A macros 1.1 derive implementation for Pread and Pwrite traits from the scroll crate")
    (description
     "This package provides a macros 1.1 derive implementation for Pread and Pwrite traits from the scroll crate")
    (license #f)))

(define-public rust-libssh2-sys
  (package
    (name "rust-libssh2-sys")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libssh2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17dz3xxy5bc73sr52maa6wdqmw1a0ymznrgfzlxid2rng101yshj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-libz-sys" ,rust-libz-sys)
        ("rust-openssl-sys" ,rust-openssl-sys))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc)
        ("rust-pkg-config" ,rust-pkg-config)
        ("rust-vcpkg" ,rust-vcpkg))))
    (home-page
     "https://github.com/alexcrichton/ssh2-rs")
    (synopsis
     "Native bindings to the libssh2 library")
    (description
     "Native bindings to the libssh2 library")
    (license #f)))

(define-public rust-openssl-src
  (package
    (name "rust-openssl-src")
    (version "111.3.0+1.1.1c")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-src" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15y7fdw33idbdc3y7dv3k87gdc2l4xn202mslkvzbgcls8qmzvak"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/alexcrichton/openssl-src-rs")
    (synopsis
     "Source of OpenSSL and logic to build it.")
    (description
     "Source of OpenSSL and logic to build it.")
    (license #f)))

(define-public rust-md5
  (package
    (name "rust-md5")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "md5" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17b2xm4h4cvxsdjsf3kdrzqv2za60kak961xzi5kmw6g6djcssvy"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/stainless-steel/md5")
    (synopsis
     "The package provides the MD5 hash function.")
    (description
     "The package provides the MD5 hash function.")
    (license #f)))

(define-public rust-slog
  (package
    (name "rust-slog")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slog" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13jh74jlckzh5cygkhs0k4r82wnmw8ha2km829xwslhr83n2w6hy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-erased-serde" ,rust-erased-serde))))
    (home-page "https://github.com/slog-rs/slog")
    (synopsis
     "Structured, extensible, composable logging for Rust")
    (description
     "Structured, extensible, composable logging for Rust")
    (license #f)))

(define-public rust-erased-serde
  (package
    (name "rust-erased-serde")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "erased-serde" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q7bnxs5zskfq5iillig55g7891dllcxh2p8y8k1p2j72syf9viv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde-cbor" ,rust-serde-cbor)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page
     "https://github.com/dtolnay/erased-serde")
    (synopsis
     "Type-erased Serialize and Serializer traits")
    (description
     "Type-erased Serialize and Serializer traits")
    (license #f)))

(define-public rust-memmap
  (package
    (name "rust-memmap")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ns7kkd1h4pijdkwfvw4qlbbmqmlmzwlq3g2676dcl5vwyazv1b5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir))))
    (home-page
     "https://github.com/danburkert/memmap-rs")
    (synopsis
     "Cross-platform Rust API for memory-mapped file IO")
    (description
     "Cross-platform Rust API for memory-mapped file IO")
    (license #f)))

(define-public rust-pcre2
  (package
    (name "rust-pcre2")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pcre2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "103i66a998g1fjrqf9sdyvi8qi83hwglz3pjdcq9n2r207hsagb0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-log" ,rust-log)
        ("rust-pcre2-sys" ,rust-pcre2-sys)
        ("rust-thread-local" ,rust-thread-local))))
    (home-page
     "https://github.com/BurntSushi/rust-pcre2")
    (synopsis
     "High level wrapper library for PCRE2.")
    (description
     "High level wrapper library for PCRE2.")
    (license #f)))

(define-public rust-unindent
  (package
    (name "rust-unindent")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unindent" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x21ilf78aqcq9xzb9b7i628wm10rhk0jp0chlv06rkc690l8jw3"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dtolnay/indoc")
    (synopsis
     "Remove a column of leading whitespace from a string")
    (description
     "Remove a column of leading whitespace from a string")
    (license #f)))

(define-public rust-ci-info
  (package
    (name "rust-ci-info")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ci_info" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01n3gxmwp765m6xg1fl8v1y12wsvbqvlcai27kdr5d2skrijyfb7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f ; Has failing tests
       #:cargo-inputs
       (("rust-envmnt" ,rust-envmnt)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page
     "http://github.com/sagiegurari/ci_info")
    (synopsis
     "Provides current CI environment information.")
    (description
     "Provides current CI environment information.")
    (license #f)))

(define-public rust-ci-info-0.3.1
  (package
    (inherit rust-ci-info)
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ci_info" version))
       (file-name
        (string-append (package-name rust-ci-info) "-" version ".tar.gz"))
       (sha256
        (base32
         "00pr17g6q6i752acrkycg0hkq3lm0p634anm41g3m6lqg8q83s75"))))
    (arguments
     `(#:tests? #f ; Has failing tests
       #:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))))

(define-public rust-console
  (package
    (name "rust-console")
    (version "0.7.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "console" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a4n2syzik9lh02v2i4wdazvm05d99bib7dw0lqvz8mq2hn7r9cc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty)
        ("rust-clicolors-control"
         ,rust-clicolors-control)
        ("rust-encode-unicode" ,rust-encode-unicode)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-libc" ,rust-libc)
        ("rust-parking-lot" ,rust-parking-lot)
        ("rust-regex" ,rust-regex)
        ("rust-termios" ,rust-termios)
        ("rust-unicode-width" ,rust-unicode-width)
        ("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/mitsuhiko/console")
    (synopsis
     "A terminal and console abstraction for Rust")
    (description
     "This package provides a terminal and console abstraction for Rust")
    (license #f)))

(define-public rust-difference
  (package
    (name "rust-difference")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "difference" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1621wx4k8h452p6xzmzzvm7mz87kxh4yqz0kzxfjj9xmjxlbyk2j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getopts" ,rust-getopts))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck)
        ("rust-term" ,rust-term))))
    (home-page
     "https://github.com/johannhof/difference.rs")
    (synopsis
     "A Rust text diffing and assertion library.")
    (description
     "This package provides a Rust text diffing and assertion library.")
    (license #f)))

(define-public rust-pest
  (package
    (name "rust-pest")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "134686mwxm73asbiads53zfchqvvcrsrsyax2cghfcizmvg8ac4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-ucd-trie" ,rust-ucd-trie))))
    (home-page "https://pest-parser.github.io/")
    (synopsis "The Elegant Parser")
    (description "The Elegant Parser")
    (license #f)))

(define-public rust-pest-derive
  (package
    (name "rust-pest-derive")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l5jfa6ril71cw5nsiw0r45br54dd8cj2r1nc2d1wq6wb3jilgc3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-pest" ,rust-pest)
        ("rust-pest-generator" ,rust-pest-generator))))
    (home-page "https://pest-parser.github.io/")
    (synopsis "pest's derive macro")
    (description "pest's derive macro")
    (license #f)))

(define-public rust-ron
  (package
    (name "rust-ron")
    (version "0.4.1") ; Current is 0.5.1, rust-insta has pinned version
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ron" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mrqdgw3w0yypg24jyq9mphp4zr9lr0ks7yam82m4n34x6njijyr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64)
        ("rust-bitflags" ,rust-bitflags)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde-bytes" ,rust-serde-bytes)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page "https://github.com/ron-rs/ron")
    (synopsis "Rusty Object Notation")
    (description "Rusty Object Notation")
    (license #f)))

(define-public rust-termios
  (package
    (name "rust-termios")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termios" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09any1p4jp4bphvb5ikagnvwjc3xn2djchy96nkpa782xb2j1dkj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc))))
    (home-page
     "https://github.com/dcuddeback/termios-rs")
    (synopsis
     "Safe bindings for the termios library.")
    (description
     "Safe bindings for the termios library.")
    (license #f)))

(define-public rust-clicolors-control
  (package
    (name "rust-clicolors-control")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clicolors-control" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1y80cgarxhrd1bz5yjm81r444v6flvy36aaxrrsac0yhfd6gvavk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-libc" ,rust-libc)
        ("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/mitsuhiko/clicolors-control")
    (synopsis
     "A common utility library to control CLI colorization")
    (description
     "This package provides a common utility library to control CLI colorization")
    (license #f)))

(define-public rust-envmnt
  (package
    (name "rust-envmnt")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "envmnt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12zkq3p999bypyxmjnpiqw9r3hmifb3bcikd7j3as1fdcbq01fyl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-indexmap" ,rust-indexmap))))
    (home-page
     "http://github.com/sagiegurari/envmnt")
    (synopsis
     "Environment variables utility functions.")
    (description
     "Environment variables utility functions.")
    (license #f)))

(define-public rust-atty
  (package
    (name "rust-atty")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atty" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lln6vaczj521qqjbaqnb81w5p6xk4fjfkg33r0m22cm4f3mnzcs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-termion" ,rust-termion)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/softprops/atty")
    (synopsis "A simple interface for querying atty")
    (description
     "This package provides a simple interface for querying atty")
    (license #f)))

(define-public rust-encode-unicode
  (package
    (name "rust-encode-unicode")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "encode_unicode" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g8a8pixkxz6r927f4sc4r15qyc0szxdxb1732v8q7h0di4wkclh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ascii" ,rust-ascii)
        ("rust-clippy" ,rust-clippy))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static))))
    (home-page
     "https://github.com/tormol/encode_unicode")
    (synopsis
     "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.")
    (description
     "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.")
    (license #f)))

(define-public rust-ucd-trie
  (package
    (name "rust-ucd-trie")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ucd-trie" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xwxkg0fyclbz8fl99iidq4gaw2jjngf8c6c8kqnqhkpzsqwbabi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static))))
    (home-page "https://github.com/BurntSushi/rucd")
    (synopsis
     "A trie for storing Unicode codepoint sets and maps.")
    (description
     "This package provides a trie for storing Unicode codepoint sets and maps.")
    (license #f)))

(define-public rust-pest-generator
  (package
    (name "rust-pest-generator")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest_generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ipnv77lqhj4d4fpfxi8m168lcjp482kszaknlardmpgqiv0a4k3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-pest" ,rust-pest)
        ("rust-pest-meta" ,rust-pest-meta)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page "https://pest-parser.github.io/")
    (synopsis "pest code generator")
    (description "pest code generator")
    (license #f)))

(define-public rust-ascii
  (package
    (name "rust-ascii")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ascii" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dck6rsjnxlczyjnncn8hf16bxj42m1vi6s2n32c1jg2ijd9dz55"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-quickcheck" ,rust-quickcheck)
        ("rust-serde" ,rust-serde)
        ("rust-serde-test" ,rust-serde-test))))
    (home-page
     "https://github.com/tomprogrammer/rust-ascii")
    (synopsis
     "ASCII-only equivalents to `char`, `str` and `String`.")
    (description
     "ASCII-only equivalents to `char`, `str` and `String`.")
    (license #f)))

(define-public rust-pest-meta
  (package
    (name "rust-pest-meta")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pest_meta" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kaprdz3jis9bjfwhri1zncbsvack5m3gx2g5flspdy7wxnyljgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-maplit" ,rust-maplit)
        ("rust-pest" ,rust-pest))
       #:cargo-development-inputs
       (("rust-sha-1" ,rust-sha-1))))
    (home-page "https://pest-parser.github.io/")
    (synopsis
     "pest meta language parser and validator")
    (description
     "pest meta language parser and validator")
    (license #f)))

(define-public rust-maplit
  (package
    (name "rust-maplit")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "maplit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hsczmvd6zkqgzqdjp5hfyg7f339n68w83n4pxvnsszrzssbdjq8"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/maplit")
    (synopsis
     "Collection â\x80\x9cliteralâ\x80\x9d macros for HashMap, HashSet, BTreeMap, and BTreeSet.")
    (description
     "Collection â\x80\x9cliteralâ\x80\x9d macros for HashMap, HashSet, BTreeMap, and BTreeSet.")
    (license #f)))

(define-public rust-ref-cast
  (package
    (name "rust-ref-cast")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jgj1zxaikqm030flpifbp517fy4z21lly6ysbwyciii39bkzcf1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ref-cast-impl" ,rust-ref-cast-impl))))
    (home-page "https://github.com/dtolnay/ref-cast")
    (synopsis
     "Safely cast &T to &U where the struct U contains a single field of type T.")
    (description
     "Safely cast &T to &U where the struct U contains a single field of type T.")
    (license #f)))

(define-public rust-ref-cast-impl
  (package
    (name "rust-ref-cast-impl")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ref-cast-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hw0frpzna5rf5szix56zyzd0vackcb3svj94ndj629xi75dkb32"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page "https://github.com/dtolnay/ref-cast")
    (synopsis
     "Derive implementation for ref_cast::RefCast.")
    (description
     "Derive implementation for ref_cast::RefCast.")
    (license #f)))

(define-public rust-winapi-build
  (package
    (name "rust-winapi-build")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winapi-build" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g4rqsgjky0a7530qajn2bbfcrl2v0zb39idgdws9b1l7gp5wc9d"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Common code for build.rs in WinAPI -sys crates.")
    (description
     "Common code for build.rs in WinAPI -sys crates.")
    (license #f)))

(define-public rust-pcre2-sys
  (package
    (name "rust-pcre2-sys")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pcre2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nwdvc43dkb89qmm5q8gw1zyll0wsfqw7kczpn23mljra3874v47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-pkg-config" ,rust-pkg-config))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/BurntSushi/rust-pcre2")
    (synopsis "Low level bindings to PCRE2.")
    (description "Low level bindings to PCRE2.")
    (license #f)))

(define-public rust-bindgen
  (package
    (name "rust-bindgen")
    (version "0.50.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1k4n1d002vrfn1mlpww3ib7f275yn4rpxfwkqpr9bym27zg17ab5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags)
        ("rust-cexpr" ,rust-cexpr)
        ("rust-cfg-if" ,rust-cfg-if)
        ("rust-clang-sys" ,rust-clang-sys)
        ("rust-clap" ,rust-clap)
        ("rust-env-logger" ,rust-env-logger)
        ("rust-fxhash" ,rust-fxhash)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-peeking-take-while"
         ,rust-peeking-take-while)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-regex" ,rust-regex)
        ("rust-shlex" ,rust-shlex)
        ("rust-which" ,rust-which))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap)
        ("rust-diff" ,rust-diff)
        ("rust-shlex" ,rust-shlex))))
    (home-page
     "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license #f)))

(define-public rust-cmake
  (package
    (name "rust-cmake")
    (version "0.1.40")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cmake" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1w0zgqdbbhl9w6px7avc6d5p43clglrmjfdn2n26mdsli5n3i91c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/alexcrichton/cmake-rs")
    (synopsis
     "A build dependency for running `cmake` to build a native library")
    (description
     "This package provides a build dependency for running `cmake` to build a native library")
    (license #f)))

(define-public rust-cexpr
  (package
    (name "rust-cexpr")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cexpr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1by64ini3f058pwad3immx5cc12wr0m0kwgaxa8apzym03mj9ym7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nom" ,rust-nom))
       #:cargo-development-inputs
       (("rust-clang-sys" ,rust-clang-sys))))
    (home-page
     "https://github.com/jethrogb/rust-cexpr")
    (synopsis "A C expression parser and evaluator")
    (description
     "This package provides a C expression parser and evaluator")
    (license #f)))

(define-public rust-clang-sys
  (package
    (name "rust-clang-sys")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clang-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m8h56yjwv19pbah4lrhmb8js9mhx6hi5gk0y4zzix89xjf2c9s2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-glob" ,rust-glob)
        ("rust-libc" ,rust-libc)
        ("rust-libloading" ,rust-libloading))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob))))
    (home-page
     "https://github.com/KyleMayes/clang-sys")
    (synopsis "Rust bindings for libclang.")
    (description "Rust bindings for libclang.")
    (license #f)))

(define-public rust-fxhash
  (package
    (name "rust-fxhash")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fxhash" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "037mb9ichariqi45xm6mz0b11pa92gj38ba0409z3iz239sns6y3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv)
        ("rust-seahash" ,rust-seahash))))
    (home-page "https://github.com/cbreeden/fxhash")
    (synopsis
     "A fast, non-secure, hashing algorithm derived from an internal hasher used in FireFox and Rustc.")
    (description
     "This package provides a fast, non-secure, hashing algorithm derived from an internal hasher used in FireFox and Rustc.")
    (license #f)))

(define-public rust-peeking-take-while
  (package
    (name "rust-peeking-take-while")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "peeking_take_while" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16bhqr6rdyrp12zv381cxaaqqd0pwysvm1q8h2ygihvypvfprc8r"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/fitzgen/peeking_take_while")
    (synopsis
     "Like `Iterator::take_while`, but calls the predicate on a peeked value. This allows you to use `Iterator::by_ref` and `Iterator::take_while` together, and still get the first value for which the `take_while` predicate returned false after dropping the `by_ref`.")
    (description
     "Like `Iterator::take_while`, but calls the predicate on a peeked value.  This allows you to use `Iterator::by_ref` and `Iterator::take_while` together, and still get the first value for which the `take_while` predicate returned false after dropping the `by_ref`.")
    (license #f)))

(define-public rust-shlex
  (package
    (name "rust-shlex")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "shlex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1lmv6san7g8dv6jdfp14m7bdczq9ss7j7bgsfqyqjc3jnjfippvz"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/comex/rust-shlex")
    (synopsis
     "Split a string into shell words, like Python's shlex.")
    (description
     "Split a string into shell words, like Python's shlex.")
    (license #f)))

(define-public rust-nom
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
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-lexical-core" ,rust-lexical-core)
        ("rust-memchr" ,rust-memchr)
        ("rust-regex" ,rust-regex))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion)
        ("rust-doc-comment" ,rust-doc-comment)
        ("rust-jemallocator" ,rust-jemallocator)
        ("rust-version-check" ,rust-version-check))))
    (home-page "https://github.com/Geal/nom")
    (synopsis
     "A byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library")
    (license #f)))

(define-public rust-libloading
  (package
    (name "rust-libloading")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libloading" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0682nn0g7zias4dcgsrk0vlrpvlav70fbcqq85yf48qqnn12ysd5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/nagisa/rust_libloading/")
    (synopsis
     "A safer binding to platformâ\x80\x99s dynamic library loading utilities")
    (description
     "This package provides a safer binding to platformâ\x80\x99s dynamic library loading utilities")
    (license #f)))

(define-public rust-jemallocator
  (package
    (name "rust-jemallocator")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jemallocator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0sabfa5118b7l4ars5n36s2fjyfn59w4d6mjs6rrmsa5zky67bj3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-jemalloc-sys" ,rust-jemalloc-sys)
        ("rust-libc" ,rust-libc))
       #:cargo-development-inputs
       (("rust-paste" ,rust-paste))))
    (home-page
     "https://github.com/gnzlbg/jemallocator")
    (synopsis
     "A Rust allocator backed by jemalloc")
    (description
     "This package provides a Rust allocator backed by jemalloc")
    (license #f)))

(define-public rust-lexical-core
  (package
    (name "rust-lexical-core")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lexical-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gr5y3ykghd3wjc00l3iizkj1dxylyhwi6fj6yn2qg06nzx771iz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-dtoa" ,rust-dtoa)
        ("rust-ryu" ,rust-ryu)
        ("rust-stackvector" ,rust-stackvector)
        ("rust-static-assertions"
         ,rust-static-assertions))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx)
        ("rust-proptest" ,rust-proptest)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rustc-version" ,rust-rustc-version))))
    (home-page
     "https://github.com/Alexhuszagh/rust-lexical/tree/master/lexical-core")
    (synopsis
     "Lexical, to- and from-string conversion routines.")
    (description
     "Lexical, to- and from-string conversion routines.")
    (license #f)))

(define-public rust-dtoa
  (package
    (name "rust-dtoa")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dtoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0phbm7i0dpn44gzi07683zxaicjap5064w62pidci4fhhciv8mza"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/dtolnay/dtoa")
    (synopsis
     "Fast functions for printing floating-point primitives to an io::Write")
    (description
     "Fast functions for printing floating-point primitives to an io::Write")
    (license #f)))

(define-public rust-static-assertions
  (package
    (name "rust-static-assertions")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "static_assertions" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hdj6cxknz53vxnf7szpifs16rk4l3x0n0i4bzmm6li1v8vdxy5l"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/nvzqz/static-assertions-rs")
    (synopsis
     "Compile-time assertions to ensure that invariants are met.")
    (description
     "Compile-time assertions to ensure that invariants are met.")
    (license #f)))

(define-public rust-stackvector
  (package
    (name "rust-stackvector")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stackvector" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bv820fhdad16islwli1g3iksk39ivf0zaqz4j1m08vq15jjaiqw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unreachable" ,rust-unreachable))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version))))
    (home-page
     "https://github.com/Alexhuszagh/rust-stackvector")
    (synopsis
     "StackVec: vector-like facade for stack-allocated arrays.")
    (description
     "StackVec: vector-like facade for stack-allocated arrays.")
    (license #f)))

(define-public rust-unreachable
  (package
    (name "rust-unreachable")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unreachable" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mps2il4xy2mjqc3appas27hhn2xmvixc3bzzhfrjj74gy3i0a1q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-void" ,rust-void))))
    (home-page
     "https://github.com/reem/rust-unreachable.git")
    (synopsis
     "An unreachable code optimization hint in stable rust.")
    (description
     "An unreachable code optimization hint in stable rust.")
    (license #f)))

(define-public rust-void
  (package
    (name "rust-void")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "void" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zc8f0ksxvmhvgx4fdg0zyn6vdnbxd2xv9hfx4nhzg6kbs4f80ka"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/reem/rust-void.git")
    (synopsis
     "The uninhabited void type for use in statically impossible cases.")
    (description
     "The uninhabited void type for use in statically impossible cases.")
    (license #f)))

(define-public rust-c2-chach
  (package
    (name "rust-c2-chacha")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "c2-chacha" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00a11qdc8mg3z0k613rhprkc9p6xz0y7b1681x32ixg0hr3x0r3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-ppv-lite86" ,rust-ppv-lite86)
        ("rust-stream-cipher" ,rust-stream-cipher))
       #:cargo-development-inputs
       (("rust-hex-literal" ,rust-hex-literal))))
    (home-page
     "https://github.com/cryptocorrosion/cryptocorrosion")
    (synopsis "The ChaCha family of stream ciphers")
    (description
     "The ChaCha family of stream ciphers")
    (license #f)))

(define-public rust-hex-literal
  (package
    (name "rust-hex-literal")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-literal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ni2nv3di0jpih2xnmlnr6s96zypkdr8xrw2cvk4f8fx5wb6inn3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-hex-literal-impl" ,rust-hex-literal-impl)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Procedural macro for converting hexadecimal string to byte array at compile time.")
    (description
     "Procedural macro for converting hexadecimal string to byte array at compile time.")
    (license #f)))

(define-public rust-hex-literal-impl
  (package
    (name "rust-hex-literal-impl")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex-literal-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04m6d1k57a9h3hhdgn0vq1hkfwjv9hfkw6q73bqn0my0qw45s286"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Internal implementation of the hex-literal crate")
    (description
     "Internal implementation of the hex-literal crate")
    (license #f)))

(define-public rust-ppv-lite86
  (package
    (name "rust-ppv-lite86")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ppv-lite86" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06snnv338w341nicfqba2jgln5dsla72ndkgrw7h1dfdb3vgkjz3"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/cryptocorrosion/cryptocorrosion")
    (synopsis
     "Implementation of the crypto-simd API for x86")
    (description
     "Implementation of the crypto-simd API for x86")
    (license #f)))

(define-public rust-c2-chacha
  (package
    (name "rust-c2-chacha")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "c2-chacha" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00a11qdc8mg3z0k613rhprkc9p6xz0y7b1681x32ixg0hr3x0r3x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-ppv-lite86" ,rust-ppv-lite86)
        ("rust-stream-cipher" ,rust-stream-cipher))
       #:cargo-development-inputs
       (("rust-hex-literal" ,rust-hex-literal))))
    (home-page
     "https://github.com/cryptocorrosion/cryptocorrosion")
    (synopsis "The ChaCha family of stream ciphers")
    (description
     "The ChaCha family of stream ciphers")
    (license #f)))

(define-public rust-stream-cipher
  (package
    (name "rust-stream-cipher")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stream-cipher" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1g1nd8r6pph70rzk5yyvg7a9ji7pkap9ddiqpp4v9xa9ys0bqqc8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-blobby" ,rust-blobby)
        ("rust-generic-array" ,rust-generic-array))))
    (home-page
     "https://github.com/RustCrypto/traits")
    (synopsis "Stream cipher traits")
    (description "Stream cipher traits")
    (license #f)))

(define-public rust-blobby
  (package
    (name "rust-blobby")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blobby" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xicpf3s2mi5xqnx8ps5mdych4ib5nh2nfsbrsg8ar8bjk1girbg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-hex" ,rust-hex))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Iterator over simple binary blob storage")
    (description
     "Iterator over simple binary blob storage")
    (license #f)))

(define-public rust-generic-array
  (package
    (name "rust-generic-array")
    (version "0.13.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "generic-array" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kddwxpd58y807y1r3lijg7sw3gxm6nczl6wp57gamhv6mhygl8f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-typenum" ,rust-typenum))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode)
        ("rust-serde-json" ,rust-serde-json))))
    (home-page
     "https://github.com/fizyk20/generic-array.git")
    (synopsis
     "Generic types implementing functionality of arrays")
    (description
     "Generic types implementing functionality of arrays")
    (license #f)))

(define-public rust-generic-array-0.12.3
  (package
    (inherit rust-generic-array)
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "generic-array" version))
       (file-name
        (string-append (package-name rust-generic-array) "-" version ".tar.gz"))
       (sha256
        (base32
         "1v5jg7djicq34nbiv1dwaki71gkny002wyy9qfn3y0hfmrs053y6"))))))

(define-public rust-hex
  (package
    (name "rust-hex")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xsdcjiik5j750j67zk42qdnmm4ahirk3gmkmcqgq7qls2jjcl40"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/KokaKiwi/rust-hex")
    (synopsis
     "Encoding and decoding data into/from hexadecimal representation.")
    (description
     "Encoding and decoding data into/from hexadecimal representation.")
    (license #f)))

(define-public rust-typenum
  (package
    (name "rust-typenum")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typenum" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0sc1jirllfhdi52z1xv9yqzxzpk6v7vadd13n7wvs1wnjipn6bb1"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/paholg/typenum")
    (synopsis
     "Typenum is a Rust library for type-level numbers evaluated at compile time. It currently supports bits, unsigned integers, and signed integers. It also provides a type-level array of type-level numbers, but its implementation is incomplete.")
    (description
     "Typenum is a Rust library for type-level numbers evaluated at compile time.  It currently supports bits, unsigned integers, and signed integers.  It also provides a type-level array of type-level numbers, but its implementation is incomplete.")
    (license #f)))

(define-public rust-wasm-bindgen-macro
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.48")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07fqzzlbncccmnxbbkg9v4n53qc1lps5g0bb9wq3i9zp9gvm0zgh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-quote" ,rust-quote)
        ("rust-wasm-bindgen-macro-support"
         ,rust-wasm-bindgen-macro-support))
       #:cargo-development-inputs
       (("rust-trybuild" ,rust-trybuild)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (description
     "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (license #f)))

(define-public rust-trybuild
  (package
    (name "rust-trybuild")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trybuild" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0df6ipayif05xn61iavdb0dcshm9y6wmcd140pp7dl91mirygs7j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-glob" ,rust-glob)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-termcolor" ,rust-termcolor)
        ("rust-toml" ,rust-toml))))
    (home-page "https://github.com/dtolnay/trybuild")
    (synopsis
     "Test harness for ui tests of compiler diagnostics")
    (description
     "Test harness for ui tests of compiler diagnostics")
    (license #f)))

(define-public rust-wasm-bindgen-macro-support
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.48")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-macro-support" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mxi6rj11k67sks88pfqiqylnijxmb1s0gcgpj8mzfj5gvkqzkwm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn)
        ("rust-wasm-bindgen-backend"
         ,rust-wasm-bindgen-backend)
        ("rust-wasm-bindgen-shared"
         ,rust-wasm-bindgen-shared))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate")
    (description
     "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate")
    (license #f)))

(define-public rust-wasm-bindgen-backend
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.48")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-backend" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qxqkbjkjg4pphhcr91nk95c0gizx77dyq24mmijqnwzxxqc30jx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bumpalo" ,rust-bumpalo)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn)
        ("rust-wasm-bindgen-shared"
         ,rust-wasm-bindgen-shared))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Backend code generation of the wasm-bindgen tool")
    (description
     "Backend code generation of the wasm-bindgen tool")
    (license #f)))

(define-public rust-wasm-bindgen
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.48")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08rnfhjyk0f6liv8n4rdsvhx7r02glkhcbj2lp9lcbkbfpad9hnr"))))
    (build-system cargo-build-system)
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Shared support between wasm-bindgen and wasm-bindgen cli")
    (description
     "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (license #f)))

(define-public rust-bumpalo
  (package
    (name "rust-bumpalo")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bumpalo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "018b5calz3895v04shk9bn7i73r4zf8yf7p1dqg92s3xya13vm1c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-criterion" ,rust-criterion)
        ("rust-quickcheck" ,rust-quickcheck))))
    (home-page "https://github.com/fitzgen/bumpalo")
    (synopsis
     "A fast bump allocation arena for Rust.")
    (description
     "This package provides a fast bump allocation arena for Rust.")
    (license #f)))

(define-public rust-foreign-types
  (package
    (name "rust-foreign-types")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ca4i38yrf9iy5k47lr1ylb3rvcbn36d81k5pr5kzf6kmj6p111n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-foreign-types-macros"
         ,rust-foreign-types-macros)
        ("rust-foreign-types-shared"
         ,rust-foreign-types-shared))))
    (home-page
     "https://github.com/sfackler/foreign-types")
    (synopsis
     "A framework for Rust wrappers over C APIs")
    (description
     "This package provides a framework for Rust wrappers over C APIs")
    (license #f)))

(define-public rust-foreign-types-macros
  (package
    (name "rust-foreign-types-macros")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16yjigjcsklcwy2ad32l24k1nwm9n3bsnyhxc3z9whjbsrj60qk6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2)
        ("rust-quote" ,rust-quote)
        ("rust-syn" ,rust-syn))))
    (home-page
     "https://github.com/sfackler/foreign-types")
    (synopsis
     "An internal crate used by foreign-types")
    (description
     "An internal crate used by foreign-types")
    (license #f)))

(define-public rust-foreign-types-shared
  (package
    (name "rust-foreign-types-shared")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types-shared" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kanxlif1vp0ffh2r9l610jqbkmb3183yqykxq1z5w1vay2rn7y6"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/sfackler/foreign-types")
    (synopsis
     "An internal crate used by foreign-types")
    (description
     "An internal crate used by foreign-types")
    (license #f)))

(define-public rust-json
  (package
    (name "rust-json")
    (version "0.11.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "json" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hj8c6xj5c2aqqszi8naaflmcdbya1i9byyjrq4iybxjb4q91mq1"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/maciejhirsz/json-rust")
    (synopsis "JSON implementation in Rust")
    (description "JSON implementation in Rust")
    (license #f)))

(define-public rust-bytes
  (package
    (name "rust-bytes")
    (version "0.4.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0768a55q2fsqdjsvcv98ndg9dq7w2g44dvq1avhwpxrdzbydyvr0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder)
        ("rust-either" ,rust-either)
        ("rust-iovec" ,rust-iovec)
        ("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test))))
    (home-page "https://github.com/carllerche/bytes")
    (synopsis
     "Types and traits for working with bytes")
    (description
     "Types and traits for working with bytes")
    (license #f)))

(define-public rust-scopeguard
  (package
    (name "rust-scopeguard")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "scopeguard" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03aay84r1f6w87ckbpj6cc4rnsxkxcfs13n5ynxjia0qkgjiabml"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/scopeguard")
    (synopsis
     "A RAII scope guard that will run a given closure when it goes out of scope")
    (description
     "This package provides a RAII scope guard that will run a given closure when it goes out of scope,
even if the code between panics (assuming unwinding panic).

Defines the macros `defer!`, `defer_on_unwind!`, `defer_on_success!` as
shorthands for guards with one of the implemented strategies.")
    (license #f)))

(define-public rust-half
  (package
    (name "rust-half")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "half" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0diqajg3mgar511hxswl4kgqqz9a026yvn3103x5h2smknlc4lwk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde))))
    (home-page
     "https://github.com/starkat99/half-rs")
    (synopsis
     "Half-precision floating point f16 type for Rust implementing the IEEE 754-2008 binary16 type")
    (description
     "Half-precision floating point f16 type for Rust implementing the IEEE 754-2008 binary16 type.")
    (license #f)))

(define-public rust-sha-1
  (package
    (name "rust-sha-1")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha-1" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s6fdy5wp3x4h2z4fcl2d9vjvrpzr87v4h49r51xcq8nm4qj35i3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-block-buffer" ,rust-block-buffer)
        ("rust-digest" ,rust-digest)
        ("rust-fake-simd" ,rust-fake-simd)
        ("rust-opaque-debug" ,rust-opaque-debug)
        ("rust-sha1-asm" ,rust-sha1-asm))
       #:cargo-development-inputs
       (("rust-digest" ,rust-digest)
        ("rust-hex-literal" ,rust-hex-literal))))
    (home-page
     "https://github.com/RustCrypto/hashes")
    (synopsis "SHA-1 hash function")
    (description "SHA-1 hash function")
    (license #f)))

(define-public rust-block-buffer
  (package
    (name "rust-block-buffer")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block-buffer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12v8wizynqin0hqf140kmp9s38q223mp1b0hkqk8j5pk8720v560"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-block-padding" ,rust-block-padding)
        ("rust-byte-tools" ,rust-byte-tools)
        ("rust-byteorder" ,rust-byteorder)
        ("rust-generic-array" ,rust-generic-array-0.12.3))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Fixed size buffer for block processing of data")
    (description
     "Fixed size buffer for block processing of data")
    (license #f)))

(define-public rust-digest
  (package
    (name "rust-digest")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "digest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1madjl27f3kj5ql7kwgvb9c8b7yb7bv7yfgx7rqzj4i3fp4cil7k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-blobby" ,rust-blobby)
        ("rust-generic-array" ,rust-generic-array))))
    (home-page
     "https://github.com/RustCrypto/traits")
    (synopsis
     "Traits for cryptographic hash functions")
    (description
     "Traits for cryptographic hash functions")
    (license #f)))

(define-public rust-fake-simd
  (package
    (name "rust-fake-simd")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fake-simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vfylvk4va2ivqx85603lyqqp0zk52cgbs4n5nfbbbqx577qm2p8"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Crate for mimicking simd crate on stable Rust")
    (description
     "Crate for mimicking simd crate on stable Rust")
    (license #f)))

(define-public rust-sha1-asm
  (package
    (name "rust-sha1-asm")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha1-asm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i1i8viy6y30mv9v5hwhg9w6b722qkyh9c6n8bn4d27jpv14pg0s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-cc" ,rust-cc))))
    (home-page
     "https://github.com/RustCrypto/asm-hashes")
    (synopsis
     "Assembly implementation of SHA-1 compression function")
    (description
     "Assembly implementation of SHA-1 compression function")
    (license #f)))

(define-public rust-block-padding
  (package
    (name "rust-block-padding")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block-padding" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02fz9wx5dmgpc79ndrb9xfxqlrkk7lg5wki2blz2zqg27spw6kbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byte-tools" ,rust-byte-tools))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Padding and unpadding of messages divided into blocks.")
    (description
     "Padding and unpadding of messages divided into blocks.")
    (license #f)))

(define-public rust-byte-tools
  (package
    (name "rust-byte-tools")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byte-tools" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mqi29wsm8njpl51pfwr31wmpzs5ahlcb40wsjyd92l90ixcmdg3"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Bytes related utility functions")
    (description "Bytes related utility functions")
    (license #f)))

(define-public rust-cloudabi
  (package
    (name "rust-cloudabi")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cloudabi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kxcg83jlihy0phnd2g8c2c303px3l2p3pkjz357ll6llnd5pz6x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags))))
    (home-page "https://nuxi.nl/cloudabi/")
    (synopsis
     "Low level interface to CloudABI")
    (description
     "Low level interface to CloudABI.  Contains all syscalls and related types.")
    (license #f)))

(define-public rust-petgraph
  (package
    (name "rust-petgraph")
    (version "0.4.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "petgraph" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kyfmca854s54jk26g2x1kjb04c3k7cjilaxyr0if8lhxv8mjdlw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fixedbitset" ,rust-fixedbitset)
        ("rust-ordermap" ,rust-ordermap)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))
       #:cargo-development-inputs
       (("rust-defmac" ,rust-defmac)
        ("rust-itertools" ,rust-itertools)
        ("rust-odds" ,rust-odds)
        ("rust-rand" ,rust-rand))))
    (home-page "https://github.com/bluss/petgraph")
    (synopsis
     "Graph data structure library")
    (description
     "Graph data structure library.  Provides graph types and graph algorithms.")
    (license #f)))

(define-public rust-fixedbitset
  (package
    (name "rust-fixedbitset")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fixedbitset" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0czam11mi80dbyhf4rd4lz0ihcf7vkfchrdcrn45wbs0h40dxm46"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/bluss/fixedbitset")
    (synopsis
     "FixedBitSet is a simple bitset collection")
    (description
     "FixedBitSet is a simple bitset collection")
    (license #f)))

(define-public rust-ordermap
  (package
    (name "rust-ordermap")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordermap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1m0vxmlm1x92m1ydgpddzg5mrfk3ddy8gk3r9dmpml18qrs9ch4i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv)
        ("rust-itertools" ,rust-itertools)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-quickcheck" ,rust-quickcheck)
        ("rust-rand" ,rust-rand)
        ("rust-serde-test" ,rust-serde-test))))
    (home-page "https://github.com/bluss/ordermap")
    (synopsis
     "A hash table with consistent order and fast iteration. NOTE: This crate was renamed to indexmap. Please use it under its new name.")
    (description
     "This package provides a hash table with consistent order and fast iteration.  NOTE: This crate was renamed to indexmap.  Please use it under its new name.")
    (license #f)))

(define-public rust-defmac
  (package
    (name "rust-defmac")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "defmac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01ff3jdmcc5waffkwllndnx5hsn414r7x1rq4ib73n7awsyzxkxv"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/defmac")
    (synopsis
     "A macro to define lambda-like macros inline.")
    (description
     "This package provides a macro to define lambda-like macros inline.")
    (license #f)))

(define-public rust-odds
  (package
    (name "rust-odds")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "odds" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rdnxa0na4897yb0svb3figz35g4imxjv61yfm2j21gbh5q8v8d9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rawpointer" ,rust-rawpointer)
        ("rust-rawslice" ,rust-rawslice)
        ("rust-unchecked-index" ,rust-unchecked-index))
       #:cargo-development-inputs
       (("rust-itertools" ,rust-itertools)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-memchr" ,rust-memchr)
        ("rust-quickcheck" ,rust-quickcheck))))
    (home-page "https://github.com/bluss/odds")
    (synopsis
     "Odds and ends â\x80\x94 collection miscellania. Extra functionality for slices (`.find()`, `RevSlice`), strings and other things. Things in odds may move to more appropriate crates if we find them.
")
    (description
     "Odds and ends â\x80\x94 collection miscellania.  Extra functionality for slices (`.find()`, `RevSlice`), strings and other things.  Things in odds may move to more appropriate crates if we find them.
")
    (license #f)))

(define-public rust-rawpointer
  (package
    (name "rust-rawpointer")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rawpointer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06ghpm9y7gacks78s3maakha07kbnwrxif5q37r2l7z1sali3b7b"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/bluss/rawpointer/")
    (synopsis
     "Extra methods for raw pointers.

For example `.post_inc()` and `.pre_dec()` (c.f. `ptr++` and `--ptr`) and
`ptrdistance`.
")
    (description
     "Extra methods for raw pointers.

For example `.post_inc()` and `.pre_dec()` (c.f. `ptr++` and `--ptr`) and
`ptrdistance`.
")
    (license #f)))

(define-public rust-rawslice
  (package
    (name "rust-rawslice")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rawslice" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09bympww1rpsd422da3w444q5w1znjbjh7mjninhq9gaaygkpci2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rawpointer" ,rust-rawpointer))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck))))
    (home-page "https://github.com/bluss/rawslice/")
    (synopsis
     "Reimplementation of the slice iterators, with extra features")
    (description
     "Reimplementation of the slice iterators, with extra features.  For example
creation from raw pointers and start, end pointer accessors.
")
    (license #f)))

(define-public rust-unchecked-index
  (package
    (name "rust-unchecked-index")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unchecked-index" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p6qcai1mjayx59cpgk27d0zgw9hz9r1ira5jiqil66f4ba8dfpf"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/bluss/unchecked-index")
    (synopsis
     "Unchecked indexing wrapper using regular index syntax")
    (description
     "Unchecked indexing wrapper using regular index syntax.")
    (license #f)))

(define-public rust-owning-ref
  (package
    (name "rust-owning-ref")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "owning_ref" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04zgwy77lin8qz398s6g44467pd6kjhbrlqifkia5rkr47mbi929"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-stable-deref-trait"
         ,rust-stable-deref-trait))))
    (home-page
     "https://github.com/Kimundi/owning-ref-rs")
    (synopsis
     "A library for creating references that carry their owner with them")
    (description
     "This package provides a library for creating references that carry their owner with them.")
    (license #f)))

(define-public rust-crossbeam
  (package
    (name "rust-crossbeam")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g5jysq5x4gndc1v5sq9n3f1m97k7qihwdpigw6ar6knj14qm09d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if)
        ("rust-crossbeam-channel"
         ,rust-crossbeam-channel)
        ("rust-crossbeam-deque" ,rust-crossbeam-deque)
        ("rust-crossbeam-epoch" ,rust-crossbeam-epoch)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/crossbeam-rs/crossbeam")
    (synopsis "Tools for concurrent programming")
    (description "Tools for concurrent programming")
    (license #f)))

(define-public rust-nodrop-union
  (package
    (name "rust-nodrop-union")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nodrop-union" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jsnkdn9l8jlmb9h4wssi76sxnyxwnyi00p6y1p2gdq7c1gdw2b7"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis
     "A wrapper type to inhibit drop (destructor)")
    (description
     "This package provides a wrapper type to inhibit drop (destructor).  Implementation crate for nodrop, the untagged unions implementation (which is unstable / requires nightly) as of this writing.")
    (license #f)))

(define-public rust-rand-jitter
  (package
    (name "rust-rand-jitter")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_jitter" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mnjbfzj97g788jslz0k77bpsg6qjhz676cibk82ibbvgqp4sy43"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc)
        ("rust-log" ,rust-log)
        ("rust-rand-core" ,rust-rand-core)
        ("rust-winapi" ,rust-winapi))))
    (home-page "https://github.com/rust-random/rand")
    (synopsis
     "Random number generator based on timing jitter")
    (description
     "Random number generator based on timing jitter")
    (license #f)))

(define-public rust-rand-jitter-0.1.4
  (package
    (inherit rust-rand-jitter)
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_jitter" version))
       (file-name
        (string-append (package-name rust-rand-jitter) "-" version ".tar.gz"))
       (sha256
        (base32
         "16z387y46bfz3csc42zxbjq89vcr1axqacncvv8qhyy93p4xarhi"))))))

(define-public rust-average
  (package
    (name "rust-average")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "average" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "077wbjzn2hwdjnglp8pjvirvsjgfgbgnlirwh5g2hk14xqx7f57l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-conv" ,rust-conv)
        ("rust-float-ord" ,rust-float-ord)
        ("rust-num-traits" ,rust-num-traits)
        ("rust-serde" ,rust-serde)
        ("rust-serde-big-array" ,rust-serde-big-array)
        ("rust-serde-derive" ,rust-serde-derive))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher)
        ("rust-proptest" ,rust-proptest)
        ("rust-quantiles" ,rust-quantiles)
        ("rust-rand" ,rust-rand)
        ("rust-rand-distr" ,rust-rand-distr)
        ("rust-rand-xoshiro" ,rust-rand-xoshiro)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-streaming-stats" ,rust-streaming-stats))))
    (home-page "https://github.com/vks/average")
    (synopsis "Calculate statistics iteratively")
    (description "Calculate statistics iteratively")
    (license #f)))

(define-public rust-conv
  (package
    (name "rust-conv")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "conv" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "168j1npqrif1yqxbgbk0pdrx9shzhs5ylc5a4xw49b6hbxi11zvq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-custom-derive" ,rust-custom-derive))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck)
        ("rust-winapi" ,rust-winapi))))
    (home-page
     "https://github.com/DanielKeep/rust-conv")
    (synopsis
     "This crate provides a number of conversion traits with more specific semantics than those provided by 'as' or 'From'/'Into'.")
    (description
     "This crate provides a number of conversion traits with more specific semantics than those provided by 'as' or 'From'/'Into'.")
    (license #f)))

(define-public rust-float-ord
  (package
    (name "rust-float-ord")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "float-ord" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kin50365sr3spnbscq43lksymybi99ai9rkqdw90m6vixhlibbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand))))
    (home-page
     "https://github.com/notriddle/rust-float-ord")
    (synopsis
     "A total ordering for floating-point numbers")
    (description
     "This package provides a total ordering for floating-point numbers")
    (license #f)))

(define-public rust-quantiles
  (package
    (name "rust-quantiles")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quantiles" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wjp16a3d4bmldq9w2wds0q4gjz4mnsqac3g38r6ryr6zc9sh3y1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck))))
    (home-page
     "https://github.com/postmates/quantiles")
    (synopsis
     "a collection of approximate quantile algorithms")
    (description
     "a collection of approximate quantile algorithms")
    (license #f)))

(define-public rust-rand-distr
  (package
    (name "rust-rand-distr")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_distr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08drhcw9k4a79pri3rd1vkv7v9cbm6cf4i342nai39f527c58zn3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand" ,rust-rand))
       #:cargo-development-inputs
       (("rust-average" ,rust-average)
        ("rust-rand-pcg" ,rust-rand-pcg))))
    (home-page "https://crates.io/crates/rand_distr")
    (synopsis
     "Sampling from random number distributions")
    (description
     "Sampling from random number distributions")
    (license #f)))

(define-public rust-streaming-stats
  (package
    (name "rust-streaming-stats")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "streaming-stats" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0l7xz4g6709s80zqpvlhrg0qhgz64r94cwhmfsg8xhabgznbp2px"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits))))
    (home-page
     "https://github.com/BurntSushi/rust-stats")
    (synopsis
     "Experimental crate for computing basic statistics on streams")
    (description
     "Experimental crate for computing basic statistics on streams.")
    (license #f)))

(define-public rust-custom-derive
  (package
    (name "rust-custom-derive")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "custom_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f81bavw1wnykwh21hh4yyzigs6zl6f6pkk9p3car8kq95yfb2pg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize))))
    (home-page
     "https://github.com/DanielKeep/rust-custom-derive/tree/custom_derive-master")
    (synopsis
     "This crate provides a macro that enables the use of custom derive attributes")
    (description
     "(Note: superseded by `macro-attr`) This crate provides a macro that enables the use of custom derive attributes.")
    (license #f)))

(define-public rust-fuchsia-cprng
  (package
    (name "rust-fuchsia-cprng")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fuchsia-cprng" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fnkqrbz7ixxzsb04bsz9p0zzazanma8znfdqjvh39n14vapfvx0"))))
    (build-system cargo-build-system)
    (home-page
     "https://fuchsia.googlesource.com/fuchsia/+/master/garnet/public/rust/fuchsia-cprng")
    (synopsis
     "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator")
    (description
     "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator")
    (license #f)))

(define-public rust-rdrand-0.4
  (package
    (name "rust-rdrand")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rdrand" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cjq0kwx1bk7jx3kzyciiish5gqsj7620dm43dc52sr8fzmm9037"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core))))
    (home-page
     "https://github.com/nagisa/rust_rdrand/")
    (synopsis
     "An implementation of random number generator based on rdrand and rdseed instructions")
    (description
     "An implementation of random number generator based on rdrand and rdseed instructions")
    (license #f)))

(define-public rust-wasm
  (package
    (name "rust-wasm")
    (version "0.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "136d50gyi3l4nzr9mv0j3p2p50ywdqzf59kkyj33zmcbxmwi42zs"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis "WASM tools")
    (description "WASM tools")
    (license #f)))

(define-public rust-opaque-debug
  (package
    (name "rust-opaque-debug")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "opaque-debug" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "02942l2gc7w5r4js7i9063x99szic5mzzk1055j83v4diqpbpxck"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Macro for opaque Debug trait implementation")
    (description
     "Macro for opaque Debug trait implementation")
    (license #f)))

(define-public rust-clap
  (package
    (name "rust-clap")
    (version "2.33.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nf6ld3bims1n5vfzhkvcb55pdzh04bbhzf8nil5vvw05nxzarsh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term)
        ("rust-atty" ,rust-atty)
        ("rust-bitflags" ,rust-bitflags)
        ("rust-clippy" ,rust-clippy)
        ("rust-strsim" ,rust-strsim-0.8)
        ("rust-term-size" ,rust-term-size-0.3)
        ("rust-textwrap" ,rust-textwrap)
        ("rust-unicode-width" ,rust-unicode-width)
        ("rust-vec-map" ,rust-vec-map)
        ("rust-yaml-rust" ,rust-yaml-rust-0.3))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static)
        ("rust-regex" ,rust-regex)
        ("rust-version-sync" ,rust-version-sync))))
    (home-page "https://clap.rs/")
    (synopsis
     "simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured
Command Line Argument Parser.")
    (license #f)))

(define-public rust-insta
  (package
    (name "rust-insta")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "insta" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17rvqw9xm61prncbqi3cplphr3l2dl85sljdpyr3fz2mqjgbdfwb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-chrono" ,rust-chrono)
        ("rust-ci-info" ,rust-ci-info-0.3.1)
        ("rust-console" ,rust-console)
        ("rust-difference" ,rust-difference)
        ("rust-failure" ,rust-failure)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-pest" ,rust-pest)
        ("rust-pest-derive" ,rust-pest-derive)
        ("rust-ron" ,rust-ron)
        ("rust-serde" ,rust-serde)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-serde-yaml" ,rust-serde-yaml)
        ("rust-uuid" ,rust-uuid))))
    (home-page "https://github.com/mitsuhiko/insta")
    (synopsis "A snapshot testing library for Rust")
    (description
     "This package provides a snapshot testing library for Rust")
    (license #f)))

(define-public rust-version-check
  (package
    (name "rust-version-check")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "version_check" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kikqlnggii1rvnxrbls55sc46lxvinz5k3giscgncjj4p87b1q7"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis "")
    (description "")
    (license license:expat)))

(define-public rust-version-check-0.1
  (package
    (name "rust-version-check")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "version_check" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pf91pvj8n6akh7w6j5ypka6aqz08b3qpzgs0ak2kjf4frkiljwi"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis "")
    (description "")
    (license license:expat)))

(define-public rust-data-encoding
  (package
    (name "rust-data-encoding")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "data_encoding" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17rvqw9xm61prncbqi3cplphr3l2dl85sljdpyr3fz2mqjgbdfwb"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis "Efficient and customizable data-encoding functions")
    (description
     "Provides little-endian ASCII base-conversion encodings for bases of
size 2, 4, 8, 16, 32, and 64.")
    (license license:expat)))
