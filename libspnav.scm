(define-module (libspnav)
  #:use-module ((gnu packages xorg) #:select (libx11))
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (libspnav))

(define libspnav
  (let ((commit "20961617eecc845b23fcf9e06acd1a6bb340b88b")
        (revision "1"))
    (package
     (name "libspnav")
     (version (git-version "" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FreeSpacenav/libspnav")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1ib5jxcpz76lr90f69vb50yn2q9ss45axlgil29layh36dnyifac"))))
     (build-system gnu-build-system)
     (inputs
      `(("libx11" ,libx11)))
     (arguments `(#:tests? #f))
     (home-page "http://spacenav.sourceforge.net/")
     (synopsis
      "Library for communicating with spacenavd or 3dxsrv to get input from 6-dof devices.")
     (description
      "The libspnav library is provided as a replacement of the magellan library. It provides a cleaner, and more orthogonal interface. libspnav supports both the original X11 protocol for communicating with the driver, and the new alternative non-X protocol. Programs that choose to use the X11 protocol, are automatically compatible with either the free spacenavd driver or the official 3dxserv, as if they were using the magellan SDK.

Also, libspnav provides a magellan API wrapper on top of the new API. So, any applications that were using the magellan library, can switch to libspnav without any changes. And programmers that are familliar with the magellan API can continue using it with a free library without the restrictions of the official SDK.")
     (license license:bsd-3))))
