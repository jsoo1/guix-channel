(define-module (python-pyside)
  #:use-module ((gnu packages base) #:select (which))
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages llvm) #:select (clang))
  #:use-module ((gnu packages python) #:select (python-2.7))
  #:use-module ((gnu packages python-xyz) #:select (python-wheel))
  #:use-module ((gnu packages qt) #:select (qt qt-4))
  #:use-module ((gnu packages xml) #:select (libxml2 libxslt))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-pyside-2 python-shiboken-2))

(define python-pyside-2
  (let ((revision "1")
        (commit "9ef7df3e333177c7d71b5e7bb725f9f5ceb6cd9f"))
    (package
      (name "python-pyside-2")
      (version (git-version "v5.12.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://code.qt.io/pyside/pyside-setup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "15x8iib4xf3glp28fz73cgx4l2rsmrjkki93clflhfsw422lv8sr"))))
      (build-system python-build-system)
      (native-inputs
       `(("qt" ,qt)
         ("which" ,which)))
      (inputs
       `(("clang" ,clang)
         ("cmake" ,cmake)
         ("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("python-wheel" ,python-wheel)))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (delete 'build)
           ;; (replace 'build
           ;;   (lambda* (#:key outputs inputs #:allow-other-keys)
           ;;     (let ((out (assoc-ref outputs "out"))
           ;;           (qt (assoc-ref inputs "qt"))
           ;;           (cmake (assoc-ref inputs "cmake")))
           ;;       (invoke
           ;;        (which "python")
           ;;        "setup.py" "build"
           ;;        ;; (string-append "--prefix=" out)
           ;;        ;; "--single-version-externally-managed"
           ;;        ;; "--root=/"
           ;;        (string-append "--cmake=" (string-append cmake "/bin/cmake"))
           ;;        (string-append "--qmake=" (string-append qt "/bin/qmake"))
           ;;        "--build-tests"))))

           ;; TODO
           (delete 'check)
           ;; (replace 'check
           ;;   (lambda _
           ;;     (invoke
           ;;      (which "python")
           ;;      "testrunner.py" "test")))
           (replace 'install
             (lambda* (#:key outputs inputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out"))
                     (qt (assoc-ref inputs "qt")))
                 (invoke
                  (which "python")
                  "setup.py" "install"
                  (string-append "--prefix=" out)
                  "--single-version-externally-managed"
                  "--root=/"
                  (string-append "--qmake=" (string-append qt "/bin/qmake"))
                  "--build-tests")))))))
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

(define python-shiboken-2
  (let ((revision "1")
        (commit "9ef7df3e333177c7d71b5e7bb725f9f5ceb6cd9f"))
    (package
      (name "python-shiboken-2")
      (version (git-version "v5.12.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://code.qt.io/pyside/pyside-setup")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "15x8iib4xf3glp28fz73cgx4l2rsmrjkki93clflhfsw422lv8sr"))))
      (build-system cmake-build-system)
      (native-inputs
       `(("qt" ,qt)))
      (inputs
       `(("clang" ,clang)
         ("cmake" ,cmake)
         ("libxml2" ,libxml2)
         ("libxslt" ,libxslt)
         ("python-wheel" ,python-wheel)))
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (replace 'unpack
             (lambda* _ #f)))))
      (home-page "https://wiki.qt.io/Qt_for_Python")
      (synopsis
       "Shiboken generates bindings for C++ libraries using CPython source code")
      (description
              "Shiboken generates bindings for C++ libraries using CPython source code")
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
