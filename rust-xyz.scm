(define-module (rust-xyz)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages rust)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public rust-serde-stacker
  (package
    (name "rust-serde-stacker")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_stacker" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jn54i5m1mlc6nm47f96k85fgjs9mhpbbqa4dvd5xjbivkdw55ic"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-stacker" ,rust-stacker-0.1))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/dtolnay/serde-stacker")
    (synopsis
     "Serde adapter that avoids stack overflow")
    (description
     "Serde adapter that avoids stack overflow by dynamically growing
the stack.")
    (license #f)))

(define-public rust-serde-big-array
  (package
    (name "rust-serde-big-array")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde-big-array" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gkyqxk760mp1lfcg6lhjk95ajc89nr0qdd0vl4ic0g8pyxcy9mr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/est31/serde-big-array")
    (synopsis "Big array helper for serde")
    (description "Big array helper for serde.")
    (license #f)))

(define-public rust-spin
  (package
    (name "rust-spin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m9clchsj0rf13bggsgvbv9haiy0f6rhvnvkpvkk8720a5pkydj4"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/mvdnes/spin-rs.git")
    (synopsis
     "Synchronization primitives based on spinning")
    (description
     "Synchronization primitives based on spinning.
They may contain data, are usable without `std`,
and static initializers are available.")
    (license #f)))

(define-public rust-unicode-xid-0.0.3
  (package
    (inherit rust-unicode-xid-0.1)
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-xid" version))
       (file-name
        (string-append
         (package-name rust-unicode-xid-0.1) "-" version ".tar.gz"))
       (sha256
        (base32
         "1sqvl06884cy3hh14shik5afcv6bhsvb0gh2y267rv5lmyfg1prn"))))))

(define-public rust-ansi-term
  (package
    (name "rust-ansi-term")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ansi_term" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16wpvrghvd0353584i1idnsgm0r3vchg8fyrm0x8ayv1rgvbljgf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/ogham/rust-ansi-term")
    (synopsis
     "ANSI terminal colours and styles")
    (description
     "Library for ANSI terminal colours and styles (bold, underline)")
    (license #f)))

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

(define-public rust-bitflags-0.7
  (package
    (inherit rust-bitflags-1)
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bitflags" version))
       (file-name
        (string-append (package-name rust-bitflags-1) "-" version ".tar.gz"))
       (sha256
        (base32
         "0v8hh6wdkpk9my8z8442g4hqrqf05h0qj53dsay6mv18lqvqklda"))))))

(define-public rust-clippy-0.0.103 ; Old - for racer
  (package
    (inherit rust-clippy-0.0)
    (version "0.0.103")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clippy" version))
       (file-name
        (string-append
         (package-name rust-clippy-0.0) "-" version ".tar.gz"))
       (sha256
        (base32
         "0cpznss2fbb2im0yhmlw0k9cz5av9bd0l71w66d43xnxg7wsnksv"))))
    (arguments
     `(#:cargo-inputs
       (("rust-term" ,rust-term-0.5))))))

(define-public rust-textwrap
  (package
    (name "rust-textwrap")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textwrap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q5hky03ik3y50s9sz25r438bc4nwhqc6dqwynv4wylc807n29nk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-hyphenation" ,rust-hyphenation)
        ("rust-term-size" ,rust-term-size-1.0)
        ("rust-unicode-width" ,rust-unicode-width-0.1))
       #:cargo-development-inputs
       (("rust-lipsum" ,rust-lipsum)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page
     "https://github.com/mgeisler/textwrap")
    (synopsis
     "Word wrapping, indenting, and dedenting strings")
    (description
     "Textwrap is a small library for word wrapping, indenting, and
dedenting strings.

You can use it to format strings (such as help and error messages) for
display in commandline applications.  It is designed to be efficient
and handle Unicode charactersec-map")
    (license #f)))

(define-public rust-vec-map
  (package
    (name "rust-vec-map")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vec_map" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "06n8hw4hlbcz328a3gbpvmy0ma46vg1lc0r5wf55900szf3qdiq5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-1.0))))
    (home-page
     "https://github.com/contain-rs/vec-map")
    (synopsis
     "Vector for small integer keys")
    (description
     "This package provides a simple map based on a vector for small
integer keys.")
    (license #f)))

(define-public rust-yaml-rust-0.3
  (package
    (name "rust-yaml-rust")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "yaml-rust" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "14m9dzwb8fb05f4jjb4nqp49rxd9c5vcmwpv3a04d2y5iphncqz6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-clippy" ,rust-clippy-0.0)
        ("rust-linked-hash-map" ,rust-linked-hash-map-0.5))))
    (home-page
     "http://chyh1990.github.io/yaml-rust/")
    (synopsis "The missing YAML 1.2 parser for rust")
    (description
     "The missing YAML 1.2 parser for rust")
    (license #f)))

(define-public rust-aho-corasick-0.6
  (package
    (inherit rust-aho-corasick-0.7)
    (version "0.6.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "aho-corasick" version))
       (file-name
        (string-append (package-name rust-aho-corasick-0.7) "-" version ".tar.gz"))
       (sha256
        (base32
         "19f8v503ibvlyr824g5ynicrh1lsmp2i0zmpszr8lqay0qw3vkl1"))))))

(define-public rust-regex-syntax-0.5
  (package
    (inherit rust-regex-syntax-0.6)
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-syntax" version))
       (file-name
        (string-append (package-name rust-regex-syntax-0.6) "-" version ".tar.gz"))
       (sha256
        (base32
         "19zp25jr3dhmclg3qqjk3bh1yrn7bqi05zgr5v52szv3l97plw3x"))))))

(define-public rust-regex-syntax-0.3
  (package
    (inherit rust-regex-syntax-0.6)
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "regex-syntax" version))
       (file-name
        (string-append (package-name rust-regex-syntax-0.6) "-" version ".tar.gz"))
       (sha256
        (base32
         "0ms9hgdhhsxw9w920i7gipydvagf100bb56jbs192rz86ln01v7r"))))))

(define-public rust-automod
  (package
    (name "rust-automod")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "automod" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pld582piq2d55z0j96zcs8izw3ml46f8h9y7sdyxg093yfvxl2h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://github.com/dtolnay/automod")
    (synopsis
     "Pull in every source file in a directory as a module")
    (description
     "Pull in every source file in a directory as a module.")
    (license #f)))

(define-public rust-select-rustc
  (package
    (name "rust-select-rustc")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "select-rustc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0daqd56smi93g59nz43n4mh3d8whr6j5pa8dmwlf8bd76mdy3cpx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/dtolnay/select-rustc")
    (synopsis
     "Conditional compilation according to rustc compiler version")
    (description
     "Conditional compilation according to rustc compiler version")
    (license #f)))

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

(define-public rust-toml-0.1
  (package
    (inherit rust-toml-0.5)
    (version "0.1.30")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml" version))
       (file-name
        (string-append (package-name rust-toml-0.5) "-" version ".tar.gz"))
       (sha256
        (base32
         "15j7hjangq8qv8z7l35fn768zqfsi1j1rcd39nf8f3p5h8hxg405"))))))

(define-public rust-termion
  (package
    (name "rust-termion")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0c634rg520zjjfhwnxrc2jbfjz7db0rcpsjs1qici0nyghpv53va"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-numtoa" ,rust-numtoa-0.1.0)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-redox-termios" ,rust-redox-termios))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/termion")
    (synopsis
     "A bindless library for manipulating terminals.")
    (description
     "This package provides a bindless library for manipulating terminals.")
    (license #f)))

(define-public rust-hyphenation
  (package
    (name "rust-hyphenation")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyphenation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k5msv8calmnfd5kw1rmq4bg5hn1vcd39kbsxl57sdld63xwd4q4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atlatl" ,rust-atlatl)
        ("rust-bincode" ,rust-bincode-1.1)
        ("rust-hyphenation-commons"
         ,rust-hyphenation-commons)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-atlatl" ,rust-atlatl)
        ("rust-bincode" ,rust-bincode-1.1)
        ("rust-hyphenation-commons"
         ,rust-hyphenation-commons)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-pocket-resources" ,rust-pocket-resources)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-unicode-normalization"
         ,rust-unicode-normalization-0.1)
        ("rust-unicode-segmentation"
         ,rust-unicode-segmentation-1.3))))
    (home-page
     "https://github.com/tapeinosyne/hyphenation")
    (synopsis
     "Knuth-Liang hyphenation for a variety of languages")
    (description
     "Knuth-Liang hyphenation for a variety of languages")
    (license #f)))

(define-public rust-lipsum
  (package
    (name "rust-lipsum")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lipsum" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0nlxkz8zjxqmbrxqasr36a5fqn2n33cxy11w0x0a0b6mcx04dr2q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand" ,rust-rand-0.4))
       #:cargo-development-inputs
       (("rust-rand-xorshift" ,rust-rand-xorshift-0.2)
        ("rust-version-sync" ,rust-version-sync-0.8))))
    (home-page "https://github.com/mgeisler/lipsum/")
    (synopsis
     "Lorem ipsum text generation library")
    (description
     "Lipsum is a lorem ipsum text generation library.  Use this if
you need some filler text for your application.

The text is generated using a simple Markov chain, which you can also
instantiate to generate your own pieces of pseudo-random text.")
    (license #f)))

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

(define-public rust-mmap
  (package
    (name "rust-mmap")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08xqhvr4l3rf1fkz2w4cwz3z5wd0m1jab1d34sxd4v80lr459j0b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://github.com/rbranson/rust-mmap")
    (synopsis
     "A library for dealing with memory-mapped I/O")
    (description
     "This package provides a library for dealing with memory-mapped I/O")
    (license #f)))

(define-public rust-crossbeam-utils-0.2
  (package
    (inherit rust-crossbeam-utils-0.6)
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-utils" version))
       (file-name
        (string-append
         (package-name rust-crossbeam-utils-0.6) "-" version ".tar.gz"))
       (sha256
        (base32
         "1n8qr52sw9y6yxzyfxi1phh55rsxms7ry4iipdd8vmd16ag8jq17"))))))

(define-public rust-remove-dir-all
  (package
    (name "rust-remove-dir-all")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "remove_dir_all" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bkrlyg26mgizpiy1yb2hhpgscxcag8r5fnckqsvk25608vzm0sa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page
     "https://github.com/XAMPPRocky/remove_dir_all.git")
    (synopsis
     "A safe, reliable implementation of remove_dir_all for Windows")
    (description
     "This package provides a safe, reliable implementation of
remove_dir_all for Windows")
    (license #f)))

(define-public rust-getrandom-0.1.12
  (package
    (inherit rust-getrandom-0.1)
    (version "0.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getrandom" version))
       (file-name
        (string-append
         (package-name rust-getrandom-0.1) "-" version ".tar.gz"))
       (sha256
        (base32
         "0w9mj0nrzhhkl4n8l18n14hfabiwxs6az8fhij01xzy8miji4fj7"))))
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-wasi" ,rust-wasi))))))

(define-public rust-chacha
  (package
    (name "rust-chacha")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chacha" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qj839h7fjkmxlwyx5yqrcj0rlgvw2cfkaj0arhyb8gvnn0w1wyx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-keystream" ,rust-keystream))))
    (home-page "https://github.com/PeterReid/chacha")
    (synopsis "ChaCha stream ciphers")
    (description "ChaCha stream ciphers")
    (license #f)))

(define-public rust-rand-hc
  (package
    (name "rust-rand-hc")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_hc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g31sqwpmsirdlwr0svnacr4dbqyz339im4ssl9738cjgfpjjcfa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5))))
    (home-page "https://crates.io/crates/rand_hc")
    (synopsis "HC128 random number generator")
    (description "HC128 random number generator")
    (license #f)))

(define-public rust-rand-hc-0.1.0
  (package
    (inherit rust-rand-hc)
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_hc" version))
       (file-name
        (string-append (package-name rust-rand-hc) "-" version ".tar.gz"))
       (sha256
        (base32
         "1i0vl8q5ddvvy0x8hf1zxny393miyzxkwqnw31ifg6p0gdy6fh3v"))))))

(define-public rust-rand-pcg
  (package
    (name "rust-rand-pcg")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_pcg" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dljwilv3640l1c5vlg4isiq7qz8gqa2cjbvgv3p0p5wrd36669y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://crates.io/crates/rand_pcg")
    (synopsis
     "Selected PCG random number generators")
    (description
     "Selected PCG random number generators")
    (license #f)))

(define-public rust-rand-pcg-0.1.2
  (package
    (inherit rust-rand-pcg)
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_pcg" version))
       (file-name
        (string-append (package-name rust-rand-pcg) "-" version ".tar.gz"))
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

(define-public rust-rand-isaac
  (package
    (name "rust-rand-isaac")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_isaac" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xlb9415x518ffkazxhvk8b04i9i548nva4i5l5s34crvjrv1xld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))
    (home-page "https://crates.io/crates/rand_isaac")
    (synopsis "ISAAC random number generator")
    (description "ISAAC random number generator")
    (license #f)))

(define-public rust-rand-isaac-0.1.1
  (package
    (inherit rust-rand-isaac)
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_isaac" version))
       (file-name
        (string-append (package-name rust-rand-isaac) "-" version ".tar.gz"))
       (sha256
        (base32
         "027flpjr4znx2csxk7gxb7vrf9c7y5mydmvg5az2afgisp4rgnfy"))))
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-bincode" ,rust-bincode-1.1))))))

(define-public rust-no-panic
  (package
    (name "rust-no-panic")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "no-panic" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "089gmyxg7kviimqn5nmghm5kngnmi77a0c6fbv0j67jxx7pjhq3r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/dtolnay/no-panic")
    (synopsis
     "Prove a function can't ever panic")
    (description
     "Attribute macro to require that the compiler prove a function
can't ever panic.")
    (license #f)))

(define-public rust-winapi-i686-pc-windows-gnu
  (package
    (name "rust-winapi-i686-pc-windows-gnu")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winapi-i686-pc-windows-gnu" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Import libraries for the i686-pc-windows-gnu target")
    (description
     "Import libraries for the i686-pc-windows-gnu target.  Please
don't use this crate directly, depend on winapi instead.")
    (license #f)))

(define-public rust-winapi-x86-64-pc-windows-gnu
  (package
    (name "rust-winapi-x86-64-pc-windows-gnu")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri
             "winapi-x86_64-pc-windows-gnu"
             version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/retep998/winapi-rs")
    (synopsis
     "Import libraries for the x86_64-pc-windows-gnu target")
    (description
     "Import libraries for the x86_64-pc-windows-gnu target.  Please
don't use this crate directly, depend on winapi instead.")
    (license #f)))

(define-public rust-numtoa
  (package
    (name "rust-numtoa")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "numtoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1c10ndd0wk48blhljqhlwrpni23246jzkg9abpxc3cm0xynvc8g5"))))
    (build-system cargo-build-system)
    (home-page "https://gitlab.com/mmstick/numtoa")
    (synopsis
     "Convert numbers into stack-allocated byte arrays")
    (description
     "Convert numbers into stack-allocated byte arrays")
    (license #f)))

(define-public rust-numtoa-0.1.0
  (package
    (inherit rust-numtoa)
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "numtoa" version))
       (file-name
        (string-append (package-name rust-numtoa) "-" version ".tar.gz"))
       (sha256
        (base32
         "1vs9rhggqbql1p26x8nkha1j06wawwgb2jp5fs88b5gi7prvvy5q"))))))

(define-public rust-redox-termios
  (package
    (name "rust-redox-termios")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "redox_termios" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xhgvdh62mymgdl3jqrngl8hr4i8xwpnbsxnldq0l47993z1r2by"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-redox-syscall" ,rust-redox-syscall-0.1))))
    (home-page "https://github.com/redox-os/termios")
    (synopsis
     "A Rust library to access Redox termios functions")
    (description
     "This package provides a Rust library to access Redox termios functions")
    (license #f)))

(define-public rust-dirs
  (package
    (name "rust-dirs")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dirs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18aggvhdg6jcgf1gz8z51rzcx4mgfgjpyb1akqrr7lq2p6lgakhw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-dirs-sys" ,rust-dirs-sys-0.3))))
    (home-page "https://github.com/soc/dirs-rs")
    (synopsis
     "Provides platform-specific standard locations of directories for config")
    (description
     "This package provides a tiny low-level library that provides
platform-specific standard locations of directories for config, cache
and other data on Linux, Windows, macOS and Redox by leveraging the
mechanisms defined by the XDG base/user directory specifications on
Linux, the Known Folder API on Windows, and the Standard Directory
guidelines on macOS.")
    (license #f)))

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

(define-public rust-atlatl
  (package
    (name "rust-atlatl")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atlatl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18kyvdm56fdb52b1sryi80xgs3nkjdylynsv324aiqnj85l1bfrj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-fst" ,rust-fst)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/tapeinosyne/atlatl")
    (synopsis "Double-array tries.")
    (description "Double-array tries.")
    (license #f)))

(define-public rust-hyphenation-commons
  (package
    (name "rust-hyphenation-commons")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyphenation_commons" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pasnbk3rbdgf30jjjh1h24a9pxpdrnn0ihcivmpnzqha6mn2d4y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atlatl" ,rust-atlatl)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page
     "https://github.com/tapeinosyne/hyphenation")
    (synopsis
     "Proemial code for the `hyphenation` library")
    (description
     "Proemial code for the `hyphenation` library")
    (license #f)))

(define-public rust-pocket-resources
  (package
    (name "rust-pocket-resources")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pocket-resources" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n2i5vmi8fdbw89wm5nz1ws1z9f1qax911p6ksg4scmdg23z6df1"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/tomaka/pocket-resources")
    (synopsis
     "Include resources in your applications.")
    (description
     "Include resources in your applications.")
    (license #f)))

(define-public rust-getopts-0.2.19
  (package
    (inherit rust-getopts-0.2)
    (version "0.2.19")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getopts" version))
       (file-name
        (string-append (package-name rust-getopts-0.2) "-" version ".tar.gz"))
       (sha256
        (base32
         "0l74ldicw6gpkly3jdiq8vq8g597x7akvych2cgy7gr8q8apnckj"))))))

(define-public rust-idna-0.2
  (package
    (name "rust-idna")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "idna" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1a9066imqpdrm1aavfasdyb1zahqaz8jmdcwdawvb1pf60y6gqh2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-matches" ,rust-matches-0.1)
        ("rust-unicode-bidi" ,rust-unicode-bidi-0.3)
        ("rust-unicode-normalization"
         ,rust-unicode-normalization-0.1))
       #:cargo-development-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-rustc-test" ,rust-rustc-test-0.3))))
    (home-page "https://github.com/servo/rust-url/")
    (synopsis
     "IDNA (Internationalizing Domain Names in Applications) and Punycode")
    (description
     "IDNA (Internationalizing Domain Names in Applications) and Punycode.")
    (license #f)))

(define-public rust-keystream
  (package
    (name "rust-keystream")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "keystream" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a4b2g4i1bxkh8ngbpcnplwbsliif8zw9q3d6mk25q4y7j1p0c63"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/PeterReid/keystream")
    (synopsis "Cryptographic keystream traits")
    (description "Cryptographic keystream traits")
    (license #f)))

(define-public rust-time-0.1.42
  (package
    (name "rust-time")
    (version "0.1.42")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "time" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vsbvsz0ryxb35dy9j4anxvy8zlaplmjmi0a4z4l64bc135cz3fv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-redox-syscall" ,rust-redox-syscall-0.1)
        ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rust-lang/time")
    (synopsis
     "Utilities for working with time-related functions in Rust")
    (description
     "Utilities for working with time-related functions in Rust.")
    (license #f)))

(define-public rust-fst
  (package
    (name "rust-fst")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fst" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pwb4gqpdwa1h4cjp1nkv6blhm4ccr2aym6xpg6ndxfzlxn14wnv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-memmap" ,rust-memmap-0.7))
       #:cargo-development-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-fst-levenshtein" ,rust-fst-levenshtein)
        ("rust-fst-regex" ,rust-fst-regex)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
     "Finite state transducers representing strings")
    (description
     "Use finite state transducers to compactly represents sets or
maps of many strings (> 1 billion is possible).")
    (license #f)))

(define-public rust-rand-os-0.1.3
  (package
    (inherit rust-rand-os-0.2)
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_os" version))
       (file-name
        (string-append (package-name rust-rand-os-0.2) "-" version ".tar.gz"))
       (sha256
        (base32
         "0wahppm0s64gkr2vmhcgwc0lij37in1lgfxg5rbgqlz0l5vgcxbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cloudabi" ,rust-cloudabi-0.0)
        ("rust-fuchsia-cprng" ,rust-fuchsia-cprng)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-rdrand" ,rust-rdrand-0.4)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-stdweb" ,rust-stdweb-0.4)
        ("rust-wasm" ,rust-wasm))))))

(define-public rust-fst-levenshtein
  (package
    (name "rust-fst-levenshtein")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fst-levenshtein" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1s5ml10442bbnpmilmwjh4pfixsj6837rg68vjzg63i3djd4524y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fst" ,rust-fst)
        ("rust-utf8-ranges" ,rust-utf8-ranges-1.0))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
     "Finite state transducers with fuzzy queries")
    (description
     "Search finite state transducers with fuzzy queries using
Levenshtein automata.")
    (license #f)))

(define-public rust-fst-regex
  (package
    (name "rust-fst-regex")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fst-regex" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "126xrv3s8mrq8nqsahmpy0nlks6l3wlivqyf6a0i4g7d3vcs3b47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fst" ,rust-fst)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-utf8-ranges" ,rust-utf8-ranges-1.0))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
     "Search finite state transducers with regular expression")
    (description
     "Search finite state transducers with regular expression.")
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

(define-public rust-crossbeam-deque-0.2
  (package
    (inherit rust-crossbeam-deque-0.7)
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-deque" version))
       (file-name
        (string-append (package-name rust-crossbeam-deque-0.7) "-" version ".tar.gz"))
       (sha256
        (base32
         "1wwwbnvxh0rza38xiws8qc46klzhv19zgvarn37pijis6v2zhfgp"))))
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-epoch" ,rust-crossbeam-epoch-0.3)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))))

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

(define-public rust-lock-api-0.1
  (package
    (name "rust-lock-api")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lock_api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0b24q9mh258xa52ap636q1sxz0j5vrnp0hwbbh7ddjka3wwz3sv2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-owning-ref" ,rust-owning-ref-0.4)
        ("rust-scopeguard" ,rust-scopeguard-1.0)
        ("rust-serde" ,rust-serde-1.0))))
    (home-page
     "https://github.com/Amanieu/parking_lot")
    (synopsis
     "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.")
    (description
     "Wrappers to create fully-featured Mutex and RwLock types.  Compatible with no_std.")
    (license #f)))

(define-public rust-semver-0.2
  (package
    (inherit rust-semver-0.9)
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name
        (string-append
         (package-name rust-semver-0.9) "-" version ".tar.gz"))
       (sha256
        (base32
         "0gv28l5ggain32flkvw3sss0szz810y3pjw89vciaf7hl4w7cnrd"))))
    (arguments
     `(#:cargo-inputs
       (("rust-nom" ,rust-nom-1)
        ("rust-semver-parser" ,rust-semver-parser-0.7)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-crates-index" ,rust-crates-index-0.13)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3))))))

(define-public rust-crossbeam-epoch-0.3
  (package
    (inherit rust-crossbeam-epoch-0.7)
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crossbeam-epoch" version))
       (file-name
        (string-append
         (package-name rust-crossbeam-epoch-0.7) "-" version ".tar.gz"))
       (sha256
        (base32
         "0l4igvp2i7b6dgaiq040j8kj8hygwdpr6ppzh1hrbsbx83sj2wcj"))))
    (arguments
     `(#:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.2)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-memoffset" ,rust-memoffset-0.2)
        ("rust-scopeguard" ,rust-scopeguard-0.3))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))))

(define-public rust-adler32
  (package
    (name "rust-adler32")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "adler32" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0p7fxlnks9l7p7rwfqi7aqgnk2bps5zc0rjiw00mdw19nnbjjlky"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/remram44/adler32-rs")
    (synopsis
     "Minimal Adler32 implementation for Rust")
    (description
     "Minimal Adler32 implementation for Rust.")
    (license #f)))

(define-public rust-openssl-sys-0.9.49
  (package
    (name "rust-openssl-sys")
    (version "0.9.49")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1168vivyqbzaxl48bvv9r1x714c03f5c1za8pv5x8fyj9gjxkypl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-vcpkg" ,rust-vcpkg-0.2))
       #:cargo-development-inputs
       (("rust-autocfg" ,rust-autocfg-0.1)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-openssl-src" ,rust-openssl-src)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/sfackler/rust-openssl")
    (synopsis "FFI bindings to OpenSSL")
    (description "FFI bindings to OpenSSL")
    (license #f)))

(define-public rust-libssh2-sys
  (package
    (name "rust-libssh2-sys")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libssh2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17dz3xxy5bc73sr52maa6wdqmw1a0ymznrgfzlxid2rng101yshj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1.0)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page
     "https://github.com/alexcrichton/ssh2-rs")
    (synopsis
     "Native bindings to the libssh2 library")
    (description
     "Native bindings to the libssh2 library")
    (license #f)))

(define-public rust-openssl-src
  (package
    (name "rust-openssl-src")
    (version "111.3.0+1.1.1c")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openssl-src" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15y7fdw33idbdc3y7dv3k87gdc2l4xn202mslkvzbgcls8qmzvak"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cc" ,rust-cc-1.0))))
    (home-page
     "https://github.com/alexcrichton/openssl-src-rs")
    (synopsis
     "Source of OpenSSL and logic to build it.")
    (description
     "Source of OpenSSL and logic to build it.")
    (license #f)))

(define-public rust-ci-info
  (package
    (name "rust-ci-info")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ci_info" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01n3gxmwp765m6xg1fl8v1y12wsvbqvlcai27kdr5d2skrijyfb7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f ; Has failing tests
       #:cargo-inputs
       (("rust-envmnt" ,rust-envmnt-0.6)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page
     "http://github.com/sagiegurari/ci_info")
    (synopsis
     "Provides current CI environment information.")
    (description
     "Provides current CI environment information.")
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

(define-public rust-bindgen-0.33
  (package
    (inherit rust-bindgen-0.50)
    (version "0.33.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bindgen" version))
       (file-name
        (string-append (package-name rust-bindgen-0.50) "-" version ".tar.gz"))
       (sha256
        (base32
         "0vnw5fb74gl9pgnimgbrkac1xgwrjz86pqilx20rbkia77cdhgk0"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cexpr" ,rust-cexpr-0.2)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-clang-sys" ,rust-clang-sys-0.22)
        ("rust-clap" ,rust-clap-2)
        ("rust-env-logger" ,rust-env-logger-0.5)
        ("rust-fxhash" ,rust-fxhash-0.2)
        ("rust-hashbrown" ,rust-hashbrown-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-peeking-take-while" ,rust-peeking-take-while-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-0.3)
        ("rust-regex" ,rust-regex-0.2)
        ("rust-shlex" ,rust-shlex-0.1)
        ("rust-which" ,rust-which-1))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-shlex" ,rust-shlex-0.1))))))

(define-public rust-cexpr-0.2
  (package
    (inherit rust-cexpr-0.3)
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cexpr" version))
       (file-name
        (string-append (package-name rust-cexpr-0.3) "-" version ".tar.gz"))
       (sha256
        (base32
         "0v1xa3758czmj8h97gh548mr8g0v13ixxvrlm1s79nb7jmgc9aj2"))))
    (arguments
     `(#:cargo-inputs
       (("rust-nom" ,rust-nom-3))
       #:cargo-development-inputs
       (("rust-clang-sys" ,rust-clang-sys-0.28))))))

(define-public rust-clang-sys-0.22
  (package
    (inherit rust-clang-sys-0.28)
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clang-sys" version))
       (file-name
        (string-append (package-name rust-clang-sys-0.28) "-" version ".tar.gz"))
       (sha256
        (base32
         "0f65dw1ydnzq4wrv894fql78n4ikb53jjp53xck0s4hb64s1m6lk"))))
    (arguments
     `(#:cargo-inputs
       (("rust-glob" ,rust-glob-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libloading" ,rust-libloading))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob-0.3))))))

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

(define-public rust-nom-3
  (package
    (inherit rust-nom-5.0)
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append (package-name rust-nom-5.0) "-" version ".tar.gz"))
       (sha256
        (base32
         "0yr8fazcspgawl6s7wmx5llz61s68jl88cnrph18fa7xf06cbbh5"))))
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-lexical-core" ,rust-lexical-core-0.4)
        ("rust-memchr" ,rust-memchr-1.0)
        ("rust-regex" ,rust-regex-1.1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-jemallocator" ,rust-jemallocator-0.3)
        ("rust-version-check" ,rust-version-check-0.9))))))

(define-public rust-nom-1
  (package
    (inherit rust-nom-5.0)
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name
        (string-append (package-name rust-nom-5.0) "-" version ".tar.gz"))
       (sha256
        (base32
         "1kjh42w67z1hh1dw3jrilgqrf54jk2xcvhw4rcdm4wclzmbc5f55"))))
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-lexical-core" ,rust-lexical-core-0.4)
        ("rust-memchr" ,rust-memchr-1.0)
        ("rust-regex" ,rust-regex-1.1))
       #:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2)
        ("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-jemallocator" ,rust-jemallocator-0.3)
        ("rust-version-check" ,rust-version-check-0.9))))))

(define-public rust-libloading
  (package
    (name "rust-libloading")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libloading" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0682nn0g7zias4dcgsrk0vlrpvlav70fbcqq85yf48qqnn12ysd5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page
     "https://github.com/nagisa/rust_libloading/")
    (synopsis
     "A safer binding to platformâ\x80\x99s dynamic library loading utilities")
    (description
     "This package provides a safer binding to platformâ\x80\x99s dynamic library loading utilities")
    (license #f)))

(define-public rust-foreign-types
  (package
    (name "rust-foreign-types")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "foreign-types" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ca4i38yrf9iy5k47lr1ylb3rvcbn36d81k5pr5kzf6kmj6p111n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-foreign-types-macros"
         ,rust-foreign-types-macros-0.1)
        ("rust-foreign-types-shared" ,rust-foreign-types-shared-0.2))))
    (home-page
     "https://github.com/sfackler/foreign-types")
    (synopsis
     "A framework for Rust wrappers over C APIs")
    (description
     "This package provides a framework for Rust wrappers over C APIs")
    (license #f)))

(define-public rust-json
  (package
    (name "rust-json")
    (version "0.11.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "json" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1hj8c6xj5c2aqqszi8naaflmcdbya1i9byyjrq4iybxjb4q91mq1"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/maciejhirsz/json-rust")
    (synopsis "JSON implementation in Rust")
    (description "JSON implementation in Rust")
    (license #f)))

(define-public rust-nodrop-union
  (package
    (name "rust-nodrop-union")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nodrop-union" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jsnkdn9l8jlmb9h4wssi76sxnyxwnyi00p6y1p2gdq7c1gdw2b7"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis
     "A wrapper type to inhibit drop (destructor)")
    (description
     "This package provides a wrapper type to inhibit drop (destructor).  Implementation crate for nodrop, the untagged unions implementation (which is unstable / requires nightly) as of this writing.")
    (license #f)))

(define-public rust-rand-jitter
  (package
    (name "rust-rand-jitter")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_jitter" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mnjbfzj97g788jslz0k77bpsg6qjhz676cibk82ibbvgqp4sy43"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-rand-core" ,rust-rand-core-0.5)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rust-random/rand")
    (synopsis
     "Random number generator based on timing jitter")
    (description
     "Random number generator based on timing jitter")
    (license #f)))

(define-public rust-rand-jitter-0.1.4
  (package
    (inherit rust-rand-jitter)
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_jitter" version))
       (file-name
        (string-append (package-name rust-rand-jitter) "-" version ".tar.gz"))
       (sha256
        (base32
         "16z387y46bfz3csc42zxbjq89vcr1axqacncvv8qhyy93p4xarhi"))))))

(define-public rust-average
  (package
    (name "rust-average")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "average" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "077wbjzn2hwdjnglp8pjvirvsjgfgbgnlirwh5g2hk14xqx7f57l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-conv" ,rust-conv)
        ("rust-float-ord" ,rust-float-ord)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-big-array" ,rust-serde-big-array)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-proptest" ,rust-proptest-0.9)
        ("rust-quantiles" ,rust-quantiles)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rand-distr" ,rust-rand-distr)
        ("rust-rand-xoshiro" ,rust-rand-xoshiro-0.3)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-streaming-stats" ,rust-streaming-stats))))
    (home-page "https://github.com/vks/average")
    (synopsis "Calculate statistics iteratively")
    (description "Calculate statistics iteratively")
    (license #f)))

(define-public rust-conv
  (package
    (name "rust-conv")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "conv" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "168j1npqrif1yqxbgbk0pdrx9shzhs5ylc5a4xw49b6hbxi11zvq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-custom-derive" ,rust-custom-derive))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/DanielKeep/rust-conv")
    (synopsis
     "This crate provides a number of conversion traits with more specific semantics than those provided by 'as' or 'From'/'Into'.")
    (description
     "This crate provides a number of conversion traits with more specific semantics than those provided by 'as' or 'From'/'Into'.")
    (license #f)))

(define-public rust-float-ord
  (package
    (name "rust-float-ord")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "float-ord" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kin50365sr3spnbscq43lksymybi99ai9rkqdw90m6vixhlibbv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/notriddle/rust-float-ord")
    (synopsis
     "A total ordering for floating-point numbers")
    (description
     "This package provides a total ordering for floating-point numbers")
    (license #f)))

(define-public rust-quantiles
  (package
    (name "rust-quantiles")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quantiles" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wjp16a3d4bmldq9w2wds0q4gjz4mnsqac3g38r6ryr6zc9sh3y1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page
     "https://github.com/postmates/quantiles")
    (synopsis
     "a collection of approximate quantile algorithms")
    (description
     "a collection of approximate quantile algorithms")
    (license #f)))

(define-public rust-rand-distr
  (package
    (name "rust-rand-distr")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rand_distr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08drhcw9k4a79pri3rd1vkv7v9cbm6cf4i342nai39f527c58zn3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand" ,rust-rand-0.4))
       #:cargo-development-inputs
       (("rust-average" ,rust-average)
        ("rust-rand-pcg" ,rust-rand-pcg))))
    (home-page "https://crates.io/crates/rand_distr")
    (synopsis
     "Sampling from random number distributions")
    (description
     "Sampling from random number distributions")
    (license #f)))

(define-public rust-streaming-stats
  (package
    (name "rust-streaming-stats")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "streaming-stats" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0l7xz4g6709s80zqpvlhrg0qhgz64r94cwhmfsg8xhabgznbp2px"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
     "https://github.com/BurntSushi/rust-stats")
    (synopsis
     "Experimental crate for computing basic statistics on streams")
    (description
     "Experimental crate for computing basic statistics on streams.")
    (license #f)))

(define-public rust-custom-derive
  (package
    (name "rust-custom-derive")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "custom_derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f81bavw1wnykwh21hh4yyzigs6zl6f6pkk9p3car8kq95yfb2pg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))
    (home-page
     "https://github.com/DanielKeep/rust-custom-derive/tree/custom_derive-master")
    (synopsis
     "This crate provides a macro that enables the use of custom derive attributes")
    (description
     "(Note: superseded by `macro-attr`) This crate provides a macro that enables the use of custom derive attributes.")
    (license #f)))

(define-public rust-fuchsia-cprng
  (package
    (name "rust-fuchsia-cprng")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fuchsia-cprng" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fnkqrbz7ixxzsb04bsz9p0zzazanma8znfdqjvh39n14vapfvx0"))))
    (build-system cargo-build-system)
    (home-page
     "https://fuchsia.googlesource.com/fuchsia/+/master/garnet/public/rust/fuchsia-cprng")
    (synopsis
     "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator")
    (description
     "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator")
    (license #f)))

(define-public rust-rdrand-0.4
  (package
    (name "rust-rdrand")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rdrand" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1cjq0kwx1bk7jx3kzyciiish5gqsj7620dm43dc52sr8fzmm9037"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rand-core" ,rust-rand-core-0.5))))
    (home-page
     "https://github.com/nagisa/rust_rdrand/")
    (synopsis
     "An implementation of random number generator based on rdrand and rdseed instructions")
    (description
     "An implementation of random number generator based on rdrand and rdseed instructions")
    (license #f)))

(define-public rust-wasm
  (package
    (name "rust-wasm")
    (version "0.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "136d50gyi3l4nzr9mv0j3p2p50ywdqzf59kkyj33zmcbxmwi42zs"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis "WASM tools")
    (description "WASM tools")
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
        ("rust-time" ,rust-time-0.1.42)
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
       (("rust-dirs" ,rust-dirs)
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
        ("rust-dirs" ,rust-dirs)
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

(define-public rust-cookie-store
  (package
    (name "rust-cookie-store")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cookie-store" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sp4bqfiwzaif8g6sxbncrgphxa2z4i9h3rccyrp88g200801kai"))))
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

(define-public rust-winreg-0.5
  (package
    (inherit rust-winreg)
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winreg" version))
       (file-name
        (string-append (package-name rust-winreg) "-" version ".tar.gz"))
       (sha256
        (base32
         "0jkh4jj2g8g0bl7r1xvq9vv9hr4gdzphg9ndqm65q6f1jn9paym2"))))))

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
       (("rust-adler32" ,rust-adler32)
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
        ("rust-tokio-core" ,rust-tokio-core))))
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
        ("rust-spin" ,rust-spin)
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

(define rust-pretty-assertions
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
       (("rust-ansi-term" ,rust-ansi-term)
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
        ("rust-tokio-core" ,rust-tokio-core))))
    (home-page
     "https://github.com/facebookincubator/rust-partial-io")
    (synopsis
     "Helpers to test partial, interrupted and would-block I/O operations.")
    (description
     "Helpers to test partial, interrupted and would-block I/O operations.")
    (license license:expat)))

(define-public rust-tokio-core
  (package
    (name "rust-tokio-core")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wbgg59mxfvrhzv97y56nh3gmnmw3jj9dhgkmvz27410jjxzpvxf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-iovec" ,rust-iovec-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-executor" ,rust-tokio-executor-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
        ("rust-tokio-timer" ,rust-tokio-timer-0.2))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-futures-cpupool" ,rust-futures-cpupool-0.1)
        ("rust-http" ,rust-http-0.1)
        ("rust-httparse" ,rust-httparse-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-time" ,rust-time-0.1))))
    (home-page "https://tokio.rs")
    (synopsis
     "Core I/O and event loop primitives for asynchronous I/O in Rust")
    (description
     "Core I/O and event loop primitives for asynchronous I/O in Rust.
Foundation for the rest of the tokio crates.")
    (license #f)))

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
        ("rust-spin" ,rust-spin)
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

(define-public rust-rustc-tools-util
  (package
    (name "rust-rustc-tools-util")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-tools-util" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1vj4ymv29igs7n52m12k138zbsn5k5d7ya4sys6lig7sx7ddl9dp"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/rust-lang/rust-clippy")
    (synopsis
     "small helper to generate version information for git packages")
    (description
     "small helper to generate version information for git packages")
    (license #f)))

(define-public rust-glutin
  (package
    (name "rust-glutin")
    (version "0.21.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jcr3fg5wmq32db4jjvrs9867d61z6ivwcv12qsibzmvn6ifg34k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-android-glue" ,rust-android-glue)
        ("rust-cgl" ,rust-cgl)
        ("rust-cocoa" ,rust-cocoa-0.18)
        ("rust-core-foundation" ,rust-core-foundation)
        ("rust-core-graphics" ,rust-core-graphics)
        ("rust-derivative" ,rust-derivative)
        ("rust-glutin-egl-sys" ,rust-glutin-egl-sys)
        ("rust-glutin-emscripten-sys" ,rust-glutin-emscripten-sys)
        ("rust-glutin-gles2-sys" ,rust-glutin-gles2-sys)
        ("rust-glutin-glx-sys" ,rust-glutin-glx-sys)
        ("rust-glutin-wgl-sys" ,rust-glutin-wgl-sys)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libloading" ,rust-libloading)
        ("rust-log" ,rust-log-0.4)
        ("rust-objc" ,rust-objc)
        ("rust-osmesa-sys" ,rust-osmesa-sys)
        ("rust-parking-lot" ,rust-parking-lot-0.9)
        ("rust-wayland-client" ,rust-wayland-client-0.21.13)
        ("rust-smithay-client-toolkit" ,rust-smithay-client-toolkit-0.4)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-winit" ,rust-winit))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis
     "Cross-platform OpenGL context provider.")
    (description
     "Cross-platform OpenGL context provider.")
    (license license:asl2.0)))

(define-public rust-android-glue
  (package
    (name "rust-android-glue")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "android-glue" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01y495x4i9vqkwmklwn2xk7sqg666az2axjcpkr4iwngdwi48100"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/tomaka/android-rs-glue")
    (synopsis "Glue for the Android JNI")
    (description "Glue for the Android JNI")
    (license license:expat)))

(define-public rust-cgl
  (package
    (name "rust-cgl")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cgl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x8jp663viih8mj587qyyi5wy7zd7v9kg6w7dr6iji8m0lad0k72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-gleam" ,rust-gleam)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/servo/cgl-rs")
    (synopsis "Rust bindings for CGL on Mac")
    (description "Rust bindings for CGL on Mac")
    (license #f)))

(define-public rust-cgl-0.2
  (package
    (inherit rust-cgl)
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cgl" version))
       (file-name
        (string-append (package-name rust-cgl) "-" version ".tar.gz"))
       (sha256
        (base32
         "0j8ayr8pbwvyv6l8r7m5z197rs3pqn97085w9j4rfn7yfh5yrrsm"))))
    (arguments
     `(#:cargo-inputs
       (("rust-gleam" ,rust-gleam-0.6)
        ("rust-libc" ,rust-libc-0.2))))))

(define-public rust-cocoa
  (package
    (name "rust-cocoa")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cocoa" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1n9pklag536ghbw93hhld8gzp1fykag67mc6h953p2c0x12h1llc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-block" ,rust-block)
        ("rust-core-foundation" ,rust-core-foundation)
        ("rust-core-graphics" ,rust-core-graphics)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-objc" ,rust-objc))))
    (home-page
     "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to Cocoa for macOS")
    (description "Bindings to Cocoa for macOS")
    (license #f)))

(define-public rust-cocoa-0.18
  (package
    (inherit rust-cocoa)
    (version "0.18.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cocoa" version))
       (file-name
        (string-append (package-name rust-cocoa) "-" version ".tar.gz"))
       (sha256
        (base32
         "0yyprmkqy16s329m4wcn2jsyczdq04val1jkwl3fyp8yw6jdlyfg"))))))

(define-public rust-core-graphics
  (package
    (name "rust-core-graphics")
    (version "0.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-graphics" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1acm3vygngnilzlr6klym5ywh7kfzh2xxrh2l41152hwmdl0jyan"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-core-foundation" ,rust-core-foundation)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/servo/core-graphics-rs")
    (synopsis "Bindings to Core Graphics for OS X")
    (description
     "Bindings to Core Graphics for OS X")
    (license #f)))

(define-public rust-derivative
  (package
    (name "rust-derivative")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derivative" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fpfcw0if70gnp8hvz6ki2wasldzi31pnwx6jmjq18zpxqqa8b4l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page
     "https://github.com/mcarton/rust-derivative")
    (synopsis
     "A set of alternative `derive` attributes for Rust")
    (description
     "This package provides a set of alternative `derive` attributes for Rust")
    (license #f)))

(define-public rust-glutin-egl-sys
  (package
    (name "rust-glutin-egl-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-egl-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09nk7nknjsw2svzqrxmggc53h37xl9a9xd83v4dbdckcmf3qkx13"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-gl-generator" ,rust-gl-generator))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "The egl bindings for glutin")
    (description "The egl bindings for glutin")
    (license license:asl2.0)))

(define-public rust-glutin-emscripten-sys
  (package
    (name "rust-glutin-emscripten-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-emscripten-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ix0jmm8p5if4qarzdfl5mz9rbq4hhgqarakb3bzwvyz13dkynr4"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "The emscripten bindings for glutin")
    (description
     "The emscripten bindings for glutin")
    (license license:asl2.0)))

(define-public rust-glutin-gles2-sys
  (package
    (name "rust-glutin-gles2-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-gles2-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1pswvl5zyqmqwzjr674yzslj0al2xbqsp2ai9ggb9qbshlq6r6c9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-objc" ,rust-objc))
       #:cargo-development-inputs
       (("rust-gl-generator" ,rust-gl-generator))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "The gles2 bindings for glutin")
    (description "The gles2 bindings for glutin")
    (license license:asl2.0)))

(define-public rust-glutin-glx-sys
  (package
    (name "rust-glutin-glx-sys")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-glx-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mxs3mil68xqqb49466n5rpwpcllj6fwqjgrcrzzmz26bv5ab40j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-x11-dl" ,rust-x11-dl))
       #:cargo-development-inputs
       (("rust-gl-generator" ,rust-gl-generator))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "The glx bindings for glutin")
    (description "The glx bindings for glutin")
    (license license:asl2.0)))

(define-public rust-glutin-wgl-sys
  (package
    (name "rust-glutin-wgl-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glutin-wgl-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08chlfzpj59q36qm212i4k879gvjzha7i90q90fds8pw3v4vn0gq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-gl-generator" ,rust-gl-generator))))
    (home-page "https://github.com/tomaka/glutin")
    (synopsis "The wgl bindings for glutin")
    (description "The wgl bindings for glutin")
    (license license:asl2.0)))

(define-public rust-objc
  (package
    (name "rust-objc")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03ar7qxhailxgb0zi5lszv7fhwl6b1xkas5y4m8wy1vyng90zlii"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-malloc-buf" ,rust-malloc-buf-0.0)
        ("rust-objc-exception" ,rust-objc-exception))))
    (home-page
     "http://github.com/SSheldon/rust-objc")
    (synopsis
     "Objective-C Runtime bindings and wrapper for Rust.")
    (description
     "Objective-C Runtime bindings and wrapper for Rust.")
    (license license:expat)))

(define-public rust-osmesa-sys
  (package
    (name "rust-osmesa-sys")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "osmesa-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fq1q1zcgfb0qydrg9r2738jlwc4hqxgb9vj11z72bjxx7kfrkw8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-shared-library" ,rust-shared-library))))
    (home-page
     "https://github.com/Daggerbot/osmesa-rs.git")
    (synopsis "OSMesa library bindings for Rust")
    (description "OSMesa library bindings for Rust")
    (license license:cc0)))

