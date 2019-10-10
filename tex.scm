(define-module (tex)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:))

(define-public texlive-moderncv
  (package
    (name "texlive-moderncv")
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
         (let* ((source (assoc-ref %build-inputs "source"))
                (out (assoc-ref %outputs "out"))
                (moderncv
                 (string-append out "/share/texmf-dist/")))
           (mkdir-p moderncv)
           ;; TODO: remove readme, ignore files,
           ;;       examples, take care of manuals
           (copy-recursively source moderncv)))))
    (home-page "https://ctan.org/pkg/moderncv")
    (synopsis "A modern curriculum vitae class")
    (description
     "The class provides facilities for typesetting modern
curriculums vitae, both in a classic and in a casual style.  It is
fairly customizable, allowing you to define your own style by changing
the colours, the fonts, etc.")
    (license license:lppl)))

