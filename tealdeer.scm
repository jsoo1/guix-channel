(define-module (tealdeer)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages rust)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public tealdeer
  (package
    (name "tealdeer")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tealdeer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0j0zs3hzk7871j29ppb1skq31r624j89f2lng895mmf28wfk7pfh"))))
    (build-system cargo-build-system)
    (inputs `(("openssl" ,openssl)))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'configure 'dont-vendor-sources
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((openssl (assoc-ref inputs "openssl")))
               (setenv "OPENSSL_DIR" openssl))
             #t))
         (add-after 'install 'install-completions
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out")))
               (install-file
                "bash_tealdeer"
                (string-append out "/etc/bash_completion.d"))
               (install-file
                "fish_tealdeer"
                (string-append
                 out "/share/completions/vendor_completions.d"))))))
       #:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12)
        ("rust-app-dirs" ,rust-app-dirs-1.2)
        ("rust-docopt" ,rust-docopt-1.0)
        ("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-log" ,rust-log-0.4)
        ("rust-miniz-oxide-c-api" ,rust-miniz-oxide-c-api-0.2)
        ("rust-pager" ,rust-pager-0.15)
        ("rust-reqwest" ,rust-reqwest-0.9)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-derive" ,rust-serde-derive-1)
        ("rust-tar" ,rust-tar-0.4)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-walkdir" ,rust-walkdir-2)
        ("rust-xdg" ,rust-xdg-2.2))
       #:cargo-development-inputs
       (("rust-assert-cmd" ,rust-assert-cmd-0.10)
        ("rust-escargot" ,rust-escargot-0.3)
        ("rust-predicates" ,rust-predicates-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-utime" ,rust-utime-0.2))))
    (home-page "https://github.com/dbrgn/tealdeer/")
    (synopsis
     "Fetch and show tldr help pages for many CLI commands")
    (description
     "Fetch and show tldr help pages for many CLI commands.  Full
featured offline client with caching support.")
    (license (list license:expat license:asl2.0))))