(define-public rust-wayland-client
  (package
    (name "rust-wayland-client")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-client" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nmw2kz70llc5mxwzg6bglnqy0qnyr9224zjmq9czazgw3mq045g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop)
        ("rust-downcast-rs" ,rust-downcast-rs)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-nix" ,rust-nix-0.15)
        ("rust-wayland-commons" ,rust-wayland-commons)
        ("rust-wayland-scanner" ,rust-wayland-scanner)
        ("rust-wayland-sys" ,rust-wayland-sys))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Bindings to the standard C implementation of the wayland protocol, client side.")
    (description
     "Bindings to the standard C implementation of the wayland protocol, client side.")
    (license license:expat)))


(define-public rust-wayland-client-0.21.13
  (package
    (inherit rust-wayland-client)
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-client" version))
       (file-name
        (string-append (package-name rust-wayland-client) "-" version ".tar.gz"))
       (sha256
        (base32
         "04r7dy074hhdalsi1day482wvmczr40hg7qvrnzkgxpakrgkx5j9"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop)
        ("rust-downcast-rs" ,rust-downcast-rs)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-nix" ,rust-nix-0.15)
        ("rust-wayland-commons" ,rust-wayland-commons-0.21)
        ("rust-wayland-scanner" ,rust-wayland-scanner-0.21)
        ("rust-wayland-sys" ,rust-wayland-sys-0.21))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-tempfile" ,rust-tempfile-3.0))))))

(define-public rust-winit
  (package
    (name "rust-winit")
    (version "0.19.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pwzniwm2nn68w4ppixn4pizbnh93vm8nvyaqmajvr8swq2sj3bx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-android-glue" ,rust-android-glue)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop)
        ("rust-cocoa" ,rust-cocoa)
        ("rust-core-foundation" ,rust-core-foundation)
        ("rust-core-graphics" ,rust-core-graphics)
        ("rust-core-video-sys" ,rust-core-video-sys)
        ("rust-derivative" ,rust-derivative)
        ("rust-dispatch" ,rust-dispatch)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-objc" ,rust-objc)
        ("rust-objc" ,rust-objc)
        ("rust-parking-lot" ,rust-parking-lot-0.8)
        ("rust-percent-encoding" ,rust-percent-encoding-2.1)
        ("rust-raw-window-handle"
         ,rust-raw-window-handle)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-smithay-client-toolkit"
         ,rust-smithay-client-toolkit)
        ("rust-wayland-client" ,rust-wayland-client)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-x11-dl" ,rust-x11-dl))
       #:cargo-development-inputs
       (("rust-env-logger" ,rust-env-logger-0.6)
        ("rust-image" ,rust-image))))
    (home-page
     "https://github.com/rust-windowing/winit")
    (synopsis
     "Cross-platform window creation library.")
    (description
     "Cross-platform window creation library.")
    (license license:asl2.0)))

