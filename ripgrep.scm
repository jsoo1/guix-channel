(define-module (ripgrep)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public ripgrep
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
       (("rust-bstr" ,rust-bstr-0.1)
        ("rust-clap" ,rust-clap-2)
        ("rust-grep" ,rust-grep)
        ("rust-ignore" ,rust-ignore)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-wincolor" ,rust-wincolor)
        ("rust-quote" ,rust-quote-0.6))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page
     "https://github.com/BurntSushi/ripgrep")
    (synopsis
     "Line-oriented search tool")
    (description
     "ripgrep is a line-oriented search tool that recursively searches
your current directory for a regex pattern while respecting your
gitignore rules.  ripgrep has first class support on Windows, macOS
and Linux")
    (license #f)))
