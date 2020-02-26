(define-module (dmenu)
  #:use-module (gnu packages suckless)
  #:use-module (guix packages)
  #:use-module (guix git-download))

(define-public my-dmenu
  (package
    (inherit dmenu)
    (name "my-dmenu")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jsoo1/dmenu")
             (commit "bcf21fa38e95bda59ddfb6653137d7943fcb74ec")))
       (file-name (git-file-name name (package-version dmenu)))
       (sha256
        (base32
         "1jmmrxwdbkawpkpvj69bsaf5l84g6j3i2dq1l9l6idjnl1zr36lh"))))))