(define-public rust-calloop
  (package
    (name "rust-calloop")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "calloop" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q6ic9lr0s86886mbyn4yncg68b2sykgwjf3iygdw01swmxhk8ks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-mio" ,rust-mio-0.6)
        ("rust-mio-extras" ,rust-mio-extras)
        ("rust-nix" ,rust-nix-0.15))
       #:cargo-development-inputs
       (("rust-lazycell" ,rust-lazycell-1.2))))
    (home-page "https://github.com/Smithay/calloop")
    (synopsis "A callback-based event loop")
    (description
     "This package provides a callback-based event loop")
    (license license:expat)))

(define-public rust-core-video-sys
  (package
    (name "rust-core-video-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-video-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1l59cg88482hkl95ssb30ac9x65hpbdsmxz9s5r6y222jlhnbh4d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-core-foundation-sys"
         ,rust-core-foundation-sys-0.6)
        ("rust-core-graphics" ,rust-core-graphics)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-metal" ,rust-metal)
        ("rust-objc" ,rust-objc))))
    (home-page
     "https://github.com/luozijun/rust-core-video-sys")
    (synopsis
     "Bindings to CoreVideo.framework for macOS and iOS")
    (description
     "Bindings to CoreVideo.framework for macOS and iOS")
    (license license:expat)))

(define-public rust-dispatch
  (package
    (name "rust-dispatch")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dispatch" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "019nzy993hxaiazcdnayx3csv2iki34i535asw11ki96hakkrs84"))))
    (build-system cargo-build-system)
    (home-page
     "http://github.com/SSheldon/rust-dispatch")
    (synopsis
     "Rust wrapper for Apple's Grand Central Dispatch.")
    (description
     "Rust wrapper for Apple's Grand Central Dispatch.")
    (license license:expat)))

(define-public rust-raw-window-handle
  (package
    (name "rust-raw-window-handle")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "raw-window-handle" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "11wfzz3w2jqkjlk478765imwwf9lzy5rmhpgf4hzzcsk20p3ngdg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/rust-windowing/raw-window-handle")
    (synopsis
     "Raw platform window types for interoperability")
    (description
     "Raw platform window types for interoperability")
    (license license:unlicense)))

(define-public rust-smithay-client-toolkit
  (package
    (name "rust-smithay-client-toolkit")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay-client-toolkit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m20687zs36l6xak2s5k9s7qp78ly8xfjpbmrhacp7whfn4hx5lk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-andrew" ,rust-andrew)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-dlib" ,rust-dlib)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-nix" ,rust-nix-0.15)
        ("rust-wayland-client" ,rust-wayland-client)
        ("rust-wayland-protocols"
         ,rust-wayland-protocols))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-image" ,rust-image)
        ("rust-wayland-client" ,rust-wayland-client))))
    (home-page
     "https://github.com/smithay/client-toolkit")
    (synopsis
     "Toolkit for making client wayland applications.")
    (description
     "Toolkit for making client wayland applications.")
    (license license:expat)))

