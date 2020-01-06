(define-module (tokei)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public tokei
  (package
    (name "tokei")
    (version "10.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tokei" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "07f5laqw2k9l3k8wrg9h8p2m5d9hkfxngyacwrn3vs7mlnw8l81m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
        (("rust-clap" ,rust-clap-2)
         ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.4)
         ("rust-dirs" ,rust-dirs-2.0)
         ("rust-encoding-rs-io" ,rust-encoding-rs-io-0.1)
         ("rust-env-logger" ,rust-env-logger-0.7)
         ("rust-grep-searcher" ,rust-grep-searcher-0.1.6)
         ("rust-hex" ,rust-hex-0.4)
         ("rust-ignore" ,rust-ignore-0.4)
         ("rust-log" ,rust-log-0.4)
         ("rust-rayon" ,rust-rayon-1.3)
         ("rust-serde" ,rust-serde-1.0.104)
         ("rust-serde-cbor" ,rust-serde-cbor-0.10.2)
         ("rust-serde-derive" ,rust-serde-derive-1.0.104)
         ("rust-serde-json" ,rust-serde-json-1.0.44)
         ("rust-serde-yaml" ,rust-serde-yaml-0.8.11)
         ("rust-term-size" ,rust-term-size-0.3)
         ("rust-toml" ,rust-toml-0.5.5))
        #:cargo-development-inputs
        (("rust-git2" ,rust-git2-0.11)
         ("rust-handlebars" ,rust-handlebars-2.0)
         ("rust-ignore" ,rust-ignore-0.4)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-serde-json" ,rust-serde-json-1.0.44)
         ("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://tokei.rs")
    (synopsis
      "Count code, quickly")
    (description
      "This package provides a utility that allows you to count code,
quickly.")
    (license (list license:expat license:asl2.0))))

