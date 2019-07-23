(define-module (ghc-mtl)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:export (ghc-mtl-compat))

(define ghc-mtl-compat
  (package
    (name "ghc-mtl-compat")
    (version "0.2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/mtl-compat/mtl-compat-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "15388p9ybdn6digk6cpdsw6havd0yva8vvwl3p7fnc9sb59wln34"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f
                 #:phases (modify-phases %standard-phases
                            (delete 'haddock))))
    (home-page
     "https://github.com/haskell-compat/mtl-compat")
    (synopsis
     "Backported Control.Monad.Except module from mtl")
    (description
     "This package backports the \"Control.Monad.Except\" module from mtl (if using mtl-2.2.0.1 or earlier), which reexports the ExceptT monad transformer and the MonadError class.

This package should only be used if there is a need to use the Control.Monad.Except module specifically. If you just want the mtl class instances for ExceptT, use transformers-compat instead, since mtl-compat does nothing but reexport the instances from that package.

Note that unlike how mtl-2.2 or later works, the \"Control.Monad.Except\" module defined in this package exports all of ExceptT's monad class instances. Therefore, you may have to declare import Control.Monad.Except () at the top of your file to get all of the ExceptT instances in scope.")
    (license license:bsd-3)))