(define-public rust-smithay-client-toolkit-0.4
  (package
    (inherit rust-smithay-client-toolkit)
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay-client-toolkit" version))
       (file-name
        (string-append (package-name rust-smithay-client-toolkit) "-" version ".tar.gz"))
       (sha256
        (base32
         "1yj8yzd0lhqpsgq0x4iikl9a02q2hnkky81brk938alv0ibqrjrc"))))
    (arguments
     `(#:cargo-inputs
       (("rust-andrew" ,rust-andrew)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-dlib" ,rust-dlib)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-nix" ,rust-nix-0.15)
        ("rust-wayland-client" ,rust-wayland-client)
        ("rust-wayland-protocols" ,rust-wayland-protocols-0.21))
       #:cargo-development-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-image" ,rust-image)
        ("rust-wayland-client" ,rust-wayland-client))))))

(define-public rust-x11-dl
  (package
    (name "rust-x11-dl")
    (version "2.18.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11-dl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0n1w837xagxqgwx2880d7c9ks6l3g1kk00yd75afdaiv58sf2rdy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-maybe-uninit" ,rust-maybe-uninit)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/erlepereira/x11-rs.git")
    (synopsis "X11 library bindings for Rust")
    (description "X11 library bindings for Rust")
    (license license:cc0)))

(define-public rust-image
  (package
    (name "rust-image")
    (version "0.22.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0rrcghjyvnf3mdah80ysq6qybc3qb1w7nxr180asvwm09906a1pf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-gif" ,rust-gif)
        ("rust-jpeg-decoder" ,rust-jpeg-decoder)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-png" ,rust-png)
        ("rust-scoped-threadpool"
         ,rust-scoped-threadpool-0.1)
        ("rust-tiff" ,rust-tiff))
       #:cargo-development-inputs
       (("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page "https://github.com/image-rs/image")
    (synopsis
     "Imaging library written in Rust. Provides basic filters and decoders for the most common image formats.")
    (description
     "Imaging library written in Rust.  Provides basic filters and decoders for the most common image formats.")
    (license license:expat)))

(define-public rust-image-0.21
  (package
    (name "rust-image")
    (version "0.21.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sv534xp8yyn7jj0q6yn2bgng1350f962g81sv8v7c6pgi31wdrm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-gif" ,rust-gif)
        ("rust-jpeg-decoder" ,rust-jpeg-decoder)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-png" ,rust-png-0.14)
        ("rust-scoped-threadpool" ,rust-scoped-threadpool-0.1)
        ("rust-tiff" ,rust-tiff-0.2))
       #:cargo-development-inputs
       (("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-num-complex" ,rust-num-complex-0.2)
        ("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page "https://github.com/image-rs/image")
    (synopsis
     "Imaging library written in Rust. Provides basic filters and decoders for the most common image formats.")
    (description
     "Imaging library written in Rust.  Provides basic filters and decoders for the most common image formats.")
    (license license:expat)))

(define-public rust-downcast-rs
  (package
    (name "rust-downcast-rs")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "downcast-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03q2pqjk1wik3agbwgsypah7qziqbpwp41bmpw62cx9gbkyjvfgj"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/marcianx/downcast-rs")
    (synopsis
     "Trait object downcasting support using only safe Rust")
    (description
     "Trait object downcasting support using only safe Rust.  It
supports type parameters, associated types, and type constraints.")
    (license #f)))

(define-public rust-nix-0.14
  (package
    (name "rust-nix")
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kmxdlmvnmq8cfpmr3g6wk37rwi2ybdvp1z6z3831m1p23p2nwkc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-void" ,rust-void-1.0))
       #:cargo-development-inputs
       (("rust-bytes" ,rust-bytes-0.4)
        ("rust-caps" ,rust-caps-0.3)
        ("rust-cc" ,rust-cc-1.0)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-sysctl" ,rust-sysctl-0.4)
        ("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description
     "Rust friendly bindings to *nix APIs")
    (license license:expat)))

(define-public rust-wayland-commons
  (package
    (name "rust-wayland-commons")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-commons" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nyvcs6xxxzqgh0wvc7z0fgi89bf3h9p4qrbf77bnfbwlb8v0rmv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nix" ,rust-nix-0.15)
        ("rust-wayland-sys" ,rust-wayland-sys))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Common types and structures used by wayland-client and wayland-server.")
    (description
     "Common types and structures used by wayland-client and wayland-server.")
    (license license:expat)))

(define-public rust-wayland-commons-0.21
  (package
    (inherit rust-wayland-commons)
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-commons" version))
       (file-name
        (string-append (package-name rust-wayland-commons) "-" version ".tar.gz"))
       (sha256
        (base32
         "1v1jpcsnn6cwwy5ii5pdl58i6b9slmi8mn4my4fpwrlbfsb8ih20"))))))

(define-public rust-wayland-sys
  (package
    (name "rust-wayland-sys")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1x2qafvj8hd2x5qfaan2dfpw9amg0f5g9sqrkdy7qvbddsl8jknr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dlib" ,rust-dlib)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "FFI bindings to the various libwayland-*.so libraries. You should only need this crate if you are working on custom wayland protocol extensions. Look at the crate wayland-client for usable bindings.")
    (description
     "FFI bindings to the various libwayland-*.so libraries.  You should only need this crate if you are working on custom wayland protocol extensions.  Look at the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-wayland-sys-0.21
  (package
    (inherit rust-wayland-sys)
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-sys" version))
       (file-name
        (string-append (package-name rust-wayland-sys) "-" version ".tar.gz"))
       (sha256
        (base32
         "0a0ndgkg98pvmkv44yya4f7mxzjaxylknqh64bpa05w0azyv02jj"))))))

(define-public rust-wayland-scanner
  (package
    (name "rust-wayland-scanner")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-scanner" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0g8wcphykjrcpslznyi3qccx1pckw97rckq5b295nfbg6r3j5c4k"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-xml-rs" ,rust-xml-rs))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Wayland Scanner for generating rust APIs from XML wayland protocol files. Intented for use with wayland-sys. You should only need this crate if you are working on custom wayland protocol extensions. Look at the crate wayland-client for usable bindings.")
    (description
     "Wayland Scanner for generating rust APIs from XML wayland protocol files.  Intented for use with wayland-sys.  You should only need this crate if you are working on custom wayland protocol extensions.  Look at the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-wayland-scanner-0.21
  (package
    (inherit rust-wayland-scanner)
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-scanner" version))
       (file-name
        (string-append (package-name rust-wayland-scanner) "-" version ".tar.gz"))
       (sha256
        (base32
         "17mp49v7w0p0x5ry628lj2llljnwkr9aj9g4bqqhfibid32jhf5z"))))))

(define-public rust-shared-library
  (package
    (name "rust-shared-library")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "shared-library" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04fs37kdak051hm524a360978g58ayrcarjsbf54vqps5c7px7js"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/tomaka/shared_library/")
    (synopsis
     "Easily bind to and load shared libraries")
    (description
     "Easily bind to and load shared libraries")
    (license #f)))

(define-public rust-malloc-buf
  (package
    (name "rust-malloc-buf")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "malloc-buf" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zap9m0xmd5sdsxil7v2rgb1dzlq0308f826pwvqdvjyaz0chciz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/SSheldon/malloc_buf")
    (synopsis
     "Structs for handling malloc'd memory passed to Rust.")
    (description
     "Structs for handling malloc'd memory passed to Rust.")
    (license license:expat)))

(define-public rust-malloc-buf-0.0
  (package
    (inherit rust-malloc-buf)
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "malloc-buf" version))
       (file-name
        (string-append (package-name rust-malloc-buf) "-" version ".tar.gz"))
       (sha256
        (base32
         "1jqr77j89pwszv51fmnknzvd53i1nkmcr8rjrvcxhm4dx1zr1fv2"))))))

(define-public rust-objc-exception
  (package
    (name "rust-objc-exception")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc-exception" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p00damjvy4nbfmrc90d9kbdygycrk76kq1s8v9k1hm35ydd5309"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-gcc" ,rust-gcc-0.3))))
    (home-page
     "http://github.com/SSheldon/rust-objc-exception")
    (synopsis
     "Rust interface for Objective-C's throw and try/catch statements.")
    (description
     "Rust interface for Objective-C's throw and try/catch statements.")
    (license license:expat)))

(define-public rust-gl-generator
  (package
    (name "rust-gl-generator")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gl-generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jpqjqpyrl73sf8y20p5rv50qz8glnsvv9infg8h4vi52zgbp66a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-khronos-api" ,rust-khronos-api)
        ("rust-log" ,rust-log-0.4)
        ("rust-xml-rs" ,rust-xml-rs))))
    (home-page
     "https://github.com/brendanzab/gl-rs/")
    (synopsis
     "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (description
     "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (license license:asl2.0)))

(define-public rust-gl-generator-0.11
  (package
    (name "rust-gl-generator")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gl-generator" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gdchvay0k0g931b2ki33mkfixcw4radk5b8sqsm29rahxg3v8ir"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-khronos-api" ,rust-khronos-api)
        ("rust-log" ,rust-log-0.4)
        ("rust-xml-rs" ,rust-xml-rs))))
    (home-page
     "https://github.com/brendanzab/gl-rs/")
    (synopsis
     "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (description
     "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (license license:asl2.0)))

(define-public rust-block
  (package
    (name "rust-block")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16k9jgll25pzsq14f244q22cdv0zb4bqacldg3kx6h89d7piz30d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-objc-test-utils" ,rust-objc-test-utils))))
    (home-page
     "http://github.com/SSheldon/rust-block")
    (synopsis
     "Rust interface for Apple's C language extension of blocks.")
    (description
     "Rust interface for Apple's C language extension of blocks.")
    (license license:expat)))

(define-public rust-gleam
  (package
    (name "rust-gleam")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gleam" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0jf8fimzj9rx0cm7yd96r7skfksg3f0zn0b4a403zbhifjxgk94y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-gl-generator" ,rust-gl-generator))))
    (home-page "https://github.com/servo/gleam")
    (synopsis
     "Generated OpenGL bindings and wrapper for Servo.")
    (description
     "Generated OpenGL bindings and wrapper for Servo.")
    (license #f)))

(define-public rust-gleam-0.6
  (package
    (inherit rust-gleam)
    (version "0.6.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gleam" version))
       (file-name
        (string-append (package-name rust-gleam) "-" version ".tar.gz"))
       (sha256
        (base32
         "0ma4n66amyqn4wy73ymnpsxvqf5f1zlp5mqqzj5x5xnpl0wpix6g"))))))

(define-public rust-uninit
  (package
    (name "rust-uninit")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uninit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04q75v0hnkm0jnqch06z2a52r9pms22z5asmqq9sf56nyjpxcbsf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-require-unsafe-in-body"
         ,rust-require-unsafe-in-body))))
    (home-page "https://crates.io/crates/uninit")
    (synopsis
     "A collection of tools for a safer usage of uninitialized memory")
    (description
     "This package provides a collection of tools for a safer usage of uninitialized memory")
    (license license:expat)))

(define-public rust-maybe-uninit
  (package
    (name "rust-maybe-uninit")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "maybe-uninit" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "004y0nzmpfdrhz251278341z6ql34iv1k6dp1h6af7d6nd6jwc30"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/est31/maybe-uninit")
    (synopsis
     "MaybeUninit for friends of backwards compatibility")
    (description
     "MaybeUninit for friends of backwards compatibility")
    (license (list license:asl2.0 license:expat))))

(define rust-andrew
  (package
    (name "rust-andrew")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "andrew" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0pmklwcwy8g1jras46fz8xcny779zfqpg4riksrbdhkjk3w0jzwv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-line-drawing" ,rust-line-drawing-0.7)
        ("rust-rusttype" ,rust-rusttype-0.7)
        ("rust-rusttype" ,rust-rusttype)
        ("rust-walkdir" ,rust-walkdir-2.2)
        ("rust-xdg" ,rust-xdg-2.2)
        ("rust-xml-rs" ,rust-xml-rs))
       #:cargo-development-inputs
       (("rust-smithay-client-toolkit"
         ,rust-smithay-client-toolkit))))
    (home-page "https://github.com/trimental/andrew")
    (synopsis
     "The andrew crate provides convenient drawing of objects such as shapes, lines and text to buffers")
    (description
     "The andrew crate provides convenient drawing of objects such as shapes, lines and text to buffers")
    (license license:expat)))

(define-public rust-dlib
  (package
    (name "rust-dlib")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dlib" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0smp2cdvy12xfw26qyqms273w5anszfadv73g75s88yqm54i5rbp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libloading" ,rust-libloading))))
    (home-page "https://github.com/vberger/dlib")
    (synopsis
     "Helper macros for handling manually loading optional system libraries.")
    (description
     "Helper macros for handling manually loading optional system libraries.")
    (license license:expat)))

(define-public rust-wayland-protocols
  (package
    (name "rust-wayland-protocols")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ygwbzqlnks5xzafka3c8ag6k92g2h6ygj2xsmvjfx2n6rj8dhkc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-wayland-client" ,rust-wayland-client)
        ("rust-wayland-commons" ,rust-wayland-commons)
        ("rust-wayland-server" ,rust-wayland-server))
       #:cargo-development-inputs
       (("rust-wayland-scanner" ,rust-wayland-scanner))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Generated API for the officials wayland protocol extensions")
    (description
     "Generated API for the officials wayland protocol extensions")
    (license license:expat)))

(define-public rust-wayland-protocols-0.21
  (package
    (inherit rust-wayland-protocols)
    (version "0.21.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-protocols" version))
       (file-name
        (string-append (package-name rust-wayland-protocols) "-" version ".tar.gz"))
       (sha256
        (base32
         "0i91yh3nxk9llhly2ly3nvlfx0lbpvyq919cgmnyx3j25bmf5zaa"))))))

(define-public rust-metal
  (package
    (name "rust-metal")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "metal" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1sy17s9pyhqxhxfyckw0ficyx6hmp7vpngrx57v7l73040phby6x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-block" ,rust-block)
        ("rust-cocoa" ,rust-cocoa)
        ("rust-core-graphics" ,rust-core-graphics)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-objc" ,rust-objc))
       #:cargo-development-inputs
       (("rust-sema" ,rust-sema)
        ("rust-winit" ,rust-winit))))
    (home-page "https://github.com/gfx-rs/metal-rs")
    (synopsis "Rust bindings for Metal")
    (description "Rust bindings for Metal")
    (license (list license:expat license:asl2.0))))

(define-public rust-mio-extras
  (package
    (name "rust-mio-extras")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio-extras" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0h6fc7pmvsh5r1vpg5xz48lyraalsmb4s4q2v2w50qpsq823mrs6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazycell" ,rust-lazycell-1.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-slab" ,rust-slab-0.4))))
    (home-page
     "https://github.com/dimbleby/mio-extras")
    (synopsis "Extra components for use with Mio")
    (description "Extra components for use with Mio")
    (license license:expat)))

(define-public rust-objc-test-utils
  (package
    (name "rust-objc-test-utils")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc-test-utils" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09rckmp5h9bbns08xzicdlk7y5lxj2ygbg3yqk1cszfnzd5n8kzx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-gcc" ,rust-gcc-0.3))))
    (home-page
     "http://github.com/SSheldon/rust-objc")
    (synopsis
     "Utilities for testing Objective-C interop.")
    (description
     "Utilities for testing Objective-C interop.")
    (license license:expat)))

(define-public rust-wayland-server
  (package
    (name "rust-wayland-server")
    (version "0.23.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wayland-server" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ccsalq6gnf07klnbjx2dxcbibhw03rqsgi578p913s3zsjlcg8a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-calloop" ,rust-calloop)
        ("rust-downcast-rs" ,rust-downcast-rs)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-nix" ,rust-nix-0.15)
        ("rust-wayland-commons" ,rust-wayland-commons)
        ("rust-wayland-sys" ,rust-wayland-sys))
       #:cargo-development-inputs
       (("rust-wayland-scanner" ,rust-wayland-scanner))))
    (home-page
     "https://github.com/smithay/wayland-rs")
    (synopsis
     "Bindings to the standard C implementation of the wayland protocol, server side.")
    (description
     "Bindings to the standard C implementation of the wayland protocol, server side.")
    (license license:expat)))

(define-public rust-line-drawing
  (package
    (name "rust-line-drawing")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "line-drawing" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1chawny039jkj0lj6abkbykfbhk5wwilshn60fqh4c288bjh46gq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))
       #:cargo-development-inputs
       (("rust-bresenham" ,rust-bresenham)
        ("rust-image" ,rust-image)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/expenses/line_drawing")
    (synopsis
     "A collection of line-drawing algorithms for use in graphics and video games.")
    (description
     "This package provides a collection of line-drawing algorithms for use in graphics and video games.")
    (license license:expat)))

(define-public rust-line-drawing-0.7
  (package
    (inherit rust-line-drawing)
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "line-drawing" version))
       (file-name
        (string-append (package-name rust-line-drawing) "-" version ".tar.gz"))
       (sha256
        (base32
         "1fcna7hq1g1kkkqy07hydscx5d2zgb6gskz3vnsvsif8h8ysvisw"))))))

(define-public rust-rusttype
  (package
    (name "rust-rusttype")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusttype" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hk9j3fghwf6kgxkynhs2gprvlmvrylkyacyqfb05k0dz56pvih7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-arrayvec" ,rust-arrayvec-0.4)
        ("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-libm" ,rust-libm)
        ("rust-linked-hash-map" ,rust-linked-hash-map-0.5)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-ordered-float" ,rust-ordered-float)
        ("rust-rustc-hash" ,rust-rustc-hash-1.0)
        ("rust-stb-truetype" ,rust-stb-truetype))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/rusttype")
    (synopsis
     "Pure Rust alternative to libraries like FreeType")
    (description
     "This package provides a pure Rust alternative to libraries like
FreeType.

RustType provides an API for loading, querying and rasterising
TrueType fonts.

It also provides an implementation of a dynamic GPU glyph cache for
hardware font rendering.")
    (license #f)))

(define-public rust-rusttype-0.7
  (package
    (inherit rust-rusttype)
    (version "0.7.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rusttype" version))
       (file-name
        (string-append (package-name rust-rusttype) "-" version ".tar.gz"))
       (sha256
        (base32
         "1m9ms4p94cgif74y1rzkj04rx8i1la193c0jgvnip61rd904429i"))))))

(define-public rust-xml-rs
  (package
    (name "rust-xml-rs")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xml-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1db4v716rbpgjiasaim2s17rmvsfcq1qzwg6nji6mdf5k34i46sl"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/netvl/xml-rs")
    (synopsis "An XML library in pure Rust")
    (description "An XML library in pure Rust")
    (license license:expat)))

(define-public rust-sema
  (package
    (name "rust-sema")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sema" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ckq33sg84785p195m54h03jcn7fai8w08hjnb94nzaakgzibbz3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-time" ,rust-time-0.1))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-nix" ,rust-nix-0.15))))
    (home-page "https://github.com/cpjreynolds/sema")
    (synopsis "Rust semaphore library")
    (description "Rust semaphore library")
    (license license:expat)))

(define-public rust-libm
  (package
    (name "rust-libm")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "16pc0gx4gkg0q2s1ssq8268brn14j8344623vwhadmivc4lsmivz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-no-panic" ,rust-no-panic)
        ("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/rust-lang-nursery/libm")
    (synopsis "libm in pure Rust")
    (description "libm in pure Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-ordered-float
  (package
    (name "rust-ordered-float")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordered-float" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0625x96987kspdxbikry5mb7hsf5pdc5bbanxd8wjwqlx0ar71hq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page
     "https://github.com/reem/rust-ordered-float")
    (synopsis
     "Wrappers for total ordering on floats")
    (description
     "Wrappers for total ordering on floats")
    (license license:expat)))

(define-public rust-stb-truetype
  (package
    (name "rust-stb-truetype")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stb-truetype" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0ykggf9iaifsg2q441j5lld33iv0d2nhw9s54nnw7jsjzgb10hl2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-libm" ,rust-libm))
       #:cargo-development-inputs
       (("rust-approx" ,rust-approx-0.3))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/stb_truetype-rs")
    (synopsis
     "A straight translation of the font loading code in stb_truetype.h from C to Rust.")
    (description
     "This package provides a straight translation of the font loading code in stb_truetype.h from C to Rust.")
    (license #f)))

(define-public rust-bresenham
  (package
    (name "rust-bresenham")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bresenham" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1mvg3zcyll0m3z79jwbg183ha4kb7bw06rd286ijwvgn4mi13hdz"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mbr/bresenham-rs")
    (synopsis
     "Iterator-based integer-only implementation of Bresenham's line algorithm")
    (description
     "This package provides a fast, iterator-based integer-only
implementation of Bresenham's line algorithm.")
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

(define-public rust-num-rational
  (package
    (name "rust-num-rational")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-rational" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m5l76rdzzq98cfhnbjsxfngz6w75pal5mnfflpxqapysmw5527j"))))
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

(define-public rust-which-1
  (package
    (inherit rust-which-2.0)
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "which" version))
       (file-name
        (string-append (package-name rust-which-2.0) "-" version ".tar.gz"))
       (sha256
        (base32
         "1cjwa57kzfgzs681a27m5pjmq580pv3hkcg23smf270bgqz60jp8"))))))

(define-public rust-notify
  (package
    (name "rust-notify")
    (version "4.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "notify" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1jzkkyafrr9bl0rm2lksmmpyn6ksbc98l8swnpn1s17yp2ifz48i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-anymap" ,rust-anymap)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-chashmap" ,rust-chashmap)
        ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.3)
        ("rust-filetime" ,rust-filetime-0.2)
        ("rust-fsevent" ,rust-fsevent-0.4)
        ("rust-fsevent-sys" ,rust-fsevent-sys)
        ("rust-inotify" ,rust-inotify-0.6)
        ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-extras" ,rust-mio-extras)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-walkdir" ,rust-walkdir-2.2)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1.0)
        ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/passcod/notify")
    (synopsis
     "Cross-platform filesystem notification library")
    (description
     "Cross-platform filesystem notification library")
    (license license:cc0)))

(define-public rust-anymap
  (package
    (name "rust-anymap")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "anymap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0i23vv38i22aazp5z2hz0a44b943b6w5121kwwnpq1brpm1l559k"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/chris-morgan/anymap")
    (synopsis
     "A safe and convenient store for one value of each type")
    (description
     "This package provides a safe and convenient store for one value of each type")
    (license #f)))

(define-public rust-chashmap
  (package
    (name "rust-chashmap")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "chashmap" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0igsvpc2ajd6w68w4dwn0fln6yww8gq4pq9x02wj36g3q71a6hgz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-owning-ref" ,rust-owning-ref-0.4)
        ("rust-parking-lot" ,rust-parking-lot-0.8))))
    (home-page
     "https://gitlab.redox-os.org/redox-os/chashmap")
    (synopsis
     "Fast, concurrent hash maps with extensive API.")
    (description
     "Fast, concurrent hash maps with extensive API.")
    (license license:expat)))

(define-public rust-fsevent
  (package
    (name "rust-fsevent")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fsevent" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f5zd75g7mzn2596sv9amkvwjgylwh65pjvq3ihkw89wbqmgdqvq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-fsevent-sys" ,rust-fsevent-sys))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-time" ,rust-time-0.1))))
    (home-page
     "https://github.com/octplane/fsevent-rust")
    (synopsis
     "Rust bindings to the fsevent-sys macOS API for file changes notifications")
    (description
     "Rust bindings to the fsevent-sys macOS API for file changes notifications")
    (license license:expat)))

(define-public rust-fsevent-0.4
  (package
    (inherit rust-fsevent)
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fsevent" version))
       (file-name
        (string-append (package-name rust-fsevent) "-" version ".tar.gz"))
       (sha256
        (base32
         "1djxnc2fmv265xqf1iyfz56smh13v9r1p0w9125wjg6k3fyx3dss"))))))

(define-public rust-fsevent-sys
  (package
    (name "rust-fsevent-sys")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fsevent-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "18246vxk7rqn52m0sfrhivxq802i34p2wqqx5zsa0pamjj5086zl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/octplane/fsevent-rust/tree/master/fsevent-sys")
    (synopsis
     "Rust bindings to the fsevent macOS API for file changes notifications")
    (description
     "Rust bindings to the fsevent macOS API for file changes notifications")
    (license license:expat)))

(define-public rust-inotify
  (package
    (name "rust-inotify")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inotify" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1f5zpi3rvzgc1fm5lgnhjrx6dbgmirf4k5n7w2120knnsmphvr14"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-futures" ,rust-futures-0.1)
        ("rust-inotify-sys" ,rust-inotify-sys)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-tokio" ,rust-tokio-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-reactor" ,rust-tokio-reactor-0.1))
       #:cargo-development-inputs
       (("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page
     "https://github.com/inotify-rs/inotify")
    (synopsis "Idiomatic wrapper for inotify")
    (description "Idiomatic wrapper for inotify")
    (license license:isc)))

(define-public rust-inotify-0.6
  (package
    (inherit rust-inotify)
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inotify" version))
       (file-name
        (string-append (package-name rust-inotify) "-" version ".tar.gz"))
       (sha256
        (base32
         "0627k5aq44knjlrc09hl017nxap3svpl79przf26y3ciycwlbda0"))))))

(define-public rust-inotify-sys
  (package
    (name "rust-inotify-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inotify-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1h2nwgajz80qddjm4mpma94zahxw84nscbycy9pgzbjrgjl1ljp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/inotify-rs/inotify-sys")
    (synopsis
     "inotify bindings for the Rust programming language")
    (description
     "inotify bindings for the Rust programming language")
    (license license:isc)))

(define-public rust-terminfo
  (package
    (name "rust-terminfo")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "terminfo" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17k8vqvicd6yg0iqmkjnxjhz8h8pknv86r03nq3f3ayjmxdhclcf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-fnv" ,rust-fnv-1.0)
        ("rust-nom" ,rust-nom-4.2)
        ("rust-phf" ,rust-phf-0.7)
        ("rust-phf-codegen" ,rust-phf-codegen-0.7))))
    (home-page
     "https://github.com/meh/rust-terminfo")
    (synopsis "Terminal information.")
    (description "Terminal information.")
    (license #f)))

(define-public rust-vte
  (package
    (name "rust-vte")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vte" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kz8svnqnxclllsgh0ck20rplw3qzp46b5v30yscnzrgw8vgahjg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-utf8parse" ,rust-utf8parse))))
    (home-page "https://github.com/jwilm/vte")
    (synopsis
     "Parser for implementing terminal emulators")
    (description
     "Parser for implementing terminal emulators")
    (license (list license:asl2.0 license:expat))))

(define-public rust-khronos-api
  (package
    (name "rust-khronos-api")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "khronos-api" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p0xj5mlbagqyvvnv8wmv3cr7l9y1m153888pxqwg3vk3mg5inz2"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/brendanzab/gl-rs/")
    (synopsis
     "The Khronos XML API Registry, exposed as byte string constants.")
    (description
     "The Khronos XML API Registry, exposed as byte string constants.")
    (license license:asl2.0)))

(define-public rust-gif
  (package
    (name "rust-gif")
    (version "0.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gif" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s7mm8i971i0clm8xs6kvbl8yins7cib4isrxs35rq6njysz5hl6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-color-quant" ,rust-color-quant)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-lzw" ,rust-lzw))
       #:cargo-development-inputs
       (("rust-glob" ,rust-glob-0.3))))
    (home-page
     "https://github.com/image-rs/image-gif")
    (synopsis "GIF de- and encoder")
    (description "GIF de- and encoder")
    (license #f)))

(define-public rust-jpeg-decoder
  (package
    (name "rust-jpeg-decoder")
    (version "0.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jpeg-decoder" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1flj2wq4xdzv6nqs3vk2l3jsg4lpwiz6lfrccb30kr7azs7y3an1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-rayon" ,rust-rayon-1.1))
       #:cargo-development-inputs
       (("rust-png" ,rust-png)
        ("rust-walkdir" ,rust-walkdir-2.2))))
    (home-page
     "https://github.com/kaksmet/jpeg-decoder")
    (synopsis "JPEG decoder")
    (description "JPEG decoder")
    (license #f)))

(define-public rust-png
  (package
    (name "rust-png")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00j64vq8y701i426mx5a95pj6qp23hb9xxmfp6bxs4y0n9xv48l4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-deflate" ,rust-deflate)
        ("rust-inflate" ,rust-inflate))
       #:cargo-development-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ("rust-glium" ,rust-glium)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-term" ,rust-term-0.5))))
    (home-page
     "https://github.com/image-rs/image-png.git")
    (synopsis
     "PNG decoding and encoding library in pure Rust")
    (description
     "PNG decoding and encoding library in pure Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-png-0.14
  (package
    (inherit rust-png)
    (version "0.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name
        (string-append (package-name rust-png) "-" version ".tar.gz"))
       (sha256
        (base32
         "0nf3a8r9p9zrj4x30b48f7yv18dz9xkmrq9b3lnzmpnhzn0z9nk3"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-deflate" ,rust-deflate-0.7)
        ("rust-inflate" ,rust-inflate))
       #:cargo-development-inputs
       (("rust-getopts" ,rust-getopts-0.2)
        ("rust-glium" ,rust-glium)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-term" ,rust-term-0.5))))))

(define-public rust-tiff
  (package
    (name "rust-tiff")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tiff" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zgmbny2f8rssqmjdfvnysy0vqwcvlwl6q9f5yixhavlqk7w5dyp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-lzw" ,rust-lzw)
        ("rust-num-derive" ,rust-num-derive)
        ("rust-num-traits" ,rust-num-traits-0.2))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page
     "https://github.com/image-rs/image-tiff")
    (synopsis
     "TIFF decoding and encoding library in pure Rust")
    (description
     "TIFF decoding and encoding library in pure Rust")
    (license license:expat)))

(define-public rust-tiff-0.2
  (package
    (inherit rust-tiff)
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tiff" version))
       (file-name
        (string-append (package-name rust-tiff) "-" version ".tar.gz"))
       (sha256
        (base32
         "1kn7psgpacns337vvqh272rkqwnakmjd51rc7ygwnc03ibr38j0y"))))))

(define-public rust-lzw
  (package
    (name "rust-lzw")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lzw" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1170dfskhzlh8h2bm333811hykjvpypgnvxyhhm1rllyi2xpr53x"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/nwin/lzw.git")
    (synopsis "LZW compression and decompression.")
    (description
     "LZW compression and decompression.")
    (license #f)))

(define-public rust-num-derive
  (package
    (name "rust-num-derive")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wnv7776fh4i40r3zfxcxcmm0dh029skx7gp4sjknz2kqm2hpzga"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-num" ,rust-num)
        ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
     "https://github.com/rust-num/num-derive")
    (synopsis "Numeric syntax extensions")
    (description "Numeric syntax extensions")
    (license #f)))

(define-public rust-deflate
  (package
    (name "rust-deflate")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deflate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13wh22symwllysjf8xrlyxh9r3z9h0hhay93f0kf1c7qv0i6ws4m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-adler32" ,rust-adler32)
        ("rust-byteorder" ,rust-byteorder-1.3)
        ("rust-gzip-header" ,rust-gzip-header))
       #:cargo-development-inputs
       (("rust-miniz-oxide" ,rust-miniz-oxide-0.2))))
    (home-page
     "https://github.com/image-rs/deflate-rs")
    (synopsis
     "A DEFLATE, zlib and gzip encoder written in rust.")
    (description
     "This package provides a DEFLATE, zlib and gzip encoder written in rust.")
    (license #f)))

(define-public rust-deflate-0.7
  (package
    (inherit rust-deflate)
    (version "0.7.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deflate" version))
       (file-name
        (string-append (package-name rust-deflate) "-" version ".tar.gz"))
       (sha256
        (base32
         "1d7d9fpmgjnznrksmd3vlv3dyw01wsrm11ifil6ag22871xnlyvh"))))))

(define-public rust-inflate
  (package
    (name "rust-inflate")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "inflate" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zxjdn8iwa0ssxrnjmywm3r1v284wryvzrf8vkc7nyf5ijbjknqw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-adler32" ,rust-adler32))))
    (home-page
     "https://github.com/PistonDevelopers/inflate.git")
    (synopsis "DEFLATE decoding")
    (description "DEFLATE decoding")
    (license license:expat)))

(define-public rust-glium
  (package
    (name "rust-glium")
    (version "0.25.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "glium" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0mhjly07x10lxg802ppg16wbxddhh4fdnlg10i99qwpfamvqhzbd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-fnv" ,rust-fnv-1.0)
        ("rust-glutin" ,rust-glutin)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-takeable-option" ,rust-takeable-option))
       #:cargo-development-inputs
       (("rust-cgmath" ,rust-cgmath)
        ("rust-genmesh" ,rust-genmesh)
        ("rust-gl-generator" ,rust-gl-generator)
        ("rust-image" ,rust-image)
        ("rust-obj" ,rust-obj)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-rental" ,rust-rental))))
    (home-page "https://github.com/glium/glium")
    (synopsis
     "Elegant and safe OpenGL wrapper")
  (description
    "Glium is an intermediate layer between OpenGL and your application.
You still need to manually handle the graphics pipeline, but without
having to use OpenGL's old and error-prone API.

Its objectives:

 - Be safe to use.  Many aspects of OpenGL that can trigger a crash if
misused are automatically handled by glium.
 - Provide an API that enforces good pratices such as RAII or
stateless function calls.
 - Be compatible with all OpenGL versions that support shaders,
providing unified API when things diverge.
 - Avoid all OpenGL errors beforehand.
 - Produce optimized OpenGL function calls, and allow the user to
easily use modern OpenGL techniques.")
  (license license:asl2.0)))

(define-public rust-color-quant
  (package
    (name "rust-color-quant")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "color-quant" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ga56jrafnjm80903nnqjkyii4bwd6a7visxh0g8hgi6cmrvbfqd"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/PistonDevelopers/color_quant.git")
    (synopsis
     "Color quantization library to reduce n colors to 256 colors")
    (description
     "Color quantization library to reduce n colors to 256 colors.")
    (license license:expat)))

(define-public rust-gzip-header
  (package
    (name "rust-gzip-header")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gzip-header" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fg6vm8sgsm69szwqyz7abfbyziv6pv0jkcailimlamvsfrzwc81"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crc32fast" ,rust-crc32fast-1.2))))
    (home-page
     "https://github.com/oyvindln/gzip-header")
    (synopsis
     "Ecoding and encoding the header part of gzip files")
    (description
     "This package provides a crate for decoding and encoding the
header part of gzip files based on the gzip header implementation in
the flate2 crate.")
    (license #f)))

(define-public rust-dunce
  (package
    (name "rust-dunce")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dunce" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0kys739zvwcvsngspa4lw2dksigiima17i25c09d2j45m3v6pbfh"))))
    (build-system cargo-build-system)
    (home-page "https://crates.rs/crates/dunce")
    (synopsis
     "Normalize Windows paths to the most compatible format")
    (description
     "Normalize Windows paths to the most compatible format, avoiding
UNC where possible")
    (license license:cc0)))

(define-public rust-mio-anonymous-pipes
  (package
    (name "rust-mio-anonymous-pipes")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mio-anonymous-pipes" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1bqs8wncd73q4pnbiwskhgds57hyr8g89vfpqmw1vk9dqp1p9hpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-mio" ,rust-mio-0.6)
        ("rust-miow" ,rust-miow-0.3)
        ("rust-spsc-buffer" ,rust-spsc-buffer)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/davidhewitt/mio-anonymous-pipes")
    (synopsis
     "Asynchronous wrapper for windows synchronous pipes")
    (description
     "Asynchronous wrapper for windows synchronous pipes")
    (license license:expat)))

(define-public rust-spsc-buffer
  (package
    (name "rust-spsc-buffer")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spsc-buffer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fsv5zpxkax2n46flxhyajq1yblgh8f33la39gp86hksqcwkyv5y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-criterion" ,rust-criterion-0.2))))
    (home-page
     "https://github.com/davidhewitt/spsc-buffer")
    (synopsis
     "Single-producer single-consumer lock-free buffer")
    (description
     "Single-producer single-consumer lock-free buffer")
    (license license:expat)))

(define-public rust-smithay
  (package
    (name "rust-smithay")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "10x6qmphw70x6h6a8mh9a4gj45wzx71778ayhrpnkajm8cjlibq1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-dbus" ,rust-dbus)
        ("rust-drm" ,rust-drm)
        ("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-gbm" ,rust-gbm)
        ("rust-glium" ,rust-glium)
        ("rust-image" ,rust-image)
        ("rust-input" ,rust-input)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libloading" ,rust-libloading)
        ("rust-nix" ,rust-nix-0.15)
        ("rust-slog" ,rust-slog-2.4)
        ("rust-slog-stdlog" ,rust-slog-stdlog)
        ("rust-systemd" ,rust-systemd)
        ("rust-tempfile" ,rust-tempfile-3.0)
        ("rust-udev" ,rust-udev)
        ("rust-wayland-client" ,rust-wayland-client)
        ("rust-wayland-commons" ,rust-wayland-commons)
        ("rust-wayland-protocols"
         ,rust-wayland-protocols)
        ("rust-wayland-server" ,rust-wayland-server)
        ("rust-wayland-sys" ,rust-wayland-sys)
        ("rust-winit" ,rust-winit)
        ("rust-xkbcommon" ,rust-xkbcommon))
       #:cargo-development-inputs
       (("rust-gl-generator" ,rust-gl-generator)
        ("rust-slog-term" ,rust-slog-term))))
    (home-page "https://github.com/Smithay/smithay")
    (synopsis
     "Smithay is a library for writing wayland compositors.")
    (description
     "Smithay is a library for writing wayland compositors.")
    (license license:expat)))

(define-public rust-dbus
  (package
    (name "rust-dbus")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dbus" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zwzinmqhic4pjhb0dir1ssc7ccclq4bmzkp9bc68k5qvafxyfpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libdbus-sys" ,rust-libdbus-sys))
       #:cargo-development-inputs
       (("rust-tempfile" ,rust-tempfile-3.0))))
    (home-page "https://github.com/diwic/dbus-rs")
    (synopsis
     "Rust bindings to D-Bus")
    (description
     "Bindings to D-Bus, which is a bus commonly used on Linux for
inter-process communication.")
    (license #f)))

(define-public rust-libdbus-sys
  (package
    (name "rust-libdbus-sys")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libdbus-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1w06ycq2mw8zfp9j73macgdl8d2881bnxbzdyyxys90ljyya64nw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/diwic/dbus-rs")
    (synopsis "FFI bindings to libdbus.")
    (description "FFI bindings to libdbus.")
    (license #f)))

(define-public rust-drm
  (package
    (name "rust-drm")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "drm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "187vy5qql7rs1sjlp26ykzf4ic344gjyvgr1jzpx8ln5r8hrfcd3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-derive-more" ,rust-derive-more)
        ("rust-drm-sys" ,rust-drm-sys)
        ("rust-error-chain" ,rust-error-chain-0.12)
        ("rust-nix" ,rust-nix-0.15))))
    (home-page "https://github.com/Smithay/drm-rs")
    (synopsis
     "Safe, low-level bindings to the Direct Rendering Manager API")
    (description
     "Safe, low-level bindings to the Direct Rendering Manager API")
    (license license:expat)))

(define-public rust-gbm
  (package
    (name "rust-gbm")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gbm" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0m6zckvhq1r8frkln1lscpzsayg5i7724z1g69ihc1gs91bfaxnj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-drm" ,rust-drm)
        ("rust-gbm-sys" ,rust-gbm-sys)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-wayland-server" ,rust-wayland-server))
       #:cargo-development-inputs
       (("rust-drm" ,rust-drm))))
    (home-page "https://github.com/Smithay/gbm.rs")
    (synopsis "libgbm bindings for rust")
    (description "libgbm bindings for rust")
    (license license:expat)))

(define-public rust-input
  (package
    (name "rust-input")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "input" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s24vslw1c0sknj9r6r1nwajiv2lvv5h4pddlshx4xjq15bjm9nv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-input-sys" ,rust-input-sys)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-udev" ,rust-udev))))
    (home-page
     "https://github.com/Drakulix/input.rs")
    (synopsis "libinput bindings for rust")
    (description "libinput bindings for rust")
    (license license:expat)))

(define-public rust-slog-stdlog
  (package
    (name "rust-slog-stdlog")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slog-stdlog" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "08sc604j19zxc6kb64ppig2nhf7lgqzsrhrbv2i5srdg7f88fkdy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam" ,rust-crossbeam-0.7)
        ("rust-log" ,rust-log-0.4)
        ("rust-slog" ,rust-slog-2.4)
        ("rust-slog-scope" ,rust-slog-scope))
       #:cargo-development-inputs
       (("rust-slog-async" ,rust-slog-async)
        ("rust-slog-term" ,rust-slog-term))))
    (home-page "https://github.com/slog-rs/stdlog")
    (synopsis "`log` crate adapter for slog-rs")
    (description "`log` crate adapter for slog-rs")
    (license #f)))

(define-public rust-systemd
  (package
    (name "rust-systemd")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "systemd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19cjhzn4ja5fwxj9xs73brgw7kqdyrav6iszvigznbbd6hnzvwns"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cstr-argument" ,rust-cstr-argument)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libsystemd-sys" ,rust-libsystemd-sys)
        ("rust-log" ,rust-log-0.4)
        ("rust-utf8-cstr" ,rust-utf8-cstr))))
    (home-page
     "https://github.com/jmesmon/rust-systemd")
    (synopsis
     "A rust interface to libsystemd provided APIs")
    (description
     "This package provides a rust interface to libsystemd provided APIs")
    (license license:lgpl2.1+)))

(define-public rust-udev
  (package
    (name "rust-udev")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "udev" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "00gkkicb8vfhf32c4h5lp7z07kw31agivpbx7q9ipsmj94d4sl27"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libudev-sys" ,rust-libudev-sys))))
    (home-page "https://github.com/Smithay/udev-rs")
    (synopsis "libudev bindings for Rust")
    (description "libudev bindings for Rust")
    (license license:expat)))

(define-public rust-xkbcommon
  (package
    (name "rust-xkbcommon")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xkbcommon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kig3drxm3jbjlyxv9vxawpi2x32w2z9jxysxvg53gfsgmgym87x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-memmap" ,rust-memmap-0.7)
        ("rust-xcb" ,rust-xcb))))
    (home-page
     "https://github.com/rtbo/xkbcommon-rs")
    (synopsis
     "Rust bindings and wrappers for libxkbcommon")
    (description
     "Rust bindings and wrappers for libxkbcommon")
    (license license:expat)))

(define-public rust-slog-term
  (package
    (name "rust-slog-term")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slog-term" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "022f4lsicdsvy6ihi2r8l2fh6sbwxnc8lmg3zj06bj62lgckz6yb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-slog" ,rust-slog-2.4)
        ("rust-term" ,rust-term-0.5)
        ("rust-thread-local" ,rust-thread-local-0.3))
       #:cargo-development-inputs
       (("rust-slog-async" ,rust-slog-async))))
    (home-page "https://github.com/slog-rs/slog")
    (synopsis
     "Unix terminal drain and formatter for slog-rs")
    (description
     "Unix terminal drain and formatter for slog-rs")
    (license #f)))

(define-public rust-xcb
  (package
    (name "rust-xcb")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xcb" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ph27r9nxyfy3hh1c7x85g6dciwxcinf6514pvw9ybhl4hzpm4ay"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-x11" ,rust-x11))
       #:cargo-development-inputs
       (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/rtbo/rust-xcb")
    (synopsis "Rust bindings and wrappers for XCB")
    (description
     "Rust bindings and wrappers for XCB")
    (license license:expat)))

(define-public rust-libudev-sys
  (package
    (name "rust-libudev-sys")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libudev-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09236fdzlx9l0dlrsc6xx21v5x8flpfm3d5rjq9jr5ivlas6k11w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/dcuddeback/libudev-sys")
    (synopsis "FFI bindings to libudev")
    (description "FFI bindings to libudev")
    (license license:expat)))

(define-public rust-cstr-argument
  (package
    (name "rust-cstr-argument")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cstr-argument" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1fyclwygkwp2yrz87n2vvf6l262b3pwrwxga9lx7q362cy04xg90"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-memchr" ,rust-memchr-2.2))))
    (home-page
     "https://github.com/johnschug/cstr-argument")
    (synopsis
     "A trait for converting function arguments to null terminated strings")
    (description
     "This package provides a trait for converting function arguments
to null terminated strings")
    (license license:unlicense)))

(define-public rust-libsystemd-sys
  (package
    (name "rust-libsystemd-sys")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libsystemd-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0sr2vi90sbjhxrg0asnnwh5cpaxrqjis7wd6rfmc7984rmc89ffp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/jmesmon/rust-systemd")
    (synopsis "FFI bindings to libsystemd")
    (description "FFI bindings to libsystemd")
    (license license:lgpl2.1+)))

(define-public rust-utf8-cstr
  (package
    (name "rust-utf8-cstr")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "utf8-cstr" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0a5n94agdn7z54lzqqwk05fp9hsi1farac39sl82n5a1a51bpg2m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-assert-matches" ,rust-assert-matches))))
    (home-page
     "https://github.com/jmesmon/utf8-cstr")
    (synopsis
     "Type wrappers promising null termination and utf-8 validity")
    (description
     "Type wrappers promising null termination and utf-8 validity.
The intersection of `std::ffi::CStr` and `str`")
    (license (list license:asl2.0 license:expat))))

(define-public rust-slog-scope
  (package
    (name "rust-slog-scope")
    (version "4.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slog-scope" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1gs6p6pjciy56d9gmzqc58bmjv56phmrghc7xjkmfvnl2iifrlyi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-arc-swap" ,rust-arc-swap-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-slog" ,rust-slog-2.4))
       #:cargo-development-inputs
       (("rust-slog-async" ,rust-slog-async)
        ("rust-slog-term" ,rust-slog-term))))
    (home-page "https://github.com/slog-rs/slog")
    (synopsis "Logging scopes for slog-rs")
    (description "Logging scopes for slog-rs")
    (license #f)))

(define-public rust-slog-async
  (package
    (name "rust-slog-async")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "slog-async" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bzwkcvwn4d3x6dc8vqywxmcmkxa65gfabv6cv488393ddnd2i75"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-slog" ,rust-slog-2.4)
        ("rust-take-mut" ,rust-take-mut)
        ("rust-thread-local" ,rust-thread-local-0.3))))
    (home-page "https://github.com/slog-rs/slog")
    (synopsis "Asynchronous drain for slog-rs")
    (description "Asynchronous drain for slog-rs")
    (license #f)))

(define-public rust-input-sys
  (package
    (name "rust-input-sys")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "input-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0y3q3d7sllcg3n8dgj46n6s3va2mj0nw7zrhchhcvzmnk77n8axf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-bindgen" ,rust-bindgen-0.50))))
    (home-page
     "https://github.com/Drakulix/input.rs/tree/master/input-sys")
    (synopsis
     "Bindgen generated unsafe libinput wrapper")
    (description
     "Bindgen generated unsafe libinput wrapper")
    (license license:expat)))

(define-public rust-takeable-option
  (package
    (name "rust-takeable-option")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "takeable-option" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "182axkm8pq7cynsfn65ar817mmdhayrjmbl371yqp8zyzhr8kbin"))))
    (build-system cargo-build-system)
    (home-page "")
    (synopsis "A small wrapper around option.")
    (description
     "This package provides a small wrapper around option.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cgmath
  (package
    (name "rust-cgmath")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cgmath" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1rvgila6ivr0dh1bxza450a4yfwdi2pwj3h1vnwg0jy4xk6l8f98"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-approx" ,rust-approx-0.3)
        ("rust-mint" ,rust-mint)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-simd" ,rust-simd))
       #:cargo-development-inputs
       (("rust-glium" ,rust-glium)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/brendanzab/cgmath")
    (synopsis
     "Linear algebra and mathematics library for computer graphics")
    (description
     "This package provides a linear algebra and mathematics library
for computer graphics.")
    (license license:asl2.0)))

(define-public rust-genmesh
  (package
    (name "rust-genmesh")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "genmesh" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17qybydyblf3hjiw7mq181jpi4vrbb8dmsj0wi347r8k0m354g89"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cgmath" ,rust-cgmath)
        ("rust-mint" ,rust-mint))))
    (home-page "https://github.com/gfx-rs/genmesh")
    (synopsis "A package for generating 3D meshes")
    (description
     "This package provides a package for generating 3D meshes")
    (license license:asl2.0)))

(define-public rust-obj
  (package
    (name "rust-obj")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "obj" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1p550ws511h9qic01ppn1p3kgzwyhd2gd1rnrb2z17hgc8yv9bxh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-genmesh" ,rust-genmesh))))
    (home-page "https://github.com/kvark/obj")
    (synopsis
     "A package for loading Wavefront .obj files")
    (description
     "This package provides a package for loading Wavefront .obj files")
    (license license:asl2.0)))

(define-public rust-rental
  (package
    (name "rust-rental")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rental" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "07ry2b2y7mj2rk3i8bj0lcnbpxa7zai455fwlmw1ks62kyynx481"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rental-impl" ,rust-rental-impl)
        ("rust-stable-deref-trait"
         ,rust-stable-deref-trait-1.1))))
    (home-page "https://github.com/jpernst/rental")
    (synopsis
     "A macro to generate safe self-referential structs, plus premade types for common use cases.")
    (description
     "This package provides a macro to generate safe self-referential structs, plus premade types for common use cases.")
    (license #f)))

(define-public rust-gbm-sys
  (package
    (name "rust-gbm-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gbm-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1xl3h4dyrj44w0d1qjylnjhsjsssgnimpjbbdb1dc01alnd1gdp0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-bindgen" ,rust-bindgen-0.50))))
    (home-page
     "https://github.com/Drakulix/gbm.rs/tree/master/gbm-sys")
    (synopsis
     "Bindgen generated unsafe libgbm wrapper")
    (description
     "Bindgen generated unsafe libgbm wrapper")
    (license license:expat)))

(define-public rust-derive-more
  (package
    (name "rust-derive-more")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-more" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1zks5bn7hmqfz927spmridk9bvy7ly4f38vls331x4hc4hq1653s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-rustc-version" ,rust-rustc-version-0.2))))
    (home-page
     "https://github.com/JelteF/derive_more")
    (synopsis
     "Adds deriving macros for more traits")
    (description
     "Adds @code{#[derive(x)]} macros for more traits")
    (license license:expat)))

(define-public rust-derive-more-0.13
  (package
    (inherit rust-derive-more)
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "derive-more" version))
       (file-name
        (string-append (package-name rust-derive-more) "-" version ".tar.gz"))
       (sha256
        (base32
         "0wdqixd7gakanyfzyhd8qwv0p5ksqwgc4w2fml6jfidxyf6dfmrz"))))))

(define-public rust-drm-sys
  (package
    (name "rust-drm-sys")
    (version "0.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "drm-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "17qbmw41jfjmdq7dcv4kb1l0n8zww5l03pj1f6qdnw4p22qj7qz5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-bindgen" ,rust-bindgen-0.50)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/Slabity/modesetting-rs")
    (synopsis
     "Bindings to the Direct Rendering Manager API")
    (description
     "Bindings to the Direct Rendering Manager API")
    (license license:expat)))

(define-public rust-x11
  (package
    (name "rust-x11")
    (version "2.18.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dg2d0yrqmwg6prpxkw3vpmwzwxnaki2cn0v64ylh5gp4cqpws9r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/erlepereira/x11-rs.git")
    (synopsis "X11 library bindings for Rust")
    (description "X11 library bindings for Rust")
    (license license:cc0)))

(define-public rust-smithay-clipboard
  (package
    (name "rust-smithay-clipboard")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smithay-clipboard" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0gcyhs9iq3q5h7ay3ww37pj7dwfri1jbmndfrcylhrfk2x23yp1i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-nix" ,rust-nix-0.15)
        ("rust-smithay-client-toolkit"
         ,rust-smithay-client-toolkit))
       #:cargo-development-inputs
       (("rust-andrew" ,rust-andrew))))
    (home-page
     "https://github.com/smithay/smithay-clipboard")
    (synopsis
     "Provides access to the wayland clipboard for client applications.")
    (description
     "Provides access to the wayland clipboard for client applications.")
    (license license:expat)))

(define-public rust-x11-clipboard
  (package
    (name "rust-x11-clipboard")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x11-clipboard" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1smwyr23jns0dncm6bwv00xfxxy99bv6qlx6df7dkdcydk04kgc9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-xcb" ,rust-xcb))))
    (home-page
     "https://github.com/quininer/x11-clipboard")
    (synopsis "x11 clipboard support for Rust.")
    (description "x11 clipboard support for Rust.")
    (license license:expat)))

(define-public rust-objc-foundation
  (package
    (name "rust-objc-foundation")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc-foundation" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1y9bwb3m5fdq7w7i4bnds067dhm4qxv4m1mbg9y61j9nkrjipp8s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-block" ,rust-block)
        ("rust-objc" ,rust-objc)
        ("rust-objc-id" ,rust-objc-id))))
    (home-page
     "http://github.com/SSheldon/rust-objc-foundation")
    (synopsis
     "Rust wrapper for Objective-C's Foundation framework.")
    (description
     "Rust wrapper for Objective-C's Foundation framework.")
    (license license:expat)))

(define-public rust-objc-id
  (package
    (name "rust-objc-id")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "objc-id" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0fq71hnp2sdblaighjc82yrac3adfmqzhpr11irhvdfp9gdlsbf9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-objc" ,rust-objc))))
    (home-page
     "http://github.com/SSheldon/rust-objc-id")
    (synopsis
     "Rust smart pointers for Objective-C reference counting")
    (description
     "Rust smart pointers for Objective-C reference counting.")
    (license license:expat)))

(define-public rust-clipboard-win
  (package
    (name "rust-clipboard-win")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clipboard-win" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0431sg4jhabrqf2dliiwhbx9hinb9z4qfcm6914lm5mb17ya5798"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/DoumanAsh/clipboard-win")
    (synopsis
     "Provides simple way to interact with Windows clipboard")
    (description
     "Provides simple way to interact with Windows clipboard.")
    (license license:expat)))

(define-public rust-euclid
  (package
    (name "rust-euclid")
    (version "0.19.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "euclid" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qah8h2z3dj2gb325f2qqcm30p4w7b8qsbadz6jyfxwl3di9jssr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-euclid-macros" ,rust-euclid-macros)
        ("rust-mint" ,rust-mint)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1.0))
       #:cargo-development-inputs
       (("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page "https://github.com/servo/euclid")
    (synopsis "Geometry primitives")
    (description "Geometry primitives")
    (license #f)))

(define-public rust-mint
  (package
    (name "rust-mint")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mint" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z2akkbail867wr8f0hvwwz6fxf90q254q8sx8bm25dh9fdw5rn9"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/kvark/mint")
    (synopsis "Math interoperability standard types")
    (description
     "Math interoperability standard types")
    (license license:expat)))

(define-public rust-freetype-rs
  (package
    (name "rust-freetype-rs")
    (version "0.19.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "freetype-rs" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01g78ib2n1sdrbc6hp08nqgdrbl3k8zjd7i7whqvdrqf0jkr5k18"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-freetype-sys" ,rust-freetype-sys-0.7)
        ("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-unicode-normalization"
         ,rust-unicode-normalization-0.1))))
    (home-page
     "https://github.com/PistonDevelopers/freetype-rs")
    (synopsis "Bindings for FreeType font library")
    (description
     "Bindings for FreeType font library")
    (license license:expat)))

(define-public rust-freetype-sys
  (package
    (name "rust-freetype-sys")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "freetype-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1i5q9dj7m7qkagd9ddh4j7qnbw8zqlsdd30n2wkz6g6y72881j8j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1.0))
       #:cargo-development-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
     "https://github.com/PistonDevelopers/freetype-sys")
    (synopsis
     "Low level binding for FreeType font library")
    (description
     "Low level binding for FreeType font library")
    (license license:expat)))

(define-public rust-freetype-sys-0.7
  (package
    (inherit rust-freetype-sys)
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "freetype-sys" version))
       (file-name
        (string-append (package-name rust-freetype-sys) "-" version ".tar.gz"))
       (sha256
        (base32
         "0f2x5cqlv7fbjpsf1hxlh0jbkfmzzr3kcqlhl98nxkz7rik8d70g"))))))

(define-public rust-servo-fontconfig
  (package
    (name "rust-servo-fontconfig")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "servo-fontconfig" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1nach6s4hdf86jz5hlm4p5r7vin91cs7gg89mr533id5fpbzi250"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-servo-fontconfig-sys"
         ,rust-servo-fontconfig-sys))))
    (home-page
     "https://github.com/servo/rust-fontconfig/")
    (synopsis "Rust bindings for fontconfig")
    (description "Rust bindings for fontconfig")
    (license #f)))

(define-public rust-servo-fontconfig-sys
  (package
    (name "rust-servo-fontconfig-sys")
    (version "4.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "servo-fontconfig-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "13bv3b9x1mfk3dhiw3qb9s1461y4k0fjilcag70jbgfgvld20vdl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-expat-sys" ,rust-expat-sys)
        ("rust-servo-freetype-sys"
         ,rust-servo-freetype-sys))
       #:cargo-development-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "http://fontconfig.org")
    (synopsis
     "Font configuration and customization library")
    (description
     "Font configuration and customization library")
    (license license:expat)))

(define-public rust-expat-sys
  (package
    (name "rust-expat-sys")
    (version "2.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "expat-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1yj5pqynds776ay8wg9mhi3hvna4fv7vf244yr1864r0i5r1k3v5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cmake" ,rust-cmake-0.1))
       #:cargo-development-inputs
       (("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "http://www.libexpat.org/")
    (synopsis "XML parser library written in C")
    (description "XML parser library written in C")
    (license license:expat)))

(define-public rust-servo-freetype-sys
  (package
    (name "rust-servo-freetype-sys")
    (version "4.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "servo-freetype-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1z0dvnakans4vn4vlpx4nxg984427lh8dskxxz9pglij1mnwnk1c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-development-inputs
       (("rust-cmake" ,rust-cmake-0.1)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "http://www.freetype.org/")
    (synopsis
     "FreeType is a freely available software library to render fonts.")
    (description
     "FreeType is a freely available software library to render fonts.")
    (license #f)))

(define-public rust-core-text
  (package
    (name "rust-core-text")
    (version "13.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "core-text" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0h56y8a71dv5yqi4ahhqprxxk4azfzxji5mll805dj8lnd1l4s0j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-core-foundation" ,rust-core-foundation)
        ("rust-core-graphics" ,rust-core-graphics)
        ("rust-foreign-types" ,rust-foreign-types-0.3)
        ("rust-libc" ,rust-libc-0.2))))
    (home-page
     "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to the Core Text framework.")
    (description
     "Bindings to the Core Text framework.")
    (license #f)))

(define-public rust-dwrote
  (package
    (name "rust-dwrote")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dwrote" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03gzl5pd90nlkmwqmbmjmyz47h7wlblbqrwv5a29npnv0ag3dl8b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/servo/dwrote-rs")
    (synopsis "Lightweight binding to DirectWrite.")
    (description
     "Lightweight binding to DirectWrite.")
    (license license:mpl2.0)))

(define-public rust-winpty-sys
  (package
    (name "rust-winpty-sys")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winpty-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0s5m2vvlw7wphc466s47zfmp08zk00wzj999l1w3ajqlxbnfgb9x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.33))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page "https://github.com/rprichard/winpty")
    (synopsis "Rust winpty bindings")
    (description "Rust winpty bindings")
    (license license:expat)))

(define-public rust-embed-resource
  (package
    (name "rust-embed-resource")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "embed-resource" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1wx418iqn4bzlnhz5qz4gm1p9ibclg18qwv5x35i2gqv07xrqhg1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-vswhom" ,rust-vswhom)
        ("rust-winreg" ,rust-winreg-0.5))))
    (home-page
     "https://github.com/nabijaczleweli/rust-embed-resource")
    (synopsis
     "A Cargo library to handle compilation and inclusion of Windows resources in the most resilient fashion imaginable")
    (description
     "This package provides a Cargo library to handle compilation and inclusion of Windows resources in the most resilient fashion imaginable")
    (license license:expat)))

(define-public rust-vswhom
  (package
    (name "rust-vswhom")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vswhom" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "12v0fjjzxdc3y5c0lcwycfhphz7zf2s06hl5krwhawah0xzrp5xy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2)
        ("rust-vswhom-sys" ,rust-vswhom-sys))))
    (home-page
     "https://github.com/nabijaczleweli/vswhom.rs")
    (synopsis
     "FFI to Jon Blow's VS discovery script")
    (description
     "FFI to Jon Blow's VS discovery script")
    (license license:expat)))

(define-public rust-vswhom-sys
  (package
    (name "rust-vswhom-sys")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "vswhom-sys" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0clm4dx4amwlhg5lkh52fmvvwq6c7s7b9xqljw39mryhsc158bzw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-libc" ,rust-libc-0.2))
       #:cargo-development-inputs
       (("rust-cc" ,rust-cc-1.0))))
    (home-page
     "https://github.com/nabijaczleweli/vswhom-sys.rs")
    (synopsis
     "Pure FFI to Jon Blow's VS discovery script")
    (description
     "Pure FFI to Jon Blow's VS discovery script")
    (license license:expat)))

(define-public rust-http-req
  (package
    (name "rust-http-req")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-req" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1v5kvanljbzks56bvymc9b6g2mbhmdb7k58r8jwfwfm9gf83acks"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-native-tls" ,rust-native-tls)
        ("rust-rustls" ,rust-rustls)
        ("rust-unicase" ,rust-unicase-2.4)
        ("rust-webpki" ,rust-webpki)
        ("rust-webpki-roots" ,rust-webpki-roots))))
    (home-page
     "https://github.com/jayjamesjay/http_req")
    (synopsis
     "simple and lightweight HTTP client with built-in HTTPS support")
    (description
     "simple and lightweight HTTP client with built-in HTTPS support")
    (license license:expat)))

(define-public rust-zip
  (package
    (name "rust-zip")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zip" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ilzgvacszn9n9in5q67983m2bxnmnivvxa7l0ixhazs190vn89w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bzip2" ,rust-bzip2)
        ("rust-crc32fast" ,rust-crc32fast-1.2)
        ("rust-flate2" ,rust-flate2-1.0)
        ("rust-podio" ,rust-podio)
        ("rust-time" ,rust-time-0.1))
       #:cargo-development-inputs
       (("rust-bencher" ,rust-bencher-0.1)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-walkdir" ,rust-walkdir-2.2))))
    (home-page
     "https://github.com/mvdnes/zip-rs.git")
    (synopsis
     "Library to support the reading and writing of zip files")
    (description
     "Library to support the reading and writing of zip files.")
    (license license:expat)))

(define-public rust-podio
  (package
    (name "rust-podio")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "podio" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ga5arhwakj5rwrqzf9410zrbwnf24jd59af8kr9rgwbd6vb83vq"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/mvdnes/podio.git")
    (synopsis
     "Additional trait for Read and Write to read and write Plain Old Data")
    (description
     "Additional trait for Read and Write to read and write Plain Old Data")
    (license (list license:expat license:asl2.0))))

(define-public rust-named-pipe
  (package
    (name "rust-named-pipe")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "named-pipe" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vgsdvg9zhg4s6fjfwz5h75fnbalblfjrcajapbybxzmqid0mlcf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page
     "https://github.com/blackbeam/named_pipe")
    (synopsis
     "Wrapper for overlapped (asyncronous) IO of Windows's named pipes")
    (description
     "Wrapper for overlapped (asyncronous) IO of Windows's named pipes")
    (license (list license:expat license:asl2.0))))

(define-public rust-euclid-macros
  (package
    (name "rust-euclid-macros")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "euclid-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "05dy60mxw2yg26m1ssqd5v7an0wly97rn0r3b8f7l0x5iv0q9jzx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "")
    (synopsis "Euclid implementation detail")
    (description "Euclid implementation detail")
    (license #f)))

(define-public rust-quote-0.3
  (package
    (inherit rust-quote-0.6)
    (version "0.3.15")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quote" version))
       (file-name
        (string-append (package-name rust-quote-1.0) "-" version ".tar.gz"))
       (sha256
        (base32
         "0yhnnix4dzsv8y4wwz4csbnqjfh73al33j35msr10py6cl5r4vks"))))))

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

(define-public rust-syntex-errors-0.52
  (package
    (inherit rust-syntex-errors)
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-errors" version))
       (file-name
        (string-append
         (package-name rust-syntex-errors) "-" version ".tar.gz"))
       (sha256
        (base32
         "16qym892xi6m2qm95x7f679jdgy51qzg4k3qhxsvdkq2cbzbylly"))))))

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

(define-public rust-syntex-syntax-0.52
  (package
    (inherit rust-syntex-syntax)
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-syntax" version))
       (file-name
        (string-append
         (package-name rust-syntex-syntax) "-" version ".tar.gz"))
       (sha256
        (base32
         "1pmg6h5igjxkz0r8939v0x85cf9j70f7jxzm5wvslj732zkh58vn"))))))

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

(define-public rust-syntex-pos-0.52
  (package
    (inherit rust-syntex-pos)
    (version "0.52.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "syntex-pos" version))
       (file-name
        (string-append
         (package-name rust-syntex-pos) "-" version ".tar.gz"))
       (sha256
        (base32
         "1b0mbspiby8qkrj8109kgmaqya7zfgw9f50dd3j6ii7ldaqz8plm"))))))

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

(define-public rust-racer-cargo-metadata
  (package
    (name "rust-racer-cargo-metadata")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "racer-cargo-metadata" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0vvwbfi991gjbk2k9a7yl7fqc8amvwlf7sa9lsx1sr0s55rcsq1b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-racer-interner" ,rust-racer-interner)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/racer-rust/racer")
    (synopsis
     "light-weight cargo metadata parser for racer")
    (description
     "light-weight cargo metadata parser for racer")
    (license license:expat)))

(define-public rust-rls-span
  (package
    (name "rust-rls-span")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rls-span" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0d6rwya5zsyw6vmrj8d8g3fgvic0xyp1lvfhv62vswk2dzavxsgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page "https://github.com/rust-lang/rls")
    (synopsis
     "Types for identifying code spans/ranges")
    (description
     "Types for identifying code spans/ranges")
    (license #f)))

(define-public rust-rustc-ap-syntax
  (package
    (name "rust-rustc-ap-syntax")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-syntax" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0w1nr16xjjb7s3a6nwz571pjl1d799nlwsmqk3488djplc2yjcqb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures)
        ("rust-rustc-ap-rustc-errors" ,rust-rustc-ap-rustc-errors)
        ("rust-rustc-ap-rustc-lexer" ,rust-rustc-ap-rustc-lexer)
        ("rust-rustc-ap-rustc-macros" ,rust-rustc-ap-rustc-macros)
        ("rust-rustc-ap-rustc-target" ,rust-rustc-ap-rustc-target)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize)
        ("rust-rustc-ap-syntax-pos" ,rust-rustc-ap-syntax-pos)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0)
        ("rust-smallvec" ,rust-smallvec-0.6))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of the package rust-syntax")
    (description
     "Automatically published version of the package rust-syntax.")
    (license #f)))

(define-public rust-rustc-ap-syntax-583
  (package
    (inherit rust-rustc-ap-syntax)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-syntax" version))
       (file-name
        (string-append (package-name rust-rustc-ap-syntax) "-" version ".tar.gz"))
       (sha256
        (base32
         "1j9jjq4vvfs79m5gx2ngx3lhq9dl24fy64ynhbggnkl11317z0mk"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures)
        ("rust-rustc-ap-rustc-errors" ,rust-rustc-ap-rustc-errors-583)
        ("rust-rustc-ap-rustc-lexer" ,rust-rustc-ap-rustc-lexer-583)
        ("rust-rustc-ap-rustc-macros" ,rust-rustc-ap-rustc-macros-583)
        ("rust-rustc-ap-rustc-target" ,rust-rustc-ap-rustc-target-583)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize-583)
        ("rust-rustc-ap-syntax-pos" ,rust-rustc-ap-syntax-pos-583)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0)
        ("rust-smallvec" ,rust-smallvec-0.6))))))

(define-public rust-racer-interner
  (package
    (name "rust-racer-interner")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "racer-interner" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k7ssjjcr4kr9r1jbz93rglisfsx1m6fkx3wz6yng5rizm528si0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/racer-rust/racer")
    (synopsis
     "Thread-local string interner for racer-rust")
    (description
     "Thread-local string interner for racer-rust")
    (license license:expat)))

(define-public rust-rustc-ap-rustc-data-structures
  (package
    (name "rust-rustc-ap-rustc-data-structures")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri
             "rustc-ap-rustc-data-structures"
             version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "074q4kqfhvb95nlnq1j28l2m8b02qa0j3l53m4m3rf5xsb7izhvm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-ena" ,rust-ena)
        ("rust-indexmap" ,rust-indexmap-1.0)
        ("rust-jobserver" ,rust-jobserver)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-parking-lot" ,rust-parking-lot-0.9)
        ("rust-rustc-ap-graphviz" ,rust-rustc-ap-graphviz)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize)
        ("rust-rustc-hash" ,rust-rustc-hash-1.0)
        ("rust-rustc-rayon" ,rust-rustc-rayon)
        ("rust-rustc-rayon-core" ,rust-rustc-rayon-core)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-stable-deref-trait" ,rust-stable-deref-trait-1.1))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of rust-rustc-data-structures")
    (description
     "Automatically published version of rust-rustc-data-structures")
    (license #f)))

(define-public rust-rustc-ap-rustc-data-structures-583
  (package
    (inherit rust-rustc-ap-rustc-data-structures)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-data-structures"
             version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-rustc-data-structures)
         "-" version ".tar.gz"))
       (sha256
        (base32
         "0dhsrfdmy19dc5izmgnfl5cpl019iggz6snm7j7l31c1wrxjr7p8"))))
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.6)
        ("rust-ena" ,rust-ena)
        ("rust-indexmap" ,rust-indexmap-1.0)
        ("rust-jobserver" ,rust-jobserver)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-parking-lot" ,rust-parking-lot-0.7)
        ("rust-rustc-ap-graphviz" ,rust-rustc-ap-graphviz-583)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize-583)
        ("rust-rustc-hash" ,rust-rustc-hash-1.0)
        ("rust-rustc-rayon" ,rust-rustc-rayon)
        ("rust-rustc-rayon-core" ,rust-rustc-rayon-core)
        ("rust-smallvec" ,rust-smallvec-0.6)
        ("rust-stable-deref-trait" ,rust-stable-deref-trait-1.1))))))

(define-public rust-rustc-ap-rustc-errors
  (package
    (name "rust-rustc-ap-rustc-errors")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-errors" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0bj79dda5f6k77mnlc58hgvgwyv17b0k96qfniq67w94d42v85cb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-annotate-snippets" ,rust-annotate-snippets)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize)
        ("rust-rustc-ap-syntax-pos" ,rust-rustc-ap-syntax-pos)
        ("rust-term-size" ,rust-term-size-1.0)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of rust-rustc-errors")
    (description
     "Automatically published version of rust-rustc-errors")
    (license #f)))

(define-public rust-rustc-ap-rustc-errors-583
  (package
    (inherit rust-rustc-ap-rustc-errors)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-errors" version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-rustc-errors)
         "-" version ".tar.gz"))
       (sha256
        (base32
         "0cv3wh4wa3am1q6iybvcadyymvppjbal48rbwh0jpdxy18wcniqy"))))
    (arguments
     `(#:cargo-inputs
       (("rust-annotate-snippets" ,rust-annotate-snippets)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures-583)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize-583)
        ("rust-rustc-ap-syntax-pos" ,rust-rustc-ap-syntax-pos-583)
        ("rust-term-size" ,rust-term-size-1.0)
        ("rust-termcolor" ,rust-termcolor-1.0)
        ("rust-unicode-width" ,rust-unicode-width-0.1))))))

