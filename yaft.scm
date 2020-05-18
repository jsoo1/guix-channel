(define-module (yaft)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages image)
  #:use-module (gnu packages ncurses)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (libsixel)
  #:export (yaft
            idump
            sdump))

(define yaft
  (package
    (name "yaft")
    (version "0.2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/uobikiemukot/yaft/archive/v" version ".tar.gz"))
              (sha256 (base32 "0k1pn1fph7zinb44mb0bdrlmvi93irplss4whmvlz8zhgy9ydxw0"))))
    (build-system gnu-build-system)
    (inputs `(("gcc" ,gcc)
              ("ncurses" ,ncurses)))
    (outputs '("out"))
    (arguments
     `(#:make-flags (list (string-append "DESTDIR=" (assoc-ref %outputs "out")))
       #:tests? #f
       #:phases
       (modify-phases
           %standard-phases
         (delete 'configure)
         (add-before 'build 'make-locale
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (setenv "LANG" "en_US.UTF-8")
             (setenv "CC" (string-append (assoc-ref inputs "gcc") "/bin/gcc"))
             (setenv "DESTDIR" (assoc-ref outputs "out"))
             #t))
         (add-after 'install 'postinstall
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (copy-recursively (string-append out "/usr/bin") (string-append out "/bin"))
               (copy-recursively (string-append out "/usr/share") (string-append out "/share"))
               (delete-file-recursively (string-append out "/usr"))
               #t))))))
    (synopsis "Yet another framebuffer terminal")
    (home-page "https://github.com/uobikiemukot/yaft")
    (description
     "Yet Another Framebuffer Terminal (aka \"yaft\") is simple terminal emulator for minimalist.

Features:

    various framebuffer types (8/15/16/24/32bpp)
    compatible with vt102 and Linux console (detail)
    UTF-8 encoding and UCS2 glyphs
    256 colors (same as xterm)
    wallpaper
    DRCS (DECDLD/DRCSMMv1) (experimental)
    sixel (experimental)")
    ;; TODO: Fix license
    (license #f)))

(define idump
  (let ((commit "f3d0da4ac1675604ccb14d9f34887777d2e20181")
        (revision "1"))
    (package
      (name "idump")
      (version (git-version "v0.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/uobikiemukot/idump")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256 (base32 "1h29hp67ynmwffnskkhrnrp8xq8ac6cg1qipqx51zp1b6znnlcvw"))))
      (build-system gnu-build-system)
      (inputs `(("gcc" ,gcc)
                ("libjpeg" ,libjpeg-turbo)
                ("libpng" ,libpng)
                ("libtiff" ,libtiff)))
      (arguments
       `(#:tests? #f
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (delete 'install)
           (add-before 'build 'make-locale
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (setenv "LANG" "en_US.UTF-8")
               (setenv "CC" (string-append (assoc-ref inputs "gcc") "/bin/gcc"))
               (setenv "DESTDIR" (assoc-ref outputs "out"))
               #t))
           (add-after 'build 'jank-install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (install-file "idump" (string-append out "/bin"))
                 #t))))))
      ;; TODO: fix license
      (home-page "https://github.com/uobikiemukot/idump")
      (synopsis "tiny image viewer for framebuffer")
      (description "")
      (license #f))))

(define sdump
  (let ((commit "c5fb55b6c2e548fcd229b75a9ff091cdc3b2e230")
        (revision "1"))
    (package
      (name "sdump")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/uobikiemukot/sdump.git")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "00grshn14dk7jjkmcylnn2ral815fsqwhf9w1vaiwhwh90qpbbh6"))))
      (build-system gnu-build-system)
      (inputs `(("libjpeg" ,libjpeg-turbo)
                ("libpng" ,libpng)
                ("libsixel" ,libsixel)))
      (arguments
       `(#:tests? #f
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (delete 'install)
           (add-before 'build 'make-locale
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (setenv "LANG" "en_US.UTF-8")
               (setenv "CC" (string-append (assoc-ref inputs "gcc") "/bin/gcc"))
               (setenv "DESTDIR" (assoc-ref outputs "out"))
               #t))
           (add-after 'build 'jank-install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (install-file "sdump" (string-append out "/bin"))
                 #t))))))
      (home-page "https://github.com/uobikiemukot/sdump")
      (synopsis "sixel image dumper")
      (description "this program is a variant of idump")
      (license #f))))

