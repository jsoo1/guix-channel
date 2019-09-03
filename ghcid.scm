(define-module (ghcid)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages haskell-check)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghcid))

(define ghcid
  (package
    (name "ghcid")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://hackage/package/ghcid/ghcid-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "06n37dv51i2905v8nwwv1ilm0zlx6zblrkfic1mp491ws2sijdx7"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-extra" ,ghc-extra)
       ("ghc-ansi-terminal" ,ghc-ansi-terminal)
       ("ghc-cmdargs" ,ghc-cmdargs)
       ("ghc-fsnotify" ,ghc-fsnotify)
       ("ghc-terminal-size" ,ghc-terminal-size)))
    (native-inputs
     `(("ghc-tasty" ,ghc-tasty)
       ("ghc-tasty-hunit" ,ghc-tasty-hunit)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'remove-lib
           (lambda* (#:key outputs #:allow-other-keys)
             (delete-file-recursively
              (string-append (assoc-ref outputs "out") "/lib")
              #t))))))
    (home-page
     "https://github.com/ndmitchell/ghcid#readme")
    (synopsis "GHCi based bare bones IDE")
    (description
     "Either \\\"GHCi as a daemon\\\" or \\\"GHC + a bit of an IDE\\\". A very simple Haskell development tool which shows you the errors in your project and updates them whenever you save. Run @code{ghcid --topmost --command=ghci}, where @code{--topmost} makes the window on top of all others (Windows only) and @code{--command} is the command to start GHCi on your project (defaults to @code{ghci} if you have a @code{.ghci} file, or else to @code{cabal repl}).")
    (license license:bsd-3)))

