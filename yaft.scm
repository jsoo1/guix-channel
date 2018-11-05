(define-module (yaft)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages ncurses)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license)
  #:use-module (guix packages)
  #:export (yaft))

(define yaft
  (package
   (name "yaft")
   (version "0.2.9")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/uobikiemukot/yaft/archive/v" version ".tar.gz"))
            (sha256 (base32 "0k1pn1fph7zinb44mb0bdrlmvi93irplss4whmvlz8zhgy9ydxw0"))))
   (build-system gnu-build-system)
   (inputs `(("gcc" ,gcc)))
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
                     #t)))))
   (inputs `(("ncurses" ,ncurses)))
   (outputs '("out"))
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

