(define-module (emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (gnu packages)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome) ; for librsvg
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages linux) ; alsa-lib
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:export (emacs-27))

(define emacs-27
  (let ((commit "405f851f4bf64e2290e841b65ffabf37c61187f4")
        (revision "1"))
    (package
      (inherit emacs)
      (name "emacs-next")
      (version "27.alpha")
      (source
       (origin
         (inherit (package-source emacs))
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/emacs-mirror/emacs")
           (commit commit)))
         (sha256
          (base32
           "1gg6833vvcy2sam44gr5kbz0fcfd2xxdnhgki9dy0w3j44jk04z4"))
         (snippet
          ;; Delete the bundled byte-compiled elisp files and
          ;; generated autoloads.
          '(with-directory-excursion "lisp"
             (for-each delete-file
                       (append (find-files "." "\\.elc$")
                               (find-files "." "loaddefs\\.el$")))

             ;; Make sure Tramp looks for binaries in the right places on
             ;; remote Guix System machines, where 'getconf PATH' returns
             ;; something bogus.
             (substitute* "net/tramp-sh.el"
               ;; Patch the line after "(defcustom tramp-remote-path".
               (("\\(tramp-default-remote-path")
                (format #f "(tramp-default-remote-path ~s ~s ~s ~s "
                        "~/.guix-profile/bin" "~/.guix-profile/sbin"
                        "/run/current-system/profile/bin"
                        "/run/current-system/profile/sbin")))

             ;; Make sure Man looks for C header files in the right
             ;; places.
             (substitute* "man.el"
               (("\"/usr/local/include\"" line)
                (string-join
                 (list line
                       "\"~/.guix-profile/include\""
                       "\"/var/guix/profiles/system/profile/include\"")
                 " ")))
             #t))))
      (inputs
       (cons `("autoconf" ,autoconf) (package-inputs emacs))))))
