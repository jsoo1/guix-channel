(define-module (ghc-mvar-lock)
  #:use-module ((gnu packages haskell-xyz) #:select (ghc-safe-exceptions))
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-mvar-lock))

(define ghc-mvar-lock
  (package
   (name "ghc-mvar-lock")
   (version "0.1.0.2")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "mirror://hackage/package/mvar-lock/mvar-lock-"
           version
           ".tar.gz"))
     (sha256
      (base32
       "09diqzb4vp7bcg6v16fgjb70mi68i8srnyxf6qga58va6avbc4wg"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-safe-exceptions" ,ghc-safe-exceptions)))
   (arguments
    `(#:phases
      (modify-phases %standard-phases
         (add-after 'unpack 'add-setup-script
           (lambda _
             ;; The usual "Setup.hs" script is missing from the source.
             (with-output-to-file "Setup.hs"
               (lambda ()
                 (format #t "import Distribution.Simple~%")
                 (format #t "main = defaultMain~%"))))))))
   (home-page
    "https://github.com/chris-martin/mvar-lock")
   (synopsis "A trivial lock based on MVar.")
   (description
    "Using an MVar as a lock is a common pattern. This module just wraps that up into some functions with nice names that make the pattern explicit.")
   (license license:asl2.0)))

