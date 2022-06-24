(define-module (wm dwl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix transformations)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system asdf)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system haskell)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages calendar)
  #:use-module (gnu packages check)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lisp-check)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages logging)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages man)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpd)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

(define-public wayland-protocols-next
  (package
   (inherit wayland-protocols)
   (name "wayland-protocols-next")
   (version "1.24")
   (source (origin
            (method url-fetch)
            (uri (string-append
                  "https://wayland.freedesktop.org/releases/"
                  "wayland-protocols-" version ".tar.xz"))
            (sha256
             (base32
              "1hlb6gvyqlmsdkv5179ccj07p04cn6xacjkgklakbszczv7xiw5z"))))))

(define-public libdrm-next
  (package
   (inherit libdrm)
   (name "libdrm-next")
   (version "2.4.109")
   (source (origin
            (method url-fetch)
            (uri (string-append
                  "https://dri.freedesktop.org/libdrm/libdrm-"
                  version ".tar.xz"))
            (sha256
             (base32
              "09kzrdsd14zr0i3izvi5mck4vqccl3c9hr84r9i4is0zikh554v2"))))
   ))

(define-public wlroots-next
  (package
   (inherit wlroots)
   (name "wlroots-next")
   (version "0.15.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.freedesktop.org/wlroots/wlroots/")
           (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32 "00s73nhi3sc48l426jdlqwpclg41kx1hv0yk4yxhbzw19gqpfm1h"))))
   (propagated-inputs (list wayland-protocols-next
                            eudev
                            libinput
                            libxkbcommon
                            mesa
                            pixman
                            libseat
                            wayland
                            xcb-util-errors
                            xcb-util-wm
                            xorg-server-xwayland
                            libdrm-next)
                      )))

(define-public my-dwl
  (package
   (inherit dwl)
   (name "my-dwl")
   (version "0.3.1")
   (source
    (origin
     (inherit (package-source dwl))
     (uri (git-reference
           (url "https://github.com/var-nothing/mydwl")
           (commit (string-append "v" version))))
     (sha256
      (base32
       "0952kajc60ijy6qz14y6s5n7dyyf14ndzrhs4ynxj97k76742z2l"))
     ))
   (inputs
    (list wlroots-next wayland-protocols-next))
   ))
my-dwl
