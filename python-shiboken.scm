(define-module (python-shiboken)
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages python) #:select (python-2.7))
  #:use-module ((gnu packages python-xyz) #:select (python-wheel))
  #:use-module ((gnu packages qt) #:select (qt-4))
  #:use-module ((gnu packages xml) #:select (libxml2 libxslt))
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-shiboken))

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
        (commit "bbb7d417e75043dec53c84ceafec5c07cc282a81"))
    (package
      (name "python-generatorrunner")
      (version (git-version "0.6.16" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/pyside/Generatorrunner")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0ibhq8nrlhp73p3ba9afiacivh3dwvmdw8vahwmflwxkcxd1znhj"))))
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
        (commit "744d018dd857543f93f3961cf9e7f70adcc7ce65"))
    (package
      (name "python-apiextractor")
      (version (git-version "0.10.11" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference (url "https://github.com/pyside/Apiextractor")
                             (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "18z2n9rijhra1dbxymza2rzwg6z26mfp80hjqghf6i7p76df2jrk"))))
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
