(define-module (open-mpi)
  #:use-module ((gnu packages perl) #:select (perl))
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:export (open-mpi))

(define open-mpi
  (let ((major "4")
        (minor "0")
        (patch "0"))
    (package
     (name "open-mpi")
     (version (string-append major "." minor "." patch))
     (source
      (origin
       (method url-fetch)
       (uri
        (string-append
         "https://download.open-mpi.org/release/open-mpi/v" major "." minor
         "/openmpi-" major "." minor "." patch ".tar.gz"))
       (sha256
        (base32 "03di44ymxs67xddf1qn61cya3ck617vzfsv81x9kf78v7ym0vw9n"))))
     (build-system gnu-build-system)
     (inputs `(("perl" ,perl)))
     (home-page "https://www.open-mpi.org")
     (synopsis "A High Performance Message Passing Library")
     (description
      "The Open MPI Project is an open source Message Passing Interface implementation that is developed and maintained by a consortium of academic, research, and industry partners. Open MPI is therefore able to combine the expertise, technologies, and resources from all across the High Performance Computing community in order to build the best MPI library available. Open MPI offers advantages for system and software vendors, application developers and computer science researchers.")
     ;; TODO understand this
     (license #f))))
