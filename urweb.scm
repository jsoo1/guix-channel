(define-module (urweb)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:))

(define-public urweb
  (package
    (name "urweb")
    (version "20190217")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/urweb/urweb")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0172x019gxhvkh36iqqn3zsb5ypwrwn2qydr62zkmdgaps815idq"))))
    (inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("gettext" ,gnu-gettext)
       ("libtool" ,libtool)
       ("mariadb" ,mariadb)
       ("libressl" ,libressl)
       ("pkg-config" ,pkg-config)
       ("postgresql" ,postgresql)
       ("sqlite" ,sqlite)
       ("uthash" ,uthash)))
    (build-system gnu-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (replace 'build (lambda _ #f)))))
    (home-page "impredicative.com/ur")
    (synopsis "Purely functional language/framework for web programming")
    (description
     " Ur is a programming language in the tradition of ML and
Haskell, but featuring a significantly richer type system. Ur is
functional, pure, statically typed, and strict. Ur supports a powerful
kind of metaprogramming based on row types.

Ur/Web is Ur plus a special standard library and associated rules for
parsing and optimization. Ur/Web supports construction of dynamic web
applications backed by SQL databases. The signature of the standard
library is such that well-typed Ur/Web programs \"don't go wrong\" in a
very broad sense. Not only do they not crash during particular page
generations, but they also may not:

  * Suffer from any kinds of code-injection attacks

  * Return invalid HTML

  * Contain dead intra-application links

  * Have mismatches between HTML forms and the fields expected by
their handlers

  * Include client-side code that makes incorrect assumptions about
the \"AJAX\"-style services that the remote web server provides

  * Attempt invalid SQL queries

  * Use improper marshaling or unmarshaling in communication with SQL
databases or between browsers and web servers")
    (license license:bsd-3)))
