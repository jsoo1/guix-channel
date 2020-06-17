(define-module (rust-xyz)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages rust)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public rust-bitflags-0.9
  (package
    (inherit rust-bitflags-1)
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name
        (string-append (package-name rust-bitflags-1) "-" version ".tar.gz"))
       (sha256
        (base32
         "19dk39gfwmhi3iy1x0wgml1fv1bkb525ywy25zwihbm063i05zaf"))))))

(define-public rust-toml-0.4
  (package
    (inherit rust-toml-0.5)
    (version "0.4.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml" version))
       (file-name
        (string-append (package-name rust-toml-0.5) "-" version ".tar.gz"))
       (sha256
        (base32
         "07qilkzinn8z13vq2sss65n2lza7wrmqpvkbclw919m3f7y691km"))))))

(define-public rust-url-2.0
  (package
    (name "rust-url")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "url" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ij81gib9z2n9r67gin545zr7xvh345pr5bydg2q2sswwr9azpbp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-encoding" ,rust-encoding-0.2)
        ("rust-heapsize" ,rust-heapsize-0.4)
        ("rust-idna" ,rust-idna-0.1)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-percent-encoding" ,rust-percent-encoding-2.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-rustc-test" ,rust-rustc-test-0.3)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/servo/rust-url")
    (synopsis
     "URL library for Rust, based on the WHATWG URL Standard")
    (description
     "URL library for Rust, based on the WHATWG URL Standard")
    (license #f)))

(define-public rust-base64-0.9
  (package
    (inherit rust-base64-0.10)
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name
        (string-append (package-name rust-base64-0.10) "-" version ".tar.gz"))
       (sha256
        (base32
         "0hs62r35bgxslawyrn1vp9rmvrkkm76fqv0vqcwd048vs876r7a8"))))))

