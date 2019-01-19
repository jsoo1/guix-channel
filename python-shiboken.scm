(define-module (python-shiboken)
  #:use-module ((gnu packages cmake) #:select (cmake))
  #:use-module ((gnu packages python) #:select (python-2))
  #:use-module ((gnu packages python-xyz) #:select (python-wheel))
  #:use-module ((gnu packages qt) #:select (qt-4))
  #:use-module ((gnu packages xml) #:select (libxml2 libxslt))
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (python-shiboken))

(define python-shiboken
  (package
   (name "python-shiboken")
   (version "1.2.2")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "Shiboken" version))
     (sha256
      (base32
       "0bwpak85gr1g345fv5n23jqq4ii3bv5x00225vj5das4c8yf1bhb"))))
   (build-system python-build-system)
   (inputs `(("cmake" ,cmake)
             ("libxml2" ,libxml2)
             ("libxslt" ,libxslt)
             ("python-2" ,python-2)
             ("python-wheel" ,python-wheel)
             ("qt-4" ,qt-4)))
   (arguments
    `(#:tests? #f
      #:phases
      (modify-phases
       %standard-phases
       (add-before 'build 'add-xml-and-xslt-search-paths
                   (lambda* (#:key inputs #:allow-other-keys)
                     (let ((xml2 (assoc-ref inputs "libxml2"))
                           (xslt (assoc-ref inputs "libxslt")))
                       (setenv "LIBXML2_LIBRARY" (string-append xml2 "/include"))
                       (setenv "LIBXML2_INCLUDE_DIR" (string-append xml2 "/lib"))
                       (setenv "LIBXSLT_LIBRARIES" (string-append xslt "/lib"))
                       (setenv "LIBXSLT_INCLUDE_DIR" (string-append xslt "/include")))))
       (add-after 'build 'python-2-build
                  (lambda* (#:key inputs outputs #:allow-other-keys)
                    (let ((qt (assoc-ref inputs "qt-4"))
                          (py2 (assoc-ref inputs "python-2"))
                          (out (assoc-ref outputs "out")))
                      (invoke (string-append py2 "/bin/python2.7")
                              "setup.py"
                              "build"
                              (string-append "--qmake=" qt "/bin/qmake")
                              "--build-tests"))))
       (delete 'build)
       (add-after 'install 'python-2-install
                  (lambda* (#:key inputs outputs #:allow-other-keys)
                    (let* ((py2 (assoc-ref inputs "python-2"))
                           (out (assoc-ref outputs "out")))
                      (invoke (string-append py2 "/bin/python2.7")
                              "setup.py"
                              "install"
                              (string-append "--prefix=" out)))))
       (delete 'install)
       (add-after 'install 'postinstall
                  (lambda* (#:key inputs outputs #:allow-other-keys)
                    (let ((py2 (assoc-ref inputs "python-2")))
                      (invoke (string-append py2 "/bin/python2.7")
                              "shiboken_postinstall.py"
                              "-install")))))))
   (home-page "http://www.pyside.org")
   (synopsis
    "Shiboken generates bindings for C++ libraries using CPython source code")
   (description
    "Shiboken generates bindings for C++ libraries using CPython source code")
   (license #f)))

