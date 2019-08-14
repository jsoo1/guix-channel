(define-module (ghc-dbus)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system haskell)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xml)
  #:export (ghc-dbus))

;; PUBLIC
(define ghc-dbus
  (package
   (name "ghc-dbus")
   (version "1.0.1")
   (source
    (origin
     (method url-fetch)
     (uri
      (string-append
       "https://hackage.haskell.org/package/dbus/dbus-" version ".tar.gz"))
     (sha256 (base32 "1xg8wzs7xnh3455v3bbw9nd8inzr06n5939pzlq3nd4ajp3ba9d3"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-cereal" ,ghc-cereal)
      ("ghc-lens" ,ghc-lens)
      ("ghc-libxml-sax" ,ghc-libxml-sax)
      ("ghc-network" ,ghc-network)
      ("ghc-random" ,ghc-random)
      ("ghc-split" ,ghc-split)
      ("ghc-th-lift" ,ghc-th-lift)
      ("ghc-vector" ,ghc-vector)
      ("ghc-xml-types" ,ghc-xml-types)))
   (arguments `(#:tests? #f))
   (home-page "https://github.com/rblaze/haskell-dbus#readme")
   (synopsis "A client library for the D-Bus IPC system.")
   (description "")
   (license license:asl2.0)))

;; DEPENDENCIES
(define ghc-libxml-sax
  (package
   (name "ghc-libxml-sax")
   (version "0.7.5")
   (source
    (origin
     (method url-fetch)
     (uri
      (string-append
       "https://hackage.haskell.org/package/libxml-sax/libxml-sax-"
       version ".tar.gz"))
     (sha256 (base32 "0lbdq6lmiyrnzk6gkx09vvp928wj8qnqnqfzy14mfv0drj21f54r"))))
   (build-system haskell-build-system)
   (inputs
    `(("ghc-xml-types" ,ghc-xml-types)))
   (native-inputs
    `(("pkg-config" ,pkg-config)
      ("libxml2" ,libxml2)))
   (home-page "https://john-millikin.com/software/haskell-libxml/")
   (synopsis "Bindings for the libXML2 SAX interface")
   (description "")
   (license license:expat)))

