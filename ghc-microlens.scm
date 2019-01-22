(define-module (ghc-microlens)
  #:use-module (ghc-mtl)
  #:use-module (gnu packages haskell)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-microlens-0.4.10
            ghc-microlens-ghc
            ghc-microlens-mtl))

(define ghc-microlens-0.4.10
  (package
    (name "ghc-microlens")
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens/microlens-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "1v277yyy4p9q57xr2lfp6qs24agglfczmcabrapxrzci3jfshmcw"))))
    (build-system haskell-build-system)
    (home-page
     "http://github.com/monadfix/microlens")
    (synopsis
     "A tiny lens library with no dependencies. If you're writing an app, you probably want microlens-platform, not this.")
    (description
     "NOTE: If you're writing an app, you probably want <http://hackage.haskell.org/package/microlens-platform microlens-platform> â\x80\x93 it has the most features. <http://hackage.haskell.org/package/microlens microlens> is intended more for library writers who want a tiny lens library (after all, lenses are pretty useful for everything, not just for updating records!). . This library is an extract from <http://hackage.haskell.org/package/lens lens> (with no dependencies). It's not a toy lenses library, unsuitable for â\x80\x9creal worldâ\x80\x9d, but merely a small one. It is compatible with lens, and should have same performance. It also has better documentation. . There's a longer readme <https://github.com/monadfix/microlens#readme on Github>. It has a migration guide for lens users, a description of other packages in the family, a discussion of other lens libraries you could use instead, and so on. . Here are some usecases for this library: . * You want to define lenses or traversals in your own library, but don't want to depend on lens. Having lenses available often make working with a library more pleasant. . * You just want to be able to use lenses to transform data (or even just use @over _1@ to change the first element of a tuple). . * You are new to lenses and want a small library to play with. . However, don't use this library if: . * You need @Iso@s, @Prism@s, indexed traversals, or actually anything else which isn't defined here (tho some indexed functions are available elsewhere â\x80\x93 containers and vector provide them for their types, and <http://hackage.haskell.org/package/ilist ilist> provides indexed functions for lists). . * You want a library with a clean, understandable implementation (in which case you're looking for <http://hackage.haskell.org/package/lens-simple lens-simple>). . As already mentioned, if you're writing an application which uses lenses more extensively, look at <http://hackage.haskell.org/package/microlens-platform microlens-platform> â\x80\x93 it combines features of most other microlens packages (<http://hackage.haskell.org/package/microlens-mtl microlens-mtl>, <http://hackage.haskell.org/package/microlens-th microlens-th>, <http://hackage.haskell.org/package/microlens-ghc microlens-ghc>). . If you want to export getters or folds and don't mind the <http://hackage.haskell.org/package/contravariant contravariant> dependency, please consider using <http://hackage.haskell.org/package/microlens-contra microlens-contra>. . If you haven't ever used lenses before, read <http://hackage.haskell.org/package/lens-tutorial/docs/Control-Lens-Tutorial.html this tutorial>. (It's for lens, but it applies to microlens just as well.) . Note that microlens has no dependencies starting from GHC 7.10 (base-4.8). Prior to that, it depends on transformers-0.2 or above.")
    (license license:bsd-3)))

(define ghc-microlens-ghc
  (package
    (name "ghc-microlens-ghc")
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-ghc/microlens-ghc-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "102dbrdsdadxbbhvx8avv1wbk84767a7lkb8ckp3zxk9g7qlly33"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-microlens" ,ghc-microlens-0.4.10)))
    (home-page
     "http://github.com/monadfix/microlens")
    (synopsis
     "microlens + array, bytestring, containers, transformers")
    (description
     "Use this package instead of <http://hackage.haskell.org/package/microlens microlens> if you don't mind depending on all dependencies here â\x80\x93 @Lens.Micro.GHC@ reexports everything from @Lens.Micro@ and additionally provides orphan instances of microlens classes for packages coming with GHC (<http://hackage.haskell.org/package/array array>, <http://hackage.haskell.org/package/bytestring bytestring>, <http://hackage.haskell.org/package/containers containers>, <http://hackage.haskell.org/package/transfromers transformers>). . The minor and major versions of microlens-ghc are incremented whenever the minor and major versions of microlens are incremented, so you can depend on the exact version of microlens-ghc without specifying the version of microlens you need. . This package is a part of the <http://hackage.haskell.org/package/microlens microlens> family; see the readme <https://github.com/monadfix/microlens#readme on Github>.")
    (license license:bsd-3)))

(define ghc-microlens-mtl
  (package
    (name "ghc-microlens-mtl")
    (version "0.1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-mtl/microlens-mtl-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "0l6z1gkzwcpv89bxf5vgfrjb6gq2pj7sjjc53nvi5b9alx34zryk"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-microlens" ,ghc-microlens-0.4.10)
       ("ghc-mtl" ,ghc-mtl)
       ("ghc-transformers-compat"
        ,ghc-transformers-compat)))
    (home-page "http://github.com/aelve/microlens")
    (synopsis
     "microlens support for Reader/Writer/State from mtl")
    (description
     "This package contains functions (like 'view' or '+=') which work on 'MonadReader', 'MonadWriter', and 'MonadState' from the mtl package. . This package is a part of the <http://hackage.haskell.org/package/microlens microlens> family; see the readme <https://github.com/aelve/microlens#readme on Github>.")
    (license license:bsd-3)))

