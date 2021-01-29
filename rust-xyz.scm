(define-module (rust-xyz)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages rust)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

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
        ("rust-serde" ,rust-serde-1))
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
      `(#:cargo-inputs (("rust-which" ,rust-which-2))))
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
         ("rust-walkdir" ,rust-walkdir-2))
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
        (("rust-difference" ,rust-difference-2)
         ("rust-float-cmp" ,rust-float-cmp-0.6)
         ("rust-normalize-line-endings"
          ,rust-normalize-line-endings-0.2)
         ("rust-predicates-core" ,rust-predicates-core-1.0)
         ("rust-regex" ,rust-regex-1))
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
         ("rust-tempfile" ,rust-tempfile-3))))
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
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1))
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
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1))
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
         ("rust-xdg" ,rust-xdg-2))))
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
        ("rust-regex" ,rust-regex-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-strsim" ,rust-strsim-0.7))))))
