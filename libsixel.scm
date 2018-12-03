(define-module (libsixel)
  #:use-module (gnu packages image)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:export (libsixel))

(define libsixel
  (let ((commit "6219db6d8416fde3a3b1272e900a76ccdfadec01")
        (revision "1"))
    (package
      (name "libsixel")
      (version (git-version "v1.8.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/saitoha/libsixel.git")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1jn5z2ylccjkp9i12n5x53x2zzhhsgmgs6xxi7aja6qimfw90h1n"))))
      (build-system gnu-build-system)
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-before 'build 'create-package-json
             (lambda _ (chmod "package.json" #o644)))))) ; Permissions changed here?
      (home-page "https://github.com/saitoha/libsixel")
      (synopsis
       "A SIXEL encoder/decoder implementation derived from kmiya's sixel (https://github.com/saitoha/sixel).")
      (description
       "This package provides encoder/decoder implementation for DEC SIXEL graphics, and some converter programs.

SIXEL is one of image formats for printer and terminal imaging introduced by Digital Equipment Corp. (DEC). Its data scheme is represented as a terminal-friendly escape sequence. So if you want to view a SIXEL image file, all you have to do is \"cat\" it to your terminal.

On 80's real hardware terminals, it tooks unbearable long waiting times to display images.

But nowdays, with high-speed CPU and broadband network, we got the chance to develop a new scope of SIXELs.")
      (license #f))))
