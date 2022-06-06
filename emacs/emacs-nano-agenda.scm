(define-module (emacs emacs-nano-agenda)
  #:use-module (gnu packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)

  #:use-module (srfi srfi-1)

  #:use-module (guix diagnostics)
  #:use-module (guix i18n)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:))

(define-public emacs-nano-agenda
  (package
   (name "emacs-nano-agenda")
   (version "6e810a")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rougier/nano-agenda")
           (commit "6e810ab416062328c8b52a557f00eb64739b8ef7")))
     (sha256
      (base32
       "0x5ikg1wz6x5xy8gr9vsh3nkizjficdcppsbdffafxmzrn7crpsk"))))
   (build-system emacs-build-system)
   (propagated-inputs (list ))
   (home-page "https://github.com/rougier/nano-agenda")
   (synopsis "Autogenerated package")
   (description "Autogenerated package")
   (license #f)
   ))
emacs-nano-agenda