(define-public rust-rustc-ap-rustc-lexer
  (package
    (name "rust-rustc-ap-rustc-lexer")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-lexer" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1qbdwaqlbwwkwfpbi78ij2608iy5pr9gkbnb7i399mdbjw386kq1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of the package rust-rustc-lexer")
    (description
     "Automatically published version of the package rust-rustc-lexer")
    (license #f)))

(define-public rust-rustc-ap-rustc-lexer-583
  (package
    (inherit rust-rustc-ap-rustc-lexer)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-lexer" version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-rustc-lexer)
         "-" version ".tar.gz"))
       (sha256
        (base32
         "01ckjn5fs4zi27prgnvqyjn8kb31pb5ywkkps1kps8a9gzvglk29"))))))

(define-public rust-rustc-ap-rustc-macros
  (package
    (name "rust-rustc-ap-rustc-macros")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-macros" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "01r5hz6zrg4vf0lxrnx4184494nfm56z633ilmh12zq94piwb61q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-itertools" ,rust-itertools-0.8)
        ("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15)
        ("rust-synstructure" ,rust-synstructure-0.10))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of the package rust-rustc-macros")
    (description
     "Automatically published version of the package rust-rustc-macros")
    (license #f)))

(define-public rust-rustc-ap-rustc-macros-583
  (package
    (inherit rust-rustc-ap-rustc-macros)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-macros" version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-rustc-macros)
         "-" version ".tar.gz"))
       (sha256
        (base32
         "0vs89yqng49ncv09a3hxg8hf0788203axlybz6bl96y5ximx7rg2"))))))

