(define-module (bower)
  #:use-module (gnu packages node)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build utils)
  #:use-module (guix build-system gnu)
  #:use-module ((ice-9 match) #:select (match))
  #:export (bower))

(define bower
  (package
    (name "bower")
    (version "1.8.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://registry.npmjs.org/bower/-/bower-"
             version
             ".tgz"))
       (sha256
        (base32
         "17m47mcbxzjcd5d9z3y85y2l4s0mdcrxax70x3xpad093g3j3r2s"))))
    (build-system gnu-build-system)
    (native-inputs `(("node" ,node)))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (replace 'install
           (lambda* _
             (let ((out (assoc-ref %outputs "out")))
               (begin
                 (mkdir out)
                 (copy-recursively
                  "bin" (string-append out "/bin"))
                 (copy-recursively
                  "lib" (string-append out "/lib"))
                 (copy-recursively
                  "package.json" (string-append out "/package.json"))
                 ;; TODO de-jank node_modules
                 (copy-recursively
                  "lib/node_modules"
                  (string-append out "/lib/node_modules"))
                 (delete-file-recursively "lib/node_modules")
                 #t)))))))
    (home-page "http://www.bower.io/")
    (synopsis
     "The browser package manager")
    (description "The browser package manager")
    ;; MIT
    (license #f)))
