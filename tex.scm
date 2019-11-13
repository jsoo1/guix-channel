(define-module (tex)
  #:use-module ((fonts) #:select (lcdf-typetools font-font-awesome))
  #:use-module ((gnu packages tex) #:select (texlive-bin))
  #:use-module ((guix build-system python) #:select (python-build-system))
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system texlive)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix svn-download)
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module ((gnu packages fontutils) #:select (fontforge))
  #:use-module ((guix licenses) #:prefix license:))

(define-public texlive-latex-moderncv
  (package
    (name "texlive-latex-moderncv")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xdanaux/moderncv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1slgjsyiagglpzx4fqwmhbq6bnz40ii5kl8g2vbh144nnlql0smj"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((target (string-append (assoc-ref %outputs "out")
                                     "/share/texmf-dist/tex/latex/moderncv")))
           (mkdir-p target)
           (copy-recursively (assoc-ref %build-inputs "source") target)
           #t))))
    (home-page "https://ctan.org/pkg/moderncv")
    (synopsis "A modern curriculum vitae class")
    (description
     "The class provides facilities for typesetting modern curriculums
vitae, both in a classic and in a casual style.  It is fairly
customizable, allowing you to define your own style by changing the
colours, the fonts, etc.")
    (license license:lppl1.3+)))

(define-public texlive-latex-microtype
  (package
    (name "texlive-latex-microtype")
    (version "2.7c")
    (source
     (origin
       (method svn-fetch)
       (uri (texlive-ref "latex" "microtype"))
       (sha256
        (base32
         "08r7g0cfgjpdsz44nmgwimf2kg40n5v31yzky1f9cizg0p9pj25d"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((target (string-append (assoc-ref %outputs "out")
                                     "/share/texmf-dist/tex/latex/microtype")))
           (mkdir-p target)
           (copy-recursively (assoc-ref %build-inputs "source") target)
           #t))))
    (home-page "http://www.ctan.org/pkg/microtype")
    (synopsis "Subliminal refinements towards typographical perfection")
    (description
     "The package provides a LaTeX interface to the micro-typographic
extensions that were introduced by pdfTeX and have since also
propagated to XeTeX and LuaTeX: most prominently, character protrusion
and font expansion, furthermore the adjustment of interword spacing
and additional kerning, as well as hyphenatable
letterspacing (tracking) and the possibility to disable all or
selected ligatures.  These features may be applied to customisable
sets of fonts, and all micro-typographic aspects of the fonts can be
configured in a straight-forward and flexible way.  Settings for
various fonts are provided.  Note that character protrusion requires
pdfTeX, LuaTeX, or XeTeX. Font expansion works with pdfTeX or LuaTeX.
The package will by default enable protrusion and expansion if they
can safely be assumed to work. Disabling ligatures requires pdfTeX or
LuaTeX, while the adjustment of interword spacing and of kerning only
works with pdfTeX.  Letterspacing is available with pdfTeX or LuaTeX.
The alternative package `letterspace', which also works with plain
TeX, provides the user commands for letterspacing only, omitting
support for all other extensions.")
    (license license:lppl1.3c)))

(define-public texlive-latex-fontawesome
  (package
    (name "texlive-latex-fontawesome")
    (version "4.6.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xdanaux/fontawesome-latex")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0m5fm1hj747braq7g7j8zbld7fq71ikdw5glva3w54yzqkgwcx6k"))))
    (inputs
     `(("fontforge" ,fontforge)
       ("font-font-awesome" ,font-font-awesome)
       ("lcdf-typetools" ,lcdf-typetools)
       ("texlive-bin" ,texlive-bin)))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (replace 'build
           (lambda _
             (invoke "python" "generate_tex_bindings.py" ,version)
             #t))
         (replace 'install
           (lambda _
             (let ((target
                    (string-append
                     (assoc-ref %outputs "out")
                     "/share/texmf-dist/tex/latex/fontawesome")))
               (mkdir-p target)
               (copy-recursively "." target)
               #t))))))
    (home-page "http://www.ctan.org/pkg/fontawesome")
    (synopsis
     "Font containing web-related icons")
    (description
     "The package offers access to the large number of web-related
icons provided by the included
http://fortawesome.github.io/Font-Awesome/font.  The package requires
the package, fontspec, if run with XeTeX or LuaTeX.")
    (license license:lppl1.3+)))
