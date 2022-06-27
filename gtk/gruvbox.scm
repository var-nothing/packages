(define-module (gtk gruvbox)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages attr)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml))

(define-public gruvbox-material-gtk-theme
  (package
   (name "gruvbox-material-gtk-theme")
   (version "0.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/TheGreatMcPain/gruvbox-material-gtk")
           (commit "cc255d43322ad646bb35924accb0778d5e959626")))
     (sha256
      (base32
       "1dqxrw2pzxwqnslwhzaznbzijpf5chk3js0r2j8mlylrv2kzivfl"))
     (file-name (git-file-name name version))))
   (build-system copy-build-system)
   (arguments
    `(#:install-plan
      `(("." "share/"
         #:exclude ("README.md" ".git" "LICENSE" "demo.png")))))
   (home-page "https://github.com/TheGreatMcPain/gruvbox-material-gtk")
   (synopsis "Gruvbox Material for GTK, Gnome, Cinnamon, XFCE, Unity, Plank and Icons.")
   (description "This theme is a port of sainnhe/gruvbox-material, currently supports GTK, Gnome, Cinnamon, XFCE, Unity, Plank and Icons.")
   (license license:expat)))

gruvbox-material-gtk-theme
