(define-module (python-bad python-py-cord)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-web)
  #:use-module (guix packages)
  #:use-module (guix transformations)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  )

(define-public python-py-cord
  (package
   (name "python-py-cord")
   (version "1.7.3")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/Pycord-Development/pycord/")
                  (commit "905b7d37105cd44983b89e46a81ffeac97cf1730")))
            (sha256
             (base32
              "1zpvhrx6yznchmj46mqg9zg0m199x6d1vlx3bi778i97pccvhavf"
              ))))
   (build-system python-build-system)
   (propagated-inputs (list python-aiohttp))
   (inputs (list python-pytest))
   (home-page "https://github.com/Pycord-Development/pycord")
   (synopsis "A Python wrapper for the Discord API")
   (description "This package provides a Python wrapper for the Discord API")
   (license license:expat))
  )
python-py-cord
