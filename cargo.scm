(define-module (cargo)
  #:use-module (gnu packages rust)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (guix packages))

(define-public (cargo-for rust)
  (package
    (inherit rust)
    (name "cargo")
    (version (package-version rust))
    (source (package-source rust))
    (build-system trivial-build-system)
    (inputs `(("cargo" ,rust "cargo")))
    (outputs '("out"))
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((cargo (assoc-ref %build-inputs "cargo"))
               (out (assoc-ref %outputs "out")))
           (mkdir-p out)
           (copy-recursively cargo out)))))
    (home-page (package-home-page rust))
    (synopsis (package-synopsis rust))
    (description (package-description rust))
    (license (package-license rust))))

(define-public cargo (cargo-for rust))
