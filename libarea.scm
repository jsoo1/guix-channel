(define-module (libarea)
  #:use-module ((gnu packages boost) #:select (boost))
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages python) #:select (python-wrapper))
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (libarea))

(define libarea
  (let ((revision "1")
        (commit "8f8bac811c10f1f01fda0d742a18591f61dd76ee"))
    (package
     (name "libarea")
     (version (git-version "0" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference (url "https://github.com/Heeks/libarea.git")
                           (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pvqz6cabxqdz5y26wnj6alkn8v5d7gkx0d3h8xmg4lvy9r3kh3g"))))
     (build-system gnu-build-system)
     (inputs `(("boost" ,boost)
               ("cmake" ,cmake)
               ("python-wrapper" ,python-wrapper)))
     (arguments
      `(#:tests? #f
        #:phases
        (modify-phases
         %standard-phases
         (add-after 'configure 'cmake-configure
          (lambda* (#:key inputs outputs #:allow-other-keys)
            (let ((out (assoc-ref outputs "out"))
                  (cmake (assoc-ref inputs "cmake")))
              (mkdir-p "build")
              (invoke "cmake"
                      (string-append "-DCMAKE_INSTALL_PREFIX=" out)))))
         (delete 'configure))))
     (home-page "https://github.com/Heeks/libarea")
     (synopsis
      "Library and python module for pocketing and profiling operations")
     (description
      "Area is a CAM-related software for pocketing operation.

This project provides library and associated python-module to compute pocket operations.")
     (license license:bsd-3))))
