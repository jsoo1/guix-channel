(define-module (rustfmt)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-apps))

(define-public rustfmt
  (deprecated-package "rustfmt" rustfmt-nightly))
