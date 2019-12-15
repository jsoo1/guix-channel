(define-module (pijul)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages pkg-config)
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
       ("libsodium" ,libsodium)
       ("nettle" ,nettle)
       ("pkg-config" ,pkg-config)))
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-base64" ,rust-base64-0.10)
        ("rust-bincode" ,rust-bincode-1.1)
        ("rust-bs58" ,rust-bs58)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-clap" ,rust-clap-2)
        ("rust-cryptovec" ,rust-cryptovec)
        ("rust-dirs" ,rust-dirs-1)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-getch" ,rust-getch)
        ("rust-hex" ,rust-hex-0.3)
        ("rust-ignore" ,rust-ignore)
        ("rust-libpijul" ,rust-libpijul)
        ("rust-line" ,rust-line)
        ("rust-log" ,rust-log-0.4)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-pathdiff" ,rust-pathdiff)
        ("rust-progrs" ,rust-progrs)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rand-chacha" ,rust-rand-chacha-0.1)
        ("rust-rand-core" ,rust-rand-core-0.4.0)
        ("rust-rand-hc" ,rust-rand-hc-0.1.0)
        ("rust-rand-isaac" ,rust-rand-isaac-0.1.1)
        ("rust-rand-jitter" ,rust-rand-jitter-0.1.4)
        ("rust-rand-os" ,rust-rand-os-0.1.3)
        ("rust-rand-pcg" ,rust-rand-pcg-0.1.2)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-reqwest" ,rust-reqwest)
        ("rust-rpassword" ,rust-rpassword-2.1.0)
        ("rust-sequoia-openpgp" ,rust-sequoia-openpgp-0.9.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-shell-escape" ,rust-shell-escape)
        ("rust-tar" ,rust-tar-0.4)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-term" ,rust-term-0.5)
        ("rust-thrussh" ,rust-thrussh)
        ("rust-thrussh-config" ,rust-thrussh-config)
        ("rust-thrussh-keys" ,rust-thrussh-keys)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-uds" ,rust-tokio-uds-0.2)
        ("rust-toml" ,rust-toml-0.4)
        ("rust-username" ,rust-username)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-winapi-build" ,rust-winapi-build)
        ("rust-wincolor" ,rust-wincolor)
        ("rust-xattr" ,rust-xattr-0.2))
       #:cargo-development-inputs
       (("rust-walkdir" ,rust-walkdir-2.2))
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-clang-env
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv
              "LIBCLANG_PATH"
              (string-append (assoc-ref inputs "clang") "/lib"))
             #t))
         (add-after 'install 'install-completions
           (lambda* (#:key outputs #:allow-other-keys)
             (use-modules (ice-9 popen)
                          (ice-9 textual-ports))
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (share (string-append out "/share"))
                    (bash (string-append
                           share "/bash-completion/completions"))
                    (zsh (string-append
                          share "/zsh/site-functions"))
                    (fish (string-append
                           share "/fish/vendor_completions.d")))
               (for-each
                (lambda (x)
                  (let ((dir (cddr x))
                        (file (cadr x))
                        (shell (car x)))
                    (mkdir-p dir)
                    (call-with-output-file (string-append dir "/" file)
                      (lambda (f)
                        (let* ((cmd (string-append
                                     bin "/pijul generate-completions --"
                                     shell))
                               (pipe (open-input-pipe cmd))
                               (completion (get-string-all pipe)))
                          (format f "~A" completion)
                          (close-pipe pipe)))) ))
                `(("bash" . ("pijul" . ,bash))
                  ("zsh" . ("_pijul" . ,zsh))
                  ("fish" . ("pijul.fish" . ,fish))))
               #t))))))
    (home-page "https://pijul.org/")
    (synopsis
     "Patch-based distributed version control system")
    (description
     "This package provides a patch-based distributed version control
system, easy to use and fast.  Command-line interface.")
    (license license:gpl2+)))