(define-public rust-rustc-ap-rustc-target
  (package
    (name "rust-rustc-ap-rustc-target")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-target" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "061jvg4v9zqyp01bipbavfz1vr42viigg9lwqsgqbdrf35z5d1d3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize)
        ("rust-rustc-ap-syntax-pos" ,rust-rustc-ap-syntax-pos))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of the package rust-rustc-target")
    (description
     "Automatically published version of the package rust-rustc-target")
    (license #f)))

(define-public rust-rustc-ap-rustc-target-583
  (package
    (inherit rust-rustc-ap-rustc-target)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-rustc-target" version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-rustc-target) "-" version ".tar.gz"))
       (sha256
        (base32
         "1hnpzpkfrnm7j6sbim3cfzvcyzj66xzlz22pbf6ryfzwdpwwbgx7"))))
    (arguments
     `(#:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures-583)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize-583)
        ("rust-rustc-ap-syntax-pos" ,rust-rustc-ap-syntax-pos-583))))))

(define-public rust-rustc-ap-serialize
  (package
    (name "rust-rustc-ap-serialize")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-serialize" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1as8lcaqfsp2d21jjvdvsfpj5s4z5wxjwm7xlkn0n4nd5cj4258p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-indexmap" ,rust-indexmap-1.0)
        ("rust-smallvec" ,rust-smallvec-0.6))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of the package rust-rustc-serialize")
    (description
     "Automatically published version of the package rust-rustc-serialize")
    (license #f)))

(define-public rust-rustc-ap-serialize-583
  (package
    (inherit rust-rustc-ap-serialize)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-serialize" version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-serialize)
         "-" version ".tar.gz"))
       (sha256
        (base32
         "1xpl03pfnvqvwalsl2wcbkzkcq9xz2cp8r2nkk9xx7pp3hiyxf9b"))))))

(define-public rust-rustc-ap-syntax-pos
  (package
    (name "rust-rustc-ap-syntax-pos")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-syntax-pos" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0xavlkhrjbwghda08138h415k2gdfp6kb3fgybg1n435nm8wygx3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-rustc-ap-arena" ,rust-rustc-ap-arena)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures)
        ("rust-rustc-ap-rustc-macros" ,rust-rustc-ap-rustc-macros)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0)
        ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of the package rust-syntax-pos")
    (description
     "Automatically published version of the package rust-syntax-pos")
    (license #f)))

(define-public rust-rustc-ap-syntax-pos-583
  (package
    (inherit rust-rustc-ap-syntax-pos)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-syntax-pos" version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-syntax-pos)
         "-" version ".tar.gz"))
       (sha256
        (base32
         "04sjn0i0ajh5ajxl6p4xhxrs717sfvb08p1irh9fa9gk6hfdh3lk"))))
    (arguments
     `(#:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-rustc-ap-arena" ,rust-rustc-ap-arena-583)
        ("rust-rustc-ap-rustc-data-structures"
         ,rust-rustc-ap-rustc-data-structures-583)
        ("rust-rustc-ap-rustc-macros" ,rust-rustc-ap-rustc-macros-583)
        ("rust-rustc-ap-serialize" ,rust-rustc-ap-serialize-583)
        ("rust-scoped-tls" ,rust-scoped-tls-1.0)
        ("rust-unicode-width" ,rust-unicode-width-0.1))))))

