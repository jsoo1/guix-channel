(define-module (ghc-microlens)
  #:use-module (ghc-mtl)
  #:use-module (gnu packages haskell)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (ghc-microlens-0.4.10
            ghc-microlens-ghc
            ghc-microlens-mtl
            ghc-microlens-platform))

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
     "A tiny lens library with no dependencies.")
    (description
     "NOTE: If you're writing an app, you probably want microlens-platform at http://hackage.haskell.org/package/microlens-platform it has the most features. microlens is intended more for library writers who want a tiny lens library (after all, lenses are pretty useful for everything, not just for updating records!).

This library is an extract from lens at http://hackage.haskell.org/package/lens (with no dependencies). It's not a toy lenses library, unsuitable for real world, but merely a small one. It is compatible with lens, and should have same performance. It also has better documentation.

There's a longer readme on Github at https://github.com/monadfix/microlens#readme. It has a migration guide for lens users, a description of other packages in the family, a discussion of other lens libraries you could use instead, and so on. . Here are some usecases for this library: . * You want to define lenses or traversals in your own library, but don't want to depend on lens. Having lenses available often make working with a library more pleasant. . * You just want to be able to use lenses to transform data (or even just use over _1 to change the first element of a tuple). . * You are new to lenses and want a small library to play with. . However, don't use this library if: . * You need Isos, Prisms, indexed traversals, or actually anything else which isn't defined here (tho some indexed functions are available elsewhere containers and vector provide them for their types, and <http://hackage.haskell.org/package/ilist ilist> provides indexed functions for lists). . * You want a library with a clean, understandable implementation (in which case you're looking for <http://hackage.haskell.org/package/lens-simple lens-simple>). . As already mentioned, if you're writing an application which uses lenses more extensively, look at <http://hackage.haskell.org/package/microlens-platform microlens-platform> â\x80\x93 it combines features of most other microlens packages (<http://hackage.haskell.org/package/microlens-mtl microlens-mtl>, <http://hackage.haskell.org/package/microlens-th microlens-th>, <http://hackage.haskell.org/package/microlens-ghc microlens-ghc>). . If you want to export getters or folds and don't mind the <http://hackage.haskell.org/package/contravariant contravariant> dependency, please consider using <http://hackage.haskell.org/package/microlens-contra microlens-contra>. . If you haven't ever used lenses before, read <http://hackage.haskell.org/package/lens-tutorial/docs/Control-Lens-Tutorial.html this tutorial>. (It's for lens, but it applies to microlens just as well.) . Note that microlens has no dependencies starting from GHC 7.10 (base-4.8). Prior to that, it depends on transformers-0.2 or above.")
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
     "Use this package instead of microlens at http://hackage.haskell.org/package/microlens if you don't mind depending on all dependencies here.

 Lens.Micro.GHC reexports everything from Lens.Micro and additionally provides orphan instances of microlens classes for packages coming with GHC (array at http://hackage.haskell.org/package/array array, bytestring at http://hackage.haskell.org/package/bytestring, Containers at http://hackage.haskell.org/package/containers, transformers at http://hackage.haskell.org/package/transfromers).

The minor and major versions of microlens-ghc are incremented whenever the minor and major versions of microlens are incremented, so you can depend on the exact version of microlens-ghc without specifying the version of microlens you need.

This package is a part of the microlens family; see the readme on Github at https://github.com/monadfix/microlens#readme.")
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
     "This package contains functions (like 'view' or '+=') which work on 'MonadReader', 'MonadWriter', and 'MonadState' from the mtl package. . This package is a part of the microlens family; see the readme on Github at https://github.com/aelve/microlens#readme.")
    (license license:bsd-3)))


(define ghc-microlens-platform
  (package
    (name "ghc-microlens-platform")
    (version "0.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/microlens-platform/microlens-platform-"
             version
             ".tar.gz"))
       (sha256
        (base32
         "18950lxgmsg5ksvyyi3zs1smjmb1qf1q73a3p3g44bh21miz0xwb"))))
    (build-system haskell-build-system)
    (inputs
     `(("ghc-hashable" ,ghc-hashable)
       ("ghc-microlens" ,ghc-microlens)
       ("ghc-microlens-ghc" ,ghc-microlens-ghc)
       ("ghc-microlens-mtl" ,ghc-microlens-mtl)
       ("ghc-microlens-th" ,ghc-microlens-th)
       ("ghc-unordered-containers"
        ,ghc-unordered-containers)
       ("ghc-vector" ,ghc-vector)))
    (home-page
     "http://github.com/monadfix/microlens")
    (synopsis "Feature-complete microlens")
    (description
     "This package exports a module which is the recommended starting point for using microlens at http://hackage.haskell.org/package/microlens if you aren't trying to keep your dependencies minimal. By importing Lens.Micro.Platform you get all functions and instances from microlens, microlens-th at http://hackage.haskell.org/package/microlens-th, microlens-mtl at http://hackage.haskell.org/package/microlens-mtl, microlens-ghc at http://hackage.haskell.org/package/microlens-ghc, as well as instances for Vector, Text, and HashMap.

 The minor and major versions of microlens-platform are incremented whenever the minor and major versions of any other microlens package are incremented, so you can depend on the exact version of microlens-platform without specifying the version of microlens (microlens-mtl, etc) you need.

This package is a part of the microlens family; see the readme on Github at https://github.com/monadfix/microlens#readme.")
    (license license:bsd-3)))
