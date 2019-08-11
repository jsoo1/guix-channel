(define-module (cedille)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system gnu)
  #:use-module ((gnu packages agda) #:select (agda))
  #:use-module ((gnu packages haskell)
                #:select (ghc-8.4 ghc-alex ghc-happy))
  #:use-module ((gnu packages version-control) #:select (git))
  #:export (cedille emacs-se-mode))

(define cedille
  (package
    (name "cedille")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cedille/cedille/archive/v"
             version ".tar.gz"))
       (sha256
        (base32
         "05b32fsshcjrbh9ysz4pfv5y5jndkycd7qrg8sdh4spnlf077r92"))))
    (inputs
     `(("agda" ,agda)
       ("agda-ial" ,agda-ial)
       ("emacs-se-mode" ,emacs-se-mode)
       ("ghc" ,ghc-8.4)
       ("ghc-alex" ,ghc-alex)
       ("ghc-happy" ,ghc-happy)
       ("git" ,git)))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-cedille-path-el
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "cedille-mode.el"
               (("/usr/share/emacs/site-lisp/cedille-mode")
                (string-append
                 (assoc-ref outputs "out")
                 "/share/emacs/site-lisp/guix.d/cedille-" ,version "/"
                 "cedille-mode")))))
         (add-before 'install 'copy-cedille-mode-libraries
           (lambda* (#:key outputs #:allow-other-keys)
             (copy-recursively
              "cedille-mode"
              (string-append
               (assoc-ref outputs "out")
               "/share/emacs/site-lisp/guix.d/cedille-" ,version "/"
               "cedille-mode"))
             #t))
         ;; Byte compilation fails
         (delete 'build)
         (add-after 'unpack 'patch-libraries
           (lambda _ (patch-shebang "create-libraries.sh") #t))
         (add-after 'unpack 'copy-ial
           (lambda* (#:key inputs #:allow-other-keys)
             (copy-recursively
              (string-append (assoc-ref inputs "agda-ial")
                             "/include/agda/ial")
              "ial")
             ;; Ambiguous module if main is included from ial
             (delete-file "ial/main.agda")
             #t))
         (add-after 'check 'build-cedille
           (lambda _ (invoke "make" "--jobs=1")))
         (add-after 'install 'install-cedille
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (copy-recursively
                "lib" (string-append out "/lib/cedille"))
               (install-file "cedille" (string-append out "/bin"))
               #t))))))
    (propogated-inputs
     `(("emacs-se-mode" ,emacs-se-mode)))
    (home-page "https://cedille.github.io/")
    (synopsis
     "a dependently typed programming languages based on the Calculus of Dependent Lambda Eliminations")
    (description
     "Cedille is an interactive theorem-prover and dependently
typed programming language, based on extrinsic (aka Curry-style)
type theory.  This makes it rather different from type theories
like Coq and Agda, which are intrinsic (aka Church-style).  In
Cedille, terms are nothing more than annotated versions of terms
of pure untyped lambda calculus.  In contrast, in Coq or Agda,
the typing annotations are intrinsic parts of terms.  The typing
annotations can only be erased as an optimization under certain
conditions, not by virtue of the definition of the type theory.

Cedille’s type theory allows one to derive inductive datatypes,
together with their induction principles.  These derivations are
done via lambda-encodings, including not just the familiar Church
encoding (with its well-known limitation to inefficient accessors),
but also more efficient Parigot and Mendler encodings.  Further,
Cedille supports datatype declarations and pattern-matching
recursion via elaboration to certain of these encodings.

Cedille is used from an emacs mode, which communicates with the
backend tool.  The emacs mode supports convenient navigation of
the source text following the structure of its syntax tree.  Typing
and context information is available for all subexpressions as
one navigates, as well as information related to type inference.
  Cedille implements a novel form of local type inference called
spine-local type inference.  At the moment this is restricted to
solving for first-order type variables, but in the coming 2018-2019
academic year we plan to add support for inferring values for term
variables as well as dependent and higher-order type variables.")
    (license license:expat)))

(define emacs-se-mode
  (package
    (name "emacs-se-mode")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       ;; Comes with the cedille language
       (uri (string-append
             "https://github.com/cedille/cedille/archive/v"
             version ".tar.gz"))
       (sha256
        (base32
         "05b32fsshcjrbh9ysz4pfv5y5jndkycd7qrg8sdh4spnlf077r92"))))
    (build-system emacs-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'chdir-se-mode
           (lambda _ (chdir "se-mode") #t))
         ;; Byte compilation fails
         (delete 'build))))
    (home-page "https://cedille.github.io/")
    (synopsis
     "Structural navigation for emacs")
    (description
     "Allows structural navigation of files.  Used particularly in the
Cedille programming mode.")
    (license license:expat)))

(define agda-ial
  (package
    (name "agda-ial")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cedille/ial/archive/v"
             version ".tar.gz"))
       (sha256
        (base32
         "0ilgalmx3kljy6j9i8d7w6r7ky4bq0xzxanwfr6kyx56mf2sf0zh"))))
    (build-system gnu-build-system)
    (inputs
     `(("agda" ,agda)))
    (arguments
     `(#:parallel-build? #f
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-before 'build 'patch-dependencies
           (lambda _
             (patch-shebang "find-deps.sh")
             #t))
         (delete 'check)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (for-each
              (lambda (file)
                (install-file
                 file
                 (string-append
                  (assoc-ref outputs "out") "/include/agda/ial")))
              (find-files "." ".*agda.*"))
             #t)))))
    (home-page "https://github.com/cedille/ial")
    (synopsis
     "The Iowa Agda Library")
    (description
     "The goal is to provide a concrete library focused on verification
examples, as opposed to mathematics.  The library has a good number
of theorems for booleans, natural numbers, and lists.  It also has
trees, tries, vectors, and rudimentary IO.  A number of good ideas
come from Agda's standard library.")
    (license license:expat)))