(define-public rust-rustc-ap-arena
  (package
  (name "rust-rustc-ap-arena")
  (version "590.0.0")
  (source
    (origin
      (method url-fetch)
      (uri (crate-uri "rustc-ap-arena" version))
      (file-name
        (string-append name "-" version ".tar.gz"))
      (sha256
        (base32
          "1kz9cxq0s2nzwypn6aqy049ag82rrvbkdh8x1q5gvq3rmzn22h9p"))))
  (build-system cargo-build-system)
  (arguments
    `(#:cargo-inputs
      (("rust-rustc-ap-rustc-data-structures"
        ,rust-rustc-ap-rustc-data-structures)
       ("rust-smallvec" ,rust-smallvec-0.6))))
  (home-page "https://github.com/rust-lang/rust")
  (synopsis
    "Automatically published version of the package rust-arena")
  (description
    "Automatically published version of the package rust-arena")
  (license #f)))

(define-public rust-rustc-ap-arena-583
  (package
  (inherit rust-rustc-ap-arena)
  (version "583.0.0")
  (source
    (origin
      (method url-fetch)
      (uri (crate-uri "rustc-ap-arena" version))
      (file-name
        (string-append
         (package-name rust-rustc-ap-arena) "-" version ".tar.gz"))
      (sha256
        (base32
         "1xamij3mh6m25fi7svvwqvx80plccwkiqrawvhzkylxx6k9pd6zm"))))
  (arguments
    `(#:cargo-inputs
      (("rust-rustc-ap-rustc-data-structures"
        ,rust-rustc-ap-rustc-data-structures-583)
       ("rust-smallvec" ,rust-smallvec-0.6))))))

