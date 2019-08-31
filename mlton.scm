(define-module (mlton)
  #:use-module (gnu packages multiprecision)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public mlton
  (package
    (name "mlton")
    (version "on-20180207-release")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference (url "https://github.com/mlton/mlton")
                           (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "00rdd2di5x1dzac64il9z05m3fdzicjd3226wwjyynv631jj3q2a"))))
    (inputs `(("gmp" ,gmp)))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda* (#:key inputs #:allow-other-keys)
             (let* ((gmp (assoc-ref inputs "gmp"))
                    (gmp-inc (string-append
                              "WITH_GMP_INC_DIR=" gmp "/include"))
                    (gmp-lib (string-append
                              "WITH_GMP_LIB_DIR=" gmp "/lib"))
                    (bootstrap (string-append "BOOTSTRAP=false")))
               (invoke "make" gmp-inc gmp-lib bootstrap)))))))
    (home-page "http://mlton.org")
    (synopsis "Whole-program, optimizing Standard ML compiler")
    (description
     "MLton is an open-source, whole-program, optimizing Standard ML
compiler.")
    (license license:hpnd)))
