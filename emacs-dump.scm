(define-module (emacs-dump)
  #:use-module (gnu packages agda)
  #:use-module (gnu packages cedille)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public my-emacs-dump
  (let ((commit "ac5cc4e9823d8041eb333fa4db380ebf6620f83a")
        (rev "1"))
    (package
      (name "my-emacs-dump")
      (version (git-version "0.1" rev commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jsoo1/dotfiles")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0lv89ijvgczwnsrj0vv6srv868scjmq7fd4xakqjy763ckgcp2s1"))))
      (build-system gnu-build-system)
      (inputs
       `(("agda" ,agda)
         ("cedille" ,cedille)
         ("emacs-anzu" ,emacs-anzu)
         ("emacs-avy" ,emacs-avy)
         ("emacs-cmake-mode" ,emacs-cmake-mode)
         ("emacs-company" ,emacs-company)
         ("emacs-counsel-projectile" ,emacs-counsel-projectile)
         ("emacs-csv-mode" ,emacs-csv-mode)
         ("emacs-dash" ,emacs-dash)
         ("emacs-debbugs" ,emacs-debbugs)
         ("emacs-docker" ,emacs-docker)
         ("emacs-dockerfile-mode" ,emacs-dockerfile-mode)
         ("emacs-ediprolog" ,emacs-ediprolog)
         ("emacs-emmet-mode" ,emacs-emmet-mode)
         ("emacs-evil" ,emacs-evil)
         ("emacs-evil-anzu" ,emacs-evil-anzu)
         ("emacs-evil-commentary" ,emacs-evil-commentary)
         ("emacs-evil-magit" ,emacs-evil-magit)
         ("emacs-evil-org" ,emacs-evil-org)
         ("emacs-evil-surround" ,emacs-evil-surround)
         ("emacs-exec-path-from-shell" ,emacs-exec-path-from-shell)
         ("emacs-f" ,emacs-f)
         ("emacs-fill-column-indicator" ,emacs-fill-column-indicator)
         ("emacs-fish-mode" ,emacs-fish-mode)
         ("emacs-flycheck" ,emacs-flycheck)
         ("emacs-geiser" ,emacs-geiser)
         ("emacs-graphviz-dot-mode" ,emacs-graphviz-dot-mode)
         ("emacs-guix" ,emacs-guix)
         ("emacs-haskell-mode" ,emacs-haskell-mode)
         ("emacs-ibuffer-projectile" ,emacs-ibuffer-projectile)
         ("emacs-ivy" ,emacs-ivy)
         ("emacs-let-alist" ,emacs-let-alist)
         ("emacs-magit" ,emacs-magit)
         ("emacs-markdown-mode" ,emacs-markdown-mode)
         ("emacs-multi-term" ,emacs-multi-term)
         ("emacs-next" ,emacs-next)
         ("emacs-nodejs-repl" ,emacs-nodejs-repl)
         ("emacs-projectile" ,emacs-projectile)
         ("emacs-restclient" ,emacs-restclient)
         ("emacs-rust-mode" ,emacs-rust-mode)
         ("emacs-s" ,emacs-s)
         ("emacs-slime" ,emacs-slime)
         ("emacs-slime-company" ,emacs-slime-company)
         ("emacs-smartparens" ,emacs-smartparens)
         ("emacs-solarized-theme" ,emacs-solarized-theme)
         ("emacs-tuareg" ,emacs-tuareg)
         ("emacs-vimrc-mode" ,emacs-vimrc-mode)
         ("emacs-web-mode" ,emacs-web-mode)
         ("emacs-wgrep" ,emacs-wgrep)
         ("emacs-which-key" ,emacs-which-key)
         ("emacs-xterm-color" ,emacs-xterm-color)
         ("emacs-yaml-mode" ,emacs-yaml-mode)))
      (arguments
       `(#:tests? #f
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (replace 'build
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let* ((emacs
                       (string-append (assoc-ref inputs "emacs-next")
                                      "/bin/emacs"))
                      (out (assoc-ref outputs "out"))
                      (dump-file
                       (string-append out "/bin/my-dump.pdmp")))
                 (invoke
                  emacs
                  "--batch"
                  "--load" "emacs/pdump/init-guix.el"
                  "--eval" (string-append "'(dump-emacs-portable \"" dump-file "\" t)'"))))))))
      (home-page "https://github.com/jsoo1/dotfiles")
      (synopsis "Emacs, dumped for me")
      (description
       "An emacs portable-dump preloaded my preferred libraries.")
      (license #f))))
