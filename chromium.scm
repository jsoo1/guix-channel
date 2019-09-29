(define-module (chromium)
  #:use-module ((gnu packages base) #:select (tar patch))
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils))

;; Copied from gnu/packages/chromium.scm.
;; Modified to enable one thing
(define my-ungoogled-chromium-source
  (let ((chromium-source (@@ (gnu packages chromium) %chromium-origin))
        (ungoogled-source (@@ (gnu packages chromium) %ungoogled-origin))
        (debian-source (@@ (gnu packages chromium) %debian-origin)))
    (origin
      (method (@@ (gnu packages chromium) computed-origin-method))
      (file-name (string-append "ungoogled-chromium-" (@@ (gnu packages chromium) %package-version) ".tar.xz"))
      (sha256 #f)
      (uri
       (delay
         (with-imported-modules '((guix build utils))
           #~(begin
               (use-modules (guix build utils)
                            (ice-9 rdelim)
                            (srfi srfi-1)
                            (srfi srfi-26))
               (let ((chromium-dir    (string-append "chromium-" #$(@@ (gnu packages chromium) %chromium-version)))
                     (preserved-files (list #$@(@@ (gnu packages chromium) %preserved-third-party-files))))

                 (set-path-environment-variable
                  "PATH" '("bin")
                  (list #+(canonical-package patch)
                        #+(canonical-package xz)
                        #+(canonical-package tar)
                        #+python-2
                        #+python))

                 (copy-recursively #+ungoogled-source "/tmp/ungoogled")

                 (with-directory-excursion "/tmp/ungoogled"

                   (format #t "Unpacking chromium tarball...~%")
                   (force-output)
                   (invoke "tar" "xf" #+chromium-source)

                   ;; My modification
                   (substitute* "flags.gn"
                     (("(enable_hangout_services_extension=)false" key)
                      (string-append key "true")))

                   ;; Ungoogled-Chromium contains a forked subset of the Debian
                   ;; patches.  Disable those, as we apply newer versions later.
                   (substitute* "patches/series"
                     ((".*/debian_buster/.*")
                      ""))

                   (format #t "Ungooglifying...~%")
                   (force-output)
                   (invoke "python3" "utils/prune_binaries.py" chromium-dir
                           "pruning.list")
                   (invoke "python3" "utils/patches.py" "apply"
                           chromium-dir "patches")
                   (invoke "python3" "utils/domain_substitution.py" "apply" "-r"
                           "domain_regex.list" "-f" "domain_substitution.list"
                           "-c" "/tmp/domainscache.tar.gz" chromium-dir)

                   (with-directory-excursion chromium-dir

                     (format #t "applying Debian patches...~%")
                     (force-output)
                     (let* ((debian  #+debian-source)
                            (patches (string-append debian "/debian/patches"))
                            (series  (string-append patches "/series")))
                       (with-input-from-file series
                         (lambda ()
                           (let loop ((line (read-line)))
                             (unless (eof-object? line)
                               (when (and (> (string-length line) 1)
                                          ;; Skip the Debian-specific ones.
                                          (not (string-prefix? "debianization/" line))
                                          (not (string-prefix? "buster/" line))
                                          ;; And those that conflict with Ungoogled.
                                          (not (any (cute string-suffix? <> line)
                                                    '("widevine-buildflag.patch"
                                                      "signin.patch"
                                                      "third-party-cookies.patch"

                                                      ;; XXX: 'fixes/inspector.patch'
                                                      ;; makes v8 reuse the top-level
                                                      ;; third_party/inspector_protocol
                                                      ;; instead of its own bundled copy,
                                                      ;; but that does not work here for
                                                      ;; some reason.  Ignore that patch
                                                      ;; and those that depend on it.
                                                      "wrong-namespace.patch"
                                                      "explicit-specialization.patch"
                                                      "inspector.patch"))))
                                 (invoke "patch" "--force" "-p1" "--input"
                                         (string-append patches "/" line)
                                         "--no-backup-if-mismatch"))
                               (loop (read-line)))))))

                     (format #t "Applying Guix-specific patches...~%")
                     (force-output)
                     (for-each (lambda (patch)
                                 (invoke "patch" "--force" "-p1" "--input"
                                         patch "--no-backup-if-mismatch"))
                               '#+(@@ (gnu packages chromium) %auxiliary-patches))

                     (format #t "Pruning third party files...~%")
                     (force-output)
                     (apply invoke "python"
                            "build/linux/unbundle/remove_bundled_libraries.py"
                            "--do-remove" preserved-files)

                     (format #t "Replacing GN files...~%")
                     (force-output)
                     (invoke "python3" "build/linux/unbundle/replace_gn_files.py"
                             "--system-libraries" "ffmpeg" "flac" "fontconfig"
                             "freetype" "harfbuzz-ng" "icu" "libdrm" "libevent"
                             "libjpeg" "libpng" "libvpx" "libwebp" "libxml"
                             "libxslt" "openh264" "opus" "re2" "snappy" "yasm"
                             "zlib"))

                   (format #t (string-append "Packing new ungoogled tarball ...~%"))
                   (force-output)
                   (invoke "tar" "cvfa" #$output
                           ;; Avoid non-determinism in the archive.
                           "--mtime=@0"
                           "--owner=root:0"
                           "--group=root:0"
                           "--sort=name"
                           chromium-dir)

                   #t)))))))))

(define-public my-ungoogled-chromium
  (package
    (inherit ungoogled-chromium)
    (name "my-ungoogled-chromium")
    (source my-ungoogled-chromium-source)))
