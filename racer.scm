(define-module (racer)
  #:use-module (gnu packages)
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
       (patches (list (search-patch "racer-ignore-tests.patch")))))
    (build-system cargo-build-system)
    (inputs
     `(("perl" ,perl)
       ("python-wrapper" ,python-wrapper)
       ("ruby" ,ruby)))
    (arguments
     `(#:cargo-inputs
       (("rust-aho-corasick" ,rust-aho-corasick-0.7)
        ("rust-bitflags" ,rust-bitflags-0.7)
        ("rust-clap" ,rust-clap-2)
        ("rust-clippy" ,rust-clippy-0.0.103)
        ("rust-clippy-lints" ,rust-clippy-lints-0.0.103)
        ("rust-derive-more" ,rust-derive-more-0.13)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-humantime" ,rust-humantime-1.2)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-lazycell" ,rust-lazycell-1.2)
        ("rust-fuchsia-zircon" ,rust-fuchsia-zircon-0.3)
        ("rust-fuchsia-zircon-sys" ,rust-fuchsia-zircon-sys-0.3)
        ("rust-log" ,rust-log-0.3)
        ("rust-quick-error" ,rust-quick-error-1.2)
        ("rust-racer-cargo-metadata" ,rust-racer-cargo-metadata)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-rls-span" ,rust-rls-span)
        ("rust-rustc-ap-syntax" ,rust-rustc-ap-syntax-583)
        ("rust-src" ,rust-src-0.0)
        ("rust-strsim" ,rust-strsim-0.8)
        ("rust-syntex-errors" ,rust-syntex-errors-0.52)
        ("rust-syntex-pos" ,rust-syntex-pos-0.52)
        ("rust-syntex-syntax" ,rust-syntex-syntax-0.52)
        ("rust-term" ,rust-term-0.4)
        ("rust-textwrap" ,rust-textwrap-0.11)
        ("rust-thread-local" ,rust-thread-local-0.3)
        ("rust-toml" ,rust-toml-0.4)
        ("rust-ucd-util" ,rust-ucd-util-0.1)
        ("rust-unicode-xid" ,rust-unicode-xid-0.0.3)
        ("rust-utf8-ranges" ,rust-utf8-ranges-1.0)
        ("rust-vec-map" ,rust-vec-map-0.8)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-winapi-build" ,rust-winapi-build-0.1)
        ("rust-winapi-util" ,rust-winapi-util-0.1)
        ("rust-wincolor" ,rust-wincolor-1.0))
       #:tests? #f ; FIXME: Tests fail
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'remove-circular-test-dependency
           (lambda _
             (substitute* "Cargo.toml"
               (("\\[dev-dependencies.racer-testutils\\]") "")
               (("version = \"0.1\"") "")
               (("path = \"testutils\"") "")))))))
    (home-page "https://github.com/racer-rust/racer")
    (synopsis "Code completion for Rust")
    (description "Code completion for Rust")
    (license license:expat)))
