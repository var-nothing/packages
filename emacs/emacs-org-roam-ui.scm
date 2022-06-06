(define-module (emacs emacs-org-roam-ui)
  #:use-module (gnu packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix diagnostics)
  #:use-module (guix i18n)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:))

(define-public emacs-org-roam-ui
  (package
    (name "emacs-org-roam-ui")
    (version "20220225.2151")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/org-roam/org-roam-ui.git")
               (commit "9474a254390b1e42488a1801fed5826b32a8030b")))
        (sha256
          (base32 "0v54vxh95izch74wz2dl2dkdqicbvshra55l6qvd4xl5qmfhpjdc"))))
    (build-system emacs-build-system)
    (propagated-inputs
      (list emacs-org-roam emacs-simple-httpd emacs-websocket))
    (arguments
      '(#:include
        (cons "^out" %default-include)))
    (home-page "https://github.com/org-roam/org-roam-ui")
    (synopsis "User Interface for Org-roam")
    (description
      "  Org-roam-ui provides a web interface for navigating around notes created
within Org-roam.")
    (license #f)))
