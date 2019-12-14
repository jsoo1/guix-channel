(define-module (alacritty)
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages compression) #:select (gzip))
  #:use-module (gnu packages crates-io)
  #:use-module ((gnu packages fontutils) #:select (fontconfig freetype))
  #:use-module ((gnu packages freedesktop) #:select (wayland))
  #:use-module ((gnu packages gl) #:select (glew mesa))
  #:use-module ((gnu packages ncurses) #:select (ncurses))
  #:use-module ((gnu packages pkg-config) #:select (pkg-config))
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module ((gnu packages version-control) #:select (git))
  #:use-module ((gnu packages xdisorg) #:select (libxkbcommon))
  #:use-module ((gnu packages xml) #:select (expat))
  #:use-module ((gnu packages xorg)
                #:select (libx11
                          libxcb
                          libxcursor
                          libxi
                          libxrandr
                          libxxf86vm))
  #:use-module (guix build-system cargo)
  #:use-module ((guix build-system gnu) #:prefix gnu:)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (rust-xyz))

(define-public alacritty
  (package
    (name "alacritty")
    (version "0.3.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jwilm/alacritty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1h9zid7bi19qga3a8a2d4x3ma9wf1njmj74s4xnw7nzqqf3dh750"))))
    (build-system cargo-build-system)
    (inputs
     `(("cmake" ,cmake)
       ("expat" ,expat)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("glew" ,glew)
       ("gzip" ,gzip)
       ("libx11" ,libx11)
       ("libxcb" ,libxcb)
       ("libxcursor" ,libxcursor)
       ("libxi" ,libxi)
       ("libxxf86vm" ,libxxf86vm)
       ("libxkbcommon" ,libxkbcommon)
       ("libxrandr" ,libxrandr)
       ("mesa" ,mesa)
       ("ncurses" ,ncurses)
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)
       ("wayland" ,wayland)))
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64)
        ("rust-cgl" ,rust-cgl-0.2)
        ("rust-clap" ,rust-clap-2)
        ("rust-clipboard-win" ,rust-clipboard-win)
        ("rust-core-text" ,rust-core-text)
        ("rust-crossbeam-channel" ,rust-crossbeam-channel)
        ("rust-dbus" ,rust-dbus)
        ("rust-dirs" ,rust-dirs-1)
        ("rust-dunce" ,rust-dunce)
        ("rust-dwrote" ,rust-dwrote)
        ("rust-embed-resource" ,rust-embed-resource)
        ("rust-env-logger" ,rust-env-logger)
        ("rust-errno" ,rust-errno)
        ("rust-euclid" ,rust-euclid)
        ("rust-freetype-rs" ,rust-freetype-rs)
        ("rust-glutin" ,rust-gl-generator-0.11)
        ("rust-glutin" ,rust-glutin)
        ("rust-http-req" ,rust-http-req)
        ("rust-image" ,rust-image-0.21)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio-anonymous-pipes" ,rust-mio-anonymous-pipes)
        ("rust-mio-named-pipes" ,rust-mio-named-pipes)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-named-pipe" ,rust-named-pipe)
        ("rust-nix" ,rust-nix-0.14)
        ("rust-notify" ,rust-notify)
        ("rust-objc-foundation" ,rust-objc-foundation)
        ("rust-quote" ,rust-quote-0.6)
        ("rust-rand-chacha" ,rust-rand-chacha-0.1.1)
        ("rust-rand-core" ,rust-rand-core-0.4.0)
        ("rust-rand-hc" ,rust-rand-hc-0.1.0)
        ("rust-rand-isaac" ,rust-rand-isaac-0.1.1)
        ("rust-rand-jitter" ,rust-rand-jitter-0.1.4)
        ("rust-rand-os" ,rust-rand-os-0.1.3)
        ("rust-rand-pcg" ,rust-rand-pcg-0.1.2)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.1.1)
        ("rust-remove-dir-all" ,rust-remove-dir-all)
        ("rust-rustc-tools-util" ,rust-rustc-tools-util)
        ("rust-same-file" ,rust-same-file)
        ("rust-serde-yaml" ,rust-serde-yaml)
        ("rust-servo-fontconfig" ,rust-servo-fontconfig)
        ("rust-signal-hook" ,rust-signal-hook)
        ("rust-smithay" ,rust-smithay)
        ("rust-smithay-clipboard" ,rust-smithay-clipboard)
        ("rust-socket2" ,rust-socket2)
        ("rust-static-assertions" ,rust-static-assertions-0.3)
        ("rust-terminfo" ,rust-terminfo)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-time" ,rust-time-0.1.42)
        ("rust-url" ,rust-url)
        ("rust-vte" ,rust-vte)
        ("rust-widestring" ,rust-widestring-0.4)
        ("rust-winapi" ,rust-winapi-0.2)
        ("rust-winapi-build" ,rust-winapi-build)
        ("rust-winapi-util" ,rust-winapi-util)
        ("rust-wincolor" ,rust-wincolor)
        ("rust-winpty-sys" ,rust-winpty-sys)
        ("rust-ws2-32-sys" ,rust-ws2-32-sys-0.2)
        ("rust-x11-clipboard" ,rust-x11-clipboard)
        ("rust-zip" ,rust-zip))
       #:phases
       (modify-phases %standard-phases
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (gzip (string-append
                          (assoc-ref inputs "gzip") "/bin/gzip"))
                   (tic (string-append
                         (assoc-ref inputs "ncurses") "/bin/tic")))
               ;; Binary
               (install-file
                "target/release/alacritty" (string-append out "/bin"))

               ;; Completions
               (install-file
                "extra/completions/_alacritty"
                (string-append out "/share/zsh/site-functions"))
               (install-file
                "extra/completions/alacritty.bash"
                (string-append out "/etc/bash_completion.d"))
               (install-file
                "extra/completions/alacritty.fish"
                (string-append out "/share/fish/vendor_completions.d"))

               ;; .desktop file
               (install-file
                "extra/linux/alacritty.desktop"
                (string-append out "/share/applications"))

               ;; Manpages
               (mkdir-p (string-append out "/share/man/man1"))
               (call-with-output-file
                   (string-append out "/share/man/man1/alacritty.1.gz")
                 (lambda (f)
                   (use-modules (ice-9 popen) (ice-9 binary-ports))
                   (let* ((cmd (string-append gzip " -c extra/alacritty.man"))
                          (pipe (open-input-pipe cmd))
                          (man (get-bytevector-all pipe)))
                     (put-bytevector f man)
                     (close-pipe pipe))))

               ;; Terminfo
               (mkdir-p (string-append out "/share/terminfo/"))
               (invoke
                tic "-x"
                "-o" (string-append out "/share/terminfo/")
                "extra/alacritty.info")
               #t))))))
    (home-page "https://github.com/jwilm/alacritty")
    (synopsis "GPU accelerated terminal emulator")
    (description "GPU accelerated terminal emulator")
    (license license:asl2.0)))
