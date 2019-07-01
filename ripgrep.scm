(define-module ripgrep
  #:use-module (build system cargo)
  #:use-module (guix download)
  #:use-module ((guix license) #:prefix license:)
  #:use-module (guix packages)
  #:export (ripgrep))

(define ripgrep
  (package
    (name "ripgrep")
    (version "11.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ripgrep" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bn40lz9n08llq615p4qqqbi24zbkf0appfx3zgxg34a86ga9zds"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bstr" ,rust-bstr)
        ("rust-clap" ,rust-clap)
        ("rust-grep" ,rust-grep)
        ("rust-ignore" ,rust-ignore)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-log" ,rust-log)
        ("rust-num-cpus" ,rust-num-cpus)
        ("rust-regex" ,rust-regex)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-termcolor" ,rust-termcolor))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "line-oriented search tool that recursively searches your current directory")
    (description
     "ripgrep is a line-oriented search tool that recursively searches your current
directory for a regex pattern while respecting your gitignore rules.  ripgrep
has first class support on Windows, macOS and Linux")
    (license #f)))

(define rust-bstr
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

(define rust-serde
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

(define rust-clap
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
        ("rust-strsim" ,rust-strsim)
        ("rust-term-size" ,rust-term-size)
        ("rust-textwrap" ,rust-textwrap)
        ("rust-unicode-width" ,rust-unicode-width)
        ("rust-vec-map" ,rust-vec-map)
        ("rust-yaml-rust" ,rust-yaml-rust))
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

(define rust-grep
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

(define rust-ignore
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

(define rust-lazy-static
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

(define rust-log
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

(define rust-num-cpus
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

(define rust-regex
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

(define rust-serde-json
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

(define rust-termcolor
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

(define rust-serde-derive
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

(define rust-spin
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

(define rust-syn
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

(define rust-quote
  (package
    (name "rust-quote")
    (version "0.6.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quote" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nw0klza45hf127kfyrpxsxd5jw2l6h21qxalil3hkr7bnf7kx7s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2))))
    (home-page "https://github.com/dtolnay/quote")
    (synopsis "Quasi-quoting macro quote!(...)")
    (description "Quasi-quoting macro quote!(...)")
    (license #f)))

(define rust-proc-macro2
  (package
    (name "rust-proc-macro2")
    (version "0.4.30")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nd71fl24sys066jrha6j7i34nfkjv44yzw8yww9742wmc8j0gfg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid))
       #:cargo-development-inputs
       (("rust-quote" ,rust-quote))))
    (home-page
     "https://github.com/alexcrichton/proc-macro2")
    (synopsis
     "stable implementation of the upcoming new `proc_macro` API")
    (description
     "This package provides a stable implementation of the upcoming new
`proc_macro` API.  Comes with an option, off by default, to also reimplement
itself in terms of the upstream unstable API.")
    (license #f)))

(define rust-unicode-xid
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
