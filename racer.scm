(define-module (racer)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages ruby)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public racer
  (package
    (name "racer")
    (version "2.0.14") ; Versions > 2.1 require nightly rustc
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "racer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hhii43zipg048v1srpv6f8w0xkgfq39blw2w72zabgi8ngp44z7"))
       (patches '("./racer-ignore-tests.patch"))))
    (build-system cargo-build-system)
    (inputs
     `(("perl" ,perl)
       ("python-wrapper" ,python-wrapper)
       ("ruby" ,ruby)
       ("rust-src" ,rust-src)))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.7)
        ("rust-clap" ,rust-clap)
        ("rust-clippy" ,rust-clippy-0.0.103)
        ("rust-clippy-lints" ,rust-clippy-lints-0.0.103)
        ("rust-derive-more" ,rust-derive-more-0.13)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-humantime" ,rust-humantime)
        ("rust-lazy-static" ,rust-lazy-static)
        ("rust-lazycell" ,rust-lazycell)
        ("rust-log" ,rust-log-0.4)
        ("rust-racer-cargo-metadata" ,rust-racer-cargo-metadata)
        ("rust-rls-span" ,rust-rls-span)
        ("rust-rustc-ap-syntax" ,rust-rustc-ap-syntax-583)
        ("rust-syntex-errors" ,rust-syntex-errors-0.52)
        ("rust-syntex-pos" ,rust-syntex-pos-0.52)
        ("rust-syntex-syntax" ,rust-syntex-syntax-0.52)
        ("rust-term" ,rust-term-0.4)
        ("rust-toml" ,rust-toml-0.4)
        ("rust-unicode-xid" ,rust-unicode-xid-0.0.3))
       #:tests? #f ; FIXME: Tests fail
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'remove-circular-test-dependency
           (lambda _
             (substitute* "Cargo.toml"
               (("\\[dev-dependencies.racer-testutils\\]") "")
               (("version = \"0.1\"") "")
               (("path = \"testutils\"") ""))))
         (add-before 'build 'set-rust-src-path
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv
              "RUST_SRC_PATH"
              (string-append (assoc-ref inputs "rust-src") "/src"))
             #t)))))
    (home-page "https://github.com/racer-rust/racer")
    (synopsis "Code completion for Rust")
    (description "Code completion for Rust")
    (license license:expat)))