(define-public rust-annotate-snippets
  (package
    (name "rust-annotate-snippets")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "annotate-snippets" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "19x7ldklprdgf8pam8b3lfhrxqw5yldcvk5j0bw2agsajbj1q0n7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term))
       #:cargo-development-inputs
       (("rust-ansi-term" ,rust-ansi-term)
        ("rust-difference" ,rust-difference-2.0)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-yaml" ,rust-serde-yaml-0.8))))
    (home-page
     "https://github.com/rust-lang/annotate-snippets-rs")
    (synopsis
     "Build code annotations")
    (description
     "Library for building code annotations")
    (license #f)))

(define-public rust-jobserver
  (package
    (name "rust-jobserver")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jobserver" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0q61p39nw0bdx6w0wkjv1kcha5mbhcfdl4z1hxrhpcskyhpd9cgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.1.12)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4))
       #:cargo-development-inputs
       (("rust-futures" ,rust-futures-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1.10)
        ("rust-tempdir" ,rust-tempdir-0.3)
        ("rust-tokio-core" ,rust-tokio-core)
        ("rust-tokio-process" ,rust-tokio-process))))
    (home-page
     "https://github.com/alexcrichton/jobserver-rs")
    (synopsis
     "GNU make jobserver for Rust")
    (description
     "An implementation of the GNU make jobserver for Rust")
    (license #f)))

(define-public rust-rustc-ap-graphviz
  (package
    (name "rust-rustc-ap-graphviz")
    (version "590.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-graphviz" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "172smcz7p0vzc0q28dzx7ww0ga03aa9hw2dc3j2j891is2hg3k4q"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/rust-lang/rust")
    (synopsis
     "Automatically published version of the package rust-graphviz")
    (description
     "Automatically published version of the package rust-graphviz")
    (license #f)))

(define-public rust-rustc-ap-graphviz-583
  (package
    (inherit rust-rustc-ap-graphviz)
    (version "583.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-ap-graphviz" version))
       (file-name
        (string-append
         (package-name rust-rustc-ap-graphviz)
         "-" version ".tar.gz"))
       (sha256
        (base32
         "0hk1mg7xlcz3bygk5mbcb14w58a1sp9ymlj6znn5hx51ikq2wqry"))))))

(define-public rust-rustc-rayon
  (package
    (name "rust-rustc-rayon")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-rayon" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0qrk5c3f8rpa2hapg1g64z5p1fkj45iw4lyrm9cirwh1jvhhfbhd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque-0.2)
        ("rust-either" ,rust-either-1.5)
        ("rust-rustc-rayon-core" ,rust-rustc-rayon-core))
       #:cargo-development-inputs
       (("rust-docopt" ,rust-docopt-1.1)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-rand" ,rust-rand-0.4)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))))
    (home-page
     "https://github.com/rust-lang/rustc-rayon")
    (synopsis
     "Simple work-stealing parallelism for Rust")
    (description
     "Simple work-stealing parallelism for Rust - fork for rustc")
    (license #f)))

(define-public rust-rustc-rayon-core
  (package
    (name "rust-rustc-rayon-core")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustc-rayon-core" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0hr5l0ks5vmc6d22gghcrzxb0rvznaj4wlyq16gsaby2rfkqrlvr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-deque" ,rust-crossbeam-deque-0.7)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-num-cpus" ,rust-num-cpus-1.10))
       #:cargo-development-inputs
       (("rust-rand" ,rust-rand-0.4))))
    (home-page
     "https://github.com/rust-lang/rustc-rayon")
    (synopsis "Core APIs for Rayon - fork for rustc")
    (description "Core APIs for Rayon - fork for rustc")
    (license #f)))

(define-public rust-tokio-process
  (package
    (name "rust-tokio-process")
    (version "0.3.0-alpha.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-process" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0wn4r3bhpf8gcwzjhm0g4989ajqqn7zc473ndd5n7370nsd0n9wc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-crossbeam-queue" ,rust-crossbeam-queue-0.1)
        ("rust-futures-core-preview"
         ,rust-futures-core-preview-0.3)
        ("rust-futures-util-preview"
         ,rust-futures-util-preview-0.3)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-mio-named-pipes" ,rust-mio-named-pipes-0.1)
        ("rust-tokio-io" ,rust-tokio-io-0.1)
        ("rust-tokio-net" ,rust-tokio-net)
        ("rust-tokio-net" ,rust-tokio-net)
        ("rust-tokio-sync" ,rust-tokio-sync-0.1)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-tokio" ,rust-tokio-0.1))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis
     "Asynchronous process management backed futures")
    (description
     "An implementation of an asynchronous process management backed futures.")
    (license license:expat)))

(define-public rust-wasi
  (package
    (name "rust-wasi")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasi" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "03apg3sa4hjn6xwa4pkyvzjiscya51wyrygadgxwdg8lrvj3r75q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-alloc"
         ,rust-rustc-std-workspace-alloc-1.0)
        ("rust-rustc-std-workspace-core"
         ,rust-rustc-std-workspace-core-1.0))))
    (home-page
     "https://github.com/CraneStation/rust-wasi")
    (synopsis
     "Experimental WASI API bindings for Rust")
    (description
     "Experimental WASI API bindings for Rust")
    (license (list #f license:expat))))

(define-public rust-clippy-lints
  (package
    (name "rust-clippy-lints")
    (version "0.0.212")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clippy-lints" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "04l579yx9485qx8ksr9m153kmb9gml6v6p5xmmr9cr05ah32c8xx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cargo-metadata" ,rust-cargo-metadata)
        ("rust-if-chain" ,rust-if-chain)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark)
        ("rust-quine-mc-cluskey" ,rust-quine-mc-cluskey)
        ("rust-regex-syntax" ,rust-regex-syntax-0.6)
        ("rust-semver" ,rust-semver-0.9)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-toml" ,rust-toml-0.1)
        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1)
        ("rust-url" ,rust-url-1.7))))
    (home-page
     "https://github.com/rust-lang-nursery/rust-clippy")
    (synopsis
     "Helpful lints to avoid common pitfalls in Rust")
    (description
     "This package provides a bunch of helpful lints to avoid common
pitfalls in Rust")
    (license license:mpl2.0)))

(define-public rust-clippy-lints-0.0.103
  (package
    (inherit rust-clippy-lints)
    (version "0.0.103")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clippy-lints" version))
       (file-name
        (string-append
         (package-name rust-clippy-lints) "-" version ".tar.gz"))
       (sha256
        (base32
         "06k5jkavj2kqcbjg5w0zk0bj5sjh93jib89xskas0670pw2yr5nf"))))
    (arguments
     `(#:cargo-inputs
       (("rust-cargo-metadata" ,rust-cargo-metadata)
        ("rust-if-chain" ,rust-if-chain)
        ("rust-itertools" ,rust-itertools-0.8)
        ("rust-lazy-static" ,rust-lazy-static-1.3)
        ("rust-matches" ,rust-matches-0.1)
        ("rust-pulldown-cmark" ,rust-pulldown-cmark)
        ("rust-quine-mc-cluskey" ,rust-quine-mc-cluskey)
        ("rust-regex-syntax" ,rust-regex-syntax-0.3)
        ("rust-semver" ,rust-semver-0.2)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-toml" ,rust-toml-0.1)
        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1)
        ("rust-url" ,rust-url-1.7))))))

(define-public rust-cargo-metadata
  (package
    (name "rust-cargo-metadata")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cargo-metadata" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "09n4fp9hrg0z84y5q0q98rlinh0832zls3q0s0ip4dbxzlqkf2vh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-semver" ,rust-semver-0.9)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))
       #:cargo-development-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-docopt" ,rust-docopt-1.1)
        ("rust-structopt" ,rust-structopt))))
    (home-page
     "https://github.com/oli-obk/cargo_metadata")
    (synopsis
     "structured access to the output of `cargo metadata`")
    (description
     "structured access to the output of `cargo metadata`")
    (license license:expat)))

(define-public rust-if-chain
  (package
    (name "rust-if-chain")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "if-chain" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0zgcn31bahnsmsjc0cgk0cy38p8sfjs79yvi6rjs5zz5b5xhqdn3"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/lfairy/if_chain")
    (synopsis
     "Macro for writing nested `if let` expressions.")
    (description
     "Macro for writing nested `if let` expressions.")
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

(define-public rust-quine-mc-cluskey
  (package
    (name "rust-quine-mc-cluskey")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quine-mc-cluskey" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0iazdlwffhrlksb8yhhs1prgwpa68rwjwqm4v26hr9hrswarcn07"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-quickcheck" ,rust-quickcheck-0.8))))
    (home-page
     "https://github.com/oli-obk/quine-mc_cluskey")
    (synopsis
     "Rust implementation of the Quine-McCluskey algorithm and Petrick's method")
    (description
     "Rust implementation of the Quine-McCluskey algorithm and Petrick's method")
    (license license:expat)))

(define-public rust-structopt
  (package
    (name "rust-structopt")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "structopt" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0k400yfx199b1j4xmyf6c0wh9qv68p0sbkc9pwbv54np7plxdj9a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f ; FIXME Tests fail
       #:cargo-inputs
       (("rust-clap" ,rust-clap-2)
        ("rust-structopt-derive" ,rust-structopt-derive))
       #:cargo-development-inputs
       (("rust-trybuild" ,rust-trybuild-1.0)
        ("rust-version-check" ,rust-version-check-0.9))))
    (home-page
     "https://github.com/TeXitoi/structopt")
    (synopsis
     "Parse command line argument by defining a struct")
    (description
     "Parse command line argument by defining a struct.")
    (license #f)))

(define-public rust-src
  (package
    (inherit rust)
    (name "rust-src")
    (build-system gnu-build-system)
    (outputs '("out"))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (delete 'check)
         (delete 'strip)
         (delete 'validate-runpath)
         (delete 'compress-documentation)
         (delete 'delete-info-dir-file)
         (delete 'validate-documentation-location)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
             (copy-recursively
              "src" (string-append out "/lib/rustlib/src/rust/src"))
             #t))))))
    (native-search-paths
     (list (search-path-specification
            (variable "RUST_SRC_DIR")
            (files '("lib/rustlib/src/rust/src")))))))

(define-public rust-structopt-derive
  (package
    (name "rust-structopt-derive")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "structopt-derive" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0dzz8bl90dw4lji3l5pmgc2id4qgilgh4zcnfvm0sfj6blbfbs9a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-heck" ,rust-heck)
        ("rust-proc-macro-error" ,rust-proc-macro-error)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-1.0))))
    (home-page
     "https://github.com/TeXitoi/structopt")
    (synopsis
     "Parse command line argument by defining a struct, derive crate.")
    (description
     "Parse command line argument by defining a struct, derive crate.")
    (license #f)))

(define-public rust-proc-macro-error
  (package
    (name "rust-proc-macro-error")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proc-macro-error" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "15v0ghpanf8zzdbd76dxccfi5x706w3av8p4y3apb8cfbm6zxk5f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/CreepySkeleton/proc-macro-error")
    (synopsis
     "Drop-in replacement to panics in proc-macros")
    (description
     "Drop-in replacement to panics in proc-macros")
    (license license:expat)))

(define-public rust-quote-1
  (package
    (inherit rust-quote-1.0)
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quote" version))
       (file-name
        (string-append
         (package-name rust-quote-1.0) "-" version ".tar.gz"))
       (sha256
        (base32
         "1zkc46ryacf2jdkc6krsy2z615xbk1x8kp1830rcxz3irj5qqfh5"))))))

(define-public rust-rustversion
  (package
    (name "rust-rustversion")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustversion" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1s3ib2paa5gq17x4qsmjmnsw68z7b5d5av1wsiqcrihmqb7kk0dl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page
     "https://github.com/dtolnay/rustversion")
    (synopsis
     "Conditional compilation according to rustc compiler version")
    (description
     "Conditional compilation according to rustc compiler version")
    (license (list license:expat license:asl2.0))))

;; FIXME
(define-public rust-simd
  (package
    (name "rust-simd")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simd" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1dgpmfzd4favsckd5m0p6bna1dcgw19hjigkqcgwfhc4d05hxczj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0))
       #:cargo-development-inputs
       (("rust-cfg-if" ,rust-cfg-if-0.1))))
    (home-page "https://github.com/hsivonen/simd")
    (synopsis
     "Offers limited cross-platform access to SIMD instructions on")
    (description
     "This simd crate offers limited cross-platform access to SIMD instructions
on CPUs, as well as raw interfaces to platform-specific instructions.
(To be obsoleted by the `std::simd` implementation RFC 2366.)")
    (license #f)))

(define-public rust-rental-impl
  (package
    (name "rust-rental-impl")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rental-impl" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1djsnbzw57fkspjgjfm159qaw7z8k1y7w7qnvw49dgicrxa0s9l2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))))
    (home-page "https://www.jpernst.com")
    (synopsis
     "An implementation detail of rental")
    (description
     "An implementation detail of rental.  Should not be used
directly.")
    (license #f)))

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
       (("rust-ansi-term" ,rust-ansi-term)
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

(define-public rust-require-unsafe-in-body
  (package
    (name "rust-require-unsafe-in-body")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "require-unsafe-in-body" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "078fw6jx7cbw9qwipvcjwr3jf6b11zcqn4gggb289x6hs7xmg27m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-0.4)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-syn" ,rust-syn-0.15))
       #:cargo-development-inputs
       (("rust-pretty-assertions"
         ,rust-pretty-assertions)
        ("rust-trybuild" ,rust-trybuild-1.0))))
    (home-page
     "https://crates.io/crates/require_unsafe_in_body")
    (synopsis
     "Require unsafe blocks in the function's body")
    (description
     "Make @code{unsafe fn} still require @code{unsafe} blocks in the
function's body.")
    (license license:expat)))

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
       (("rust-cgmath" ,rust-cgmath)
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
       (("rust-ansi-term" ,rust-ansi-term)
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
       (("rust-ansi-term" ,rust-ansi-term)
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
     "Implement and compose tracing subscribers")
    (description
     "Utilities for implementing and composing tracing subscribers.")
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

(define-public rust-zoneinfo-compiled-0.4
  (package
    (name "rust-zoneinfo-compiled")
    (version "0.4.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "zoneinfo_compiled" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0bnm19w791q6kp79s0zl1cj9w51bw5xrifrxfy3g1p05i676y4vf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-byteorder" ,rust-byteorder-1.3)
         ("rust-datetime" ,rust-datetime-0.4))))
    (home-page
      "https://github.com/rust-datetime/zoneinfo-compiled/")
    (synopsis
      "Library for parsing compiled zoneinfo files")
    (description
      "Library for parsing compiled zoneinfo files.")
    (license license:expat)))

(define-public rust-users-0.9
  (package
    (name "rust-users")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "users" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1kxl3y2hcrqqip7jpqn5mz7xlpbwmmpfmaza0xnyrhx0mrkl4by7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/ogham/rust-users")
    (synopsis
      "Library for getting information on Unix users and groups")
    (description
      "Library for getting information on Unix users and groups.")
    (license license:expat)))

(define-public rust-term-grid-0.1
  (package
    (name "rust-term-grid")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "term_grid" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1kq2sy3b8329jrsrpcvijvyz4gbqjyvyy6c3n0wmmvda9y03w393"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page
      "https://github.com/ogham/rust-term-grid")
    (synopsis
      "Library for formatting strings into a grid layout")
    (description
      "Library for formatting strings into a grid layout")
    (license license:expat)))

(define-public rust-number-prefix-0.3
  (package
    (name "rust-number-prefix")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "number_prefix" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0slm4mqmpgs6hvz22ycny9lvyvl9ivs80a1lncslp7lszz02zc0p"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/ogham/rust-number-prefix")
    (synopsis
      "Format numeric prefixes: kilo, giga, kibi")
    (description
      "Library for formatting numeric prefixes: kilo, giga, kibi.")
    (license license:expat)))

(define-public rust-hermit-abi-0.1
  (package
    (name "rust-hermit-abi")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hermit-abi" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1mr16riz544zwn0qpd02a5rgszsdcig9p868pwafrlwj4dhdqagn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-rustc-std-workspace-core"
          ,rust-rustc-std-workspace-core-1.0))))
    (home-page
      "https://github.com/hermitcore/rusty-hermit")
    (synopsis
      "Small interface to call functions from RustyHermit")
    (description
      "hermit-abi is small interface to call functions from the unikernel RustyHermit.
It is used to build the target x86_64-unknown-hermit.")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-cpus-1.11
  (package
    (name "rust-num-cpus")
    (version "1.11.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num_cpus" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0wlxs00cpg16z09fwchj1gdz1jxnf5dgg1cbidvq0sc75bnwbnkn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-hermit-abi" ,rust-hermit-abi-0.1)
         ("rust-libc" ,rust-libc-0.2))
        #:cargo-development-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3))))
    (home-page
      "https://github.com/seanmonstar/num_cpus")
    (synopsis "Get the number of CPUs on a machine.")
    (description
      "Get the number of CPUs on a machine.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pad-0.1
  (package
    (name "rust-pad")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pad" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1qy0r26r52gp034fv252mmg0s599a55h9nr4xswy04hvky49pbfj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/ogham/rust-pad")
    (synopsis
      "Library for padding strings at runtime")
    (description
      "Library for padding strings at runtime.")
    (license license:expat)))

(define-public rust-locale-0.2
  (package
    (name "rust-locale")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "locale" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1z87wc7z6889x1pqlrwjw8f1crshzi15q5m102lqs8y0m69f9nsz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page
      "https://github.com/ogham/rust-locale")
    (synopsis
      "Library for basic localisation")
    (description
      "Library for basic localisation.  Warning: Major rewrite pending
for 0.3!")
    (license license:expat)))

(define-public rust-iso8601-0.1
  (package
    (name "rust-iso8601")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "iso8601" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
           "0xy48qyfmirslaj4dy6n4g8b564jap3cjiql35fmj5vgii7ldp0i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-nom" ,rust-nom-1))))
    (home-page "https://github.com/badboy/iso8601")
    (synopsis "Parsing ISO8601 dates using nom")
    (description "Parsing ISO8601 dates using nom.")
    (license license:expat)))

(define-public rust-datetime-0.4
  (package
    (name "rust-datetime")
    (version "0.4.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "datetime" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fd74bq48xg8ki5yw1mr1pa5hd3j5lbk4iqc5r0kh3l62b0vci2w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
        (("rust-iso8601" ,rust-iso8601-0.1)
         ("rust-kernel32-sys" ,rust-kernel32-sys-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-locale" ,rust-locale-0.2)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-pad" ,rust-pad-0.1)
         ("rust-redox-syscall" ,rust-redox-syscall-0.1)
         ("rust-winapi" ,rust-winapi-0.2))
        #:cargo-development-inputs
        (("rust-regex" ,rust-regex-1.1)
         ("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))
    (home-page
      "https://github.com/rust-datetime/datetime")
    (synopsis
      "Library for date and time formatting and arithmetic")
    (description
      "Library for date and time formatting and arithmetic.")
    (license license:expat)))

(define-public rust-natord-1.0
  (package
    (name "rust-natord")
    (version "1.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "natord" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0z75spwag3ch20841pvfwhh3892i2z2sli4pzp1jgizbipdrd39h"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
     "https://github.com/lifthrasiir/rust-natord")
    (synopsis "Natural ordering for Rust")
    (description "Natural ordering for Rust")
    (license license:expat)))

(define-public rust-ansi-term-0.12
  (package
    (name "rust-ansi-term")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ansi-term" version))
       (file-name
        (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1ljmkbilxgmhavxvxqa7qvm6f3fjggi7q2l3a72q9x0cxjvrnanm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1.0)
        ("rust-winapi" ,rust-winapi-0.3))
       #:cargo-development-inputs
       (("rust-doc-comment" ,rust-doc-comment-0.3)
        ("rust-regex" ,rust-regex-1.1)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
     "https://github.com/ogham/rust-ansi-term")
    (synopsis
     "ANSI terminal colours and styles (bold, underline)")
    (description
     "Library for ANSI terminal colours and styles (bold,
underline).")
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
