(define-module ripgrep
  #:use-module (build system cargo)
  #:use-module (guix download)
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
