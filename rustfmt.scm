(define-module (rustfmt)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public rustfmt
  (package
    (name "rustfmt")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustfmt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "003mam2zks9cvafy6ig3q38mbp4pbw1gbi98p5xgpc2dh7nhx57c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-diff" ,rust-diff)
        ("rust-env-logger" ,rust-env-logger-0.4)
        ("rust-getopts" ,rust-getopts)
        ("rust-kernel32-sys" ,rust-kernel32-sys)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log)
        ("rust-regex" ,rust-regex-0.2)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-serde-json" ,rust-serde-json)
        ("rust-strings" ,rust-strings)
        ("rust-syntex-errors" ,rust-syntex-errors)
        ("rust-syntex-syntax" ,rust-syntex-syntax)
        ("rust-term" ,rust-term-0.4)
        ("rust-toml" ,rust-toml-0.4)
        ("rust-unicode-segmentation" ,rust-unicode-segmentation)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/rust-lang-nursery/rustfmt")
    (synopsis
     "Tool to find and fix Rust formatting issues")
    (description
     "Tool to find and fix Rust formatting issues")
    (license #f)))


