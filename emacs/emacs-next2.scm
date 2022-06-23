(define-module (packages emacs-next2)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages image)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages pkg-config)

  #:use-module (flat packages emacs)
  #:use-module (rrr packages emacs)

  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1))

;; Taken from akagi/rrr
(define-public emacs-next2
  (let ((commit "630a33f0a9e976601e43152815aafe3f22350cfc")
        (revision "21")
        (version "29.0.50"))
    (package
      (inherit emacs-native-comp)
      (name "emacs-next2")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://git.savannah.gnu.org/git/emacs.git/")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "1087lp6004cd4ysqjp9005ndj505kha6bfpnxh72vai3mzhn5srx"))))
      (arguments
       (substitute-keyword-arguments (package-arguments emacs-native-comp)
         ((#:configure-flags flags #~'())
          #~(cons* "--with-pgtk"
                   "--without-libsystemd"
                   "--with-native-compilation"
                   #$flags))
         ((#:phases phases)
          #~(modify-phases #$phases
			   (delete 'strip)
              (replace 'restore-emacs-pdmp
                ;; restore the dump file that Emacs installs somewhere in
                ;; libexec/ to its original state
                (lambda _
                  (let* ((libexec (string-append #$output "/libexec"))
                         ;; each of these find-files should return one file
                         (pdmp (find-files libexec "^emacs.*\\.pdmp$"))
                         (pdmp-real (find-files libexec
                                                "^\\.emacs.*\\.pdmp-real$")))
                    (for-each (lambda (wrapper real)
                                (delete-file wrapper)
                                (rename-file real wrapper))
                              pdmp pdmp-real))))))))
      (inputs
       (modify-inputs (package-inputs emacs-native-comp)
         (prepend libwebp webkitgtk-with-libsoup2))))))
emacs-next2
