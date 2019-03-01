(define-module (lastpass)
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages curl) #:select (curl))
  #:use-module ((gnu packages documentation) #:select (asciidoc))
  #:use-module ((gnu packages gnupg) #:select (pinentry))
  #:use-module ((gnu packages pkg-config) #:select (pkg-config))
  #:use-module ((gnu packages tls) #:select (libressl))
  #:use-module ((gnu packages xml) #:select (libxml2))
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (lastpass-cli))

(define lastpass-cli
  (let ((revision "1")
        (commit "c9c9d8f34453678a266a6fbfd64fdbf826c37538"))
    (package
      (name "lastpass-cli")
      (version (git-version "v1.3.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/lastpass/lastpass-cli.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0bv177rw0f5w9j76p1bqm757c2s3v2k998ypxxgaasv7m5qzf3zh"))))
      (build-system gnu-build-system)
      (inputs
       `(("curl" ,curl)
         ("libressl" ,libressl)
         ("libxml2" ,libxml2)))
      (native-inputs
       `(("asciidoc" ,asciidoc)
         ("cmake" ,cmake)
         ("pkg-config" ,pkg-config)))
      (arguments
       `(#:tests? #f
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (setenv "DESTDIR" out)
                 (invoke "make" "install")
                 (mkdir (string-append out "/bin"))
                 (copy-file (string-append out "/usr/bin/lpass")
                            (string-append out "/bin/lpass"))
                 #t))))))
      (home-page "https://github.com/lastpass/lastpass-cli")
      (synopsis "LastPass command line interface tool")
      (description "Command line interface to LastPass.com.")
      (license license:gpl2+))))
