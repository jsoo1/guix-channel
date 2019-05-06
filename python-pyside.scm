(define-module (python-pyside)
  #:use-module ((gnu packages base) #:select (which))
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages commencement) #:select (gcc-toolchain))
  #:use-module ((gnu packages version-control) #:select (git))
  #:use-module ((gnu packages llvm) #:select (clang-6 libcxx llvm-6))
  #:use-module ((gnu packages python) #:select (python-wrapper python-2))
  #:use-module ((gnu packages python-xyz) #:select (python-wheel))
  #:use-module ((gnu packages qt)
                #:select (qt
                          qtbase
                          qtdatavis3d
                          qtmultimedia
                          qtquickcontrols
                          qtscript
                          qtscxml
                          qtsensors
                          qtspeech
                          qtsvg
                          qttools
                          qtwebchannel
                          qtwebkit
                          qtwebsockets
                          qtx11extras
                          qtxmlpatterns))
  #:use-module ((gnu packages xml) #:select (libxml2 libxslt))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (libcxx-6
            python-pyside-2
            python-pyside-2-tools
            python-shiboken-2))

(define python-pyside-2
  (let ((revision "1")
        (commit "4018787a3cc01d632fdca7891ac8aa9487110c26"))
    (package
      (name "python-pyside-2")
      (version (git-version "v5.11.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://code.qt.io/pyside/pyside-setup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0g8jacm2iqd7lw2m7f1dp1nnrsk38bl3m8pihm8zz9gxs8d31sf5"))))
      (build-system cmake-build-system)
      (inputs
       `(("python-pyside-2-libcxx-headers" ,python-pyside-2-libcxx-headers)
         ("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("llvm-toolchain-6" ,llvm-toolchain-6)
         ("qtbase" ,qtbase)
         ("qtdatavis3d" ,qtdatavis3d)
         ("qtmultimedia" ,qtmultimedia)
         ("qtquickcontrols" ,qtquickcontrols) ;; ??
         ("qtscript" ,qtscript)
         ("qtscxml" ,qtscxml)
         ("qtsensors" ,qtsensors)
         ("qtspeech" ,qtspeech)
         ("qtsvg" ,qtsvg)
         ("qttools" ,qttools)
         ("qtwebchannel" ,qtwebchannel)
         ("qtwebsockets" ,qtwebsockets)
         ("qtx11extras" ,qtx11extras)))
      (native-inputs
       `(("cmake" ,cmake)
         ("git" ,git)
         ("python-shiboken-2" ,python-shiboken-2)
         ("python-wrapper" ,python-wrapper)
         ("which" ,which)))
      (arguments
       `(#:tests? #f
         #:configure-flags '("-DBUILD_TESTS=off")
         #:phases
         (modify-phases
             %standard-phases
           (add-after 'unpack 'go-to-source-dir
             (lambda _ (chdir "sources/pyside2") #t))
           (add-before 'configure 'set-clang-dir
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((clang-dir (assoc-ref inputs "llvm-toolchain-6"))
                     (libcxx-dir (assoc-ref inputs "python-pyside-2-libcxx-headers")))
                 (setenv "CLANG_INSTALL_DIR" clang-dir)
                 (substitute* "cmake/Macros/PySideModules.cmake"
                   (("--include-paths=")
                    (string-append "--include-paths=" libcxx-dir "/include/c++/v1:")))
                 #t))))))
      (home-page "https://wiki.qt.io/Qt_for_Python")
      (synopsis
       "The Qt for Python product enables the use of Qt5 APIs in Python applications.")
      (description
       "The Qt for Python product enables the use of Qt5 APIs in Python applications. It lets Python developers utilize the full potential of Qt, using the PySide2 module. The PySide2 module provides access to the individual Qt modules such as QtCore, QtGui, and so on. Qt for Python also comes with the Shiboken2 CPython binding code generator, which can be used to generate Python bindings for your C or C++ code.")
      ;; TODO understand
      (license
       '(license:fdl1.3+
         license:gpl2+
         license:gpl3+
         ;; TODO understand
         ;; https://code.qt.io/cgit/pyside/pyside-setup.git/tree/LICENSE.GPLv3-EXCEPT
         ;; https://code.qt.io/cgit/pyside/pyside-setup.git/tree/LICENSE.COMMERCIAL
         license:lgpl3
         )))))

(define python-shiboken-2
  (let ((revision "1")
        (commit "4018787a3cc01d632fdca7891ac8aa9487110c26"))
    (package
      (name "python-shiboken-2")
      (version (git-version "v5.11.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://code.qt.io/pyside/pyside-setup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0g8jacm2iqd7lw2m7f1dp1nnrsk38bl3m8pihm8zz9gxs8d31sf5"))))
      (build-system cmake-build-system)
      (inputs
       `(("llvm-toolchain-6" ,llvm-toolchain-6)
         ("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("python-wrapper" ,python-wrapper)
         ("qtbase" ,qtbase)
         ("qtxmlpatterns" ,qtxmlpatterns)))
      (arguments
       `(#:tests? #f
         #:configure-flags '("-DBUILD_TESTS=off")
         #:phases
         (modify-phases
             %standard-phases
           (add-after 'unpack 'use-shiboken-dir-only
             (lambda _ (chdir "sources/shiboken2") #t))
           (add-before 'configure 'set-build-env
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((llvm-toolchain-dir (assoc-ref inputs "llvm-toolchain-6")))
                 (setenv "CLANG_INSTALL_DIR" llvm-toolchain-dir)
                 #t))))))
      (home-page "https://wiki.qt.io/Qt_for_Python")
      (synopsis
       "Shiboken generates bindings for C++ libraries using CPython source code")
      (description
       "Shiboken generates bindings for C++ libraries using CPython source code")
      ;; TODO understand
      (license
       '(license:gpl2+
         license:lgpl)))))

(define python-pyside-2-tools
  (let ((revision "1")
        (commit "f1b775537e7fbd718516749583b2abf1cb6adbce"))
    (package
      (name "python-pyside-2-tools")
      (version (git-version "v5.11.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://code.qt.io/pyside/pyside-tools")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1w2g5afvww9r89wmdm9jx8sz67x4bzy9difkh72n4c73ya1n91ry"))))
      (build-system cmake-build-system)
      (inputs
       `(("python-pyside-2" ,python-pyside-2)
         ("python-shiboken-2" ,python-shiboken-2)
         ("qtbase" ,qtbase)))
      (arguments
       `(#:tests? #f
         #:configure-flags '("-DBUILD_TESTS=off")))
      (home-page "https://wiki.qt.io/Qt_for_Python")
      (synopsis
       "lupdate, rcc and uic tools for PySide2")
      (description
       "TODO")
      ;; TODO: understand (this is per the arch repo)
      (license license:lgpl2.1+))))

;; PySide2 docs recommend using a bundled version of libclang
;; See https://wiki.qt.io/Qt_for_Python/GettingStarted
;; The source they recommend: https://download.qt.io/development_releases/prebuilt/libclang/
(define llvm-toolchain-6
  (package
    (inherit llvm-6)
    (name "llvm-toolchain")
    (build-system trivial-build-system)
    (inputs
     `(("clang-6" ,clang-6)
       ("llvm-6" ,llvm-6)))
    (arguments
     `(#:modules ((guix build union)
                  (guix build utils))
       #:builder
       (begin
         (use-modules (guix build union)
                      (ice-9 match)
                      (srfi srfi-1))
         (union-build
          (assoc-ref %outputs "out")
          (filter-map
           (match-lambda
             ((name . dir)
              (if (or (string=? name "clang-6")
                      (string=? name "llvm-6"))
                  dir
                  #f)))
           %build-inputs))
         #t)))
    (license license:ncsa)))

;; See https://bugreports.qt.io/browse/PYSIDE-787
;; STL headers are not parsed correctly, so only send in some headers
(define python-pyside-2-libcxx-headers
  (package
    (inherit libcxx)
    (name "python-pyside-2-libcxx-headers")
    (version (package-version llvm-6))
    (source
     (origin
       (inherit (package-source libcxx))
       (uri (string-append "http://llvm.org/releases/"
                           version "/libcxx-" version ".src.tar.xz"))
       (sha256
        (base32
         "0rzw4qvxp6qx4l4h9amrq02gp7hbg8lw4m0sy3k60f50234gnm3n"))))
    (native-inputs
     `(("clang" ,clang-6)
       ("llvm" ,llvm-6)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'use-only-required-headers
           (lambda* (#:key outputs #:allow-other-keys)
             (use-modules ((srfi srfi-1)))
             (let ((out (assoc-ref outputs "out"))
                   (required-headers
                    '("type_traits"
                      "__config"
                      "cstddef"
                      "__nullptr"
                      "utility"
                      "__tuple"
                      "initializer_list"
                      "cstring"
                      "cstdint"
                      "__debug")))
               (for-each
                delete-file
                (filter
                 (lambda (file)
                   (not
                    (fold
                     (lambda (acc header)
                       (or acc (string-contains file header)))
                     #f
                     required-headers)))
                 (find-files (string-append out "/include/c++/v1"))))
               (delete-file-recursively (string-append out "/include/c++/v1/ext"))
               (delete-file-recursively (string-append out "/include/c++/v1/support"))
               (delete-file-recursively (string-append out "/lib")))
             #t)))))
    (synopsis
     "Libcxx files specifically used by PySide2.")
    (description
     "Libcxx files specifically used by PySide2.")))

(define-public libcxx-6
  (package
    (inherit libcxx)
    (version (package-version llvm-6))
    (source
     (origin
       (inherit (package-source libcxx))
       (uri (string-append "http://llvm.org/releases/"
                           version "/libcxx-" version ".src.tar.xz"))
       (sha256
        (base32
         "0rzw4qvxp6qx4l4h9amrq02gp7hbg8lw4m0sy3k60f50234gnm3n"))))
    (native-inputs
     `(("clang" ,clang-6)
       ("llvm" ,llvm-6)))))