(define-public rust-rand-pcg-0.1.2
  (package
    (inherit rust-rand-pcg-0.2)
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_pcg" version))
       (file-name
        (string-append (package-name rust-rand-pcg-0.2) "-" version ".tar.gz"))
       (sha256
        (base32
         "0i0bdla18a8x4jn1w0fxsbs3jg7ajllz6azmch1zw33r06dv1ydb"))))
    (arguments
     `(#:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

(define-public rust-dirs-1
  (package
    (name "rust-dirs")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dirs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "009rrhzj9pxyncmm2vhlj70npg0cgggv2hjbbkiwdl9vccq8kmrz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-dirs-sys" ,rust-dirs-sys-0.3))))
    (home-page "https://github.com/soc/dirs-rs")
    (synopsis
     "Provides platform-specific standard locations of directories or config")
    (description
     "This package provides a tiny low-level library that provides
platform-specific standard locations of directories for config, cache
and other data on Linux, Windows, macOS and Redox by leveraging the
mechanisms defined by the XDG base/user directory specifications on
Linux, the Known Folder API on Windows, and the Standard Directory
guidelines on macOS.")
    (license #f)))

 (define-public rust-num-complex-0.1
  (package
    (name "rust-num-complex")
    (version "0.1.43")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-complex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mln3h018lar511hadjwfkbyq1561s8kdzfg8aagbakqg0fn725j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1))))
    (home-page
     "https://github.com/rust-num/num-complex")
    (synopsis
     "Complex numbers implementation for Rust")
    (description
     "Complex numbers implementation for Rust")
    (license #f)))

(define-public rust-socket2
  (package
    (name "rust-socket2")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "socket2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0y48mglxl4zkvzqzwwzb7llfgl54xz4mzgqlgxa0fcjrsdr6jqjf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://github.com/alexcrichton/socket2-rs")
    (synopsis
     "Handle networking sockets a lot of configuration")
    (description
     "Utilities for handling networking sockets with a maximal amount
of configuration possible intended.")
    (license #f)))

(define-public rust-termios-0.2
  (package
    (inherit rust-termios-0.3)
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termios" version))
       (file-name
        (string-append (package-name rust-termios-0.3) "-" version ".tar.gz"))
       (sha256
        (base32
         "0fk8nl0rmk43jrh6hjz6c6d83ri7l6fikag6lh0ffz3di9cwznfm"))))))

(define-public rust-bindgen-0.47
  (package
    (name "rust-bindgen")
    (version "0.47.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q4j8s4cmjdd1l0qz9q660zlxf76lxdbpbmzivmdahabnmakls6z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cexpr" ,rust-cexpr-0.3)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.26)
        ("rust-clap" ,rust-clap-2)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-fxhash" ,rust-fxhash-0.2)
        ("rust-hashbrown" ,rust-hashbrown-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-peeking-take-while"
         ,rust-peeking-take-while-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-shlex" ,rust-shlex-0.1)
        ("rust-which" ,rust-which-2.0))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))))
    (home-page
     "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
     "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license #f)))

(define-public rust-nom-5.0
  (package
    (name "rust-nom")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06snml9wfrvk8k71l4md6gg29jgj4pa8wzsg180q3qr0jf2isxp9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-lexical-core" ,rust-lexical-core-0.4)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-regex" ,rust-regex-1.1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-jemallocator" ,rust-jemallocator-0.3)
        ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/Geal/nom")
    (synopsis
     "A byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library")
    (license #f)))

(define-public rust-bs58
  (package
    (name "rust-bs58")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bs58" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "125i962x0m0ggdif6ds51wfif2lypiicy469dj5j2l6rm6xycpn9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-sha2" ,rust-sha2))
       #:cargo-development-inputs
       (("rust-assert-matches" ,rust-assert-matches)
        ("rust-base58" ,rust-base58)
        ("rust-rust-base58" ,rust-rust-base58))))
    (home-page
     "https://github.com/mycorrhiza/bs58-rs")
    (synopsis "Another Base58 codec implementation.")
    (description
     "Another Base58 codec implementation.")
    (license #f)))

(define-public rust-cryptovec
  (package
    (name "rust-cryptovec")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cryptovec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n88dmhfb2dxs48zllq1g1dya76zx4fajw482qy8jj4hgg1da4p4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://pijul.org/cryptovec")
    (synopsis
     "A vector which zeroes its memory on clears and reallocations")
    (description
     "This package provides a vector which zeroes its memory on clears
and reallocations.")
    (license license:asl2.0)))

(define-public rust-getch
  (package
    (name "rust-getch")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00in8q95qi8a5q3zn2zcaqp5avj79f5myd2a4zfdy2m24ycvbc5v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-termios" ,rust-termios-0.2))))
    (home-page
     "https://nest.pijul.com/pijul_org/getch")
    (synopsis
     "Portable implementation of getch")
    (description
     "This package provides a portable implementation of getch, using
_getch on Windows, and termios on Unix.")
    (license license:asl2.0)))

(define-public rust-libpijul
  (package
    (name "rust-libpijul")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libpijul" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18d9n8xaq5ncq3375f0xrr96l8si1frczgzdlrz3fl1jby8vbl6f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-bincode" ,rust-bincode-1.1)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-bs58" ,rust-bs58)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-diffs" ,rust-diffs)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-hex" ,rust-hex-0.3)
        ("rust-ignore" ,rust-ignore-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-sanakirja" ,rust-sanakirja-0.10)
        ("rust-sequoia-openpgp" ,rust-sequoia-openpgp)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-toml" ,rust-toml-0.5))))
    (home-page "https://pijul.org/")
    (synopsis
     "A patch-based distributed version control system, easy to use and fast.")
    (description
     "This package provides a patch-based distributed version control system, easy to use and fast.")
    (license license:gpl2+)))

(define-public rust-line
  (package
    (name "rust-line")
    (version "0.1.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "line" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pissvrl5398701zlfd22w51ca32vhw83vbsl58a330hr4w5ra04"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-utf8parse" ,rust-utf8parse))))
    (home-page "")
    (synopsis
     "A pure-Rust implementation of line editing in a terminal")
    (description
     "This package provides a pure-Rust implementation of line editing in a terminal")
    (license #f)))

(define-public rust-pathdiff
  (package
    (name "rust-pathdiff")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pathdiff" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cfg3isnx6mf3wbi7rsg4nmvywby40sbcs589n20fgi09l4p1gx3"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/Manishearth/pathdiff")
    (synopsis
     "Library for diffing paths to obtain relative paths")
    (description
     "Library for diffing paths to obtain relative paths")
    (license #f)))

(define-public rust-rpassword
  (package
    (name "rust-rpassword")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rpassword" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1k8g5lk2y41rj9zr8syqrrd381z8flg2wr4pzmp595hsy4qxjwph"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/conradkdotcom/rpassword")
    (synopsis
     "Read passwords in console applications.")
    (description
     "Read passwords in console applications.")
    (license license:asl2.0)))

(define-public rust-rpassword-2.1.0
  (package
    (name "rust-rpassword")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rpassword" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v255xqkig5lwnczvm3achydhxx6kf9jcdxdlgzndgpd18bp6x6k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/conradkdotcom/rpassword")
    (synopsis
     "Read passwords in console applications.")
    (description
     "Read passwords in console applications.")
    (license license:asl2.0)))

(define-public rust-progrs
  (package
    (name "rust-progrs")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "progrs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "108jx8jrv2r1brhvbqfw6fwx298k5fnw3m46kn7lv0jx2wmf0ifz"))))
    (build-system cargo-build-system)
    (home-page
     "https://nest.pijul.com/laumann/progrs")
    (synopsis
     "A small library for displaying compact progress bars")
    (description
     "This package provides a small library for displaying compact progress bars")
    (license license:gpl2+)))

(define-public rust-reqwest
  (package
    (name "rust-reqwest")
    (version "0.9.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "reqwest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0y4wvzl3pspd8drr2hf9kk107cjw455cb6p529sh90x58dhqjv8g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.9)
        ("rust-bytes" ,rust-bytes-0.4)
        ("rust-cookie" ,rust-cookie)
        ("rust-cookie-store" ,rust-cookie-store-0.7)
        ("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-http" ,rust-http-0.1)
        ("rust-hyper" ,rust-hyper)
        ("rust-hyper-old-types" ,rust-hyper-old-types)
        ("rust-hyper-rustls" ,rust-hyper-rustls)
        ("rust-hyper-tls" ,rust-hyper-tls)
        ("rust-log" ,rust-log-0.4)
        ("rust-mime" ,rust-mime-0.3)
        ("rust-mime-guess" ,rust-mime-guess)
        ("rust-native-tls" ,rust-native-tls)
        ("rust-rustls" ,rust-rustls)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-serde-urlencoded" ,rust-serde-urlencoded)
        ("rust-socks" ,rust-socks)
        ("rust-time" ,rust-time-0.1)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-rustls" ,rust-tokio-rustls)
        ("rust-tokio-threadpool" ,rust-tokio-threadpool-0.1)
        ("rust-tokio-timer" ,rust-tokio-timer-0.2)
        ("rust-trust-dns-resolver"
         ,rust-trust-dns-resolver)
        ("rust-url" ,rust-url-1.7)
        ("rust-uuid" ,rust-uuid-0.7)
        ("rust-webpki-roots" ,rust-webpki-roots)
        ("rust-winreg" ,rust-winreg))
       #:cargo-development-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-libflate" ,rust-libflate)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1))))
    (home-page
     "https://github.com/seanmonstar/reqwest")
    (synopsis "higher level HTTP client library")
    (description "higher level HTTP client library")
    (license #f)))

(define-public rust-sequoia-openpgp
  (package
    (name "rust-sequoia-openpgp")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sequoia-openpgp" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0da8l573l8zp6nzfibsmkjc2z0p3ghhmr3p8h5g6d4jmqwgcia2v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-buffered-reader" ,rust-buffered-reader)
        ("rust-bzip2" ,rust-bzip2)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-idna" ,rust-idna-0.1)
        ("rust-lalrpop-util" ,rust-lalrpop-util)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-memsec" ,rust-memsec)
        ("rust-nettle" ,rust-nettle)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-safemem" ,rust-safemem)
        ("rust-sequoia-rfc2822" ,rust-sequoia-rfc2822)
        ("rust-time" ,rust-time-0.1))
       #:cargo-development-inputs
       (("rust-lalrpop" ,rust-lalrpop)
        ("rust-rpassword" ,rust-rpassword))))
    (home-page "https://sequoia-pgp.org/")
    (synopsis
     "OpenPGP data types and associated machinery")
    (description
     "OpenPGP data types and associated machinery")
    (license license:gpl3)))

(define-public rust-sequoia-openpgp-0.9.0
  (package
    (name "rust-sequoia-openpgp")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sequoia-openpgp" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "007h2pi7lcph5jf5bxjydm7hjwjai33yk6dic3cxknki22lxlkfw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-buffered-reader" ,rust-buffered-reader)
        ("rust-bzip2" ,rust-bzip2)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-idna" ,rust-idna-0.1)
        ("rust-lalrpop" ,rust-lalrpop)
        ("rust-lalrpop-util" ,rust-lalrpop-util)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-memsec" ,rust-memsec)
        ("rust-nettle" ,rust-nettle)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-sequoia-rfc2822" ,rust-sequoia-rfc2822)
        ("rust-time" ,rust-time-0.1))
       #:cargo-development-inputs
       (("rust-rpassword" ,rust-rpassword))))
    (home-page "https://sequoia-pgp.org/")
    (synopsis
     "OpenPGP data types and associated machinery")
    (description
     "OpenPGP data types and associated machinery")
    (license license:gpl3)))

(define-public rust-shell-escape
  (package
    (name "rust-shell-escape")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "shell-escape" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fgs1iyx3b124b7njjmhfn9q5ipmhxrafavh8mxbfl9a9zk162hp"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/sfackler/shell-escape")
    (synopsis
     "Escape characters that may have a special meaning in a shell")
    (description
     "Escape characters that may have a special meaning in a shell")
    (license #f)))

(define-public rust-thrussh
  (package
    (name "rust-thrussh")
    (version "0.21.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thrussh" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k8ah3kx8q6vnkq3hi78s8acxdcws6yck0x989xzx2wi89nqflhl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-cryptovec" ,rust-cryptovec)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-thrussh-keys" ,rust-thrussh-keys)
        ("rust-thrussh-libsodium"
         ,rust-thrussh-libsodium)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6))))
    (home-page "https://pijul.org/thrussh")
    (synopsis "A client and server SSH library.")
    (description
     "This package provides a client and server SSH library.")
    (license license:asl2.0)))

(define-public rust-thrussh-config
  (package
    (name "rust-thrussh-config")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thrussh-config" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0h19qysnbdvv6z2y3ii3cxqn42yvjg73wnghx83kbwj6af6chryb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dirs" ,rust-dirs-2.0)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-thrussh" ,rust-thrussh)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page
     "https://nest.pijul.com/pijul_org/thrussh")
    (synopsis
     "Utilities to parse .ssh/config files, including helpers to implement ProxyCommand in Thrussh.")
    (description
     "Utilities to parse .ssh/config files, including helpers to implement ProxyCommand in Thrussh.")
    (license license:asl2.0)))

(define-public rust-thrussh-keys
  (package
    (name "rust-thrussh-keys")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thrussh-keys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rkhkkav9kv1q9lgxgydnrkniq4ccrf107lcygimralnkwyzjwjy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-bit-vec" ,rust-bit-vec-0.4)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-cryptovec" ,rust-cryptovec)
        ("rust-dirs" ,rust-dirs-2.0)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-hex" ,rust-hex-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-bigint" ,rust-num-bigint)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-thrussh-libsodium"
         ,rust-thrussh-libsodium)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-yasna" ,rust-yasna))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-tokio-uds" ,rust-tokio-uds-0.2))))
    (home-page "https://pijul.org/thrussh")
    (synopsis
     "Deal with SSH keys: load them, decrypt them, call an SSH agent.")
    (description
     "Deal with SSH keys: load them, decrypt them, call an SSH agent.")
    (license license:asl2.0)))

(define-public rust-username
  (package
    (name "rust-username")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "username" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "028s7gpsz17z6chy818bpkxldixfxhlvicvyvhdbrxr7cpgjbr4j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-advapi32-sys" ,rust-advapi32-sys)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://pijul.org/darcs/user")
    (synopsis
     "Portably retrieve the user name (and possibly other information in future versions) of the user running the current thread.")
    (description
     "Portably retrieve the user name (and possibly other information in future versions) of the user running the current thread.")
    (license #f)))

(define-public rust-sha2
  (package
    (name "rust-sha2")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gal773gz8gkpa9rndc917z6rl9kzd8q8gapaxv437s61vyqnkbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-block-buffer" ,rust-block-buffer-0.7)
        ("rust-digest" ,rust-digest-0.8)
        ("rust-fake-simd" ,rust-fake-simd-0.1)
        ("rust-opaque-debug" ,rust-opaque-debug-0.2)
        ("rust-sha2-asm" ,rust-sha2-asm))
       #:cargo-development-inputs
       (("rust-digest" ,rust-digest-0.8)
        ("rust-hex-literal" ,rust-hex-literal-0.2))))
    (home-page
     "https://github.com/RustCrypto/hashes")
    (synopsis "SHA-2 hash functions")
    (description "SHA-2 hash functions")
    (license (list license:expat license:asl2.0))))

(define-public rust-assert-matches
  (package
    (name "rust-assert-matches")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "assert-matches" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rar61v00gz2aniid0mylxcr4q98s6l77c3hvbszmg57kj10msvx"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/murarth/assert_matches")
    (synopsis
     "Asserts that a value matches a pattern")
    (description
     "Asserts that a value matches a pattern")
    (license #f)))

(define-public rust-base58
  (package
    (name "rust-base58")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base58" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10xfw6v7jzn9i682mkw9nqybzafrvl3i2wawwgp5a8gh2n0fw92h"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/debris/base58")
    (synopsis "Tiny and fast base58 encoding")
    (description "Tiny and fast base58 encoding")
    (license license:expat)))

(define-public rust-rust-base58
  (package
    (name "rust-rust-base58")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rust-base58" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fa4y2jjjmg1a0cr3gz4z8rkic0hx2vx5nm23za9lwf6rlgvj4xk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num" ,rust-num))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/nham/rust-base58")
    (synopsis
     "Simple library for converting to and from base-58 strings")
    (description
     "Simple library for converting to and from base-58 strings.")
    (license #f)))

(define-public rust-diffs
  (package
    (name "rust-diffs")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "diffs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "036sqycmir4bbl4016jprsyjq4hicc31r68dyqadmc8ac9pk55d1"))))
    (build-system cargo-build-system)
    (home-page
     "https://nest.pijul.com/pijul_org/pijul")
    (synopsis
     "A number of diff algorithms, also called longest common subsequence.")
    (description
     "This package provides a number of diff algorithms, also called longest common subsequence.")
    (license #f)))

(define-public rust-sanakirja
  (package
    (name "rust-sanakirja")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sanakirja" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00rn1i1hrdylgx7k70ag4f1hzmxfbn4mza5b3psx1c9kmiv000hv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fs2" ,rust-fs2)
        ("rust-log" ,rust-log-0.4)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-uuid" ,rust-uuid-0.7))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-hex" ,rust-hex-0.3)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://nest.pijul.com/pijul_org/sanakirja")
    (synopsis
     "A key-value dictionary, using copy-on-write and B trees.")
    (description
     "This package provides a key-value dictionary, using copy-on-write and B trees.")
    (license #f)))

(define-public rust-sanakirja-0.10
  (package
    (inherit rust-sanakirja)
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sanakirja" version))
       (file-name
        (string-append (package-name rust-sanakirja) "-" version ".tar.gz"))
       (sha256
        (base32
         "1fhn5lb6jn0pimnk0nbf5h4xvp28xdkdh33d57gq1ixy8b2y091y"))))))

(define-public rust-utf8parse
  (package
    (name "rust-utf8parse")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8parse" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zamsj2986shm4x9zncjf2m5qy9scaw7qnxw4f89b2afpg6a8wl7"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/jwilm/vte")
    (synopsis "Table-driven UTF-8 parser")
    (description "Table-driven UTF-8 parser")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cookie
  (package
    (name "rust-cookie")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cookie" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mdvqixahcywvqp0y8k2skkgbpfhsp0w73l9mz93dcrx1gq091l8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-ring" ,rust-ring)
        ("rust-time" ,rust-time-0.1)
        ("rust-url" ,rust-url-1.7))))
    (home-page
     "https://github.com/alexcrichton/cookie-rs")
    (synopsis
     "Crate for parsing HTTP cookie headers and managing a cookie jar")
    (description
     "Crate for parsing HTTP cookie headers and managing a cookie jar.  Supports signed
and private (encrypted + signed) jars.")
    (license #f)))

(define-public rust-cookie-store-0.7
  (package
    (name "rust-cookie-store")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cookie-store" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "174i9k9g62pfx7y1nqynywdpjplkl3j4hi3ck6bz2r996qzhnxa6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cookie" ,rust-cookie)
        ("rust-idna" ,rust-idna-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-publicsuffix" ,rust-publicsuffix)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-time" ,rust-time-0.1)
        ("rust-try-from" ,rust-try-from-0.3)
        ("rust-url" ,rust-url-1.7))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-pretty-assertions"
         ,rust-pretty-assertions))))
    (home-page
     "https://github.com/pfernie/cookie_store")
    (synopsis
     "Implementation of Cookie storage and retrieval per [RFC6265](http://tools.ietf.org/html/rfc6265)")
    (description
     "Implementation of Cookie storage and retrieval per [RFC6265](http://tools.ietf.org/html/rfc6265)")
    (license #f)))

(define-public rust-hyper
  (package
    (name "rust-hyper")
    (version "0.12.22")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zcq9jf5m3z4lzwagkbg2x9p58xm6cr38mwy2pin9kw70c9bhbb2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures-channel-preview"
         ,rust-futures-channel-preview-0.3)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview-0.3)
        ("rust-futures-cpupool" ,rust-futures-cpupool-0.1)
        ("rust-futures-util-preview"
         ,rust-futures-util-preview-0.3)
        ("rust-h2" ,rust-h2)
        ("rust-http" ,rust-http-0.1)
        ("rust-http-body" ,rust-http-body)
        ("rust-httparse" ,rust-httparse-1.3)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-net2" ,rust-net2-0.2)
        ("rust-pin-project" ,rust-pin-project)
        ("rust-time" ,rust-time-0.1)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-net" ,rust-tokio-net)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1)
        ("rust-tokio-timer" ,rust-tokio-timer-0.2)
        ("rust-tower-make" ,rust-tower-make)
        ("rust-tower-service" ,rust-tower-service)
        ("rust-want" ,rust-want-0.0.6))
       #:cargo-development-inputs
       (("rust-matches" ,rust-matches-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-pretty-env-logger"
         ,rust-pretty-env-logger)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-spmc" ,rust-spmc)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-fs" ,rust-tokio-fs-0.1)
        ("rust-tokio-test" ,rust-tokio-test)
        ("rust-url" ,rust-url-1.7))))
    (home-page "https://hyper.rs")
    (synopsis "A fast and correct HTTP library.")
    (description
     "This package provides a fast and correct HTTP library.")
    (license license:expat)))

(define-public rust-hyper-old-types
  (package
    (name "rust-hyper-old-types")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-old-types" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i69sks0bwamzqdbx8ffgkssxffv6crdmwjgl47nr5pkxi8vx5k8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-bytes" ,rust-bytes-0.4)
        ("rust-http" ,rust-http-0.1)
        ("rust-httparse" ,rust-httparse-1.3)
        ("rust-language-tags" ,rust-language-tags-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-mime" ,rust-mime-0.3)
        ("rust-percent-encoding" ,rust-percent-encoding-1.0)
        ("rust-time" ,rust-time-0.1)
        ("rust-unicase" ,rust-unicase-2.4))))
    (home-page "https://hyper.rs")
    (synopsis "HTTP types from hyper 0.11.x")
    (description "HTTP types from hyper 0.11.x")
    (license license:expat)))

(define-public rust-hyper-rustls
  (package
    (name "rust-hyper-rustls")
    (version "0.18.0-alpha.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-rustls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08s8c8hqgmjmv0ivavn90yxvh9vbakr4a5dzj70y0x6qc6vm0hgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-ct-logs" ,rust-ct-logs)
        ("rust-futures-preview" ,rust-futures-preview)
        ("rust-hyper" ,rust-hyper)
        ("rust-rustls" ,rust-rustls)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-rustls" ,rust-tokio-rustls)
        ("rust-webpki" ,rust-webpki)
        ("rust-webpki-roots" ,rust-webpki-roots))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://github.com/ctz/hyper-rustls")
    (synopsis
     "Rustls+hyper integration for pure rust HTTPS")
    (description
     "Rustls+hyper integration for pure rust HTTPS")
    (license #f)))

(define-public rust-hyper-tls
  (package
    (name "rust-hyper-tls")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyper-tls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kqp4sz8613j6nv375wfj3gh95ff4nb6a3rb1f2vbx0almm0v01s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-hyper" ,rust-hyper)
        ("rust-native-tls" ,rust-native-tls)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-tls" ,rust-tokio-tls))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://hyper.rs")
    (synopsis
     "Default TLS implementation for use with hyper")
    (description
     "Default TLS implementation for use with hyper")
    (license #f)))

(define-public rust-mime-guess
  (package
    (name "rust-mime-guess")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mime-guess" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16c5ssgali30db6jh1cndy77dd1qgcykhshiyfyjvxxf94wx03hs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-mime" ,rust-mime-0.3)
        ("rust-unicase" ,rust-unicase-2.4))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-unicase" ,rust-unicase-2.4))))
    (home-page
     "https://github.com/abonander/mime_guess")
    (synopsis
     "A simple crate for detection of a file's MIME type by its extension.")
    (description
     "This package provides a simple crate for detection of a file's MIME type by its extension.")
    (license license:expat)))

(define-public rust-native-tls
  (package
    (name "rust-native-tls")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "native-tls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ki7cj4wzyd2nach4qdjly69sp7rs0yz3n3z2ii4mm1gqajg2bab"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-schannel" ,rust-schannel-0.1)
        ("rust-security-framework"
         ,rust-security-framework)
        ("rust-security-framework-sys"
         ,rust-security-framework-sys-0.3)
        ("rust-tempfile" ,rust-tempfile-3.0))
       #:cargo-development-inputs
       (("rust-hex" ,rust-hex-0.3))))
    (home-page
     "https://github.com/sfackler/rust-native-tls")
    (synopsis
     "A wrapper over a platform's native TLS implementation")
    (description
     "This package provides a wrapper over a platform's native TLS implementation")
    (license #f)))

(define-public rust-rustls
  (package
    (name "rust-rustls")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17n0fx3fpkg4fhpdplrdhkissnl003kj90vzbqag11vkpyqihnmj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-log" ,rust-log-0.4)
        ("rust-ring" ,rust-ring)
        ("rust-sct" ,rust-sct)
        ("rust-webpki" ,rust-webpki))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-webpki-roots" ,rust-webpki-roots))))
    (home-page "https://github.com/ctz/rustls")
    (synopsis
     "Rustls is a modern TLS library written in Rust.")
    (description
     "Rustls is a modern TLS library written in Rust.")
    (license #f)))

(define-public rust-serde-urlencoded
  (package
    (name "rust-serde-urlencoded")
    (version "0.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-urlencoded" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nhnzllx5xrij4x17g351n14md691r95mxr7sbpz4sl80n8xcbb4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dtoa" ,rust-dtoa-0.4)
        ("rust-itoa" ,rust-itoa-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-url" ,rust-url-1.7))
       #:cargo-development-inputs
       (("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page
     "https://github.com/nox/serde_urlencoded")
    (synopsis "`x-www-form-urlencoded` meets Serde")
    (description
     "`x-www-form-urlencoded` meets Serde")
    (license #f)))

(define-public rust-socks
  (package
    (name "rust-socks")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "socks" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hnbw4c4j7dn9n3bd1v7ddkdzlxlzkfw3z29da1nxlj6jgx4r9p6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-ws2-32-sys" ,rust-ws2-32-sys-0.2))))
    (home-page
     "https://github.com/sfackler/rust-socks")
    (synopsis "SOCKS proxy clients")
    (description "SOCKS proxy clients")
    (license #f)))

(define-public rust-tokio-rustls
  (package
    (name "rust-tokio-rustls")
    (version "0.12.0-alpha.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-rustls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07bi6yd85c1h87wgswih6c567ili41g3wyzwrjr5gvrzp3xc276i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-core-preview"
         ,rust-futures-core-preview-0.3)
        ("rust-rustls" ,rust-rustls)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-webpki" ,rust-webpki))
       #:cargo-development-inputs
       (("rust-futures-util-preview"
         ,rust-futures-util-preview-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-webpki-roots" ,rust-webpki-roots))))
    (home-page
     "https://github.com/quininer/tokio-rustls")
    (synopsis
     "Asynchronous TLS/SSL streams for Tokio using Rustls.")
    (description
     "Asynchronous TLS/SSL streams for Tokio using Rustls.")
    (license #f)))

(define-public rust-trust-dns-resolver
  (package
    (name "rust-trust-dns-resolver")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-resolver" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0cjkz3rcisk7v354l5hqb3j5x9x389pjqd6da6h8skvqxr0kl6yb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-ipconfig" ,rust-ipconfig)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-lru-cache" ,rust-lru-cache)
        ("rust-resolv-conf" ,rust-resolv-conf-0.6)
        ("rust-rustls" ,rust-rustls)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
        ("rust-tokio-udp" ,rust-tokio-udp-0.1)
        ("rust-trust-dns-https" ,rust-trust-dns-https)
        ("rust-trust-dns-native-tls"
         ,rust-trust-dns-native-tls)
        ("rust-trust-dns-openssl"
         ,rust-trust-dns-openssl)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto)
        ("rust-trust-dns-rustls" ,rust-trust-dns-rustls)
        ("rust-webpki-roots" ,rust-webpki-roots))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis
     "Trust-DNS is a safe and secure DNS library")
    (description
     "Trust-DNS is a safe and secure DNS library.  This Resolver
library uses the Client library to perform all DNS queries.  The
Resolver is intended to be a high-level library for any DNS record
resolution see Resolver and AsyncResolver for supported resolution
types.  The Client can be used for other queries.")
    (license #f)))

(define-public rust-webpki-roots
  (package
    (name "rust-webpki-roots")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webpki-roots" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12vi8dh0yik0h4f0b9dnlw5i3gxyky7iblbksh6zcq4xvlvswqm2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-webpki" ,rust-webpki))))
    (home-page "https://github.com/ctz/webpki-roots")
    (synopsis
     "Mozilla's CA root certificates for use with webpki")
    (description
     "Mozilla's CA root certificates for use with webpki")
    (license license:mpl2.0)))

(define-public rust-winreg
  (package
    (name "rust-winreg")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winreg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jdcqr6zmvwyrp87h48miasfdvv16gjsb60rc8dy2kqwb3mnv65j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page
     "https://github.com/gentoo90/winreg-rs")
    (synopsis
     "Rust bindings to MS Windows Registry API")
    (description
     "Rust bindings to MS Windows Registry API")
    (license license:expat)))

(define-public rust-libflate
  (package
    (name "rust-libflate")
    (version "0.1.27")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libflate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p8z839c5lpl0g01mf8iglys9lgcjxw6xjw56crhwp8z7gs5s4yr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-adler32" ,rust-adler32-1.0)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-rle-decode-fast" ,rust-rle-decode-fast)
        ("rust-take-mut" ,rust-take-mut))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2))))
    (home-page "https://github.com/sile/libflate")
    (synopsis
     "A Rust implementation of DEFLATE algorithm and related formats (ZLIB, GZIP)")
    (description
     "This package provides a Rust implementation of DEFLATE algorithm and related formats (ZLIB, GZIP)")
    (license license:expat)))

(define-public rust-buffered-reader
  (package
    (name "rust-buffered-reader")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "buffered-reader" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05rklfiia1k4c4ifpim08l22i0q0l3j9xdg2yh3njrp6w58z6z13"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bzip2" ,rust-bzip2)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://sequoia-pgp.org/")
    (synopsis "A super-powered Reader")
    (description
     "This package provides a super-powered Reader")
    (license license:gpl3)))

(define-public rust-bzip2
  (package
    (name "rust-bzip2")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bzip2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fvfwanp42j1zpig880jhb5mc0na50bijmwd6211p77sy35w7ds2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bzip2-sys" ,rust-bzip2-sys)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-partial-io" ,rust-partial-io)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-tokio-core" ,rust-tokio-core-0.1))))
    (home-page
     "https://github.com/alexcrichton/bzip2-rs")
    (synopsis
     "Bindings to libbzip2 for bzip2 compression and decompression")
    (description
     "Bindings to libbzip2 for bzip2 compression and decompression
exposed as Reader/Writer streams.")
    (license #f)))

(define-public rust-lalrpop-util
  (package
    (name "rust-lalrpop-util")
    (version "0.17.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lalrpop-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z4bjn3g9232n1im5p6mn9mwlvw5aj5iac6hbjmljqxkhf3d2xy2"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/lalrpop/lalrpop")
    (synopsis
     "Runtime library for parsers generated by LALRPOP")
    (description
     "Runtime library for parsers generated by LALRPOP")
    (license #f)))

(define-public rust-memsec
  (package
    (name "rust-memsec")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "memsec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "017b49dddny5zdjkxvxwv1452c87isd03pis9z5pp6azcqpvkayc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mach-o-sys" ,rust-mach-o-sys)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/quininer/memsec")
    (synopsis
     "Rust implementation `libsodium/utils`.")
    (description
     "Rust implementation `libsodium/utils`.")
    (license license:expat)))

(define-public rust-nettle
  (package
    (name "rust-nettle")
    (version "5.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nettle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zfplqdf3mag8r7lc124hl24vri8yg711jmm8gl1mpwnlhass2n4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-failure" ,rust-failure-0.1)
        ("rust-getrandom" ,rust-getrandom-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-nettle-sys" ,rust-nettle-sys))))
    (home-page
     "https://gitlab.com/sequoia-pgp/nettle-rs")
    (synopsis
     "Rust bindings for the Nettle cryptographic library")
    (description
     "Rust bindings for the Nettle cryptographic library")
    (license #f)))

(define-public rust-sequoia-rfc2822
  (package
    (name "rust-sequoia-rfc2822")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sequoia-rfc2822" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1aj34i6862718m162rqfv69fkmvdw063s6ws7hbp42n73gb08p5c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-failure" ,rust-failure-0.1)
        ("rust-lalrpop-util" ,rust-lalrpop-util))
       #:cargo-development-inputs
       (("rust-lalrpop" ,rust-lalrpop)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://sequoia-pgp.org/")
    (synopsis "An RFC 2822 name-addr parser")
    (description "An RFC 2822 name-addr parser")
    (license license:gpl3)))

(define-public rust-lalrpop
  (package
    (name "rust-lalrpop")
    (version "0.17.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lalrpop" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nv7ma8cgw3r1fcma7gy06fwwlpl4fkz91mxv5kjhiaxwyc3dp34"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ascii-canvas" ,rust-ascii-canvas)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-bit-set" ,rust-bit-set-0.5)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-docopt" ,rust-docopt-1.1)
        ("rust-ena" ,rust-ena)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lalrpop-util" ,rust-lalrpop-util)
        ("rust-petgraph" ,rust-petgraph-0.4)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-sha2" ,rust-sha2)
        ("rust-string-cache" ,rust-string-cache-0.7)
        ("rust-term" ,rust-term-0.5)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/lalrpop/lalrpop")
    (synopsis "convenient LR(1) parser generator")
    (description "convenient LR(1) parser generator")
    (license #f)))

(define-public rust-thrussh-libsodium
  (package
    (name "rust-thrussh-libsodium")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thrussh-libsodium" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fjssjiwnmbxjvajk37l7k0fcw1ys97j7n8bpn3q3bbnz2qfrphv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-pkg-config" ,rust-pkg-config-0.3))
       #:cargo-development-inputs ()))
    (home-page
     "https://nest.pijul.com/pijul_org/thrussh")
    (synopsis
     "Straightforward bindings to libsodium")
    (description
     "Straightforward bindings to libsodium")
    (license #f)))

(define-public rust-bit-vec
  (package
    (name "rust-bit-vec")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bit-vec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xs6yba2jqlmzcm9ahzggrlb933c08ik9ah8zdsybylzhc83llm4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/contain-rs/bit-vec")
    (synopsis "A vector of bits")
    (description
     "This package provides a vector of bits")
    (license #f)))

(define-public rust-bit-vec-0.4
  (package
    (inherit rust-bit-vec)
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bit-vec" version))
       (file-name
        (string-append (package-name rust-bit-vec) "-" version ".tar.gz"))
       (sha256
        (base32
         "0pw902a8ail0k64a7092a8vngfzsq7xkj2r22hz6q1z62s5zzd02"))))))

(define-public rust-num-bigint
  (package
    (name "rust-num-bigint")
    (version "0.1.44")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-bigint" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hg80xd7vd5yqzks1h0zk2fcgqnf84m2cdj9q4cffk581nnrjf76"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-quickcheck-macros"
         ,rust-quickcheck-macros)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page
     "https://github.com/rust-num/num-bigint")
    (synopsis "Big integer implementation for Rust")
    (description
     "Big integer implementation for Rust")
    (license #f)))

(define-public rust-yasna
  (package
    (name "rust-yasna")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yasna" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1frcd79rzi6dlly7lldjn2avnhfmj6yxrjsgvb2p1k2zbxdzyc9s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bit-vec" ,rust-bit-vec)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-num" ,rust-num)
        ("rust-num-bigint" ,rust-num-bigint))
       #:cargo-development-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/qnighy/yasna.rs")
    (synopsis "ASN.1 library for Rust")
    (description "ASN.1 library for Rust")
    (license #f)))

(define-public rust-advapi32-sys
  (package
    (name "rust-advapi32-sys")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "advapi32-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16largvlrd1800vvdchml0ngnszjlnpqm01rcz5hm7di1h48hrg0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Contains function definitions for the Windows API library advapi32. See winapi for types and constants.")
    (description
     "Contains function definitions for the Windows API library advapi32.  See winapi for types and constants.")
    (license license:expat)))

(define-public rust-sha2-asm
  (package
    (name "rust-sha2-asm")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha2-asm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0y245rzdh4azgdmjmjb7bavsf8p18rn067fy7r1msgxsigxqmfla"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page
     "https://github.com/RustCrypto/asm-hashes")
    (synopsis
     "Assembly implementation of SHA-2 compression functions")
    (description
     "Assembly implementation of SHA-2 compression functions")
    (license license:expat)))

(define-public rust-fs2
  (package
    (name "rust-fs2")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fs2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04v2hwk7035c088f19mfl5b1lz84gnvv2hv6m935n0hmirszqr4m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://github.com/danburkert/fs2-rs")
    (synopsis
     "Cross-platform file locks and file duplication.")
    (description
     "Cross-platform file locks and file duplication.")
    (license #f)))

(define-public rust-webpki
  (package
    (name "rust-webpki")
    (version "0.21.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webpki" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1d41gfai89q7drm92mgmh6fk57nikv2vqsa773i100dcf3kn9rnp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ring" ,rust-ring)
        ("rust-untrusted" ,rust-untrusted-0.7))
       #:cargo-development-inputs
       (("rust-base64" ,rust-base64-0.10))))
    (home-page
     "https://github.com/briansmith/webpki")
    (synopsis
     "Web PKI X.509 Certificate Verification.")
    (description
     "Web PKI X.509 Certificate Verification.")
    (license #f)))

(define-public rust-ipconfig
  (package
    (name "rust-ipconfig")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ipconfig" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gyqiqr4nk2dw9ild1aq3hnv6984sgydfdq7ki586q5ydwhzlyda"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-socket2" ,rust-socket2)
        ("rust-widestring" ,rust-widestring-0.4)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-winreg" ,rust-winreg))))
    (home-page
     "https://github.com/liranringel/ipconfig")
    (synopsis
     "Get network adapters information and network configuration for windows")
    (description
     "Get network adapters information and network configuration for windows.")
    (license #f)))

(define-public rust-lru-cache
  (package
    (name "rust-lru-cache")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lru-cache" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "071viv6g2p3akwqmfb3c8vsycs5n7kr17b70l7la071jv0d4zqii"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-heapsize" ,rust-heapsize-0.4)
        ("rust-linked-hash-map" ,rust-linked-hash-map-0.5))))
    (home-page
     "https://github.com/contain-rs/lru-cache")
    (synopsis
     "A cache that holds a limited number of key-value pairs")
    (description
     "This package provides a cache that holds a limited number of key-value pairs")
    (license #f)))

(define-public rust-trust-dns-https
  (package
    (name "rust-trust-dns-https")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-https" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ypkbgm5p7smjfkca3gaszhvknbr2ykf8skw8pyvpn0sq95lv5ia"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-data-encoding" ,rust-data-encoding-2.1)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-h2" ,rust-h2)
        ("rust-http" ,rust-http-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustls" ,rust-rustls)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
        ("rust-tokio-rustls" ,rust-tokio-rustls)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto)
        ("rust-trust-dns-rustls" ,rust-trust-dns-rustls)
        ("rust-typed-headers" ,rust-typed-headers)
        ("rust-webpki" ,rust-webpki)
        ("rust-webpki-roots" ,rust-webpki-roots))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis
     "Trust-DNS is a safe and secure DNS library")
    (description
     "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use DNS over HTTPS.")
    (license #f)))

(define-public rust-trust-dns-native-tls
  (package
    (name "rust-trust-dns-native-tls")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-native-tls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dkwfqxjjmbikm3mav71zjymgy8wmqr4mca64x49qzknvc4qwy6z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-native-tls" ,rust-native-tls)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
        ("rust-tokio-tls" ,rust-tokio-tls)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis
     "Trust-DNS is a safe and secure DNS library")
    (description
     "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use native-tls for TLS.")
    (license #f)))

(define-public rust-trust-dns-openssl
  (package
    (name "rust-trust-dns-openssl")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-openssl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19qxi4y33wd2g55r4v9d6b06d20bdhqhvsrsmbpz5ir3i7l5psp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-tokio-openssl" ,rust-tokio-openssl)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto))
       #:cargo-development-inputs
       (("rust-openssl" ,rust-openssl-0.10)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis
     "Trust-DNS is a safe and secure DNS library")
    (description
     "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use tokio-openssl for TLS.")
    (license #f)))

(define-public rust-trust-dns-proto
  (package
  (name "rust-trust-dns-proto")
  (version "0.8.0")
  (source
    (origin
      (method url-fetch)
      (uri (crate-uri "trust-dns-proto" version))
      (file-name
        (string-append name "-" version ".tar.gz"))
      (sha256
        (base32
          "1f9xjyz7fsa83dj00zif7lmljd4x420c0vmniinhb7c35777wi85"))))
  (build-system cargo-build-system)
  (arguments
    `(#:cargo-inputs
      (("rust-data-encoding" ,rust-data-encoding-2.1)
       ("rust-enum-as-inner" ,rust-enum-as-inner)
       ("rust-failure" ,rust-failure-0.1)
       ("rust-futures" ,rust-futures-0.1)
       ("rust-idna" ,rust-idna-0.1)
       ("rust-lazy-static" ,rust-lazy-static-1.3)
       ("rust-log" ,rust-log-0.4)
       ("rust-openssl" ,rust-openssl-0.10)
       ("rust-rand" ,rust-rand-0.4)
       ("rust-ring" ,rust-ring)
       ("rust-serde" ,rust-serde-1.0)
       ("rust-smallvec" ,rust-smallvec-0.6)
       ("rust-socket2" ,rust-socket2)
       ("rust-tokio-executor" ,rust-tokio-executor-0.1)
       ("rust-tokio-io" ,rust-tokio-io-0.1)
       ("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
       ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
       ("rust-tokio-timer" ,rust-tokio-timer-0.2)
       ("rust-tokio-udp" ,rust-tokio-udp-0.1)
       ("rust-url" ,rust-url-1.7))
      #:cargo-development-inputs
      (("rust-env-logger" ,rust-env-logger-0.6)
       ("rust-tokio" ,rust-tokio-0.1))))
  (home-page "http://www.trust-dns.org/index.html")
  (synopsis
    "Trust-DNS is a safe and secure DNS library")
  (description
    "Trust-DNS is a safe and secure DNS library.  This is the
foundational DNS protocol library for all Trust-DNS projects.")
  (license #f)))

(define-public rust-trust-dns-rustls
  (package
    (name "rust-trust-dns-rustls")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "trust-dns-rustls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0glpggq31764q7lp19h5l6implsr7ik015qkm5rg7pqwy93krsb3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustls" ,rust-rustls)
        ("rust-tokio-rustls" ,rust-tokio-rustls)
        ("rust-tokio-tcp" ,rust-tokio-tcp-0.1)
        ("rust-trust-dns-proto" ,rust-trust-dns-proto)
        ("rust-webpki" ,rust-webpki))
       #:cargo-development-inputs
       (("rust-openssl" ,rust-openssl-0.10)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page "http://www.trust-dns.org/index.html")
    (synopsis
     "Trust-DNS is a safe and secure DNS library")
    (description
     "Trust-DNS is a safe and secure DNS library.  This is an
extension for the Trust-DNS client to use rustls for TLS.")
    (license #f)))

(define-public rust-ring
  (package
    (name "rust-ring")
    (version "0.16.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ring" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b6zxjfdbdaxwk7432pm1gpsvydb265fp95aw6zan7rb3zdghiv7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-spin" ,rust-spin-0.5)
        ("rust-untrusted" ,rust-untrusted-0.7)
        ("rust-web-sys" ,rust-web-sys)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test-0.2))))
    (home-page "https://github.com/briansmith/ring")
    (synopsis "Safe, fast, small crypto using Rust.")
    (description
     "Safe, fast, small crypto using Rust.")
    (license #f)))

(define-public rust-sct
  (package
    (name "rust-sct")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sct" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g4dz7las43kcpi9vqv9c6l1afjkdv3g3w3s7d2w7a7w77wjl173"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ring" ,rust-ring)
        ("rust-untrusted" ,rust-untrusted-0.7))))
    (home-page "https://github.com/ctz/sct.rs")
    (synopsis
     "Certificate transparency SCT verification library")
    (description
     "Certificate transparency SCT verification library")
    (license #f)))

(define-public rust-security-framework
  (package
    (name "rust-security-framework")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "security-framework" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hmdsdj061wk76g3fajbfjnw74p0q45hy8hfngp7diwy987kvrpf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-core-foundation" ,rust-core-foundation)
        ("rust-core-foundation-sys"
         ,rust-core-foundation-sys-0.6)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-security-framework-sys"
         ,rust-security-framework-sys-0.3))
       #:cargo-development-inputs
       (("rust-hex" ,rust-hex-0.3)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://lib.rs/crates/security_framework")
    (synopsis
     "Security.framework bindings for macOS and iOS")
    (description
     "Security.framework bindings for macOS and iOS")
    (license #f)))

(define-public rust-tokio-tls
  (package
    (name "rust-tokio-tls")
    (version "0.3.0-alpha.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tls" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hcxgqqmg8v0lmw5hnfr5w2x7p2x97m50yisjrmxjcz89a8v2ay6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-native-tls" ,rust-native-tls)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-futures-preview" ,rust-futures-preview)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-schannel" ,rust-schannel-0.1)
        ("rust-security-framework"
         ,rust-security-framework)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-net" ,rust-tokio-net)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://tokio.rs")
    (synopsis
     "An implementation of TLS/SSL streams for Tokio")
    (description
     "An implementation of TLS/SSL streams for Tokio giving an
implementation of TLS for nonblocking I/O streams.")
    (license license:expat)))

(define-public rust-ct-logs
  (package
    (name "rust-ct-logs")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ct-logs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04wiwiv4ghni3x2vni3z711mlz0ndqvh04vmdkbw3nr7zbsqcdjd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-sct" ,rust-sct))))
    (home-page "https://github.com/ctz/ct-logs")
    (synopsis
     "Google's list of Certificate Transparency logs for use with sct crate")
    (description
     "Google's list of Certificate Transparency logs for use with sct crate")
    (license #f)))

(define-public rust-futures-preview
  (package
    (name "rust-futures-preview")
    (version "0.3.0-alpha.18")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-preview" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dg4qijba037xqykminifxpnjasabcjx9pwa3ww8wcmj9w6gka7g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-channel-preview"
         ,rust-futures-channel-preview-0.3)
        ("rust-futures-core-preview" ,rust-futures-core-preview-0.3)
        ("rust-futures-executor-preview"
         ,rust-futures-executor-preview-0.3)
        ("rust-futures-io-preview" ,rust-futures-io-preview-0.3)
        ("rust-futures-sink-preview" ,rust-futures-sink-preview-0.3)
        ("rust-futures-util-preview" ,rust-futures-util-preview-0.3))))
    (home-page
     "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
     "An implementation of futures and streams")
    (description
     "An implementation of futures and streams featuring zero allocations,
composability, and iterator-like interfaces.")
    (license (list license:expat license:asl2.0))))

(define-public rust-h2
  (package
    (name "rust-h2")
    (version "0.1.26")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "h2" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qn457y8xh03p7c7cpk76r22gqpyqxc58g5022j3iya7d0j4rcx5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-fnv" ,rust-fnv-1.0)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview-0.3)
        ("rust-futures-sink-preview"
         ,rust-futures-sink-preview-0.3)
        ("rust-futures-util-preview"
         ,rust-futures-util-preview-0.3)
        ("rust-http" ,rust-http-0.1)
        ("rust-indexmap" ,rust-indexmap-1.0)
        ("rust-log" ,rust-log-0.4)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-string" ,rust-string)
        ("rust-tokio-codec" ,rust-tokio-codec-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-hex" ,rust-hex-0.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rustls" ,rust-rustls)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-rustls" ,rust-tokio-rustls)
        ("rust-walkdir" ,rust-walkdir-2.2)
        ("rust-webpki" ,rust-webpki)
        ("rust-webpki-roots" ,rust-webpki-roots))))
    (home-page "https://github.com/hyperium/h2")
    (synopsis "An HTTP/2.0 client and server")
    (description "An HTTP/2.0 client and server")
    (license license:expat)))

(define-public rust-http-body
  (package
  (name "rust-http-body")
  (version "0.2.0-alpha.1")
  (source
    (origin
      (method url-fetch)
      (uri (crate-uri "http-body" version))
      (file-name
        (string-append name "-" version ".tar.gz"))
      (sha256
        (base32
          "12nrv6h7amr4lj1k619a6yypphx2q6k5i56kcpbasphmyshxzj0v"))))
  (build-system cargo-build-system)
  (arguments
    `(#:cargo-inputs
      (("rust-bytes" ,rust-bytes-0.4)
       ("rust-http" ,rust-http-0.1))))
  (home-page
    "https://github.com/hyperium/http-body")
  (synopsis
    "Trait representing an HTTP request or response body")
  (description
    "Trait representing an asynchronous, streaming, HTTP request or
response body.")
  (license license:expat)))

(define rust-pin-project
  (package
    (name "rust-pin-project")
    (version "0.4.0-alpha.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x9q9lblbib3hr41828ihr86zkrrndmk7pqhrxn09hww8g301arp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-pin-project-internal"
         ,rust-pin-project-internal))
       #:cargo-development-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs-0.3))))
    (home-page
     "https://github.com/taiki-e/pin-project")
    (synopsis
     "A crate for safe and ergonomic pin-projection")
    (description
     "This package provides a crate for safe and ergonomic pin-projection.")
    (license #f)))

(define-public rust-tokio-net
  (package
    (name "rust-tokio-net")
    (version "0.2.0-alpha.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-net" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15vm0bndn6zcpkp1yb6v736rbhqgim5skc76rz299xd3y0pr249a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-crossbeam-queue" ,rust-crossbeam-queue-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview-0.3)
        ("rust-futures-sink-preview"
         ,rust-futures-sink-preview-0.3)
        ("rust-futures-util-preview"
         ,rust-futures-util-preview-0.3)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-named-pipes" ,rust-mio-named-pipes-0.1)
        ("rust-mio-uds" ,rust-mio-uds-0.6)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-parking-lot" ,rust-parking-lot-0.8)
        ("rust-signal-hook-registry"
         ,rust-signal-hook-registry-1.0)
        ("rust-slab" ,rust-slab-0.4)
        ("rust-tokio-codec" ,rust-tokio-codec-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1)
        ("rust-tracing" ,rust-tracing)
        ("rust-tracing" ,rust-tracing)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://tokio.rs")
    (synopsis
     "Event loop that drives Tokio I/O resources")
    (description
     "Event loop that drives Tokio I/O resources.")
    (license license:expat)))

(define-public rust-tower-make
  (package
    (name "rust-tower-make")
    (version "0.1.0-alpha.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-make" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hqhj3zp8ycczq6j2babrzrykxrpc52yclb905qfcaly8415v27s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tower-service" ,rust-tower-service))))
    (home-page "https://github.com/tower-rs/tower")
    (synopsis
     "Trait aliases for Services that produce specific types of Responses")
    (description
     "Trait aliases for Services that produce specific types of Responses.")
    (license license:expat)))

(define-public rust-tower-service
  (package
    (name "rust-tower-service")
    (version "0.3.0-alpha.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-service" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10rbh8ggpsn7mn4rmd3ax1cvw0xpx44dbmmmz6ip97317kw05ckv"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/tower-rs/tower")
    (synopsis
     "Trait representing an asynchronous, request / response based, client or server")
    (description
     "Trait representing an asynchronous, request / response based,
client or server.")
    (license license:expat)))

(define rust-want
  (package
    (name "rust-want")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "want" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "181b2zmwfq389x9n2g1n37cvcvvdand832zz6v8i1l8wrdlaks0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-try-lock" ,rust-try-lock-0.2))
       #:cargo-development-inputs
       (("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1))))
    (home-page "https://github.com/seanmonstar/want")
    (synopsis
     "Detect when another Future wants a result.")
    (description
     "Detect when another Future wants a result.")
    (license license:expat)))

(define rust-want-0.0.6
  (package
    (name "rust-want")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "want" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cznvlky1zbxhwlajdi0kvwq3ma8wsmalaf51j1vip9hbx3n8x3r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-try-lock" ,rust-try-lock-0.2))
       #:cargo-development-inputs
       (("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1))))
    (home-page "https://github.com/seanmonstar/want")
    (synopsis
     "Detect when another Future wants a result.")
    (description
     "Detect when another Future wants a result.")
    (license license:expat)))

(define-public rust-pretty-env-logger
  (package
    (name "rust-pretty-env-logger")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pretty-env-logger" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0x4hyjlnvvhyk9m74iypzybm22w3dl2k8img4b956239n5vf8zki"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4))))
    (home-page
     "https://github.com/seanmonstar/pretty-env-logger")
    (synopsis "a visually pretty env_logger")
    (description "a visually pretty env_logger")
    (license #f)))

(define-public rust-spmc
  (package
    (name "rust-spmc")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spmc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rgcqgj6b3d0cshi7277akr2xk0cx11rkmviaahy7a3pla6l5a02"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-loom" ,rust-loom-0.1))))
    (home-page "https://github.com/seanmonstar/spmc")
    (synopsis "Simple SPMC channel")
    (description "Simple SPMC channel")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-test
  (package
    (name "rust-tokio-test")
    (version "0.2.0-alpha.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-test" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fgzpnkndgn5f0jqwdln0w168dhc5b7sxym5a34vff605py86qbn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures-core-preview"
         ,rust-futures-core-preview-0.3)
        ("rust-pin-convert" ,rust-pin-convert)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1)
        ("rust-tokio-timer" ,rust-tokio-timer-0.2))))
    (home-page "https://tokio.rs")
    (synopsis
     "Testing utilities for Tokio- and futures-based code")
    (description
     "Testing utilities for Tokio- and futures-based code.")
    (license license:expat)))

(define-public rust-publicsuffix
  (package
    (name "rust-publicsuffix")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "publicsuffix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "040mrdpzj9lv5djxfksq2nbk29baiv3hx6gca2cfpcp23nl5kwlv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-idna" ,rust-idna-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-native-tls" ,rust-native-tls)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-url" ,rust-url-2.0))
       #:cargo-development-inputs
       (("rust-rspec" ,rust-rspec))))
    (home-page
     "https://github.com/rushmorem/publicsuffix")
    (synopsis
     "Robust domain name parsing and RFC compliant email address validation")
    (description
     "Robust domain name parsing and RFC compliant email address validation")
    (license #f)))

(define-public rust-pretty-assertions
  (package
    (name "rust-pretty-assertions")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pretty-assertions" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09yl14gnmpygiqrdlsa64lcl4w6ydjl9m8jri6kgam0v9rjf309z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.11)
        ("rust-ctor" ,rust-ctor)
        ("rust-difference" ,rust-difference-2.0)
        ("rust-output-vt100" ,rust-output-vt100))))
    (home-page
     "https://github.com/colin-kiegel/rust-pretty-assertions")
    (synopsis
     "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs.")
    (description
     "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs.")
    (license #f)))

(define-public rust-nettle-sys
  (package
    (name "rust-nettle-sys")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nettle-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0clz04m282wycdnxs9w95djjq0mc5dk5ks62ly6kyd2yipld7c8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.47))
       #:cargo-development-inputs
       (("rust-nettle-src" ,rust-nettle-src)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://gitlab.com/sequoia-pgp/nettle-sys")
    (synopsis
     "Low-level Rust bindings for the Nettle cryptographic library")
    (description
     "Low-level Rust bindings for the Nettle cryptographic library")
    (license #f)))

(define-public rust-mach-o-sys
  (package
    (name "rust-mach-o-sys")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mach-o-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09l8p7nmzq37450x2h6nb7dzg1sk6dk36a5rkcrcy81zm21lb19y"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/fitzgen/mach_o_sys")
    (synopsis
     "Bindings to the OSX mach-o system library")
    (description
     "Bindings to the OSX mach-o system library")
    (license #f)))

(define-public rust-bzip2-sys
  (package
    (name "rust-bzip2-sys")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bzip2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pz2mdhkk8yphiqdh2kghdxb60kqyd10lfrjym3r4k5dylvam135"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page
     "https://github.com/alexcrichton/bzip2-rs")
    (synopsis
     "Bindings to libbzip2 for bzip2 compression and decompression")
    (description
     "Bindings to libbzip2 for bzip2 compression and decompression
exposed as Reader/Writer streams.")
    (license #f)))

(define-public rust-partial-io
  (package
    (name "rust-partial-io")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "partial-io" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b9a2bvqmaj2r4rkbshjsg8zzvp23b67qfvj2y6jwjckrn6zhb38"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-tokio-core" ,rust-tokio-core-0.1))))
    (home-page
     "https://github.com/facebookincubator/rust-partial-io")
    (synopsis
     "Helpers to test partial, interrupted and would-block I/O operations.")
    (description
     "Helpers to test partial, interrupted and would-block I/O operations.")
    (license license:expat)))

(define-public rust-quickcheck-macros
  (package
    (name "rust-quickcheck-macros")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quickcheck-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b3mhn0xcrdd3fkbkx3rghhivwzwil8w991ngp6gaj70l72c3pyp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page
     "https://github.com/BurntSushi/quickcheck")
    (synopsis "A macro attribute for quickcheck.")
    (description
     "This package provides a macro attribute for quickcheck.")
    (license #f)))

(define-public rust-enum-as-inner
  (package
    (name "rust-enum-as-inner")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enum-as-inner" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bj914fh5b57j1ij66m021l9pdhvp1bnpwpahhl4qgsjprznq2lh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-heck" ,rust-heck)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/bluejekyll/enum-as-inner")
    (synopsis
     "A proc-macro for deriving inner field accessor functions on enums")
    (description
     "This package provides a proc-macro for deriving inner field
accessor functions on enums.")
    (license #f)))

(define-public rust-tokio-openssl
  (package
    (name "rust-tokio-openssl")
    (version "0.4.0-alpha.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-openssl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h649wxs0shqc7sk2fnf9nbanfghg9viy1c1n43npyzncarn2jl9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-openssl" ,rust-openssl-0.10)
        ("rust-tokio-io" ,rust-tokio-io-0.1))
       #:cargo-development-inputs
       (("rust-futures-preview" ,rust-futures-preview)
        ("rust-tokio" ,rust-tokio-0.1))))
    (home-page
     "https://github.com/alexcrichton/tokio-openssl")
    (synopsis
     "An implementation of SSL streams for Tokio backed by OpenSSL")
    (description
     "An implementation of SSL streams for Tokio backed by OpenSSL")
    (license #f)))

(define-public rust-typed-headers
  (package
    (name "rust-typed-headers")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "typed-headers" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g40nlq5iw0zxhwb7nfmfbr9m86abgwwhxwhzrm10nfq6bsmlvxx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-base64" ,rust-base64-0.10)
        ("rust-bytes" ,rust-bytes-0.4)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-http" ,rust-http-0.1)
        ("rust-mime" ,rust-mime-0.3))))
    (home-page
     "https://github.com/sfackler/typed-headers")
    (synopsis
     "Typed HTTP header serialization and deserialization.")
    (description
     "Typed HTTP header serialization and deserialization.")
    (license #f)))

(define-public rust-web-sys
  (package
    (name "rust-web-sys")
    (version "0.3.27")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "web-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0lccdl3ihqh70s48dzvzpm09gpwvdjyw4wksk848dm0a41vw8db4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-sourcefile" ,rust-sourcefile-0.1)
        ("rust-wasm-bindgen-futures"
         ,rust-wasm-bindgen-futures-0.3)
        ("rust-wasm-bindgen-test"
         ,rust-wasm-bindgen-test-0.2)
        ("rust-wasm-bindgen-webidl"
         ,rust-wasm-bindgen-webidl))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
    (synopsis
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (description
     "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (license #f)))

(define rust-core-foundation
  (package
    (name "rust-core-foundation")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-foundation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0va97wf49c8dzm9c8pgyk1jn7z21rl0bj1syf2zz5m2z2hzy1f95"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-core-foundation-sys"
         ,rust-core-foundation-sys-0.6)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-uuid" ,rust-uuid-0.7))))
    (home-page
     "https://github.com/servo/core-foundation-rs")
    (synopsis
     "Bindings to Core Foundation for macOS")
    (description
     "Bindings to Core Foundation for macOS")
    (license #f)))

(define-public rust-tracing
  (package
    (name "rust-tracing")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0r1yn5b1nssvi5kqj19rq4x8l6kh8s9s2hpd9vi7l6sda1d3a7vh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-spin" ,rust-spin-0.5)
        ("rust-tracing-attributes"
         ,rust-tracing-attributes)
        ("rust-tracing-core" ,rust-tracing-core-0.1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-log" ,rust-log-0.4))))
    (home-page "https://tokio.rs")
    (synopsis
     "Application-level tracing for Rust")
    (description
     "Application-level tracing for Rust.")
    (license license:expat)))

(define-public rust-pin-project-internal
  (package
    (name "rust-pin-project-internal")
    (version "0.4.0-alpha.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-project-internal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ccdd4kwz0ksd04hklxf7927dbvfz5av0dmkjjgdhwhwhf757rrj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-proc-macro-crate" ,rust-proc-macro-crate)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/taiki-e/pin-project")
    (synopsis
     "An interal crate to support pin_project - do not use directly")
    (description
     "An interal crate to support pin_project - do not use directly")
    (license #f)))

(define-public rust-string
  (package
    (name "rust-string")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "string" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vaxz85ja52fn66akgvggb29wqa5bpj3y38syykpr1pbrjzi8hfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bytes" ,rust-bytes-0.4))))
    (home-page
     "https://github.com/carllerche/string")
    (synopsis
     "A UTF-8 encoded string with configurable byte storage.")
    (description
     "This package provides a UTF-8 encoded string with configurable byte storage.")
    (license license:expat)))

(define-public rust-rspec
  (package
    (name "rust-rspec")
    (version "1.0.0-beta.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rspec" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1abfzwkbxlwahb243k8d3fp6i135lx1aqmbfl79w9zlpng182ndk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-colored" ,rust-colored)
        ("rust-derive-new" ,rust-derive-new)
        ("rust-derive-builder" ,rust-derive-builder)
        ("rust-expectest" ,rust-expectest)
        ("rust-rayon" ,rust-rayon-1.1))
       #:cargo-development-inputs
       (("rust-clippy" ,rust-clippy-0.0))))
    (home-page "https://mackwic.github.io/rspec")
    (synopsis
     "Write Rspec-like tests with stable rust")
    (description
     "Write Rspec-like tests with stable rust")
    (license license:mpl2.0)))

(define-public rust-nettle-src
  (package
    (name "rust-nettle-src")
    (version "3.5.1-2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nettle-src" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1j20nv9qyww9bjrxhgaj5a2dvc6ly44z040c2y90x213pvac1lzs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cc" ,rust-cc-1.0))))
    (home-page
     "https://gitlab.com/sequoia-pgp/nettle-sys")
    (synopsis
     "Source of Nettle and logic to build it")
    (description
     "Source of Nettle and logic to build it.")
    (license #f)))

(define-public rust-heck
  (package
    (name "rust-heck")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heck" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01a2v7yvkiqxakdqz4hw3w3g4sm52ivz9cs3qcsv2arxsmw4wmi0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-segmentation"
         ,rust-unicode-segmentation-1.3))))
    (home-page
     "https://github.com/withoutboats/heck")
    (synopsis "heck is a case conversion library")
    (description
     "heck is a case conversion library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-webidl
  (package
    (name "rust-wasm-bindgen-webidl")
    (version "0.2.50")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm-bindgen-webidl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "057zak44nyrawipgi37m451fjkxz6ix5rzcw11d699rgpy4x4lxy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-failure" ,rust-failure-0.1)
        ("rust-heck" ,rust-heck)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-wasm-bindgen-backend"
         ,rust-wasm-bindgen-backend-0.2)
        ("rust-weedle" ,rust-weedle))))
    (home-page
     "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
     "Support for parsing WebIDL specific to wasm-bindgen")
    (description
     "Support for parsing WebIDL specific to wasm-bindgen")
    (license #f)))

(define-public rust-tracing-attributes
  (package
    (name "rust-tracing-attributes")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-attributes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yly610mxhjs2078mrxn5vzx9r3jgxvhzpgw6r59zf8cbn1s2hsv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-tracing" ,rust-tracing)
        ("rust-tracing-core" ,rust-tracing-core-0.1)
        ("rust-tracing-fmt" ,rust-tracing-fmt))))
    (home-page "https://tokio.rs")
    (synopsis
     "Procedural macro attributes for automatically instrumenting functions")
    (description
     "Procedural macro attributes for automatically instrumenting
functions.")
    (license license:expat)))

(define-public rust-proc-macro-crate
  (package
    (name "rust-proc-macro-crate")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-crate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07pyc64bxlcz9g4hl0gc8cwqcjxpgh4ssvgxjvxsgj2ly58ln3g1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-toml" ,rust-toml-0.5))
       #:cargo-development-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/bkchr/proc-macro-crate")
    (synopsis
     "Replacement for crate (macro_rules keyword) in proc-macros")
    (description
     "Replacement for crate (macro_rules keyword) in proc-macros")
    (license #f)))

(define-public rust-tracing-fmt
  (package
    (name "rust-tracing-fmt")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-fmt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wagcrd6w8d3k7zdvg6sy2bwfh8w87i6ndia69p54fc7p3z4f1c8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-tracing-subscriber"
         ,rust-tracing-subscriber))
       #:cargo-development-inputs
       (("rust-tracing" ,rust-tracing))))
    (home-page "https://tokio.rs")
    (synopsis
     "A `tracing` subscriber that formats and logs trace data")
    (description
     "This package provides a `tracing` subscriber that formats and logs trace data.  Moved to the `tracing-subscriber` crate.")
    (license license:expat)))

(define-public rust-ascii-canvas
  (package
    (name "rust-ascii-canvas")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ascii-canvas" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a9s8vrbc5jr6ry5ygjyfqmbs9gyya1v6dsxzsczpai8z4nvg3pz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-term" ,rust-term-0.5))))
    (home-page
     "https://github.com/nikomatsakis/ascii-canvas")
    (synopsis
     "simple canvas for drawing lines and styled text and emitting to the terminal")
    (description
     "simple canvas for drawing lines and styled text and emitting to the terminal")
    (license #f)))

(define-public rust-ena
  (package
    (name "rust-ena")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ena" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11wxfhfrywr7pwwqc5kfbfl1mjh2f4hsksrsbaaq98wcw1l1vh1x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dogged" ,rust-dogged)
        ("rust-log" ,rust-log-0.4)
        ("rust-petgraph" ,rust-petgraph-0.4))))
    (home-page "https://github.com/nikomatsakis/ena")
    (synopsis
     "Union-find, congruence closure, and other unification code. Based on code from rustc.")
    (description
     "Union-find, congruence closure, and other unification code.  Based on code from rustc.")
    (license #f)))

(define-public rust-dogged
  (package
    (name "rust-dogged")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dogged" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0yk5l6qqidl5y935x15gi9kkd6niim1wb64r1l7kdzl9jw8dyf16"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/nikomatsakis/dogged")
    (synopsis
     "Persistent vector, similar to Clojure")
    (description
     "Persistent vector, similar to Clojure")
    (license #f)))

(define-public rust-pin-convert
  (package
    (name "rust-pin-convert")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pin-convert" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01j8zskmg91xqk39126a93n82a5xdl0fkirqcd3017mlg271dk90"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/carllerche/pin-convert")
    (synopsis
     "Traits for converting to `Pin` variants.")
    (description
     "Traits for converting to `Pin` variants.")
    (license license:expat)))

(define-public rust-safemem
  (package
    (name "rust-safemem")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "safemem" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l1ljkm4lpyryrv2ndaxi1f7z1f3v9bwy1rzl9f9mbhx04iq9c6j"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/abonander/safemem")
    (synopsis
     "Safe wrappers for memory-accessing functions, like `std::ptr::copy()`.")
    (description
     "Safe wrappers for memory-accessing functions, like `std::ptr::copy()`.")
    (license #f)))

(define-public rust-num
  (package
    (name "rust-num")
    (version "0.1.42")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vhmyvfan380f86895z0f8rjscjc6qvwcmyvm15370ik2mjas0s7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-bigint" ,rust-num-bigint)
        ("rust-num-complex" ,rust-num-complex-0.1)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/rust-num/num")
    (synopsis
     "A collection of numeric types and traits for Rust, including bigint,
complex, rational, range iterators, generic integers, and more!
")
    (description
     "This package provides a collection of numeric types and traits for Rust, including bigint,
complex, rational, range iterators, generic integers, and more!
")
    (license #f)))

(define-public rust-num-rational-0.1
  (package
    (name "rust-num-rational")
    (version "0.1.42")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-rational" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kkqb8j3b3nis9hs4ww4hkrmb4a6v9sr9al08xmwhgvmpms4qcgf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-bigint" ,rust-num-bigint)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1))))
    (home-page
     "https://github.com/rust-num/num-rational")
    (synopsis
     "Rational numbers implementation for Rust")
    (description
     "Rational numbers implementation for Rust")
    (license #f)))

(define-public rust-strings
  (package
    (name "rust-strings")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strings" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g0z91zazkw1afzl1b4bniqjp3yg8g5zg4az37w3vz22pkhiwj5a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/nrc/strings.rs")
    (synopsis
     "String utilities, including an unbalanced Rope")
    (description
     "String utilities, including an unbalanced Rope")
    (license #f)))

(define-public rust-syntex-errors
  (package
    (name "rust-syntex-errors")
    (version "0.59.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-errors" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pk0cbb6pvrm62javjwzi3s6jxqj5rdbyi98bdf9yv37g68jhcri"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-syntex-pos" ,rust-syntex-pos)
        ("rust-term" ,rust-term-0.5)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of librustc_errors")
    (description "Backport of librustc_errors")
    (license #f)))

(define-public rust-syntex-syntax
  (package
    (name "rust-syntex-syntax")
    (version "0.59.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-syntax" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hnibp8s024hw0y7mdsf27rnw7vfkjilm5ww1mvjhn6r0jgmp083"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-0.9)
        ("rust-extprim" ,rust-extprim)
        ("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-syntex-errors" ,rust-syntex-errors)
        ("rust-syntex-pos" ,rust-syntex-pos)
        ("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax")
    (description "Backport of libsyntax")
    (license #f)))

(define-public rust-syntex-pos
  (package
    (name "rust-syntex-pos")
    (version "0.59.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-pos" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0w3465vz8z08sbcva5hdalr3vk4idp3vnx7qh730ilh3l2gndarh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/serde-rs/syntex")
    (synopsis "Backport of libsyntax_pos")
    (description "Backport of libsyntax_pos")
    (license #f)))

(define-public rust-extprim
  (package
    (name "rust-extprim")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "extprim" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cagbgayqfmdw6zmci14ivs8cqdzn8k3jk9ymlyhnxj9qz81pfng"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.6)
        ("rust-rustc-version" ,rust-rustc-version-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-extprim-literals" ,rust-extprim-literals)
        ("rust-semver" ,rust-semver-0.9))))
    (home-page "https://github.com/kennytm/extprim")
    (synopsis "Extra primitive types")
    (description
     "Extra primitive types @code{(u128, i128)}")
    (license #f)))

(define-public rust-extprim-literals
  (package
    (name "rust-extprim-literals")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "extprim-literals" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09zsy9hzbjvnrzz9zd25xjijlbzp3m36cqc5q3znnqzvxjp02q46"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-extprim-literals-macros"
         ,rust-extprim-literals-macros)
        ("rust-procedural-masquerade"
         ,rust-procedural-masquerade))
       #:cargo-development-inputs
       (("rust-extprim" ,rust-extprim))))
    (home-page "https://github.com/kennytm/extprim")
    (synopsis
     "Plugin for creating extra primitive types literals")
    (description
     "Plugin for creating extra primitive types literals @code{(u128!(n), i128!(n))}")
    (license #f)))

(define-public rust-pulldown-cmark
  (package
    (name "rust-pulldown-cmark")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pulldown-cmark" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1916kszqfa9h8ja7wjbx945qb0qzwzslynxvwrg9c0hp9h6svc45"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-getopts" ,rust-getopts-0.2)
        ("rust-memchr" ,rust-memchr-2.2)
        ("rust-unicase" ,rust-unicase-2.4))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-html5ever" ,rust-html5ever-0.23)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-tendril" ,rust-tendril-0.4))))
    (home-page
     "https://github.com/raphlinus/pulldown-cmark")
    (synopsis "A pull parser for CommonMark")
    (description
     "This package provides a pull parser for CommonMark")
    (license license:expat)))

(define-public rust-rle-decode-fast
  (package
    (name "rust-rle-decode-fast")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rle-decode-fast" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1b4h7qs4mssc5dnlhs3f91ya8pb40bv72zzshl18gify2jllzgna"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-criterion" ,rust-criterion-0.2))))
    (home-page
     "https://github.com/WanzenBug/rle-decode-helper")
    (synopsis
     "Decoding for Run Length Encoded data in Rust")
  (description
    "THE fastest way to implement any kind of decoding for Run Length Encoded data in Rust.

Writing a fast decoder that is also safe can be quite challenging, so
this crate is here to save you the hassle of maintaining and testing
your own implementation.")
  (license (list license:expat license:asl2.0))))

(define-public rust-colored
  (package
    (name "rust-colored")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "colored" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00vwd3r2jrd6qz4r91bwqhmkl371wyyjvirrc7bzh9r91yv91nvc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-winconsole" ,rust-winconsole))
       #:cargo-development-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.11)
        ("rust-rspec" ,rust-rspec))))
    (home-page "https://github.com/mackwic/colored")
    (synopsis
     "The most simple way to add colors in your terminal")
    (description
     "The most simple way to add colors in your terminal")
    (license license:mpl2.0)))

(define-public rust-weedle
  (package
    (name "rust-weedle")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "weedle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0r0i2kllvkn9jil6cjzxdi1zsc6p1gjyk751w8lyclaii1q3zd1v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-nom" ,rust-nom-5.0))))
    (home-page "https://github.com/rustwasm/weedle")
    (synopsis "A WebIDL Parser")
    (description
     "This package provides a WebIDL Parser")
    (license license:expat)))

(define-public rust-derive-new
  (package
    (name "rust-derive-new")
    (version "0.5.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-new" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ncibp4jhpkym7namg3viqyw8hljd32n6abg64af8qjwrn91iwvi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/nrc/derive-new")
    (synopsis
     "Implements simple constructor functions for structs and enums")
    (description
     "@code{#[derive(new)]} implements simple constructor functions for
structs and enums.")
    (license license:expat)))

(define-public rust-take-mut
  (package
    (name "rust-take-mut")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "take-mut" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q2d7w6nd5bl7bay5csq065sjg8fw0jcx6hl1983cpzf25fh0r7p"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/Sgeo/take_mut")
    (synopsis "Take a T from a mutuble T temporarily")
    (description "Take a T from a mutable T temporarily")
    (license license:expat)))

(define-public rust-ctor
  (package
    (name "rust-ctor")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ctor" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rvxl9i9a2j40m00zcjcsfa31n4zzyjvj9vwmk6bp0zgxckif1iy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-libc-print" ,rust-libc-print))))
    (home-page
     "https://github.com/mmastrac/rust-ctor")
    (synopsis
     "@code{__attribute__((constructor))} for Rust")
    (description
     "@code{__attribute__((constructor))} for Rust")
    (license (list license:asl2.0 license:expat))))

(define-public rust-libc-print
  (package
    (name "rust-libc-print")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc-print" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sh4l815w7zxg8w17fvwj63y421sjqxxrdamzwyvg90n6mr70phv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/mmastrac/rust-libc-print")
    (synopsis
     "println! and eprintln! macros on libc without stdlib")
    (description
     "println! and eprintln! macros on libc without stdlib")
    (license (list license:asl2.0 license:expat))))

(define-public rust-derive-builder
  (package
    (name "rust-derive-builder")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-builder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1m34zpj6fw764g7s368r2wgazp154m24d4rshbgn18fdlfk3zi9s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-compiletest-rs" ,rust-compiletest-rs-0.3)
        ("rust-darling" ,rust-darling)
        ("rust-derive-builder-core"
         ,rust-derive-builder-core)
        ("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-skeptic" ,rust-skeptic)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-log" ,rust-log-0.4)
        ("rust-pretty-assertions"
         ,rust-pretty-assertions)
        ("rust-skeptic" ,rust-skeptic))))
    (home-page
     "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis
     "Automatically implement builder pattern for arbitrary structs")
    (description
     "Rust macro to automatically implement the builder pattern for
arbitrary structs.")
    (license #f)))

(define-public rust-winconsole
  (package
    (name "rust-winconsole")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winconsole" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "108xk353myxdi5qm6m3v0qky18b1s94i40bhjka4rwmxwfi62h3y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cgmath" ,rust-cgmath-0.17)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-rgb" ,rust-rgb-0.8)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-serde-cbor" ,rust-serde-cbor-0.10)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/omarkmu/winconsole")
    (synopsis
     "Wrapper for console-related functions in the Windows API")
    (description
     "This package provides a wrapper for console-related functions in
the Windows API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-darling
  (package
    (name "rust-darling")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13ia8dx03gy867j3gjqs03zxfnkdz000gysf8lk5bbgg6ajjkriz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-darling-core" ,rust-darling-core)
        ("rust-darling-macro" ,rust-darling-macro-0.10))
       #:cargo-development-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/TedDriggs/darling")
    (synopsis
     "Proc-macro for reading attributes into structs for derives")
    (description
     "This package provides a proc-macro library for reading
attributes into structs when implementing custom derives.")
    (license license:expat)))

(define-public rust-derive-builder-core
  (package
    (name "rust-derive-builder-core")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-builder-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0drbjk6n8ywls8cmhp4r8xkyjsja0wk3854cn5mj8g1km4ys5202"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-darling" ,rust-darling)
        ("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-pretty-assertions"
         ,rust-pretty-assertions))))
    (home-page
     "https://github.com/colin-kiegel/rust-derive-builder")
    (synopsis
     "Internal helper library for the derive_builder crate")
    (description
     "Internal helper library for the derive_builder crate.")
    (license #f)))

(define-public rust-skeptic
  (package
    (name "rust-skeptic")
    (version "0.13.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "skeptic" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rai61hbs65nbvbhqlk1nap5hlav5qx3zmjjjzh9rhgxagc8xyyn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytecount" ,rust-bytecount-0.5)
        ("rust-cargo-metadata" ,rust-cargo-metadata)
        ("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-walkdir" ,rust-walkdir-2.2))
       #:cargo-development-inputs
       (("rust-unindent" ,rust-unindent-0.1))))
    (home-page
     "https://github.com/budziq/rust-skeptic")
    (synopsis
     "Test your Rust markdown documentation via Cargo")
    (description
     "Test your Rust markdown documentation via Cargo")
    (license #f)))

(define-public rust-extprim-literals-macros
  (package
    (name "rust-extprim-literals-macros")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "extprim-literals-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10zgbmikp4d8j5n475kcq6dkb68l92h339zcry2h5616a1ssv6zq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-extprim" ,rust-extprim)
        ("rust-procedural-masquerade"
         ,rust-procedural-masquerade))))
    (home-page "https://github.com/kennytm/extprim")
    (synopsis
     "Internal crate to support extprim_literals")
    (description
     "Internal crate to support @code{extprim_literals}.  You typically
don't need this crate directly.")
    (license #f)))

(define-public rust-procedural-masquerade
  (package
    (name "rust-procedural-masquerade")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "procedural-masquerade" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l098px1hwdzqnxl376a9hfxb9q8kmj2n0y0s8k7plrz3jjp85cs"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/servo/rust-cssparser")
    (synopsis
     "Make proc_macro_derive pretend to be proc_macro")
    (description
     "macro_rules for making proc_macro_derive pretending to be proc_macro")
    (license (list license:expat license:asl2.0))))

(define-public rust-expectest
  (package
    (name "rust-expectest")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "expectest" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00dv47irmsyq7brzjhz4xns3p722gm98zp39h9hq2mrzd5marpgq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
     "https://github.com/zummenix/expectest")
    (synopsis
     "Provides matchers and matcher functions for unit testing")
    (description
     "Crate provides matchers and matcher functions for unit
testing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracing-subscriber
  (package
    (name "rust-tracing-subscriber")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-subscriber" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bn6911zky2wg8ndvrj38v02hml0hpk0g49h0d3kf52klxqiffy6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.11)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-matchers" ,rust-matchers)
        ("rust-owning-ref" ,rust-owning-ref-0.4)
        ("rust-parking-lot" ,rust-parking-lot-0.9)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-tracing-core" ,rust-tracing-core-0.1)
        ("rust-tracing-log" ,rust-tracing-log))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-tracing" ,rust-tracing)
        ("rust-tracing-log" ,rust-tracing-log))))
    (home-page "https://tokio.rs")
    (synopsis
     "Implement and compose @code{tracing} subscribers")
    (description
     "Utilities for implementing and composing @code{tracing}
subscribers.")
    (license license:expat)))

(define-public rust-output-vt100
  (package
    (name "rust-output-vt100")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "output-vt100" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ygqplpxz4gg3i8f3rkan2q69pqll7gv65l2mmd8r9dphnvwbkak"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/Phundrak/output-vt100-rs")
    (synopsis
     "Utility to activate escape codes in Windows' CMD and PowerShell")
    (description
     "Utility to activate escape codes in Windows' CMD and PowerShell")
    (license license:expat)))

(define-public rust-darling-core
  (package
    (name "rust-darling-core")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "119vd2nkgc6phshw4ka9733x9iskvgxds8ks6gr1rd2lxhmm2m7f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-ident-case" ,rust-ident-case)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-strsim" ,rust-strsim-0.9)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/TedDriggs/darling")
    (synopsis
     "Implementation for rust-darling")
    (description
     "Helper crate for proc-macro library for reading attributes into
structs when implementing custom derives.  Use rust-darling in your
code.")
    (license license:expat)))

(define-public rust-matchers
  (package
    (name "rust-matchers")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "matchers" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1q8ckqmkjqkznvdi9x0z769yz2bmvlqcwx51ad2lpk4mfmgpi6gh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-regex-automata" ,rust-regex-automata-0.1))))
    (home-page "https://github.com/hawkw/matchers")
    (synopsis
     "Regex matching on character and byte streams")
    (description
     "Regex matching on character and byte streams.")
    (license license:expat)))

(define-public rust-ident-case
  (package
    (name "rust-ident-case")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ident-case" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/TedDriggs/ident_case")
    (synopsis
     "Utility for applying case rules to Rust identifiers")
    (description
     "Utility for applying case rules to Rust identifiers.")
    (license #f)))

(define-public rust-tracing-log
  (package
    (name "rust-tracing-log")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tracing-log" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qsinlbk2knrqgx1k2zq8kjxs71x44vzpma2rin1sm462agcjav5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-tracing-core" ,rust-tracing-core-0.1))
       #:cargo-development-inputs
       (("rust-tracing" ,rust-tracing))))
    (home-page "https://tokio.rs")
    (synopsis
     "Provides compatibility between tracing the log crates")
    (description
     "This package provides compatibility between tracing and the
log crates.")
    (license license:expat)))

(define-public rust-darling-macro-0.10
  (package
    (name "rust-darling-macro")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "darling-macro" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hb2bajmf18kgbg6rzvxa78ph7bbsrlnlacq52vi021cwlrf9lqc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-darling-core" ,rust-darling-core)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/TedDriggs/darling")
    (synopsis
     "Internal support for rust-darling")
    (description
     "Internal support for a proc-macro library for reading attributes
into structs when implementing custom derives.  Use rust-darling in
your code.")
    (license license:expat)))

(define-public rust-rgb-0.8
  (package
    (name "rust-rgb")
    (version "0.8.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rgb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nzg8809n0p7g3giq3ca8wi77kcpzv1cihzq07i2kl8l281y9290"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://lib.rs/crates/rgb")
    (synopsis
     "Share pixels between crates and manipulate colors")
    (description
     "@code{struct RGB/RGBA/etc.} for sharing pixels between crates
and convenience methods for color manipulation.  Allows no-copy
high-level interoperability.  Also adds common convenience methods and
implements standard Rust traits to make RGB/RGBA pixels and slices
first-class Rust objects.")
    (license license:expat)))

(define-public rust-hashbrown-0.1
  (package
    (inherit rust-hashbrown-0.5)
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hashbrown" version))
       (file-name
        (string-append (package-name rust-hashbrown-0.5)
                       "-" version ".tar.gz"))
       (sha256
        (base32
         "1np350nrzysy021ndn2135q5vpzrp5nli78ywz114d1vcnv2kbiv"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-rayon" ,rust-rayon-1.3)
        ("rust-scopeguard" ,rust-scopeguard-0.3)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.4)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rayon" ,rust-rayon-1.3)
        ("rust-rustc-hash" ,rust-rustc-hash-1.0)
        ("rust-serde-test" ,rust-serde-test-1.0))))))

(define-public rust-docmatic-0.1
  (package
    (name "rust-docmatic")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "docmatic" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1hx85n266lxswqxrbbinqlhi1qcnjgd4cc7v42abg72kmz7fnn4d"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs (("rust-which" ,rust-which-2.0))))
    (home-page
      "https://github.com/assert-rs/docmatic")
    (synopsis
      "Test Rust examples in your documentation")
    (description
      "Test Rust examples in your documentation.")
    (license license:expat)))

(define-public rust-globwalk-0.7
  (package
    (name "rust-globwalk")
    (version "0.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "globwalk" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0yr6kcm2izsjicisjk5dzy00wh7jmh823zxqlfq9fs2rd01wzjsk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-ignore" ,rust-ignore-0.4)
         ("rust-walkdir" ,rust-walkdir-2.2))
        #:cargo-development-inputs
        (("rust-docmatic" ,rust-docmatic-0.1)
         ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/gilnaa/globwalk")
    (synopsis
      "Glob-matched recursive file system walking")
    (description
      "Glob-matched recursive file system walking.")
    (license license:expat)))

(define-public rust-utime-0.2
  (package
    (name "rust-utime")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "utime" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0akr32rd2qiiwdbnkwd6hs4zfy76791xlqgwh9h5cp515iamhl05"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
      "https://github.com/simnalamburt/utime")
    (synopsis "Missing utime function for Rust")
    (description
      "This package provides a missing utime function for Rust.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-treeline-0.1
  (package
    (name "rust-treeline")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "treeline" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0hcdgyk5xzcx2ylm0fr9czzs9cjznm7l9q5qz51qi97i82r43xx7"))))
    (build-system cargo-build-system)
    (home-page
      "https://github.com/softprops/treeline")
    (synopsis "Visualize tree structured data")
    (description "A library for visualizing tree structured data.")
    (license license:expat)))

(define-public rust-predicates-core-1.0
  (package
    (name "rust-predicates-core")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "predicates-core" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0y3ingf2i4xx7r61f1a8wizs57j8hh32hylyjbw9ymcj7qx5q1q6"))))
    (build-system cargo-build-system)
    (home-page
      "https://github.com/assert-rs/predicates-rs/tree/master/predicates-core")
    (synopsis
      "API for boolean-valued predicate functions.")
    (description
      "An API for boolean-valued predicate functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-predicates-tree-1.0
  (package
    (name "rust-predicates-tree")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "predicates-tree" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "090148qjilm2c722l873z7g31fhzj5j4qhd2xiv8mcqkj22w8qwf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-treeline" ,rust-treeline-0.1))))
    (home-page
      "https://github.com/assert-rs/predicates-rs/tree/master/predicates-tree")
    (synopsis
      "Render boolean-valued predicate functions results as a tree")
    (description
      "Render boolean-valued predicate functions results as a tree.")
    (license (list license:expat license:asl2.0))))

(define-public rust-normalize-line-endings-0.3
  (package
    (name "rust-normalize-line-endings")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "normalize-line-endings" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1gp52dfn2glz26a352zra8h04351icf0fkqzw1shkwrgh1vpz031"))))
    (build-system cargo-build-system)
    (home-page
      "https://github.com/derekdreery/normalize-line-endings")
    (synopsis
      "Turn an iterator over chars and into one with line endings")
    (description
      "Takes an iterator over chars and returns a new iterator with
all line endings.")
    (license license:asl2.0)))

(define-public rust-normalize-line-endings-0.2
  (package
    (inherit rust-normalize-line-endings-0.3)
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "normalize-line-endings" version))
        (file-name
          (string-append (package-name rust-normalize-line-endings-0.3)
                         "-" version ".tar.gz"))
        (sha256
          (base32
           "1a1knz9j1w5a1pl2q6whmjphm3z6p64r5njnam7syp5rx8wil2if"))))))

(define-public rust-float-cmp-0.6
  (package
    (name "rust-float-cmp")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "float-cmp" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0zb1lv3ga18vsnpjjdg87yazbzvmfwwllj3aiid8660rp3qw8qns"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
      "https://github.com/mikedilger/float-cmp")
    (synopsis
      "Floating point approximate comparison traits")
    (description
      "Floating point approximate comparison traits.")
    (license license:expat)))

(define-public rust-predicates-1.0
  (package
    (name "rust-predicates")
    (version "1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "predicates" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "12nsna7zrxf0vygzlvq4ib0i79m8d7091cc3qcl85hc15h4vz20i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-difference" ,rust-difference-2.0)
         ("rust-float-cmp" ,rust-float-cmp-0.6)
         ("rust-normalize-line-endings"
          ,rust-normalize-line-endings-0.2)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-regex" ,rust-regex-1.3))
        #:cargo-development-inputs
        (("rust-predicates-tree" ,rust-predicates-tree-1.0))))
    (home-page
      "https://github.com/assert-rs/predicates-rs")
    (synopsis
      "Implementation of boolean-valued predicate functions")
    (description
      "An implementation of boolean-valued predicate functions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-assert-fs-0.13
  (package
    (name "rust-assert-fs")
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "assert_fs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1gzi4s5k5bmd4l9a0vmiank2iflzik4dlv3k4skrpa3lkyhlfnw1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-globwalk" ,rust-globwalk-0.7)
         ("rust-predicates" ,rust-predicates-1.0)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-predicates-tree" ,rust-predicates-tree-1.0)
         ("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page
      "https://github.com/assert-rs/assert_fs")
    (synopsis
      "Filesystem fixtures and assertions for testing")
    (description
      "Filesystem fixtures and assertions for testing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-escargot-0.5
  (package
    (name "rust-escargot")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "escargot" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0vd9phbpd6yrnsksn2as8flvq8ykzvck2zlz143xpp42qaz9dkvl"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-log" ,rust-log-0.4)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))
        #:cargo-development-inputs
        (("rust-assert-fs" ,rust-assert-fs-0.13))))
    (home-page
      "https://github.com/crate-ci/escargot")
    (synopsis "Cargo API written in Paris")
    (description "Cargo API written in Paris.")
    (license (list license:expat license:asl2.0))))

(define-public rust-escargot-0.3
  (package
    (inherit rust-escargot-0.5)
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "escargot" version))
        (file-name
         (string-append (package-name rust-escargot-0.5)
                        "-" version ".tar.gz"))
        (sha256
          (base32
           "19fmn7bz1h6nlqy0mp825xwjwnrjn4xjdpwc06jl51j3fiz1znqr"))))
    (arguments
      `(#:cargo-inputs
        (("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-log" ,rust-log-0.4)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))
        #:cargo-development-inputs
        (("rust-assert-fs" ,rust-assert-fs-0.13))))))

(define-public rust-assert-cmd-0.12
  (package
    (name "rust-assert-cmd")
    (version "0.12.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "assert_cmd" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0k32njzxczq9x7r4fa3sp8gwm97y2rw77i0v946lf9kjvp4bm0v2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-escargot" ,rust-escargot-0.5)
         ("rust-predicates" ,rust-predicates-1.0)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-predicates-tree" ,rust-predicates-tree-1.0))))
    (home-page
      "https://github.com/assert-rs/assert_cmd")
    (synopsis "Test CLI Applications")
    (description "Test CLI Applications.")
    (license (list license:expat license:asl2.0))))

(define-public rust-assert-cmd-0.10
  (package
    (inherit rust-assert-cmd-0.12)
    (version "0.10.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "assert_cmd" version))
        (file-name
          (string-append (package-name rust-assert-cmd-0.12)
                         "-" version ".tar.gz"))
        (sha256
          (base32
           "0rfc8mc13bd7zl3ha6klnqzcpjyfxpk2nd5phyxf9r3m1wk5rb5p"))))
    (arguments
      `(#:cargo-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-escargot" ,rust-escargot-0.5)
         ("rust-predicates" ,rust-predicates-1.0)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-predicates-tree" ,rust-predicates-tree-1.0))))))

(define-public rust-pager-0.15
  (package
    (name "rust-pager")
    (version "0.15.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pager" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0a35mg68s0p63ya2k5hsg620c4llkjw2fx1sfi0laz4pz8myv75n"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-errno" ,rust-errno-0.2)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://gitlab.com/imp/pager-rs.git")
    (synopsis
      "Helps pipe your output through an external pager")
    (description
      "Helps pipe your output through an external pager.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-shell32-sys-0.1
  (package
    (name "rust-shell32-sys")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "shell32-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0b0jjnv8rr4flllvpx9lkfvvxdl3hac53cd2klf14mqz2134pq4y"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3))
        #:cargo-development-inputs
        (("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page
      "https://github.com/retep998/winapi-rs")
    (synopsis
      "Function definitions for the Windows API library shell32")
    (description
      "Contains function definitions for the Windows API library
shell32.  See winapi for types and constants.")
    (license license:expat)))

(define-public rust-ole32-sys-0.2
  (package
    (name "rust-ole32-sys")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ole32-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "134xg38xicrqynx4pfjfxnpp8x83m3gqw5j3s8y27rc22w14jb2x"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3))
        #:cargo-development-inputs
        (("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page
      "https://github.com/retep998/winapi-rs")
    (synopsis
      "Function definitions for the Windows API library ole32")
    (description
      "Contains function definitions for the Windows API library
ole32.  See winapi for types and constants.")
    (license license:expat)))

(define-public rust-app-dirs-1.2
  (package
    (name "rust-app-dirs")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "app_dirs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0g9ijvl4xqbmahy7d7s0wj570wg0kz3ad0jk77b98smxv6x28fp7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-ole32-sys" ,rust-ole32-sys-0.2)
         ("rust-shell32-sys" ,rust-shell32-sys-0.1)
         ("rust-winapi" ,rust-winapi-0.2)
         ("rust-xdg" ,rust-xdg-2.2))))
    (home-page
      "https://github.com/AndyBarron/app-dirs-rs")
    (synopsis
      "Put your app's data in the right place on every platform")
    (description
      "Put your app's data in the right place on every platform.")
    (license license:expat)))

(define-public rust-strsim-0.7
  (package
    (inherit rust-strsim-0.9)
    (name "rust-strsim")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "strsim" version))
        (file-name (string-append name "-" version ".crate"))
        (sha256
         (base32
          "0l7mkwvdk4vgnml67b85mczk466074aj8yf25gjrjslj4l0khkxv"))))))

(define-public rust-docopt-1.0
  (package
    (inherit rust-docopt-1.1)
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "docopt" version))
       (file-name
        (string-append (package-name rust-docopt-1.1)
                       "-" version ".tar.gz"))
       (sha256
        (base32
         "09djlzwkdmmic3jfinr29v25v0x8m6b8fchyzh3p4nwvaz10cafv"))))
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-strsim" ,rust-strsim-0.7))))))
