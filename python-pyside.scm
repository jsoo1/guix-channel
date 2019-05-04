(define-module (python-pyside)
  #:use-module ((gnu packages base) #:select (which))
  #:use-module ((gnu packages cmake) #:select (cmake))
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
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (libcxx-6
            python-apiextractor-2
            python-pyside-2
            python-pyside-2-tools
            python-apiextractor-2
            python-shiboken-2))

;; (define libcxx-6
;;   (package
;;     (inherit libcxx)
;;     (name "libcxx-6")
;;     (version (package-version llvm-6))
;;     (source
;;      (inherit (package-source libcxx))
;;      (sha256
;;       (base32
;;        "1wdrxg365ig0kngx52pd0n820sncp24blb0zpalc579iidhh4002")))))

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
       `(("clang-6" ,clang-6)
         ;; ("libcxx-6" ,libcxx-6)
         ("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("llvm-6" ,llvm-6)
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
         #:configure-flags
         '("-DBUILD_TESTS=off"
           "-DSANITIZE_ADDRESS=on")
         #:phases
         (modify-phases
             %standard-phases
           (add-after 'unpack 'go-to-source-dir
             (lambda _ (chdir "sources/pyside2") #t))
           (add-before 'configure 'set-clang-dir
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((clangdir (assoc-ref inputs "clang-6")))
                 (setenv "CLANG_INSTALL_DIR" clangdir)
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
       `(("clang-6" ,clang-6)
         ("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("llvm-6" ,llvm-6)
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
           (add-before 'configure 'set-clang-dir
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((clangdir (assoc-ref inputs "clang-6")))
                 (setenv "CLANG_INSTALL_DIR" clangdir)
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
       `(("python-shiboken-2" ,python-shiboken-2)
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
