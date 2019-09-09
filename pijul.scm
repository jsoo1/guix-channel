(define-module (pijul)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public pijul
  (package
    (name "pijul")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pijul" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12aqpfd2si70qbvfnn9kvznxyd5g5gsb1kk1q52wm077cd03yapr"))))
    (build-system cargo-build-system)
    (inputs
     `(("clang" ,clang)
       ("libressl" ,libressl)
       ("libsodium" ,libsodium)))
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty)
        ("rust-base64" ,rust-base64)
        ("rust-bincode" ,rust-bincode)
        ("rust-bs58" ,rust-bs58)
        ("rust-chrono" ,rust-chrono)
        ("rust-clap" ,rust-clap)
        ("rust-cryptovec" ,rust-cryptovec)
        ("rust-dirs" ,rust-dirs-1)
        ("rust-env-logger" ,rust-env-logger)
        ("rust-failure" ,rust-failure)
        ("rust-flate2" ,rust-flate2)
        ("rust-futures" ,rust-futures)
        ("rust-getch" ,rust-getch)
        ("rust-hex" ,rust-hex)
        ("rust-ignore" ,rust-ignore)
        ("rust-libpijul" ,rust-libpijul)
        ("rust-line" ,rust-line)
        ("rust-log" ,rust-log-0.4)
        ("rust-pathdiff" ,rust-pathdiff)
        ("rust-progrs" ,rust-progrs)
        ("rust-rand" ,rust-rand)
        ("rust-regex" ,rust-regex)
        ("rust-reqwest" ,rust-reqwest)
        ("rust-rpassword" ,rust-rpassword-2.1.0)
        ("rust-sequoia-openpgp" ,rust-sequoia-openpgp-0.9.0)
        ("rust-serde" ,rust-serde)
        ("rust-serde-derive" ,rust-serde-derive)
        ("rust-shell-escape" ,rust-shell-escape)
        ("rust-tar" ,rust-tar)
        ("rust-tempfile" ,rust-tempfile)
        ("rust-term" ,rust-term)
        ("rust-thrussh" ,rust-thrussh)
        ("rust-thrussh-config" ,rust-thrussh-config)
        ("rust-thrussh-keys" ,rust-thrussh-keys)
        ("rust-tokio" ,rust-tokio)
        ("rust-tokio-uds" ,rust-tokio-uds)
        ("rust-toml" ,rust-toml-0.4)
        ("rust-username" ,rust-username))
       #:cargo-development-inputs
       (("rust-walkdir" ,rust-walkdir))))
    (home-page "https://pijul.org/")
    (synopsis
     "A patch-based distributed version control system, easy to use and fast")
    (description
     "This package provides a patch-based distributed version control
system, easy to use and fast.  Command-line interface.")
    (license license:gpl2+)))
