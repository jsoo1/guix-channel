(define-module (xmobar)
  #:use-module (ghc-dbus)
  #:use-module (ghc-alsa)
  #:use-module (gnu packages base)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (xmobar-plus xmobar-plus2))

(define xmobar-plus2
  (package
   (name "xmobar-plus2")
   (version "0.28.1")
   (source (origin
            (method url-fetch)
            (uri (string-append "mirror://hackage/package/xmobar/xmobar-" version ".tar.gz"))
            (sha256
             (base32
              "1zrpvr1nr6a55sxmjbacacflrxvnw6aibsdal19wx404r74qjgz5"))))
   (build-system haskell-build-system)
   (native-inputs
    `(("ghc-hspec" ,ghc-hspec)
      ("hspec-discover" ,hspec-discover)))
   (inputs
    `(("ghc-hinotify" ,ghc-hinotify)
      ("ghc-alsa-core" ,ghc-alsa-core)
      ("ghc-alsa-mixer" ,ghc-alsa-mixer)
      ("ghc-dbus" ,ghc-dbus)
      ("ghc-http" ,ghc-http)
      ("ghc-old-locale" ,ghc-old-locale)
      ("ghc-iwlib" ,ghc-iwlib)
      ("ghc-parsec-numbers" ,ghc-parsec-numbers)
      ("ghc-regex-compat" ,ghc-regex-compat)
      ("ghc-x11" ,ghc-x11)
      ("ghc-x11-xft" ,ghc-x11-xft)
      ("libxpm" ,libxpm)))
   (arguments
    `(#:haskell ,ghc-8.4
      #:configure-flags
      (list
       (string-append
        "--flags="
        (string-join
         (list "with_inotify"
               "with_alsa"
               "with_iwlib"
               "with_dbus"
               "with_threaded"
               "with_xft"
               "with_xpm")
         " ")))))
   (home-page "http://xmobar.org")
   (synopsis "Minimalistic text based status bar")
   (description
    "code{xmobar} is a lightweight, text-based, status bar written in
Haskell.  It was originally designed to be used together with Xmonad, but it
is also usable with any other window manager.  While xmobar is written in
Haskell, no knowledge of the language is required to install and use it.")
   (license license:bsd-3)))

(define xmobar-plus
  (package
   (name "xmobar-plus")
   (version "0.28.1")
   (source (origin
            (method url-fetch)
            (uri (string-append "mirror://hackage/package/xmobar/xmobar-" version ".tar.gz"))
            (sha256
             (base32
              "1zrpvr1nr6a55sxmjbacacflrxvnw6aibsdal19wx404r74qjgz5"))))
   (build-system haskell-build-system)
   (native-inputs
    `(("ghc-hspec" ,my-ghc-hspec)
      ("hspec-discover" ,hspec-discover)))
   (inputs
    `(("ghc-hinotify" ,ghc-hinotify)
      ("ghc-alsa-core" ,ghc-alsa-core)
      ("ghc-alsa-mixer" ,ghc-alsa-mixer)
      ("ghc-dbus" ,ghc-dbus)
      ("ghc-http" ,ghc-http)
      ("ghc-old-locale" ,ghc-old-locale)
      ("ghc-iwlib" ,ghc-iwlib)
      ("ghc-parsec-numbers" ,my-ghc-parsec-numbers)
      ("ghc-regex-compat" ,my-ghc-regex-compat)
      ("ghc-x11" ,my-ghc-x11)
      ("ghc-x11-xft" ,ghc-x11-xft)
      ("libxpm" ,libxpm)))
   (arguments
    `(#:haskell ,ghc-8.6
      #:configure-flags
      (list
       (string-append
        "--flags="
        (string-join
         (list "with_inotify"
               "with_alsa"
               "with_iwlib"
               "with_dbus"
               "with_threaded"
               "with_xft"
               "with_xpm")
         " ")))))
   (home-page "http://xmobar.org")
   (synopsis "Minimalistic text based status bar")
   (description
    "code{xmobar} is a lightweight, text-based, status bar written in
Haskell.  It was originally designed to be used together with Xmonad, but it
is also usable with any other window manager.  While xmobar is written in
Haskell, no knowledge of the language is required to install and use it.")
   (license license:bsd-3)))

;; DEPENDENCIES
(define my-ghc-parsec-numbers
  (package
    (inherit ghc-parsec-numbers)
    (arguments `(#:haskell ,ghc-8.6))))

(define my-ghc-x11
  (package
    (inherit ghc-x11)
    (arguments `(#:haskell ,ghc-8.6))))

(define my-ghc-regex-compat
  (package
    (inherit ghc-regex-compat)
    (arguments `(#:haskell ,ghc-8.6))))

(define ghc-libpmd
  (package
   (name "ghc-libmpd")
   (version "0.9.0.8")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "mirror://hackage/package/libmpd/libmpd-" version ".tar.gz"))
     (sha256 (base32 "0kpdj4ciwrfd6vmr60y7c276h5z2r40avs26a0x8s51rbr00lasq"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-attoparsec" ,ghc-attoparsec)
      ("ghc-old-locale" ,ghc-old-locale)
      ("ghc-data-default-class" ,ghc-data-default-class)
      ("ghc-network" ,ghc-network)
      ("ghc-utf8-string" ,ghc-utf8-string)
      ("ghc-quickcheck" ,ghc-quickcheck)
      ("ghc-hspec" ,ghc-hspec)))
   (arguments
    `(#:haskell ,ghc-8.6
      #:tests? #f))
   (home-page "http://github.com/vimus/libmpd-haskell#readme")
   (synopsis "An MPD client library.")
   (description "A client library for MPD, the Music Player Daemon.")
   (license license:expat)))

(define ghc-timezone-olson
  (package
   (name "ghc-timezone-olson")
   (version "0.1.9")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "mirror://hackage/package/timezone-olson/timezone-olson-" version ".tar.gz"))
     (sha256 (base32 "05abywx1nrcaz0nqzfy4zw62bc5qd7pdfnjvv4drxkwv084ha8rj"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-timezone-series" ,ghc-timezone-series)
      ("ghc-extensible-exceptions" ,ghc-extensible-exceptions)))
   (arguments
    `(#:haskell ,ghc-8.6))
   (home-page "http://projects.haskell.org/time-ng/")
   (synopsis "A pure Haskell parser and renderer for binary Olson timezone files")
   (description
    "A parser and renderer for binary Olson timezone files whose format is specified by the tzfile(5) man page on Unix-like systems. For more information about this format, see <http://www.iana.org/time-zones/repository/tz-link.html>. Functions are provided for converting the parsed data into 'TimeZoneSeries' objects from the timezone-series package. On many platforms, binary Olson timezone files suitable for use with this package are available in the directory /usr/share/zoneinfo and its subdirectories on your computer. For a way to read binary Olson timezone files at compile time, see the timezone-olson-th package (<http://hackage.haskell.org/package/timezone-olson-th>).")
   (license license:bsd-3)))

(define ghc-timezone-series
  (package
   (name "ghc-timezone-series")
   (version "0.1.9")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "mirror://hackage/package/timezone-series/timezone-series-" version ".tar.gz"))
     (sha256 (base32 "1blwgnyzqn917rgqkl4dncv9whv3xmk0lav040qq0214vksmvlz5"))))
   (build-system haskell-build-system)
   (arguments
    `(#:haskell ,ghc-8.6))
   (home-page "http://projects.haskell.org/time-ng/")
   (synopsis "Enhanced timezone handling for Data.Time")
   (description
    "This package endows Data.Time, from the time package, with several data types and functions for enhanced processing of timezones. For one way to create timezone series, see the timezone-olson (<http://hackage.haskell.org/package/timezone-olson>) and timezone-olson-th (<http://hackage.haskell.org/package/timezone-olson-th>) packages.")
   (license license:bsd-3)))

