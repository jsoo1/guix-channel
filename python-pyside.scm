(define-module (python-pyside)
  #:use-module ((gnu packages base) #:select (which))
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages version-control) #:select (git))
  #:use-module ((gnu packages llvm) #:select (clang))
  #:use-module ((gnu packages python) #:select (python-wrapper python-2))
  #:use-module ((gnu packages python-xyz) #:select (python-wheel))
  #:use-module ((gnu packages qt)
                #:select (qt-4
                          qtbase
                          qtmultimedia
                          qttools
                          qtxmlpatterns))
  #:use-module ((gnu packages xml) #:select (libxml2 libxslt))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-pyside-2 python-apiextractor-2 python-shiboken-2))

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
      (build-system python-build-system)
      (inputs
       `(("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("python-wheel" ,python-wheel)))
      (native-inputs
       `(("clang" ,clang)
         ("cmake" ,cmake)
         ("git" ,git)
         ("qtbase" ,qtbase)
         ("qtmultimedia" ,qtmultimedia)
         ("qttools" ,qttools)
         ("qtxmlpatterns" ,qtxmlpatterns)
         ("which" ,which)))
      (arguments
       `(#:tests? #f
         #:use-setuptools? #f
         #:phases
         (modify-phases %standard-phases
           (add-before 'build 'fix-build-paths
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((clang (assoc-ref inputs "clang"))
                     (libxml2 (assoc-ref inputs "libxml2"))
                     (libxslt (assoc-ref inputs "libxslt")))
                 (substitute* "sources/shiboken2/CMakeLists.txt"
                   (("\\$\\{CLANG_DIR\\}")
                    (string-append (assoc-ref inputs "clang"))))
                 (substitute* "sources/pyside2/CMakeLists.txt"
                   (("include\\(FindQt5Extra\\)") ""))
                 (setenv "LIBXML2_LIBRARY"
                         (string-append libxml2 "/lib"))
                 (setenv "LIBXML2_INCLUDE_DIR"
                         (string-append libxml2 "/include"))
                 (setenv "LIBXSLT_LIBRARIES"
                         (string-append libxslt "/lib"))
                 (setenv "LIBXSLT_INCLUDE_DIR"
                         (string-append libxslt "/include"))
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
         license:bsd3 ; pyside-tools
         )))))

;; package="libshiboken2-dev"
;; for directory in "cmake/Shiboken2-$MAIN_VERSION_UPSTREAM" "pkgconfig"; do
;;         sed -i "s|build.*relwithdebinfo/lib|usr/lib/$DEB_HOST_MULTIARCH|" \
;; 	    debian/$package/usr/lib/$DEB_HOST_MULTIARCH/$directory/*;
;;         sed -i "s|build.*relwithdebinfo|usr|" \
;; 	    debian/$package/usr/lib/$DEB_HOST_MULTIARCH/$directory/*;
;; done

;; package="libpyside2-dev"
;; for directory in "pkgconfig" "cmake/PySide2-$MAIN_VERSION_UPSTREAM"; do
;;         sed -i "s|build.*relwithdebinfo/lib|usr/lib/$DEB_HOST_MULTIARCH|" \
;; 	    debian/$package/usr/lib/$DEB_HOST_MULTIARCH/$directory/*;
;;         sed -i "s|build.*relwithdebinfo|usr|" \
;; 	    debian/$package/usr/lib/$DEB_HOST_MULTIARCH/$directory/*;
;; done

;; # Set correctly the python path for pyside2 (Python2 for now)
;; sed -i "s|^pythonpath=.*|pythonpath=/usr/lib/python2.7/dist-packages|" \
;;     debian/libpyside2-dev/usr/lib/$DEB_HOST_MULTIARCH/pkgconfig/pyside2.pc

;; sed -i "s|^SET(PYSIDE_PYTHONPATH.*|SET(PYSIDE_PYTHONPATH \"/usr/lib/python2.7/dist-packages\")|" \
;;     debian/libpyside2-dev/usr/lib/$DEB_HOST_MULTIARCH/cmake/PySide2-$MAIN_VERSION_UPSTREAM/PySide2Config-python2.7.$DEB_HOST_MULTIARCH.cmake

;; # Set correctly the python path for pyside2 (Python3)
;; sed -i "s|^SET(PYSIDE_PYTHONPATH.*|SET(PYSIDE_PYTHONPATH \"/usr/lib/python3/dist-packages\")|" \
;;     debian/libpyside2-dev/usr/lib/$DEB_HOST_MULTIARCH/cmake/PySide2-$MAIN_VERSION_UPSTREAM/PySide2Config.cpython-3*m-$DEB_HOST_MULTIARCH.cmake

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
       `(("clang" ,clang)
         ("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("python-wrapper" ,python-wrapper)
         ("python-wheel" ,python-wheel)
         ("qtbase" ,qtbase)
         ("qtxmlpatterns" ,qtxmlpatterns)))
      (arguments
       `(#:tests? #f
         #:configure-flags '("-DBUILD_TESTS=off")
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'use-shiboken-dir-only
             (lambda* _ (chdir "sources/shiboken2") #t)))))
      (home-page "https://wiki.qt.io/Qt_for_Python")
      (synopsis
       "Shiboken generates bindings for C++ libraries using CPython source code")
      (description
       "Shiboken generates bindings for C++ libraries using CPython source code")
      ;; TODO understand
      (license
       '(license:gpl2+
         license:lgpl)))))

(define python-shiboken
  (let ((revision "1")
        (commit "09e1ffb01597b6fe4ed1ba1ae362449e3780d7ed"))
    (package
      (name "python-shiboken")
      (version (git-version "1.2.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/pyside/Shiboken")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0adsnbrsiiip4cvh67c69k3b24brm7xr0pmigsd3agydj1bd9lyx"))))
      (build-system cmake-build-system)
      (inputs
       `(("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("python-2.7" ,python-2.7)
         ("python-generatorrunner" ,python-generatorrunner)
         ("python-wheel" ,python-wheel)
         ("qt-4" ,qt-4)))
      (arguments
       `(#:tests? #f
         #:phases
         (modify-phases %standard-phases
           (add-before 'configure 'use-guix-generatorrunner
             (lambda* (#:key inputs #:allow-other-keys)
               (let ((generatorrunner (assoc-ref "python-generatorrunner" inputs)))
                 (substitute* "generator/CMakeLists.txt"
                   (("\\$\\{GENERATORRUNNER_PLUGIN_DIR\\}")
                    (string-append generatorrunner "lib/generatorrunner")))
                 #t))))))
      (home-page "http://www.pyside.org")
      (synopsis
       "Shiboken generates bindings for C++ libraries using CPython source code")
      (description
       "Shiboken generates bindings for C++ libraries using CPython source code")
      (license #f))))

(define python-generatorrunner
  (let ((revision "1")
        (commit "29bfdca3d2fd6f87fc15f5e24fdeb532281855b2"))
    (package
      (name "python-generatorrunner")
      (version (git-version "0.6.17" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://code.qt.io/cgit/pyside/generatorrunner.git")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1sv9xcbd8fxs2mq0g07m1xncx9c6wb8z9izcv05shir8wwdaj9gx"))))
      (build-system cmake-build-system)
      (inputs
       `(("python-apiextractor" ,python-apiextractor)
         ("qt-4" ,qt-4)))
      (home-page "http://www.pyside.org")
      (synopsis "Generate Qt and C++ bindings for Python")
      (description
       "GeneratorRunner is the application responsible for loading and executing the generator front-ends provided by the user as plug-ins.")
      (license license:gpl2+))))

(define python-apiextractor
  (let ((revision "1")
        (commit "25b23b4f039650c6e5d64592e6e7210719e52097"))
    (package
      (name "python-apiextractor")
      (version (git-version "0.10.11" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference ;; (url "https://github.com/pyside/Apiextractor")
               (url "https://code.qt.io/cgit/pyside/apiextractor.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1kgrzb3hv3xaj6li97kw4simj4jhli2kvzw61ahcwvrhc27flhwi"))))
      (build-system cmake-build-system)
      (inputs
       `(("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("qt-4" ,qt-4)))
      (home-page "http://www.pyside.org")
      (synopsis "")
      (description
       "API Extractor collects information about libraries from its header files and merges it with user written files (typesystem) describing how the library should be exposed as a binding on the target language.")
      (license license:gpl2+))))
