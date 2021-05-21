;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014, 2015, 2016 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2014, 2015, 2016 David Thompson <davet@gnu.org>
;;; Copyright © 2014, 2015, 2016, 2018, 2020 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2015 Taylan Ulrich Bayırlı/Kammer <taylanbayirli@gmail.com>
;;; Copyright © 2015, 2016, 2017, 2018, 2019, 2020, 2021 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2015 Andy Patterson <ajpatter@uwaterloo.ca>
;;; Copyright © 2015, 2018, 2019, 2020 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2015, 2016, 2017, 2018, 2019 Alex Vong <alexvong1995@gmail.com>
;;; Copyright © 2016, 2017 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2016 Kei Kebreau <kkebreau@posteo.net>
;;; Copyright © 2016 Dmitry Nikolaev <cameltheman@gmail.com>
;;; Copyright © 2016 Andy Patterson <ajpatter@uwaterloo.ca>
;;; Copyright © 2016, 2017 Nikita <nikita@n0.is>
;;; Copyright © 2016, 2018, 2019, 2020 Eric Bavier <bavier@posteo.net>
;;; Copyright © 2016 Jan Nieuwenhuizen <janneke@gnu.org>
;;; Copyright © 2017 Feng Shu <tumashu@163.com>
;;; Copyright © 2017–2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 Chris Marusich <cmmarusich@gmail.com>
;;; Copyright © 2017 Thomas Danckaert <post@thomasdanckaert.be>
;;; Copyright © 2017 Ethan R. Jones <doubleplusgood23@gmail.com>
;;; Copyright © 2017, 2018 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2017 Gregor Giesen <giesen@zaehlwerk.net>
;;; Copyright © 2017, 2018, 2019 Rutger Helling <rhelling@mykolab.com>
;;; Copyright © 2018 Roel Janssen <roel@gnu.org>
;;; Copyright © 2018, 2019, 2020 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2018, 2019, 2020 Pierre Neidhardt <mail@ambrevar.xyz>
;;; Copyright © 2018, 2019, 2020 Leo Famulari <leo@famulari.name>
;;; Copyright © 2018 Brendan Tildesley <mail@brendan.scot>
;;; Copyright © 2018 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
;;; Copyright © 2018 Mark Meyer <mark@ofosos.org>
;;; Copyright © 2018 Gábor Boskovit <boskovits@gmail.com>
;;; Copyright © 2019 Mathieu Othacehe <m.othacehe@gmail.com>
;;; Copyright © 2019 Timo Eisenmann <eisenmann@fn.de>
;;; Copyright © 2019 Arne Babenhauserheide <arne_bab@web.de>
;;; Copyright © 2019 Riku Viitanen <riku.viitanen@protonmail.com>
;;; Copyright © 2020, 2021 Oleg Pykhalov <go.wigust@gmail.com>
;;; Copyright © 2020 Josh Holland <josh@inv.alid.pw>
;;; Copyright © 2020 Brice Waegeneire <brice@waegenei.re>
;;; Copyright © 2020 Vincent Legoll <vincent.legoll@gmail.com>
;;; Copyright © 2020 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2020 Alex McGrath <amk@amk.ie>
;;; Copyright © 2020, 2021 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020 Vinicius Monego <monego@posteo.net>
;;; Copyright © 2020 Brett Gilio <brettg@gnu.org>
;;; Copyright © 2020 Alexandru-Sergiu Marton <brown121407@posteo.ro>
;;; Copyright © 2020 Ivan Kozlov <kanichos@yandex.ru>
;;; Copyright © 2020 Antoine Côté <antoine.cote@posteo.net>
;;; Copyright © 2021 Alexey Abramov <levenson@mmer.org>
;;; Copyright © 2021 Andrew Tropin <andrew@trop.in>
;;; Copyright © 2021 David Wilson <david@daviwil.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (gnu packages video)
  #:use-module (ice-9 match)
  #:use-module ((srfi srfi-1) #:hide (zip))
  #:use-module (srfi srfi-26)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system waf)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages dejagnu)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages file)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages iso-codes)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages man)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ocr)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages perl-web)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages re2c)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages samba)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages time)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

(define-public transcode
  (package
    (name "transcode")
    (version "1.1.7")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://sources.archlinux.org/other/community/"
                       name "/" name "-" version ".tar.bz2"))
       (sha256
        (base32 "14ha9xjsjrj131f35jd56z5v1jb4rbsrj1nril5shqnxw3c74khy"))
       (patches
        (search-patches "transcode-ffmpeg.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list
        "--enable-libv4l2"
        "--enable-libmpeg2"
        "--enable-libmpeg2convert"
        "--enable-v4l"
        ;;; XXX: Not available.
        ;"--enable-bktr"
        ;"--enable-sunau"
        "--enable-oss"
        "--enable-alsa"
        ;;; XXX: Not available.
        ;"--enable-libpostproc"
        "--enable-freetype2"
        "--enable-xvid"
        "--enable-x264"
        "--enable-ogg"
        "--enable-vorbis"
        "--enable-theora"
        ;;; XXX: Not available.
        ;"--enable-pvm3"
        "--enable-libdv"
        "--enable-libquicktime"
        "--enable-lzo"
        "--enable-a52"
        "--enable-faac"
        "--enable-libxml2"
        ;;; XXX: Not available.
        ;"--enable-ibp"
        ;;"--enable-mjpegtools"
        "--enable-sdl"
        "--enable-imagemagick"
        ;;; XXX: Not available.
        ;"--enable-libjpegmmx"
        "--enable-libjpeg")))
        ;;; XXX: Not available.
        ;"--enable-bsdav"
        ;"--enable-pv3"
        ;"--enable-nuv"
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("iconv" ,libiconv)
       ("libtool" ,libtool)
       ("libxml2" ,libxml2)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("faac" ,faac)
       ("ffmpeg" ,ffmpeg)
       ("freetype" ,freetype)
       ("imagemagick" ,imagemagick)
       ("lame" ,lame)
       ("liba52" ,liba52)
       ("libdv" ,libdv)
       ("libdvdread" ,libdvdread)
       ("libjpeg" ,libjpeg-turbo)
       ("libmpeg2" ,libmpeg2)
       ("libogg" ,libogg)
       ("libquicktime" ,libquicktime)
       ("libtheora" ,libtheora)
       ("libvorbis" ,libvorbis)
       ("lzo" ,lzo)
       ("mjepgtools" ,mjpegtools)
       ("sdl" ,sdl)
       ("v4l-utils" ,v4l-utils)
       ("x11" ,libx11)
       ("x264" ,libx264)
       ("xaw" ,libxaw)
       ("xext" ,libxext)
       ("xpm" ,libxpm)
       ("xv" ,libxv)
       ("xvid" ,xvid)
       ("zlib" ,zlib)))
    (synopsis "Audio/Video Transcoder")
    (description "Transcode is a fast, versatile and command-line based
audio/video everything to everything converter primarily focussed on producing
AVI video files with MP3 audio, but also including a program to read all the
video and audio streams from a DVD.")
    (home-page
     "http://linuxfromscratch.org/blfs/view/svn/multimedia/transcode.html")
    (license license:gpl2+)))

(define-public svt-hevc
  (package
    (name "svt-hevc")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/OpenVisualCloud/SVT-HEVC")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "038r3x3axil895vh2dq6223623ybrc45vn58vfmfb7cikz68sy23"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f)) ; Test script is stand-alone
    (native-inputs
     `(("yasm" ,yasm)))
    (synopsis "SVT HEVC encoder")
    (description "Scalable Video Technology (SVT) is a software-based video
coding technology that is highly optimized for Intel's Xeon processors.  Using
the SVT-HEVC encoder, it is possible to spread video encoding processing across
multiple Intel's Xeon processors to achieve a real advantage of processing
efficiency.")
    (home-page "https://01.org/svt")
    (license (license:non-copyleft "file:///LICENSE.md"))))

(define-public mediasdk
  (package
    (name "mediasdk")
    (version "20.1.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/Intel-Media-SDK/MediaSDK")
         (commit (string-append "intel-" name "-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0blwcxr5j8762nylx2cxrq0h53bpgnk859dbs6crq4wr9fcxlx9z"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       (list
        "-DENABLE_X11=ON"
        "-DENABLE_X11_DRI3=ON"
        "-DENABLE_WAYLAND=ON"
        "-DENABLE_TEXTLOG=ON"
        "-DENABLE_STAT=ON"
        "-DBUILD_TESTS=ON"
        "-DBUILD_TOOLS=ON"
        (string-append "-DCMAKE_EXE_LINKER_FLAGS=-Wl,-rpath="
                       (assoc-ref %outputs "out") "/lib"))))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)))
    (inputs
     `(("libdrm" ,libdrm)
       ("libva" ,libva)
       ("pciaccess" ,libpciaccess)
       ("wayland" ,wayland)
       ("x11" ,libx11)))
    (synopsis "Intel Media SDK")
    (description "MediaSDK provides a plain C API to access hardware-accelerated
video decode, encode and filtering on Intel's Gen graphics hardware platforms.")
    (home-page "http://mediasdk.intel.com/")
    (license (license:non-copyleft "file:///LICENSE"))))

(define-public schroedinger
  (package
    (name "schroedinger")
    (version "1.0.11")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://launchpad.net/" name "/trunk/" version
                       "/+download/" name "-" version ".tar.gz"))
       (sha256
        (base32 "04prr667l4sn4zx256v1z36a0nnkxfdqyln48rbwlamr6l3jlmqy"))))
    (build-system gnu-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'move-docs
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (doc (assoc-ref outputs "doc")))
               (mkdir-p (string-append doc "/share"))
               (rename-file
                (string-append out "/share/gtk-doc")
                (string-append doc "/share/gtk-doc"))
               #t))))))
    (native-inputs
     `(("dash" ,dash)
       ("gtk-doc" ,gtk-doc/stable)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("glew" ,glew)
       ("opengl" ,mesa)))
    (propagated-inputs
     `(("orc" ,orc)))
    (synopsis "Dirac video codec")
    (description "Schroedinger is a project implementing the Dirac video codec in
ANSI C code.  It is meant to be highly optimized and portable.  It is developed
as a joint effort between the BBC and Fluendo.")
    (home-page "https://launchpad.net/schroedinger")
    (license
     ;; This library is licensed under 4 different licenses,
     ;; and you can choose to use it under the terms of any one of them.
     (list
      license:gpl2+
      license:lgpl2.0+
      license:expat
      license:mpl1.1))))

(define-public libquicktime
  (package
    (name "libquicktime")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://sourceforge.net/projects/" name "/files/"
                       name "/" version "/" name "-" version ".tar.gz"))
       (sha256
        (base32 "0s3kshzl3zfjw3phzv73r91fkr9z8q8kc3dhsys4f4xk6ff3alqw"))
       (patches
        (search-patches "libquicktime-ffmpeg.patch"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("doxygen" ,doxygen)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("alsa" ,alsa-lib)
       ("ffmpeg" ,ffmpeg)
       ("gtk+-2" ,gtk+-2)
       ("lame" ,lame)
       ("libdv" ,libdv)
       ("libjpeg" ,libjpeg-turbo)
       ("libpng" ,libpng)
       ("libvorbis" ,libvorbis)
       ("opengl" ,mesa)
       ("schroedinger" ,schroedinger)
       ("x11" ,libx11)
       ("x264" ,libx264)
       ("xaw" ,libxaw)
       ("xv" ,libxv)))
    (synopsis "Quick Time Library")
    (description "The goal of this project is to enhance the quicktime4linux
library.")
    (home-page "http://libquicktime.sourceforge.net/")
    (license license:lgpl2.1+)))

(define-public mjpegtools
  (package
    (name "mjpegtools")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://sourceforge.net/projects/" name "/files/"
                       name "/" version "/" name "-" version ".tar.gz"))
       (sha256
        (base32 "0kvhxr5hkabj9v7ah2rzkbirndfqdijd9hp8v52c1z6bxddf019w"))))
    (build-system gnu-build-system)
    (inputs
     `(("gtk+-2" ,gtk+-2)
       ("libdv" ,libdv)
       ("libpng" ,libpng)
       ("libquicktime" ,libquicktime)
       ("sdl" ,sdl)))
    (synopsis "Tools for handling MPEG")
    (description "Mjpeg tools is a suite of programs which support video capture,
editing, playback, and compression to MPEG of MJPEG video.  Edit, play and
compression software is hardware independent.")
    (home-page "http://mjpeg.sourceforge.net/")
    (license license:gpl2+)))

(define-public libmms
  (package
    (name "libmms")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://sourceforge.net/projects/" name "/files/"
                       name "/" version "/" name "-" version ".tar.gz"))
       (sha256
        (base32 "0kvhxr5hkabj9v7ah2rzkbirndfqdijd9hp8v52c1z6bxddf019w"))))
    (build-system gnu-build-system)
    (synopsis "MMS stream protocol library")
    (description "Libmms is a library for streaming media files using the mmst
and mmsh protocols.")
    (home-page "https://sourceforge.net/projects/libmms/")
    (license license:lgpl2.1+)))

(define-public libvideogfx
  (package
    (name "libvideogfx")
    (version "1.0.9")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/farindk/libvideogfx")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "154b0j8cfg879pg08xcbwvbz8z9nrfnyj31i48vxir1psas70ynq"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-build-errors
           (lambda _
             (substitute* "libvideogfx/graphics/fileio/ffmpeg.cc"
               (("av_close_input_file\\(")
                "avformat_close_input(&"))
             (substitute* "libvideogfx/graphics/fileio/png.cc"
               (("is != NULL") "is.good()"))
             #t)))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("ffmpeg" ,ffmpeg-2.8)
       ("jpeg" ,libjpeg-turbo)
       ("png" ,libpng)
       ("x11" ,libx11)
       ("xext" ,libxext)))
    (synopsis "Video processing library")
    (description "LibVideoGfx is a C++ library for low-level video processing.
It aims at speeding up the development process for image and video processing
applications by providing high-level classes for commonly required tasks.")
    (home-page "https://dirk-farin.net/software/libvideogfx/index.html")
    (license license:lgpl2.1+)))

(define-public libde265
  (package
    (name "libde265")
    (version "1.0.8")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/strukturag/libde265")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dzflqbk248lz5ws0ni5acmf32b3rmnq5gsfaz7691qqjxkl1zml"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list "--disable-static")))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)))
    (inputs
     `(;; XXX: Build fails with libvideogfx.
       ;; ("libvideogfx" ,libvideogfx)
       ("qt" ,qtbase-5)
       ("sdl" ,sdl)))
    (synopsis "H.265 video codec implementation")
    (description "Libde265 is an implementation of the h.265 video codec.  It is
written from scratch and has a plain C API to enable a simple integration into
other software.")
    (home-page "https://www.libde265.org/")
    (license
     (list
      ;; Applications.
      license:expat
      ;; Library.
      license:lgpl3+))))

(define-public tslib
  (package
    (name "tslib")
    (version "1.22")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/libts/tslib")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "197p6vy539wvfrv23agbvmay4rjya1jnisi46llm0nx4cvqh48by"))))
    (build-system gnu-build-system)
    (arguments
     `(#:test-target "tests"
       #:configure-flags
       (list "--with-sdl2")))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("linux-headers" ,linux-libre-headers)
       ("sdl2" ,sdl2)))
    (synopsis "Touchscreen access library")
    (description "TSLib is a cross-platform library that provides access to
touchscreen devices and the ability to apply filters to their input events.")
    (home-page "http://www.tslib.org/")
    (license license:lgpl2.1+)))

(define-public libmpeg3
  (package
    (name "libmpeg3")
    (version "1.8")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "https://sourceforge.net/projects/heroines/files/"
                       "releases/081108/" name "-" version "-src.tar.bz2"))
       (sha256
        (base32 "1i53vv0wm5qfwgg1z7j9g14s6c7gxxkiy4vbdkq3lijjyyz50vv5"))))
    (build-system gnu-build-system)
    (arguments
     `(#:test-target "test"
       #:make-flags
       (list
        (string-append "A52DIR=" (assoc-ref %build-inputs "liba52"))
        (string-append "DST=" (assoc-ref %outputs "out") "/bin"))
     #:phases
     (modify-phases %standard-phases
       (add-after 'unpack 'delete-bundled-a52dec
         (lambda _
           (delete-file-recursively "a52dec-0.7.3")
           (substitute* "Makefile"
             (("include Makefile\\.a52")
              "")
             (("\\(A52DIR\\)/include")
              "(A52DIR)/include/a52dec")
             (("LIBS = " match)
              (string-append match "-la52 ")))
           #t))
       (add-before 'install 'create-destination-directory
         (lambda* (#:key outputs #:allow-other-keys)
           (let* ((out (string-append (assoc-ref outputs "out"))))
             (mkdir-p (string-append out "/bin"))
             #t))))))
  (native-inputs
   `(("nasm" ,nasm)))
  (inputs
   `(("liba52" ,liba52)))
  (synopsis "Advanced MPEG editing and manipulation library")
  (description "Libmpeg3 decodes MP2, MP3, AC3, MPEG-1 video, MPEG-2 video,
and DVD footage in a single library.  It supports many esoteric features like
parallel video decoding, frame-accurate editing, YUV 4:2:2, and ATSC transport
stream decoding")
  (home-page "http://heroinewarrior.com/libmpeg3.php")
  (license license:gpl2+)))

(define-public aalib
  (package
    (name "aalib")
    (version "1.4rc5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/aa-project/aa-lib/"
                                  version "/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "1vkh19gb76agvh4h87ysbrgy82hrw88lnsvhynjf4vng629dmpgv"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("makeinfo" ,texinfo)))
    (inputs
     `(("ncurses" ,ncurses)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
                  (lambda* (#:key build inputs outputs #:allow-other-keys)
                    ;; This old `configure' script doesn't support
                    ;; variables passed as arguments.
                    (let ((out     (assoc-ref outputs "out"))
                          (ncurses (assoc-ref inputs "ncurses")))
                      (setenv "CONFIG_SHELL" (which "bash"))
                      (invoke "./configure"
                              (string-append "--prefix=" out)
                              (string-append "--build=" build)
                              ;; The ancient config.guess is unable to
                              ;; guess the host triplet on mips64el.
                              ,@(if (string=? "mips64el-linux"
                                              (%current-system))
                                    '("--host=mips64el-unknown-linux-gnu")
                                    '())
                              ;; The same is also true with aarch64.
                              ,@(if (string=? "aarch64-linux"
                                              (%current-system))
                                    '("--host=aarch64-unknown-linux-gnu")
                                    '())
                              (string-append "--with-ncurses="
                                             ncurses))))))))
    (home-page "http://aa-project.sourceforge.net/aalib/")
    (synopsis "ASCII-art library")
    (description
     "AA-lib is a low level gfx library which does not require graphics device.
In fact, there is no graphical output possible.  AA-lib replaces those
old-fashioned output methods with powerful ascii-art renderer.")
    (license license:lgpl2.0+)))

(define-public celluloid
  (package
    (name "celluloid")
    (version "0.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/celluloid-player/celluloid"
                           "/releases/download/v" version
                           "/celluloid-" version ".tar.xz"))
       (sha256
        (base32 "1dvyf21iv9hrgv99szc24386vkacmhidm5b4d31hqqjs3b6di692"))))
    (build-system glib-or-gtk-build-system)
    (native-inputs
     `(("intltool" ,intltool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("gtk+" ,gtk+)
       ("libepoxy" ,libepoxy)
       ("mpv" ,mpv)))
    (home-page "https://github.com/celluloid-player/celluloid")
    (synopsis "GTK+ frontend for the mpv media player")
    (description "Celluloid is a simple GTK+ frontend for the mpv media player.
It interacts with mpv via the client API exported by libmpv, allowing access to
mpv's powerful playback capabilities.")
    (license license:gpl3+)))

(define-public liba52
  (package
    (name "liba52")
    (version "0.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    ;; A mirror://sourceforge URI doesn't work, presumably
                    ;; because the SourceForge project is misconfigured.
                    "http://liba52.sourceforge.net/files/a52dec-" version
                    ".tar.gz"))
              (sha256
               (base32
                "0czccp4fcpf2ykp16xcrzdfmnircz1ynhls334q374xknd5747d2"))
              (patches (search-patches "liba52-enable-pic.patch"
                                       "liba52-set-soname.patch"
                                       "liba52-use-mtune-not-mcpu.patch"
                                       "liba52-link-with-libm.patch"))))
    (build-system gnu-build-system)
    ;; XXX We need to run ./bootstrap because of the build system fixes above.
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)))
    (arguments `(#:configure-flags '("--enable-shared")
                 #:phases
                 (modify-phases %standard-phases
                   ;; XXX We need to run ./bootstrap because of the build
                   ;; system fixes above.
                   (replace 'bootstrap
                     (lambda _ (invoke "sh" "bootstrap"))))))
    (home-page "http://liba52.sourceforge.net/")
    (synopsis "ATSC A/52 stream decoder")
    (description "liba52 is a library for decoding ATSC A/52 streams.  The
A/52 standard is used in a variety of applications, including digital
television and DVD.  It is also known as AC-3.")
    (license license:gpl2+)))

(define-public libaom
  (package
    (name "libaom")
    (version "3.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aomedia.googlesource.com/aom/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1v3i34jmbz1p3x8msj3vx46nl6jdzxbkr2lfbh06vard8adb16il"))))
    (build-system cmake-build-system)
    (native-inputs
     `(("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python" ,python))) ; to detect the version
    (arguments
     `(#:tests? #f  ;no check target
       #:configure-flags
         ;; build dynamic library
       (list "-DBUILD_SHARED_LIBS=YES"
             "-DENABLE_PIC=TRUE"
             "-DAOM_TARGET_CPU=generic"
             (string-append "-DCMAKE_INSTALL_PREFIX="
                              (assoc-ref %outputs "out")))))
    (home-page "https://aomedia.googlesource.com/aom/")
    (synopsis "AV1 video codec")
    (description "Libaom is the reference implementation of AV1.  It includes a
shared library and encoder and decoder command-line executables.")
    (license license:bsd-2)))

(define-public libmpeg2
  (package
    (name "libmpeg2")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              ;; A mirror://sourceforge URI doesn't work, presumably
              ;; because the SourceForge project is misconfigured.
              (uri (string-append "http://libmpeg2.sourceforge.net/files/"
                                  name "-" version ".tar.gz"))
              (patches (search-patches "libmpeg2-arm-private-symbols.patch"
                                       "libmpeg2-global-symbol-test.patch"))
              (sha256
               (base32
                "1m3i322n2fwgrvbs1yck7g5md1dbg22bhq5xdqmjpz5m7j4jxqny"))))
    (inputs
     `(("libx11" ,libx11)
       ("libxext" ,libxext)
       ("libxv" ,libxv)
       ("libsm" ,libsm)
       ("libice" ,libice)
       ("sdl" ,sdl)))
    (build-system gnu-build-system)
    (home-page "http://libmpeg2.sourceforge.net/")
    (synopsis "MPEG1 and MPEG2 video decoder library")
    (description
     "libmpeg2 is a library which can decode MPEG1 and MPEG2 video streams.")
    (license license:gpl2+)))

(define-public libx264
  ;; There are no tags in the repository, so we take the version number from
  ;; the X264_BUILD variable defined in x264.h.
  (let ((version "161")
        (commit "4c2aafd864dd201832ec2be0fef4484925146650")
        (revision "0"))
    (package
      (name "libx264")
      (version (git-version version revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://code.videolan.org/videolan/x264.git")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1i6v9h3xx9pi0zmlj3anwwjxqa63sbhy9crrif8dphipwfn9hyg5"))))
      (build-system gnu-build-system)
      (native-inputs
       `(("pkg-config" ,pkg-config)
         ("nasm" ,nasm)))
      ;; TODO: Add gpac input
      (arguments
       `(#:tests? #f                    ;no check target
         #:configure-flags '("--enable-shared"
                             ;; Don't build the command-line program.  If we
                             ;; want it later, we should do so in a different
                             ;; package to avoid a circular dependency (the x264
                             ;; program depends on ffmpeg and ffmpeg depends on
                             ;; libx264).
                             "--disable-cli"

                             ;; On MIPS, we must pass "--disable-asm" or else
                             ;; configure fails after printing: "You specified a
                             ;; pre-MSA CPU in your CFLAGS. If you really want
                             ;; to run on such a CPU, configure with
                             ;; --disable-asm."
                             ,@(if (string-prefix? "mips"
                                                   (or (%current-target-system)
                                                       (%current-system)))
                                   '("--disable-asm")
                                   '()))))
      (home-page "https://www.videolan.org/developers/x264.html")
      (synopsis "H.264 video coding library")
      (description "libx264 is an advanced encoding library for creating
H.264 (MPEG-4 AVC) video streams.")
      (license (list license:gpl2+       ;most files
                     license:isc         ;common/x86/x86inc.asm
                     license:lgpl2.1+    ;extras/getopt.c
                     license:bsd-3       ;extras/inttypes.h
                     (license:non-copyleft ;extras/cl*.h
                      "file://extras/cl.h"
                      "See extras/cl.h in the distribution."))))))

(define-public mkvtoolnix
  (package
    (name "mkvtoolnix")
    (version "52.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://mkvtoolnix.download/sources/"
                           "mkvtoolnix-" version ".tar.xz"))
       (sha256
        (base32 "15y7ahlifsclnkl70wn5w34dil8nwcwcjnw3k2ydqc6dz4vb0j5s"))
       (modules '((guix build utils)))
       (snippet '(begin
                   ;; Delete bundled libraries.
                   (for-each delete-file-recursively
                             '("lib/fmt"
                               "lib/libebml"
                               "lib/libmatroska"
                               "lib/nlohmann-json"
                               "lib/pugixml"
                               "lib/utf8-cpp"))
                   #t))))
    (build-system gnu-build-system)
    (outputs '("out" "gui")) ; "mkvtoolnix-gui" brings the closure size from ~300 MB to 1.5+ GB.
    (inputs
     `(("boost" ,boost)
       ("bzip2" ,bzip2)
       ("cmark" ,cmark)
       ("libebml" ,libebml)
       ("file" ,file)
       ("flac" ,flac)
       ("fmt" ,fmt)
       ("libdvdread" ,libdvdread)
       ("libmatroska" ,libmatroska)
       ("libogg" ,libogg)
       ("libvorbis" ,libvorbis)
       ("lzo" ,lzo)
       ("pcre2" ,pcre2)
       ("pugixml" ,pugixml)
       ("qtbase" ,qtbase-5)
       ("qtmultimedia" ,qtmultimedia)
       ("utfcpp" ,utfcpp)
       ("zlib" ,zlib)))
    (native-inputs
     `(("docbook-xsl" ,docbook-xsl)
       ("gettext" ,gettext-minimal)
       ("googletest" ,googletest)
       ("libxslt" ,libxslt)
       ("json-modern-cxx" ,json-modern-cxx)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("po4a" ,po4a)
       ("qttools" ,qttools)
       ("ruby" ,ruby)))
    (arguments
     `(#:configure-flags
       (list (string-append "--with-boost="
                            (assoc-ref %build-inputs "boost"))
             (string-append "--with-docbook-xsl-root="
                            (assoc-ref %build-inputs "docbook-xsl")
                            "/xml/xsl/docbook-xsl-"
                            ,(package-version docbook-xsl))
             "--enable-update-check=no"
             "--enable-precompiled-headers=no")
        #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-relative-file-names
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
             (substitute* "src/mkvtoolnix-gui/util/settings.cpp"
               (("mkvmerge" match)
                (string-append out "/bin/" match)))
             #t)))
         (add-before 'configure 'add-googletest
           (lambda* (#:key inputs #:allow-other-keys)
             (symlink
               (string-append (assoc-ref inputs "googletest")
                              "/include/gtest") "lib/gtest")
             #t))
         (replace 'build
           (lambda _
             (let ((-j (list "-j" (number->string (parallel-job-count)))))
               (apply invoke "rake" -j))))
         (replace 'check
           (lambda _
             (invoke "rake" "tests/unit")))
         (replace 'install
           (lambda _
             (invoke "rake" "install")))
         (add-after 'install 'post-install
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Move the Qt interface to "gui".
             (let* ((out (assoc-ref outputs "out"))
                    (gui (assoc-ref outputs "gui"))
                    (strip-store-dir (lambda (path)
                                       (substring path (string-prefix-length out path)))))
               (for-each
                (lambda (file)
                  (mkdir-p (string-append gui (dirname file)))
                  (rename-file (string-append out file)
                               (string-append gui file)))
                (append '("/bin/mkvtoolnix-gui"
                          "/share/applications/org.bunkus.mkvtoolnix-gui.desktop"
                          "/share/metainfo/org.bunkus.mkvtoolnix-gui.appdata.xml"
                          "/share/mime/packages/org.bunkus.mkvtoolnix-gui.xml")
                        (map strip-store-dir (find-files out "\\.ogg$"))
                        (map strip-store-dir (find-files out "mkvtoolnix-gui\\.png$"))
                        (map strip-store-dir (find-files out "mkvtoolnix-gui\\.1"))))
               (for-each
                (lambda (file)
                  (delete-file-recursively (string-append out file)))
                '("/share/applications"
                  "/share/metainfo"
                  "/share/mime"
                  "/share/mkvtoolnix")))
             #t)))))
    (home-page "https://mkvtoolnix.download")
    (synopsis "Tools to create, alter and inspect Matroska files")
    (description
     "MKVToolNix provides tools for getting information about Matroska files
(@command{mkvinfo}), extracting tracks/data from Matroska files
(@command{mkvextract}), and creating Matroska files from other media files
(@command{mkvmerge}).")
    (license license:gpl2)))

(define-public straw-viewer
  (package
    (name "straw-viewer")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/trizen/straw-viewer")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n21byn7hqykpm94jmmnir1fwsskq6dp9wgj0bd2qf0qx5nq33cl"))))
    (build-system perl-build-system)
    (native-inputs
     `(("perl-module-build" ,perl-module-build)
       ("perl-test-pod" ,perl-test-pod)))
    (inputs
     `(("perl-data-dump" ,perl-data-dump)
       ("perl-json" ,perl-json)
       ("perl-libwww" ,perl-libwww)
       ("perl-lwp-protocol-https" ,perl-lwp-protocol-https)
       ("perl-lwp-useragent-cached" ,perl-lwp-useragent-cached)
       ("perl-mozilla-ca" ,perl-mozilla-ca)
       ("perl-term-readline-gnu" ,perl-term-readline-gnu)
       ("perl-unicode-linebreak" ,perl-unicode-linebreak)
       ("xdg-utils" ,xdg-utils)))
    ;; Required only when building the graphical interface (--gtk).
    ;;("perl-file-sharedir" ,perl-file-sharedir)
    
    ;; Some videos play without youtube-dl, but others silently fail to.
    (propagated-inputs
     `(("youtube-dl" ,youtube-dl)))
    (arguments
     `(#:modules ((guix build perl-build-system)
                  (guix build utils)
                  (srfi srfi-26))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'refer-to-inputs
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "lib/WWW/StrawViewer.pm"
               (("'youtube-dl'")
                (format #f "'~a/bin/youtube-dl'"
                        (assoc-ref inputs "youtube-dl"))))
             (substitute* "bin/gtk-straw-viewer"
               (("'xdg-open'")
                (format #f "'~a/bin/xdg-open'"
                        (assoc-ref inputs "xdg-utils"))))
             #t))
         ;; (add-after 'install 'install-desktop
         ;;   (lambda* (#:key outputs #:allow-other-keys)
         ;;     (let* ((out (assoc-ref outputs "out"))
         ;;            (sharedir (string-append out "/share")))
         ;;       (install-file "share/gtk-straw-viewer.desktop"
         ;;                     (string-append sharedir "/applications"))
         ;;       (install-file "share/icons/gtk-straw-viewer.png"
         ;;                     (string-append sharedir "/pixmaps"))
         ;;       #t)))
         (add-after 'install 'wrap-program
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin-dir (string-append out "/bin/"))
                    (site-dir (string-append out "/lib/perl5/site_perl/"))
                    (lib-path (getenv "PERL5LIB")))
               (for-each (cut wrap-program <>
                              `("PERL5LIB" ":" prefix (,lib-path ,site-dir)))
                         (find-files bin-dir))
               #t))))))
    (synopsis
     "Light-weight application for searching and streaming videos from YouTube")
    (description
     "Straw-viewer searches for YouTube videos using @uref{https://invidio.us/,
invidio.us} and plays them locally in a native media player like @command{vlc}
or @command{mpv}.

You can search for videos, playlists, and/or channels.  The videos are streamed
directly to the player at the best chosen resolution and with closed captions if
available.")
    ;; XXX Add #:module-build-flags '("--gtk") dependencies and this sentence.
    ;; Both a command-line and a graphical interface are available.
    (home-page "https://github.com/trizen/youtube-viewer")
    (license license:perl-license)))

(define-public x265
  (package
    (name "x265")
    (version "3.4")
    (outputs '("out" "static"))
    (source
      (origin
        (method url-fetch)
        (uri (list (string-append "https://bitbucket.org/multicoreware/x265"
                                  "/downloads/x265_" version ".tar.gz")
                   (string-append "https://download.videolan.org/videolan/x265/"
                                  "x265_" version ".tar.gz")))
        (sha256
         (base32 "0wl62hfsdqpf3r3z3s6l9bz7pdb1rcik5ll00b3yaadplqipy162"))
        (patches (search-patches "x265-arm-flags.patch"))
        (modules '((guix build utils)))
        (snippet '(begin
                    (delete-file-recursively "source/compat/getopt")
                    #t))))
    (build-system cmake-build-system)
    (native-inputs
     ;; XXX: ASM optimization fails on i686-linux, see <https://bugs.gnu.org/41768>.
     (if (string-prefix? "i686" (%current-system))
         '()
         `(("nasm" ,nasm))))
    (arguments
     `(#:tests? #f ; tests are skipped if cpu-optimized code isn't built
       #:configure-flags
         ;; Ensure position independent code for everyone.
         (list "-DENABLE_PIC=TRUE"
               ,@(if (target-arm?)
                     '("-DENABLE_ASSEMBLY=OFF")
                     '())
               (string-append "-DCMAKE_INSTALL_PREFIX="
                              (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'prepare-build
           (lambda _
             (delete-file-recursively "build")
             (chdir "source")
             #t))
         (add-before 'configure 'build-12-bit
           (lambda* (#:key (configure-flags '()) #:allow-other-keys)
             (mkdir "../build-12bit")
             (with-directory-excursion "../build-12bit"
               (apply invoke
                 "cmake" "../source"
                 "-DHIGH_BIT_DEPTH=ON"
                 "-DEXPORT_C_API=OFF"
                 "-DENABLE_CLI=OFF"
                 "-DMAIN12=ON"
                 configure-flags)
               (substitute* (cons "cmake_install.cmake"
                                  (append
                                    (find-files "CMakeFiles/x265-shared.dir" ".")
                                    (find-files "CMakeFiles/x265-static.dir" ".")))
                 (("libx265") "libx265_main12"))
               (invoke "make"))))
         (add-before 'configure 'build-10-bit
           (lambda* (#:key (configure-flags '()) #:allow-other-keys)
             (mkdir "../build-10bit")
             (with-directory-excursion "../build-10bit"
               (apply invoke
                 "cmake" "../source"
                 "-DHIGH_BIT_DEPTH=ON"
                 "-DEXPORT_C_API=OFF"
                 "-DENABLE_CLI=OFF"
                 configure-flags)
               (substitute* (cons "cmake_install.cmake"
                                  (append
                                    (find-files "CMakeFiles/x265-shared.dir" ".")
                                    (find-files "CMakeFiles/x265-static.dir" ".")))
                 (("libx265") "libx265_main10"))
               (invoke "make"))))
         (add-after 'install 'install-more-libs
           (lambda _
             (with-directory-excursion "../build-12bit"
               (invoke "make" "install"))
             (with-directory-excursion "../build-10bit"
               (invoke "make" "install"))))
         (add-before 'strip 'move-static-libs
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (static (assoc-ref outputs "static")))
               (mkdir-p (string-append static "/lib"))
               (with-directory-excursion
                 (string-append out "/lib")
                 (for-each
                   (lambda (file)
                     (rename-file file
                                  (string-append static "/lib/" file)))
                   (find-files "." "\\.a$"))))
             #t)))))
    (home-page "http://x265.org/")
    (synopsis "Library for encoding h.265/HEVC video streams")
    (description "x265 is a H.265 / HEVC video encoder application library,
designed to encode video or images into an H.265 / HEVC encoded bitstream.")
    (license license:gpl2+)))

(define-public libass
  (package
    (name "libass")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/libass/libass/releases/download/"
                    version "/libass-" version ".tar.xz"))
              (sha256
               (base32
                "0cz8v6kh3f2j5rdjrra2z0h715fa16vjm7kambvqx9hak86262cz"))))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags '("--disable-static")))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("nasm" ,nasm)))
    (propagated-inputs
     `(("freetype" ,freetype)
       ("fribidi" ,fribidi)
       ("fontconfig" ,fontconfig)
       ("harfbuzz" ,harfbuzz)))
    (home-page "https://github.com/libass/libass")
    (synopsis "Subtitle rendering library for the ASS/SSA format")
    (description "libass is a subtitle rendering library for the
ASS/SSA (Advanced Substation Alpha/SubStation Alpha) subtitle format.")
    (license license:isc)))

(define-public libcaca
  (package
    (name "libcaca")
    (version "0.99.beta19")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://caca.zoy.org/files/libcaca/libcaca-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1x3j6yfyxl52adgnabycr0n38j9hx2j74la0hz0n8cnh9ry4d2qj"))
              (patches (search-patches "libcaca-CVE-2021-3410-pt1.patch"
                                       "libcaca-CVE-2021-3410-pt2.patch"))))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags '("--disable-static")))
    (native-inputs `(("pkg-config" ,pkg-config)))
    (inputs
     `(("freeglut" ,freeglut)
       ("ftgl" ,ftgl)
       ("imlib2" ,imlib2)
       ("libx11" ,libx11)
       ("mesa" ,mesa)
       ("ncurses" ,ncurses)
       ("zlib" ,zlib)))
    (home-page "http://caca.zoy.org/wiki/libcaca")
    (synopsis "Colour ASCII-art library")
    (description "libcaca is a graphics library that outputs text instead of
pixels, so that it can work on older video cards or text terminals.  It
supports Unicode, 2048 colors, dithering of color images, and advanced text
canvas operations.")
    (license license:wtfpl2)))

(define-public libdca
  (package
    (name "libdca")
    (version "0.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.videolan.org/pub/videolan/libdca/"
                    version "/libdca-" version ".tar.bz2"))
              (sha256
               (base32
                "0sjz0s0nrv7jcpvh1i432x3jza0y5yycmzw84cfncb2qby0i62rs"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)))
    (home-page "https://www.videolan.org/developers/libdca.html")
    (synopsis "DTS Coherent Acoustics decoder")
    (description "libdca is a library for decoding DTS Coherent Acoustics
streams.")
    (license license:gpl2+)))

(define-public libdv
  (package
    (name "libdv")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/libdv/libdv/"
                    version "/libdv-" version ".tar.gz"))
              (sha256
               (base32
                "1fl96f2xh2slkv1i1ix7kqk576a0ak1d33cylm0mbhm96d0761d3"))))
    (build-system gnu-build-system)
    (native-inputs `(("pkg-config" ,pkg-config)))
    (inputs `(("libxv" ,libxv)))
    (home-page "http://libdv.sourceforge.net/")
    (synopsis "DV video (IEC 61834 and SMPTE 314M) codec")
    (description "The Quasar DV codec (libdv) is a software codec for DV
video, the encoding format used by most digital camcorders, typically those
that support the IEEE 1394 (a.k.a. FireWire or i.Link) interface.  Libdv was
developed according to the official standards for DV video: IEC 61834 and
SMPTE 314M.")
    (license license:lgpl2.1+)))

(define-public libmatroska
  (package
    (name "libmatroska")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://dl.matroska.org/downloads/"
                           "libmatroska/libmatroska-" version ".tar.xz"))
       (sha256
        (base32 "06h81sxyz2riic0gpzik6ffcnq32wrqphi8c6k55glcdymiimyfs"))))
    (build-system cmake-build-system)
    (inputs
     `(("libebml" ,libebml)))
    (arguments
     `(#:configure-flags
       (list "-DBUILD_SHARED_LIBS=YES")
       #:tests? #f))                    ; no test suite
    (home-page "https://www.matroska.org")
    (synopsis "C++ library to parse Matroska files (.mkv and .mka)")
    (description
     "Matroska aims to become the standard of multimedia container formats.
It is based on @dfn{EBML} (Extensible Binary Meta Language), a binary derivative
of XML.  EBML enables the Matroska Development Team to gain significant
advantages in terms of future format extensibility, without breaking file
support in old parsers.
libebml is a C++ library to read and write EBML files.")
    (license license:lgpl2.1)))

(define-public libva
  (package
    (name "libva")
    (version "2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/intel/libva/releases/download/"
                           version "/libva-" version ".tar.bz2"))
       (sha256
        (base32 "0dh2zjn6wi74ga75r6pbrrj8hjm213zyxvn9bv78z0fra1dy70gs"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("libdrm" ,libdrm)
       ("libx11" ,libx11)
       ("libxext" ,libxext)
       ("libxfixes" ,libxfixes)
       ("mesa" ,mesa)
       ("wayland" ,wayland)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before
          'build 'fix-dlopen-paths
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((out (assoc-ref outputs "out")))
              (substitute* "va/drm/va_drm_auth_x11.c"
                (("\"libva-x11\\.so\\.%d\"")
                 (string-append "\"" out "/lib/libva-x11.so.%d\"")))
              #t))))
       ;; Most drivers are in mesa's $prefix/lib/dri, so use that.  (Can be
       ;; overridden at run-time via LIBVA_DRIVERS_PATH.)
       #:configure-flags
       (list (string-append "--with-drivers-path="
                            (assoc-ref %build-inputs "mesa") "/lib/dri"))
       ;; However, we can't write to mesa's store directory, so override the
       ;; following make variable to install the dummy driver to libva's
       ;; $prefix/lib/dri directory.
       #:make-flags
       (list (string-append "dummy_drv_video_ladir="
                            (assoc-ref %outputs "out") "/lib/dri"))))
    (home-page "https://www.freedesktop.org/wiki/Software/vaapi/")
    (synopsis "Video acceleration library")
    (description "The main motivation for VA-API (Video Acceleration API) is
to enable hardware accelerated video decode/encode at various
entry-points (VLD, IDCT, Motion Compensation etc.) for prevailing coding
standards (MPEG-2, MPEG-4 ASP/H.263, MPEG-4 AVC/H.264, and VC-1/VMW3).")
    (license license:expat)))

(define-public libva-utils
  (package
    (name "libva-utils")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/intel/libva-utils/releases/download/"
                           version "/libva-utils-" version ".tar.bz2"))
       (sha256
        (base32 "05rasyqnsg522zqxak1q8rrm1hys7wwbi41kd0szjq0d27awjf4j"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list "--enable-wayland"
             "--enable-x11")))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("libdrm" ,libdrm)
       ("libva" ,libva)
       ("libx11" ,libx11)
       ("mesa" ,mesa)
       ("wayland" ,wayland)))
    (home-page "https://01.org/linuxmedia/vaapi")
    (synopsis "Collection of testing utilities for VA-API")
    (description
     "This is a collection of utilities  to query and test the @acronym{VA-API,
Video Acceleration API} implemented by the libva library.

These tools require a supported graphics chip, driver, and VA-API back end to
operate properly.")
    (license license:expat)))

(define-public ffmpeg
  (package
    (name "ffmpeg")
    (version "4.3.2")
    (source (origin
             (method url-fetch)
             (uri (string-append "https://ffmpeg.org/releases/ffmpeg-"
                                 version ".tar.xz"))
             (sha256
              (base32
               "1nyd9jlcy0pqnwzi29a7sg50hq37vb0g3f9l16y3q8yh3m7ydr26"))))
    (build-system gnu-build-system)
    (inputs
     `(("dav1d" ,dav1d)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("frei0r-plugins" ,frei0r-plugins)
       ("gnutls" ,gnutls)
       ("opus" ,opus)
       ("ladspa" ,ladspa)
       ("lame" ,lame)
       ("libaom" ,libaom)
       ("libass" ,libass)
       ("libbluray" ,libbluray)
       ("libcaca" ,libcaca)
       ("libcdio-paranoia" ,libcdio-paranoia)
       ("libdrm" ,libdrm)
       ("libtheora" ,libtheora)
       ("libva" ,libva)
       ("libvdpau" ,libvdpau)
       ("libvorbis" ,libvorbis)
       ("libvpx" ,libvpx)
       ("libx11" ,libx11)
       ("libx264" ,libx264)
       ("mesa" ,mesa)
       ("openal" ,openal)
       ("pulseaudio" ,pulseaudio)
       ;; XXX: rav1e depends on rust, which currently only works on x86_64.
       ;; See also the related configure flag when changing this.
       ,@(if (string-prefix? "x86_64" (or (%current-target-system)
                                          (%current-system)))
             `(("rav1e" ,rav1e))
             '())
       ("sdl" ,sdl2)
       ("soxr" ,soxr)
       ("speex" ,speex)
       ;; FFmpeg is not yet compatible with SRT > 1.4.1.
       ("srt" ,srt-1.4.1)
       ("twolame" ,twolame)
       ("vidstab" ,vidstab)
       ("x265" ,x265)
       ("xvid" ,xvid)
       ("zlib" ,zlib)))
    (native-inputs
     `(("bc" ,bc)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("texinfo" ,texinfo)
       ("speex" ,speex)
       ("yasm" ,yasm)))
    (arguments
     `(#:test-target "fate"
       #:configure-flags
       ;; possible additional inputs:
       ;;   --enable-avisynth        enable reading of AviSynth script
       ;;                            files [no]
       ;;   --enable-libaacplus      enable AAC+ encoding via libaacplus [no]
       ;;   --enable-libcelt         enable CELT decoding via libcelt [no]
       ;;   --enable-libdc1394       enable IIDC-1394 grabbing using libdc1394
       ;;                            and libraw1394 [no]
       ;;   --enable-libfaac         enable AAC encoding via libfaac [no]
       ;;   --enable-libfdk-aac      enable AAC de/encoding via libfdk-aac [no]
       ;;   --enable-libflite        enable flite (voice synthesis) support via
       ;;                            libflite [no]
       ;;   --enable-libgme          enable Game Music Emu via libgme [no]
       ;;   --enable-libgsm          enable GSM de/encoding via libgsm [no]
       ;;   --enable-libiec61883     enable iec61883 via libiec61883 [no]
       ;;   --enable-libilbc         enable iLBC de/encoding via libilbc [no]
       ;;   --enable-libmodplug      enable ModPlug via libmodplug [no]
       ;;   --enable-libnut          enable NUT (de)muxing via libnut,
       ;;                            native (de)muxer exists [no]
       ;;   --enable-libopencore-amrnb    enable AMR-NB de/encoding via
       ;;                                 libopencore-amrnb [no]
       ;;   --enable-libopencore-amrwb    enable AMR-WB decoding via
       ;;                                 libopencore-amrwb [no]
       ;;   --enable-libopencv       enable video filtering via libopencv [no]
       ;;   --enable-libopenjpeg     enable JPEG 2000 de/encoding via
       ;;                            OpenJPEG [no]
       ;;   --enable-librtmp         enable RTMP[E] support via librtmp [no]
       ;;   --enable-libschroedinger enable Dirac de/encoding via
       ;;                            libschroedinger [no]
       ;;   --enable-libshine        enable fixed-point MP3 encoding via
       ;;                            libshine [no]
       ;;   --enable-libssh          enable SFTP protocol via libssh [no]
       ;;                            (libssh2 does not work)
       ;;   --enable-libstagefright-h264  enable H.264 decoding via
       ;;                                 libstagefright [no]
       ;;   --enable-libutvideo      enable Ut Video encoding and decoding via
       ;;                            libutvideo [no]
       ;;   --enable-libv4l2         enable libv4l2/v4l-utils [no]
       ;;   --enable-libvo-aacenc    enable AAC encoding via libvo-aacenc [no]
       ;;   --enable-libvo-amrwbenc  enable AMR-WB encoding via
       ;;                            libvo-amrwbenc [no]
       ;;   --enable-libwavpack      enable wavpack encoding via libwavpack [no]
       ;;   --enable-libxavs         enable AVS encoding via xavs [no]
       ;;   --enable-libzmq          enable message passing via libzmq [no]
       ;;   --enable-libzvbi         enable teletext support via libzvbi [no]
       ;;   --enable-opencl          enable OpenCL code
       '("--enable-avresample"
         "--enable-gpl" ; enable optional gpl licensed parts
         "--enable-shared"
         "--enable-frei0r"
         "--enable-fontconfig"
         "--enable-gnutls"
         "--enable-ladspa"
         "--enable-libaom"
         "--enable-libass"
         "--enable-libbluray"
         "--enable-libcaca"
         "--enable-libcdio"
         "--enable-libdav1d"
         "--enable-libfreetype"
         "--enable-libmp3lame"
         "--enable-libopus"
         "--enable-libpulse"
         ,@(if (string-prefix? "x86_64" (or (%current-target-system)
                                            (%current-system)))
               '("--enable-librav1e")
               '())
         "--enable-libsoxr"
         "--enable-libspeex"
         "--enable-libsrt"
         "--enable-libtheora"
         "--enable-libtwolame"
         "--enable-libvidstab"
         "--enable-libvorbis"
         "--enable-libvpx"
         "--enable-libxvid"
         "--enable-libx264"
         "--enable-libx265"
         "--enable-openal"
         "--enable-opengl"
         "--enable-libdrm"

         "--enable-runtime-cpudetect"

         ;; The HTML pages take 7.2 MiB
         "--disable-htmlpages"

         ;; The static libraries are 23 MiB
         "--disable-static"

         ;; Runtime cpu detection is not implemented on
         ;; MIPS, so we disable some features.
         "--disable-mips32r2"
         "--disable-mipsdsp"
         "--disable-mipsdspr2"
         "--disable-mipsfpu")
       #:phases
       (modify-phases %standard-phases
         (replace
          'configure
          ;; configure does not work followed by "SHELL=..." and
          ;; "CONFIG_SHELL=..."; set environment variables instead
          (lambda* (#:key outputs configure-flags #:allow-other-keys)
            (let ((out (assoc-ref outputs "out")))
              (substitute* "configure"
                (("#! /bin/sh") (string-append "#!" (which "sh"))))
              (setenv "SHELL" (which "bash"))
              (setenv "CONFIG_SHELL" (which "bash"))
              (apply invoke
                     "./configure"
                     (string-append "--prefix=" out)
                     ;; Add $libdir to the RUNPATH of all the binaries.
                     (string-append "--extra-ldflags=-Wl,-rpath="
                                    out "/lib")
                     configure-flags))))
         (add-before
          'check 'set-ld-library-path
          (lambda _
            ;; Allow $(top_builddir)/ffmpeg to find its dependencies when
            ;; running tests.
            (let* ((dso  (find-files "." "\\.so$"))
                   (path (string-join (map dirname dso) ":")))
              (format #t "setting LD_LIBRARY_PATH to ~s~%" path)
              (setenv "LD_LIBRARY_PATH" path)
              #t))))))
    (home-page "https://www.ffmpeg.org/")
    (synopsis "Audio and video framework")
    (description "FFmpeg is a complete, cross-platform solution to record,
convert and stream audio and video.  It includes the libavcodec
audio/video codec library.")
    (license license:gpl2+)))

(define-public ffmpeg-3.4
  (package
    (inherit ffmpeg)
    (version "3.4.7")
    (source (origin
             (method url-fetch)
             (uri (string-append "https://ffmpeg.org/releases/ffmpeg-"
                                 version ".tar.xz"))
             (sha256
              (base32
               "1j7mdk9szrljgv4sdx69bm1pnbb3cldbdxbkr42jbdi9zn11gl7g"))))
    (arguments
     (substitute-keyword-arguments (package-arguments ffmpeg)
       ((#:modules modules %gnu-build-system-modules)
        `((srfi srfi-1)
          ,@modules))
       ((#:configure-flags flags)
        `(fold delete
               ,flags
               '("--enable-libdav1d"
                 "--enable-libaom"
                 "--enable-librav1e"
                 "--enable-libsrt")))))
    (inputs (fold alist-delete
                  (package-inputs ffmpeg)
                  '("dav1d" "libaom" "rav1e" "srt")))))

(define-public ffmpeg-2.8
  (package
    (inherit ffmpeg)
    (version "2.8.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ffmpeg.org/releases/ffmpeg-"
                                  version ".tar.xz"))
              (sha256
               (base32
                "14n0xg22yz1r4apif2idm91s3avcmkz4sl8gyj5763gcy415k2bb"))))
    (arguments
     `(#:tests? #f               ; XXX: Enable them later, if required
       #:configure-flags
       (list
        "--disable-static"
        "--enable-shared"
        "--extra-cflags=-DFF_API_OLD_ENCODE_VIDEO -DFF_API_OLD_ENCODE_AUDIO")
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs configure-flags #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (substitute* "configure"
                 (("#! /bin/sh") (string-append "#!" (which "sh"))))
                ;; configure does not work followed by "SHELL=..." and
                ;; "CONFIG_SHELL=..."; set environment variables instead.
               (setenv "SHELL" (which "bash"))
               (setenv "CONFIG_SHELL" (which "bash"))
               (apply invoke
                      "./configure"
                      (string-append "--prefix=" out)
                      ;; Add $libdir to the RUNPATH of all the binaries.
                      (string-append "--extra-ldflags=-Wl,-rpath="
                                     out "/lib")
                      configure-flags))))
         (add-before
             'check 'set-ld-library-path
           (lambda _
             ;; Allow $(top_builddir)/ffmpeg to find its dependencies when
             ;; running tests.
             (let* ((dso  (find-files "." "\\.so$"))
                    (path (string-join (map dirname dso) ":")))
               (format #t "setting LD_LIBRARY_PATH to ~s~%" path)
               (setenv "LD_LIBRARY_PATH" path)
               #t))))))
    (inputs (fold alist-delete
                  (package-inputs ffmpeg)
                  '("dav1d" "libaom" "rav1e" "srt")))))

(define-public ffmpeg-for-stepmania
  (hidden-package
   (package
     (inherit ffmpeg)
     (version "2.1.3")
     (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/stepmania/ffmpeg")
              (commit "eda6effcabcf9c238e4635eb058d72371336e09b")))
        (sha256
         (base32 "1by8rmbva8mfrivdbbkr2gx4kga89zqygkd4cfjl76nr8mdcdamb"))
        (file-name (git-file-name "ffmpeg" version))))
     (arguments
      (substitute-keyword-arguments (package-arguments ffmpeg)
        ((#:configure-flags flags)
         '(list "--disable-programs"
                "--disable-doc"
                "--disable-debug"
                "--disable-avdevice"
                "--disable-swresample"
                "--disable-postproc"
                "--disable-avfilter"
                "--disable-shared"
                "--enable-static"))))
     (inputs '()))))

(define-public ffmpegthumbnailer
  (package
    (name "ffmpegthumbnailer")
    (version "2.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dirkvdb/ffmpegthumbnailer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1bakbr714j7yxdal1f5iq0gcl4cxggbbgj227ihdh5kvygqlwich"))))
    (build-system cmake-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("ffmpeg" ,ffmpeg)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("libpng" ,libpng)
       ("gvfs" ,gvfs)))
    (arguments
     `(#:configure-flags (list "-DENABLE_GIO=ON" "-DENABLE_THUMBNAILER=ON")))
    (home-page "https://github.com/dirkvdb/ffmpegthumbnailer")
    (synopsis "Create thumbnails from video files")
    (description "FFmpegthumbnailer is a lightweight video thumbnailer that
can be used by file managers to create thumbnails for your video files.  The
thumbnailer uses ffmpeg to decode frames from the video files, so supported
videoformats depend on the configuration flags of ffmpeg.")
    (license license:gpl2+)))

(define-public vlc
  (package
    (name "vlc")
    (version "3.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.videolan.org/pub/videolan/vlc/"
                    (car (string-split version #\-))
                    "/vlc-" version ".tar.xz"))
              (sha256
               (base32
                "0ygqihw2c5vvzv8950dlf7rdwz1cpz1668jgyja604ljibrmix7g"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("flex" ,flex)
       ("bison" ,bison)
       ("gettext" ,gettext-minimal)
       ("pkg-config" ,pkg-config)))
    ;; FIXME: Add optional inputs once available.
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("avahi" ,avahi)
       ("dav1d" ,dav1d)
       ("dbus" ,dbus)
       ("eudev" ,eudev)
       ("flac" ,flac)
       ("ffmpeg" ,ffmpeg)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("fribidi" ,fribidi)
       ("gnutls" ,gnutls)
       ("liba52" ,liba52)
       ("libarchive" ,libarchive)
       ("libass" ,libass)
       ("libavc1394" ,libavc1394)
       ("libbluray" ,libbluray)
       ("libcaca" ,libcaca)
       ("libcddb" ,libcddb)
       ("libdca" ,libdca)
       ("libdvbpsi" ,libdvbpsi)
       ("libdvdnav" ,libdvdnav)
       ("libdvdread" ,libdvdread)
       ("libebml" ,libebml)
       ("libgcrypt" ,libgcrypt)
       ("libidn" ,libidn)
       ("libkate" ,libkate)
       ("libmad" ,libmad)
       ("libmatroska" ,libmatroska)
       ("libmicrodns" ,libmicrodns)
       ("libmodplug" ,libmodplug)
       ("libmpeg2" ,libmpeg2)
       ("libogg" ,libogg)
       ("libpng" ,libpng)
       ("libraw1394" ,libraw1394)
       ("librsvg" ,librsvg)
       ("libsamplerate" ,libsamplerate)
       ("libsecret" ,libsecret)
       ("libssh2" ,libssh2)
       ("libupnp" ,libupnp)
       ("libva" ,libva)
       ("libvdpau" ,libvdpau)
       ("libvorbis" ,libvorbis)
       ("libvpx" ,libvpx)
       ("libtheora" ,libtheora)
       ("libx264" ,libx264)
       ("libxext" ,libxext)
       ("libxi" ,libxi)
       ("libxinerama" ,libxinerama)
       ("libxml2" ,libxml2)
       ("libxpm" ,libxpm)
       ("livemedia-utils" ,livemedia-utils)
       ("lua" ,lua-5.2)
       ("mesa" ,mesa)
       ("opus" ,opus)
       ("perl" ,perl)
       ("pulseaudio" ,pulseaudio)
       ("protobuf" ,protobuf)
       ("python" ,python-wrapper)
       ("qtbase" ,qtbase-5)
       ("qtsvg" ,qtsvg-5)
       ("qtx11extras" ,qtx11extras-5)
       ("samba" ,samba)
       ("sdl" ,sdl)
       ("sdl-image" ,sdl-image)
       ("speex" ,speex)
       ("speexdsp" ,speexdsp)
       ;; VLC is not yet compatible with SRT > 1.4.1.
       ("srt" ,srt-1.4.1)
       ("taglib" ,taglib)
       ("twolame" ,twolame)
       ("unzip" ,unzip)
       ("wayland" ,wayland)
       ("wayland-protocols" ,wayland-protocols)
       ("x265" ,x265)
       ("xcb-util-keysyms" ,xcb-util-keysyms)))
    (arguments
     `(#:configure-flags
       `("BUILDCC=gcc"
         ,(string-append "LDFLAGS=-Wl,-rpath -Wl,"
                         (assoc-ref %build-inputs "ffmpeg")
                         "/lib"))       ;needed for the tests

       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-source
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((livemedia-utils (assoc-ref inputs "livemedia-utils")))
               (substitute* "configure"
                 (("LIVE555_PREFIX=\\$\\{LIVE555_PREFIX-\"/usr\"\\}")
                  (string-append "LIVE555_PREFIX=" livemedia-utils)))
               ;; Some of the tests require using the display to test out VLC,
               ;; which fails in our sandboxed build system
               (substitute* "test/run_vlc.sh"
                 (("./vlc --ignore-config") "echo"))
               #t)))
         (add-after 'strip 'regenerate-plugin-cache
           (lambda* (#:key outputs #:allow-other-keys)
             ;; The 'install-exec-hook' rule in the top-level Makefile.am
             ;; generates 'lib/vlc/plugins/plugins.dat', a plugin cache, using
             ;; 'vlc-cache-gen'.  This file includes the mtime of the plugins
             ;; it references.  Thus, we first reset the timestamps of all
             ;; these files, and then regenerate the cache such that the
             ;; mtimes it includes are always zero instead of being dependent
             ;; on the build time.
             (let* ((out       (assoc-ref outputs "out"))
                    (pkglibdir (string-append out "/lib/vlc"))
                    (plugindir (string-append pkglibdir "/plugins"))
                    (cachegen  (string-append pkglibdir "/vlc-cache-gen")))
               ;; TODO: Factorize 'reset-timestamps'.
               (for-each (lambda (file)
                           (let ((s (lstat file)))
                             (unless (eq? (stat:type s) 'symlink)
                               (utime file 1 1))))
                         (find-files plugindir))
               (invoke cachegen plugindir))))
         (add-after 'install 'wrap-executable
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (plugin-path (getenv "QT_PLUGIN_PATH")))
               (wrap-program (string-append out "/bin/vlc")
                 `("QT_PLUGIN_PATH" ":" prefix (,plugin-path))))
             #t)))))
    (home-page "https://www.videolan.org/")
    (synopsis "Audio and video framework")
    (description "VLC is a cross-platform multimedia player and framework
that plays most multimedia files as well as DVD, Audio CD, VCD, and various
streaming protocols.")
    (license license:gpl2+)))

(define-public mplayer
  (package
    (name "mplayer")
    (version "1.4")
    (source (origin
             (method url-fetch)
             (uri (string-append
                   "https://www.mplayerhq.hu/MPlayer/releases/MPlayer-"
                   version ".tar.xz"))
             (sha256
              (base32
               "0j5mflr0wnklxsvnpmxvk704hscyn2785hvvihj2i3a7b3anwnc2"))))
    (build-system gnu-build-system)
    ;; FIXME: Add additional inputs once available.
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("yasm" ,yasm)))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("cdparanoia" ,cdparanoia)
       ("ffmpeg" ,ffmpeg)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("giflib" ,giflib)
       ("lame" ,lame)
       ("libass" ,libass)
       ("libdvdcss" ,libdvdcss)
       ("libdvdnav" ,libdvdnav)         ; ignored without libdvdread
       ("libdvdread" ,libdvdread)       ; ignored without libdvdnav
       ("libjpeg" ,libjpeg-turbo)
       ("libmpeg2" ,libmpeg2)
       ("libmpg123" ,mpg123)            ; audio codec for MP3
       ("libpng" ,libpng)
       ("libtheora" ,libtheora)
       ("libvdpau" ,libvdpau)
       ("libvorbis" ,libvorbis)
       ("libx11" ,libx11)
       ("libx264" ,libx264)
       ("libxinerama" ,libxinerama)
       ("libxv" ,libxv)
       ("libxxf86dga" ,libxxf86dga)
       ("mesa" ,mesa)
       ("opus" ,opus)
       ("perl" ,perl)
       ("pulseaudio" ,pulseaudio)
       ("python" ,python-wrapper)
       ("sdl" ,sdl)
       ("speex" ,speex)
       ("zlib" ,zlib)))
    (arguments
     `(#:tests? #f                      ; no test target
       #:phases
       (modify-phases %standard-phases
        (replace 'configure
          ;; configure does not work followed by "SHELL=..." and
          ;; "CONFIG_SHELL=..."; set environment variables instead
          (lambda* (#:key inputs outputs #:allow-other-keys)
            (let ((out (assoc-ref outputs "out"))
                  (libx11 (assoc-ref inputs "libx11")))
              (substitute* "configure"
                (("#! /bin/sh") (string-append "#!" (which "sh"))))
              (setenv "SHELL" (which "bash"))
              (setenv "CONFIG_SHELL" (which "bash"))
              (invoke "./configure"
                      (string-append "--extra-cflags=-I"
                                     libx11 "/include") ; to detect libx11
                      "--disable-ffmpeg_a" ; disables bundled ffmpeg
                      (string-append "--prefix=" out)
                      ;; Enable runtime cpu detection where supported,
                      ;; and choose a suitable target.
                      ,@(match (or (%current-target-system)
                                   (%current-system))
                          ("x86_64-linux"
                           '("--enable-runtime-cpudetection"
                             "--target=x86_64-linux"))
                          ("i686-linux"
                           '("--enable-runtime-cpudetection"
                             "--target=i686-linux"))
                          ("mips64el-linux"
                           '("--target=mips3-linux"))
                          (_ (list (string-append
                                    "--target="
                                    (or (%current-target-system)
                                        (nix-system->gnu-triplet
                                         (%current-system)))))))
                      "--disable-iwmmxt")))))))
    (home-page "https://www.mplayerhq.hu")
    (synopsis "Audio and video player")
    (description "MPlayer is a movie player.  It plays most MPEG/VOB, AVI,
Ogg/OGM, VIVO, ASF/WMA/WMV, QT/MOV/MP4, RealMedia, Matroska, NUT,
NuppelVideo, FLI, YUV4MPEG, FILM, RoQ, PVA files.  One can watch VideoCD,
SVCD, DVD, 3ivx, DivX 3/4/5, WMV and H.264 movies.")
    (license license:gpl2)))

(define-public mpv
  (package
    (name "mpv")
    (version "0.33.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mpv-player/mpv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "06rw1f55zcsj78ql8w70j9ljp2qb1pv594xj7q9cmq7i92a7hq45"))))
    (build-system waf-build-system)
    (native-inputs
     `(("perl" ,perl) ; for zsh completion file
       ("pkg-config" ,pkg-config)
       ("python-docutils" ,python-docutils)))
    ;; Missing features: libguess, V4L2
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("enca" ,enca)
       ("ffmpeg" ,ffmpeg)
       ("jack" ,jack-1)
       ("ladspa" ,ladspa)
       ("lcms" ,lcms)
       ("libass" ,libass)
       ("libbluray" ,libbluray)
       ("libcaca" ,libcaca)
       ("libbs2b" ,libbs2b)
       ("libcdio-paranoia" ,libcdio-paranoia)
       ("libdvdread" ,libdvdread)
       ("libdvdnav" ,libdvdnav)
       ("libjpeg" ,libjpeg-turbo)
       ("libva" ,libva)
       ("libvdpau" ,libvdpau)
       ("libx11" ,libx11)
       ("libxext" ,libxext)
       ("libxinerama" ,libxinerama)
       ("libxrandr" ,libxrandr)
       ("libxscrnsaver" ,libxscrnsaver)
       ("libxv" ,libxv)
       ;; XXX: lua > 5.2 is not currently supported; see
       ;; waftools/checks/custom.py
       ("lua" ,lua-5.2)
       ("mesa" ,mesa)
       ("mpg123" ,mpg123)
       ("pulseaudio" ,pulseaudio)
       ("rsound" ,rsound)
       ("shaderc" ,shaderc)
       ("vulkan-headers" ,vulkan-headers)
       ("vulkan-loader" ,vulkan-loader)
       ("waf" ,python-waf)
       ("wayland" ,wayland)
       ("wayland-protocols" ,wayland-protocols)
       ("libxkbcommon" ,libxkbcommon)
       ("youtube-dl" ,youtube-dl)
       ("zlib" ,zlib)))
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after
          'unpack 'patch-paths
          (lambda* (#:key inputs #:allow-other-keys)
            (let ((ytdl (assoc-ref inputs "youtube-dl")))
              (substitute* "player/lua/ytdl_hook.lua"
                (("\"youtube-dl\",")
                 (string-append "\"" ytdl "/bin/youtube-dl\",")))
              #t)))
         (add-before 'configure 'build-reproducibly
           (lambda _
             ;; Somewhere in the build system library dependencies are enumerated
             ;; and passed as linker flags, but the order in which they are added
             ;; varies.  See <https://github.com/mpv-player/mpv/issues/7855>.
             ;; Set PYTHONHASHSEED as a workaround for deterministic results.
             (setenv "PYTHONHASHSEED" "1")
             #t))
         (add-before
          'configure 'setup-waf
          (lambda* (#:key inputs #:allow-other-keys)
            (let ((waf (assoc-ref inputs "waf")))
              (copy-file (string-append waf "/bin/waf") "waf"))
            (setenv "CC" "gcc")
            #t)))
       #:configure-flags (list "--enable-libmpv-shared"
                               "--enable-cdda"
                               "--enable-dvdnav"
                               "--disable-build-date")
       ;; No check function defined.
       #:tests? #f))
    (home-page "https://mpv.io/")
    (synopsis "Audio and video player")
    (description "mpv is a general-purpose audio and video player.  It is a
fork of mplayer2 and MPlayer.  It shares some features with the former
projects while introducing many more.")
    (license license:gpl2+)))

(define-public gnome-mpv
  (deprecated-package "gnome-mpv" celluloid))

(define-public mpv-mpris
  (package
    (name "mpv-mpris")
    (version "0.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/hoyon/mpv-mpris")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "07p6li5z38pkfd40029ag2jqx917vyl3ng5p2i4v5a0af14slcnk"))))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("mpris.so" "lib/"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'install 'build
           (lambda _
             (setenv "CC" (which "gcc"))
             (invoke "make"))))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("glib" ,glib)
       ("mpv" ,mpv)))
    (home-page "https://github.com/hoyon/mpv-mpris")
    (synopsis "MPRIS plugin for mpv")
    (description "This package provides an @dfn{MPRIS} (Media Player Remote
Interfacing Specification) plugin for the @code{mpv} media player.  It implements
@code{org.mpris.MediaPlayer2} and @code{org.mpris.MediaPlayer2.Player} D-Bus
interfaces.

To load this plugin, specify the following option when starting mpv:
@code{--script $GUIX_PROFILE/lib/mpris.so} or link it into
@file{$HOME/.config/mpv/scripts}.")
    (license license:expat)))

(define-public libvpx
  (package
    (name "libvpx")
    (version "1.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://chromium.googlesource.com/webm/libvpx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "16xv6ambc82g14h1y0q1vyy57wp6j9fbp0nk0wd5csnrw407rhry"))
              (patches (search-patches "libvpx-CVE-2016-2818.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags (list "--enable-shared"
                               "--disable-static"
                               "--as=yasm"
                               ;; Limit size to avoid CVE-2015-1258
                               "--size-limit=16384x16384"
                               (string-append "--prefix=" (assoc-ref %outputs "out")))
       #:make-flags  (list (string-append "LDFLAGS=-Wl,-rpath="
                                          (assoc-ref %outputs "out") "/lib"))
       #:phases (modify-phases %standard-phases
                  (replace 'configure
                    (lambda* (#:key configure-flags #:allow-other-keys)
                      ;; The configure script does not understand some of the GNU
                      ;; options, so we only add the flags specified above.
                      (apply invoke  "./configure" configure-flags))))

       ;; XXX: The test suite wants to download 871 files from a cloud storage
       ;; service (see test/test-data.sha1).  It is possible to specify a
       ;; custom directory, but there seems to be no tarball with all files.
       #:tests? #f))
    (native-inputs
     `(("perl" ,perl)
       ("yasm" ,yasm)))
    (synopsis "VP8/VP9 video codec")
    (description "libvpx is a codec for the VP8/VP9 video compression format.")
    (license license:bsd-3)
    (home-page "https://www.webmproject.org/")))

(define-public youtube-dl
  (package
    (name "youtube-dl")
    (version "2021.05.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://youtube-dl.org/downloads/latest/"
                                  "youtube-dl-" version ".tar.gz"))
              (sha256
               (base32
                "1z8sdzvkxhscnzy7cnjag308glif0k8jylr11biqwzypm1f2l0fl"))
              (snippet
               '(begin
                  ;; Delete the pre-generated files, except for the man page
                  ;; which requires 'pandoc' to build.
                  (for-each delete-file '("youtube-dl"
                                          ;;pandoc is needed to generate
                                          ;;"youtube-dl.1"
                                          "youtube-dl.bash-completion"
                                          "youtube-dl.fish"
                                          "youtube-dl.zsh"))
                  #t))))
    (build-system python-build-system)
    (arguments
     ;; The problem here is that the directory for the man page and completion
     ;; files is relative, and for some reason, setup.py uses the
     ;; auto-detected sys.prefix instead of the user-defined "--prefix=FOO".
     ;; So, we need pass the prefix directly.  In addition, make sure the Bash
     ;; completion file is called 'youtube-dl' rather than
     ;; 'youtube-dl.bash-completion'.
     `(#:tests? #f ; Many tests fail. The test suite can be run with pytest.
       #:phases (modify-phases %standard-phases
                  (add-after 'unpack 'default-to-the-ffmpeg-input
                    (lambda _
                      ;; See <https://issues.guix.gnu.org/43418#5>.
                      ;; ffmpeg is big but required to request free formats
                      ;; from, e.g., YouTube so pull it in unconditionally.
                      ;; Continue respecting the --ffmpeg-location argument.
                      (substitute* "youtube_dl/postprocessor/ffmpeg.py"
                        (("\\.get\\('ffmpeg_location'\\)" match)
                         (format #f "~a or '~a'" match (which "ffmpeg"))))
                      #t))
                  (add-before 'build 'build-generated-files
                    (lambda _
                      ;; Avoid the make targets that require pandoc.
                      (invoke "make"
                              "PYTHON=python"
                              "youtube-dl"
                              ;;"youtube-dl.1"   ; needs pandoc
                              "youtube-dl.bash-completion"
                              "youtube-dl.zsh"
                              "youtube-dl.fish")))
                  (add-before 'install 'fix-the-data-directories
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let ((prefix (assoc-ref outputs "out")))
                        (mkdir "bash-completion")
                        (rename-file "youtube-dl.bash-completion"
                                     "bash-completion/youtube-dl")
                        (substitute* "setup.py"
                          (("youtube-dl\\.bash-completion")
                           "bash-completion/youtube-dl")
                          (("'etc/")
                           (string-append "'" prefix "/etc/"))
                          (("'share/")
                           (string-append "'" prefix "/share/")))
                        #t)))
                  (add-after 'install 'install-completion
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (zsh (string-append out
                                                 "/share/zsh/site-functions")))
                        (mkdir-p zsh)
                        (copy-file "youtube-dl.zsh"
                                   (string-append zsh "/_youtube-dl"))
                        #t))))))
    (native-inputs
     `(("zip" ,zip)))
    (inputs
     `(("ffmpeg" ,ffmpeg)))
    (synopsis "Download videos from YouTube.com and other sites")
    (description
     "Youtube-dl is a small command-line program to download videos from
YouTube.com and many more sites.")
    (home-page "https://yt-dl.org")
    (license license:public-domain)))

(define-public youtube-dl-gui
  (package
    (name "youtube-dl-gui")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Youtube-DLG" version))
       (sha256
        (base32
         "0napxwzgls5ik1bxbp99vly32l23xpc4ng5kr24hfhf21ypjyadb"))))
    (build-system python-build-system)
    (arguments
     ;; In Guix, wxpython has not yet been packaged for Python 3.
     `(#:python ,python-2
       ;; This package has no tests.
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'patch-source
           (lambda* (#:key inputs #:allow-other-keys)
             ;; The youtube-dl-gui program lets you configure options.  Some of
             ;; them are problematic, so we change their defaults.
             (substitute* "youtube_dl_gui/optionsmanager.py"
               ;; When this is true, the builder process will try (and fail) to
               ;; write logs to the builder user's home directory.
               (("'enable_log': True") "'enable_log': False")
               ;; This determines which youtube-dl program youtube-dl-gui will
               ;; run.  If we don't set this, then youtube-dl-gui might download
               ;; an arbitrary copy from the Internet into the user's home
               ;; directory and run it, so let's make sure youtube-dl-gui uses
               ;; the youtube-dl from the inputs by default.
               (("'youtubedl_path': self.config_path")
                (string-append "'youtubedl_path': '"
                               (assoc-ref inputs "youtube-dl")
                               "/bin'"))
               ;; When this is True, when youtube-dl-gui is finished downloading
               ;; a file, it will try (and possibly fail) to open the directory
               ;; containing the downloaded file.  This can fail because it
               ;; assumes that xdg-open is in PATH.  Unfortunately, simply
               ;; adding xdg-utils to the propagated inputs is not enough to
               ;; make this work, so for now we set the default to False.
               (("'open_dl_dir': True") "'open_dl_dir': False"))
             ;; The youtube-dl program from the inputs is actually a wrapper
             ;; script written in bash, so attempting to invoke it as a python
             ;; script will fail.
             (substitute* "youtube_dl_gui/downloaders.py"
               (("cmd = \\['python', self\\.youtubedl_path\\]")
                "cmd = [self.youtubedl_path]"))
             ;; Use relative paths for installing data files so youtube-dl-gui
             ;; installs the files relative to its prefix in the store, rather
             ;; than relative to /.  Also, instead of installing data files into
             ;; $prefix/usr/share, install them into $prefix/share for
             ;; consistency (see: (standards) Directory Variables).
             (substitute* "setup.py"
               (("= '/usr/share") "= 'share"))
             ;; Update get_locale_file() so it finds the installed localization
             ;; files.
             (substitute* "youtube_dl_gui/utils.py"
               (("os\\.path\\.join\\('/usr', 'share'")
                (string-append "os.path.join('"
                               (assoc-ref %outputs "out")
                               "', 'share'")))
             #t))
         (add-after 'install 'create-desktop-file
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (applications (string-append out "/share/applications")))
               (mkdir-p applications)
               (call-with-output-file
                   (string-append applications "/youtube-dl-gui.desktop")
                 (lambda (file)
                   (format
                    file
                    "[Desktop Entry]~@
                     Name=Youtube-dl GUI~@
                     Comment=Graphical interface to download video with youtube-dl~@
                     Exec=youtube-dl-gui~@
                     TryExec=youtube-dl-gui~@
                     Terminal=false~@
                     Icon=youtube-dl-gui~@
                     Type=Application~@
                     Categories=AudioVideo;Audio;Video;Network~%")))
               #t))))))
    (inputs
     `(("python2-wxpython" ,python2-wxpython)
       ("youtube-dl" ,youtube-dl)))
    (home-page "https://github.com/MrS0m30n3/youtube-dl-gui")
    (synopsis
     "GUI (Graphical User Interface) for @command{youtube-dl}")
    (description
     "Youtube-dlG is a GUI (Graphical User Interface) for
@command{youtube-dl}.  You can use it to download videos from YouTube and any
other site that youtube-dl supports.")
    (license license:unlicense)))

(define-public you-get
  (package
    (name "you-get")
    (version "0.4.1500")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/soimort/you-get")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "02wkmq6bjg9iz0kccsgs192aiky99l2jnw1xs6zjhvjvq7jyvf7s"))))
    (build-system python-build-system)
    (inputs
     `(("ffmpeg" ,ffmpeg)))             ; for multi-part and >=1080p videos
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'qualify-input-references
           ;; Explicitly invoke the input ffmpeg, instead of whichever one
           ;; happens to be in the user's $PATH at run time.
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((ffmpeg (string-append (assoc-ref inputs "ffmpeg")
                                          "/bin/ffmpeg")))
               (substitute* "src/you_get/processor/ffmpeg.py"
                 ;; Don't blindly replace all occurrences of ‘'ffmpeg'’: the
                 ;; same string is also used when sniffing ffmpeg's output.
                 (("(FFMPEG == |\\()'ffmpeg'" _ prefix)
                  (string-append prefix "'" ffmpeg "'")))
               #t))))
       #:tests? #f))                    ; XXX some tests need Internet access
    (synopsis "Download videos, audio, or images from Web sites")
    (description
     "You-Get is a command-line utility to download media contents (videos,
audio, images) from the Web.  It can use either mpv or vlc for playback.")
    (home-page "https://you-get.org/")
    (license license:expat)))

(define-public youtube-viewer
  (package
    (name "youtube-viewer")
    (version "3.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trizen/youtube-viewer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0xdybiihd66b79rbsawjhxs9snm78gld5ziz3gnp8vdcw0bshwz7"))))
    (build-system perl-build-system)
    (native-inputs
     `(("perl-module-build" ,perl-module-build)))
    (inputs
     `(("perl-data-dump" ,perl-data-dump)
       ("perl-file-sharedir" ,perl-file-sharedir)
       ("perl-gtk2" ,perl-gtk2)
       ("perl-json" ,perl-json)
       ("perl-json-xs" ,perl-json-xs)
       ("perl-libwww" ,perl-libwww)
       ("perl-lwp-protocol-https" ,perl-lwp-protocol-https)
       ("perl-lwp-useragent-cached" ,perl-lwp-useragent-cached)
       ("perl-memoize" ,perl-memoize)
       ("perl-mozilla-ca" ,perl-mozilla-ca)
       ("perl-term-readline-gnu" ,perl-term-readline-gnu)
       ("perl-unicode-linebreak" ,perl-unicode-linebreak)
       ("xdg-utils" ,xdg-utils)

       ;; Some videos play without youtube-dl, but others silently fail to.
       ("youtube-dl" ,youtube-dl)))
    (arguments
     `(#:modules ((guix build perl-build-system)
                  (guix build utils)
                  (srfi srfi-26))
       ;; gtk-2/3 variants are both installed by default but the gtk3 variant
       ;; is broken without perl-gtk3.
       #:module-build-flags '("--gtk2")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'refer-to-inputs
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "lib/WWW/YoutubeViewer.pm"
               (("'youtube-dl'")
                (format #f "'~a/bin/youtube-dl'"
                        (assoc-ref inputs "youtube-dl"))))
             (substitute* '("bin/gtk2-youtube-viewer"
                            "bin/gtk3-youtube-viewer")
               (("'xdg-open'")
                (format #f "'~a/bin/xdg-open'"
                        (assoc-ref inputs "xdg-utils"))))
             #t))
         (add-after 'install 'install-desktop
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (sharedir (string-append out "/share")))
               (install-file "share/gtk-youtube-viewer.desktop"
                             (string-append sharedir "/applications"))
               (install-file "share/icons/gtk-youtube-viewer.png"
                             (string-append sharedir "/pixmaps"))
               #t)))
         (add-after 'install 'wrap-program
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin-dir (string-append out "/bin/"))
                    (site-dir (string-append out "/lib/perl5/site_perl/"))
                    (lib-path (getenv "PERL5LIB")))
               (for-each (cut wrap-program <>
                              `("PERL5LIB" ":" prefix (,lib-path ,site-dir)))
                         (find-files bin-dir))
               #t))))))
    (synopsis
     "Lightweight application for searching and streaming videos from YouTube")
    (description
     "Youtube-viewer searches and plays YouTube videos in a native player.
It comes with various search options; it can search for videos, playlists
and/or channels.  The videos are streamed directly in a selected video player
at the best resolution (customizable) and with closed-captions (if available).
Both command-line and GTK2 interface are available.")
    (home-page "https://github.com/trizen/youtube-viewer")
    (license license:perl-license)))

(define-public libbluray
  (package
    (name "libbluray")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.videolan.org/videolan/"
                                  name "/" version "/"
                                  name "-" version ".tar.bz2"))
              (sha256
               (base32
                "1zxfnw1xbghcj7b3zz5djndv6gwssxda19cz1lrlqrkg8577r7kd"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags '("--disable-bdjava-jar"
                           "--disable-static")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'refer-to-libxml2-in-.pc-file
           ;; Avoid the need to propagate libxml2 by referring to it
           ;; directly, as is already done for fontconfig & freetype.
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((libxml2 (assoc-ref inputs "libxml2")))
               (substitute* "configure"
                 ((" libxml-2.0") ""))
               (substitute* "src/libbluray.pc.in"
                 (("^Libs.private:" field)
                  (string-append field " -L" libxml2 "/lib -lxml2")))
               #t)))
         (add-before 'build 'fix-dlopen-paths
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((libaacs (assoc-ref inputs "libaacs"))
                   (libbdplus (assoc-ref inputs "libbdplus")))
               (substitute* "src/libbluray/disc/aacs.c"
                 (("\"libaacs\"")
                  (string-append "\"" libaacs "/lib/libaacs\"")))
               (substitute* "src/libbluray/disc/bdplus.c"
                 (("\"libbdplus\"")
                  (string-append "\"" libbdplus "/lib/libbdplus\"")))
               #t))))))
    (native-inputs `(("pkg-config" ,pkg-config)))
    (inputs
     `(("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("libaacs" ,libaacs)
       ("libbdplus" ,libbdplus)
       ("libxml2" ,libxml2)))
    (home-page "https://www.videolan.org/developers/libbluray.html")
    (synopsis "Blu-Ray Disc playback library")
    (description
     "libbluray is a library designed for Blu-Ray Disc playback for media
players, like VLC or MPlayer.")
    (license license:lgpl2.1+)))

(define-public libdvdread
  (package
    (name "libdvdread")
    (version "6.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.videolan.org/videolan/"
                                  "libdvdread/" version "/"
                                  "libdvdread-" version ".tar.bz2"))
              (sha256
               (base32
                "1c7yqqn67m3y3n7nfrgrnzz034zjaw5caijbwbfrq89v46ph257r"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags '("--with-libdvdcss=yes")))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (propagated-inputs
     `(("libdvdcss" ,libdvdcss)))
    (home-page "http://dvdnav.mplayerhq.hu/")
    (synopsis "Library for reading video DVDs")
    (description
     "Libdvdread provides a simple foundation for reading DVD video
disks.  It provides the functionality that is required to access many
DVDs.  It parses IFO files, reads NAV-blocks, and performs CSS
authentication and descrambling (if an external libdvdcss library is
installed).")
    (license license:gpl2+)))

(define-public dvdauthor
  (package
    (name "dvdauthor")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/dvdauthor/dvdauthor-"
                           version ".tar.gz"))
       (sha256
        (base32
         "1drfc47hikfzc9d7hjk34rw10iqw01d2vwmn91pv73ppx4nsj81h"))))
    (build-system gnu-build-system)
    (inputs
     `(("libdvdread" ,libdvdread)
       ("libpng" ,libpng)
       ("imagemagick" ,imagemagick)
       ("libxml2" ,libxml2)
       ("freetype" ,freetype)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (synopsis "Generates a DVD-Video movie from a MPEG-2 stream")
    (description "@command{dvdauthor} will generate a DVD-Video movie from a
MPEG-2 stream containing VOB packets.")
    (home-page "http://dvdauthor.sourceforge.net")
    (license license:gpl3+)))

(define-public libdvdnav
  (package
    (name "libdvdnav")
    (version "6.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.videolan.org/videolan/"
                                  "libdvdnav/" version "/"
                                  "libdvdnav-" version ".tar.bz2"))
              (sha256
               (base32
                "0cv7j8irsv1n2dadlnhr6i1b8pann2ah6xpxic41f04my6ba6rp5"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("libdvdread" ,libdvdread)))
    (home-page "http://dvdnav.mplayerhq.hu/")
    (synopsis "Library for video DVD navigation features")
    (description
     "Libdvdnav is a library for developers of multimedia
applications.  It allows easy use of sophisticated DVD navigation features
such as DVD menus, multiangle playback and even interactive DVD games.  All
this functionality is provided through a simple API which provides the DVD
playback as a single logical stream of blocks, intermitted by special
dvdnav events to report certain conditions.  The main usage of libdvdnav is
a loop regularly calling a function to get the next block, surrounded by
additional calls to tell the library of user interaction.  The whole
DVD virtual machine and internal playback states are completely
encapsulated.")
    (license license:gpl2+)))

(define-public libdvdcss
  (package
    (name "libdvdcss")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.videolan.org/pub/"
                                  name "/" version "/"
                                  name "-" version ".tar.bz2"))
              (sha256
               (base32
                "0y800y33spblb20s1lsjbaiybknmwwmmiczmjqx5s760blpwjg13"))))
    (build-system gnu-build-system)
    (home-page "https://www.videolan.org/developers/libdvdcss.html")
    (synopsis "Library for accessing DVDs as block devices")
    (description
     "libdvdcss is a simple library designed for accessing DVDs like a block
device without having to bother about the decryption.")
    (license license:gpl2+)))

(define-public srt2vtt
  (package
    (name "srt2vtt")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.dthompson.us/srt2vtt/srt2vtt-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1ravl635x81fcai4h2xnsn926i69pafgr6zkghq6319iprkw8ffv"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'wrap-srt2vtt
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out  (assoc-ref outputs "out"))
                    (bin  (string-append out "/bin"))
                    (version ,(let ((v (package-version guile-3.0)))
                                (string-append (car (string-split v #\.))
                                               ".0")))
                    (site (string-append out "/share/guile/site/" version))
                    (compiled (string-append
                               out "/lib/guile/" version
                               "/site-ccache")))
               (wrap-program (string-append bin "/srt2vtt")
                 `("GUILE_LOAD_PATH" ":" prefix (,site))
                 `("GUILE_LOAD_COMPILED_PATH" ":" prefix (,compiled)))))))))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("guile" ,guile-3.0)))
    (synopsis "SubRip to WebVTT subtitle converter")
    (description "srt2vtt converts SubRip formatted subtitles to WebVTT format
for use with HTML5 video.")
    (home-page "https://dthompson.us/projects/srt2vtt.html")
    (license license:gpl3+)))

(define-public avidemux
  (package
    (name "avidemux")
    (version "2.7.8")
    (source (origin
             (method url-fetch)
             (uri (string-append
                   "mirror://sourceforge/avidemux/avidemux/" version "/"
                   "avidemux_" version ".tar.gz"))
             (sha256
              (base32
               "00blv5455ry3bb86zyzk1xmq3rbqmbif62khc0kq3whza97l12k2"))
             (patches (search-patches "avidemux-install-to-lib.patch"))))
    (build-system cmake-build-system)
    (native-inputs
     `(("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)
       ("qttools" ,qttools)
       ("yasm" ,yasm)))
    ;; FIXME: Once packaged, add libraries not found during the build.
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("fribidi" ,fribidi)
       ("glu" ,glu)
       ("jack" ,jack-1)
       ("lame" ,lame)
       ("libaom" ,libaom)
       ("libva" ,libva)
       ("libvdpau" ,libvdpau)
       ("libvorbis" ,libvorbis)
       ("libvpx" ,libvpx)
       ("libxv" ,libxv)
       ("pulseaudio" ,pulseaudio)
       ("qtbase" ,qtbase-5)
       ("sqlite" ,sqlite)
       ("zlib" ,zlib)))
    (arguments
     `(#:tests? #f                      ; no check target
       #:phases
       ;; Make sure files inside the included ffmpeg tarball are
       ;; patch-shebanged.
       (let ((ffmpeg "ffmpeg-4.2.4"))
         (modify-phases %standard-phases
           (add-before 'patch-source-shebangs 'unpack-ffmpeg
             (lambda _
               (with-directory-excursion "avidemux_core/ffmpeg_package"
                 (invoke "tar" "xf" (string-append ffmpeg ".tar.bz2"))
                 (delete-file (string-append ffmpeg ".tar.bz2")))
               #t))
           (add-after 'patch-source-shebangs 'repack-ffmpeg
             (lambda _
               (with-directory-excursion "avidemux_core/ffmpeg_package"
                 (substitute* (string-append ffmpeg "/configure")
                   (("#! /bin/sh") (string-append "#!" (which "sh"))))
                 (invoke "tar" "cjf" (string-append ffmpeg ".tar.bz2") ffmpeg
                         ;; avoid non-determinism in the archive
                         "--sort=name" "--mtime=@0"
                         "--owner=root:0" "--group=root:0")
                 (delete-file-recursively ffmpeg))
               #t))
           (replace 'configure
             (lambda _
               ;; Copy-paste settings from the cmake build system.
               (setenv "CMAKE_LIBRARY_PATH" (getenv "LIBRARY_PATH"))
               (setenv "CMAKE_INCLUDE_PATH" (getenv "C_INCLUDE_PATH"))
               #t))
           (replace 'build
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (lib (string-append out "/lib"))
                      (top (getcwd))
                      (build_component
                       (lambda* (component srcdir #:optional (args '()))
                         (let ((builddir (string-append "build_" component)))
                           (mkdir builddir)
                           (with-directory-excursion builddir
                             (apply invoke "cmake"
                                    "-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE"
                                    (string-append "-DCMAKE_INSTALL_PREFIX=" out)
                                    (string-append "-DCMAKE_INSTALL_RPATH=" lib)
                                    (string-append "-DCMAKE_SHARED_LINKER_FLAGS="
                                                   "\"-Wl,-rpath=" lib "\"")
                                    (string-append "-DAVIDEMUX_SOURCE_DIR=" top)
                                    (string-append "../" srcdir)
                                    "-DENABLE_QT5=True"
                                    args)
                             (invoke "make" "-j"
                                     (number->string (parallel-job-count)))
                             (invoke "make" "install"))))))
                 (mkdir out)
                 (build_component "core" "avidemux_core")
                 (build_component "cli" "avidemux/cli")
                 (build_component "qt4" "avidemux/qt4")
                 (build_component "plugins_common" "avidemux_plugins"
                                  '("-DPLUGIN_UI=COMMON"))
                 (build_component "plugins_cli" "avidemux_plugins"
                                  '("-DPLUGIN_UI=CLI"))
                 (build_component "plugins_qt4" "avidemux_plugins"
                                  '("-DPLUGIN_UI=QT4"))
                 (build_component "plugins_settings" "avidemux_plugins"
                                  '("-DPLUGIN_UI=SETTINGS"))
                 ;; Remove .exe and .dll file.
                 (delete-file-recursively
                  (string-append out "/share/ADM6_addons"))
                 #t)))
           (delete 'install)))))
    (home-page "http://fixounet.free.fr/avidemux/")
    (synopsis "Video editor")
    (description "Avidemux is a video editor designed for simple cutting,
filtering and encoding tasks.  It supports many file types, including AVI,
DVD compatible MPEG files, MP4 and ASF, using a variety of codecs.  Tasks
can be automated using projects, job queue and powerful scripting
capabilities.")
    (supported-systems '("x86_64-linux" "i686-linux" "armhf-linux"))
    ;; Software with various licenses is included, see License.txt.
    (license license:gpl2+)))

(define-public vapoursynth
  (package
    (name "vapoursynth")
    (version "52")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vapoursynth/vapoursynth")
                    (commit (string-append "R" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1krfdzc2x2vxv4nq9kiv1c09hgj525qn120ah91fw2ikq8ldvmx4"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("cython" ,python-cython)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)
       ("python" ,python)
       ("yasm" ,yasm)))
    (inputs
     `(("ffmpeg" ,ffmpeg)
       ("libass" ,libass)
       ("tesseract-ocr" ,tesseract-ocr)
       ("zimg" ,zimg)))
    (home-page "http://www.vapoursynth.com/")
    (synopsis "Video processing framework")
    (description "VapourSynth is a C++ library and Python module for video
manipulation.  It aims to be a modern rewrite of Avisynth, supporting
multithreading, generalized colorspaces, per frame properties, and videos with
format changes.")
    ;; src/core/cpufeatures only allows x86, ARM or PPC
    (supported-systems (fold delete %supported-systems
                             '("mips64el-linux" "aarch64-linux")))
    ;; As seen from the source files.
    (license license:lgpl2.1+)))

(define-public xvid
  (package
    (name "xvid")
    (version "1.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://downloads.xvid.com/downloads/xvidcore-"
                    version ".tar.bz2"))
              (sha256
               (base32
                "1xyg3amgg27zf7188kss7y248s0xhh1vv8rrk0j9bcsd5nasxsmf"))))
    (build-system gnu-build-system)
    (native-inputs `(("yasm" ,yasm)))
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'pre-configure
          (lambda _
            (chdir "build/generic")
            (substitute* "configure"
              (("#! /bin/sh") (string-append "#!" (which "sh"))))
            #t)))
       #:tests? #f)) ; no test suite
    (home-page "https://www.xvid.com/")
    (synopsis "MPEG-4 Part 2 Advanced Simple Profile video codec")
    (description "Xvid is an MPEG-4 Part 2 Advanced Simple Profile (ASP) video
codec library.  It uses ASP features such as b-frames, global and quarter
pixel motion compensation, lumi masking, trellis quantization, and H.263, MPEG
and custom quantization matrices.")
    (license license:gpl2+)))

(define-public streamlink
  (package
    (name "streamlink")
    (version "2.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "streamlink" version))
        (sha256
         (base32
          "1nv2kj1k42a1b20ws8sdzlxk3wh1qz6pg5mxp75433b3c7lxksn0"))))
    (build-system python-build-system)
    (home-page "https://github.com/streamlink/streamlink")
    (native-inputs
     `(("python-freezegun" ,python-freezegun)
       ("python-pytest" ,python-pytest)
       ("python-mock" ,python-mock)
       ("python-requests-mock" ,python-requests-mock)))
    (propagated-inputs
     `(("python-pysocks" ,python-pysocks)
       ("python-websocket-client" ,python-websocket-client)
       ("python-iso3166" ,python-iso3166)
       ("python-iso639" ,python-iso639)
       ("python-isodate" ,python-isodate)
       ("python-pycryptodome" ,python-pycryptodome)
       ("python-requests" ,python-requests)
       ("python-urllib3" ,python-urllib3)))
    (synopsis "Extract streams from various services")
    (description "Streamlink is command-line utility that extracts streams
from sites like Twitch.tv and pipes them into a video player of choice.")
    (license license:bsd-2)))

(define-public twitchy
  (let ((commit "9beb36d80b16662414129693e74fa3a2fd97554e")) ; 3.4 has no tag
    (package
      (name "twitchy")
      (version (git-version "3.4" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/BasioMeusPuga/twitchy")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0di03h1j9ipp2bbnxxlxz07v87icyg2hmnsr4s7184z5ql8kpzr7"))))
      (build-system python-build-system)
      (arguments
       '(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'patch-paths
             (lambda* (#:key inputs #:allow-other-keys)
               (substitute* "twitchy/twitchy_play.py"
                 (("\"streamlink ")
                  (string-append "\"" (assoc-ref inputs "streamlink")
                                 "/bin/streamlink ")))
               #t))
           (add-before 'check 'check-setup
             (lambda _
               (setenv "HOME" (getcwd)) ;Needs to write to ‘$HOME’.
               #t))
           (add-after 'install 'install-rofi-plugin
             (lambda* (#:key outputs #:allow-other-keys)
               (install-file "plugins/rofi-twitchy"
                             (string-append (assoc-ref outputs "out")
                                            "/bin"))
               #t)))))
      (inputs
       `(("python-requests" ,python-requests)
         ("streamlink" ,streamlink)))
      (home-page "https://github.com/BasioMeusPuga/twitchy")
      (synopsis "Command-line interface for Twitch.tv")
      (description
       "This package provides a command-line interface for Twitch.tv")
      (license license:gpl3+))))

(define-public mlt
  (package
    (name "mlt")
    (version "6.22.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mltframework/mlt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0jxv848ykw0csbnayrd710ylw46m0picfv7rpzsxz1vh4jzs395k"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:make-flags '("CC=gcc" "CXX=g++")
       #:configure-flags
       (list "--enable-gpl3"
             "--enable-gpl")
       #:phases
       (modify-phases %standard-phases
         (add-after
             'configure 'override-LDFLAGS
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "config.mak"
               (("LDFLAGS\\+=")
                (string-append "LDFLAGS+=-Wl,-rpath="
                               (assoc-ref outputs "out")
                               "/lib ")))
             #t)))))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("ffmpeg" ,ffmpeg)
       ("fftw" ,fftw)
       ("frei0r-plugins" ,frei0r-plugins)
       ("gdk-pixbuf" ,gdk-pixbuf)
       ("gtk+" ,gtk+-2)
       ("libxml2" ,libxml2)
       ("jack" ,jack-1)
       ("ladspa" ,ladspa)
       ("libexif" ,libexif)
       ("libvorbis" ,libvorbis)
       ("rubberband" ,rubberband)
       ("libsamplerate" ,libsamplerate)
       ("pulseaudio" ,pulseaudio)
       ("qtbase" ,qtbase-5)
       ("qtsvg" ,qtsvg-5)
       ("sdl" ,sdl)
       ("sox" ,sox)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://www.mltframework.org/")
    (synopsis "Author, manage, and run multitrack audio/video compositions")
    (description
     "MLT is a multimedia framework, designed and developed for television
broadcasting.  It provides a toolkit for broadcasters, video editors, media
players, transcoders, web streamers and many more types of applications.  The
functionality of the system is provided via an assortment of ready to use
tools, XML authoring components, and an extensible plug-in based API.")
    (license license:gpl3)))

(define-public v4l-utils
  (package
    (name "v4l-utils")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://linuxtv.org/downloads/v4l-utils"
                                  "/v4l-utils-" version ".tar.bz2"))
              (sha256
               (base32
                "1xr66y6w422hil6s7n8d61a2vhwh4im8l267amf41jvw7xqihqcm"))))
    (build-system gnu-build-system)
    ;; Separate graphical tools in order to save almost 1 GiB on the closure
    ;; for the common case.
    (outputs '("out" "gui"))
    (arguments
     '(#:configure-flags
       (list "--disable-static"
             (string-append "--with-udevdir="
                            (assoc-ref %outputs "out")
                            "/lib/udev"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'split
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (gui (assoc-ref outputs "gui")))
               (mkdir-p (string-append gui "/bin"))
               (mkdir-p (string-append gui "/share/man/man1"))
               (mkdir-p (string-append gui "/share/applications"))
               (for-each
                (lambda (prog)
                  (for-each
                   (lambda (file)
                     (rename-file (string-append out file)
                                  (string-append gui file)))
                   (list
                    (string-append "/bin/" prog)
                    (string-append "/share/man/man1/" prog ".1")
                    (string-append "/share/applications/" prog ".desktop"))))
                '("qv4l2" "qvidcap"))
               (copy-recursively (string-append out "/share/icons")
                                 (string-append gui "/share/icons"))
               (delete-file-recursively (string-append out "/share/icons"))
               (rmdir (string-append out "/share/applications"))
               #t))))))
    (native-inputs
     `(("perl" ,perl)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("glu" ,glu)
       ("libjpeg" ,libjpeg-turbo)
       ("libx11" ,libx11)
       ("qtbase" ,qtbase-5)
       ("eudev" ,eudev)))
    (synopsis "Realtime video capture utilities for Linux")
    (description "The v4l-utils provide a series of libraries and utilities to
be used for realtime video capture via Linux-specific APIs.")
    (home-page "https://linuxtv.org/wiki/index.php/V4l-utils")
    ;; libv4l2 is LGPL2.1+, while utilities are GPL2 only.
    (license (list license:lgpl2.1+ license:gpl2))))

(define-public obs
  (package
    (name "obs")
    (version "26.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/obsproject/obs-studio")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1k1asqiqw757v59ayx0w029ril947hs0lcp8n91knzjl891fr4nc"))
              (patches
               (search-patches "obs-modules-location.patch"))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       (list (string-append "-DOBS_VERSION_OVERRIDE=" ,version)
             "-DENABLE_UNIT_TESTS=TRUE")
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'wrap-executable
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (plugin-path (getenv "QT_PLUGIN_PATH")))
               (wrap-program (string-append out "/bin/obs")
                 `("QT_PLUGIN_PATH" ":" prefix (,plugin-path))))
             #t)))))
    (native-search-paths
     (list (search-path-specification
            (variable "OBS_PLUGINS_DIRECTORY")
            (separator #f)                         ;single entry
            (files '("lib/obs-plugins")))
           (search-path-specification
            (variable "OBS_PLUGINS_DATA_DIRECTORY")
            (separator #f)                         ;single entry
            (files '("share/obs/obs-plugins")))))
    (native-inputs
     `(("cmocka" ,cmocka)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("curl" ,curl)
       ("eudev" ,eudev)
       ("ffmpeg" ,ffmpeg)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("jack" ,jack-1)
       ("jansson" ,jansson)
       ("libx264" ,libx264)
       ("libxcomposite" ,libxcomposite)
       ("mbedtls" ,mbedtls-apache)
       ("mesa" ,mesa)
       ("pulseaudio" ,pulseaudio)
       ("qtbase" ,qtbase-5)
       ("qtsvg" ,qtsvg-5)
       ("qtx11extras" ,qtx11extras-5)
       ("speexdsp" ,speexdsp)
       ("v4l-utils" ,v4l-utils)
       ("zlib" ,zlib)))
    (synopsis "Live streaming software")
    (description "Open Broadcaster Software provides a graphical interface for
video recording and live streaming.  OBS supports capturing audio and video
from many input sources such as webcams, X11 (for screencasting), PulseAudio,
and JACK.")
    (home-page "https://obsproject.com")
    (license license:gpl2+)))

(define-public obs-spectralizer
  (package
    (name "obs-spectralizer")
    (version "1.3.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/univrsal/spectralizer")
              (commit (string-append "v" version))))
        (file-name (git-file-name name version))

        ;; Remove bundled Windows DLLs.
        (snippet '(delete-file-recursively "fftw3"))
        (modules '((guix build utils)))

        (sha256
         (base32
          "0q75cnyqydpvfda51zm9gxqj3wqr99ad0lxzjhw0ld67qvj1ag6i"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f
       #:configure-flags
       (list "-DGLOBAL_INSTALLATION=ON" "-DUSE_CMAKE_LIBDIR=ON")))
    (inputs `(("obs" ,obs)
              ("fftw" ,fftw)))
    (home-page "https://github.com/univrsal/spectralizer")
    (synopsis "OBS plugin for audio visualization")
    (description "This OBS plugins allows you to vizualize MPD and internal
OBS audio sources.")
    (license license:gpl2)))

(define-public obs-websocket
  (package
    (name "obs-websocket")
    (version "4.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Palakis/obs-websocket")
             (commit version)
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r47861ma1s3998clahbnbc216wcf706b1ps514k5p28h511l5w0"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f                      ;no tests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'remove-permission-change
           (lambda* _
             (substitute* "CMakeLists.txt"
               ;; Remove lines that set writeable permissions on outputs.
               (("set\\(CMAKE_INSTALL_DEFAULT_DIRECTORY_PERMISSIONS") "")
               (("OWNER_READ.*\\)") "")
               (("PERMISSIONS") ")"))
             #t)))))
    (inputs
     `(("obs" ,obs)
       ("qtbase" ,qtbase-5)))
    (home-page "https://github.com/Palakis/obs-websocket")
    (synopsis "OBS plugin for remote control via WebSockets")
    (description "This OBS plugin allows you to establish a WebSocket channel
from within your running OBS instance so that you can control it remotely from
programs on your current machine or on other machines.")
    (license license:gpl2+)))

(define-public obs-wlrobs
  (package
    (name "obs-wlrobs")
    (version "1.0")
    (source
      (origin
        (method hg-fetch)
        (uri (hg-reference
              (url "https://hg.sr.ht/~scoopta/wlrobs")
              (changeset (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "1faiq2gdb7qis3m1hilm4pz8lkmkab75vzm608dbiazahhybf96p"))))
    (build-system meson-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (propagated-inputs `() )
    (inputs `(("obs" ,obs)
              ("libx11" ,libx11 "out")
              ("wayland" ,wayland)
              ("wayland-protocols" ,wayland-protocols)))
    (home-page "https://hg.sr.ht/~scoopta/wlrobs")
    (synopsis "OBS plugin for Wayland (wlroots) screen capture")
    (description
     "This OBS plugin allows you to capture the screen on wlroots-based
Wayland compositors.")
    (license license:gpl3+)))

(define-public libvdpau
  (package
    (name "libvdpau")
    (version "1.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://gitlab.freedesktop.org/vdpau/libvdpau.git")
              (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "1hc4mcrbr1yhfiy4zfd8wc2iiqbp90z6jswap0jia20vmyk5lqld"))))
    (build-system meson-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("libx11" ,libx11 "out")
       ("libxext" ,libxext)
       ("xorgproto" ,xorgproto)))
    (home-page "https://wiki.freedesktop.org/www/Software/VDPAU/")
    (synopsis "Video Decode and Presentation API")
    (description "VDPAU is the Video Decode and Presentation API for UNIX.  It
provides an interface to video decode acceleration and presentation hardware
present in modern GPUs.")
    (license (license:x11-style "file://COPYING"))))

(define-public vdpauinfo
  (package
    (name "vdpauinfo")
    (version "1.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://gitlab.freedesktop.org/vdpau/vdpauinfo")
              (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0s84bavxr39w0r7zfaac7kpbfsg88hgymqyzcr0yvbj1yry3liz2"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'bootstrap
           ;; ./autogen.sh runs ./configure too soon.
           (lambda _
             (invoke "autoreconf" "-fiv"))))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libx11" ,libx11)
       ("pkg-config" ,pkg-config)))
    (propagated-inputs
     `(("libvdpau" ,libvdpau)))
    (home-page "https://wiki.freedesktop.org/www/Software/VDPAU/")
    (synopsis "Tool to query the capabilities of a VDPAU implementation")
    (description "Vdpauinfo is a tool to query the capabilities of a VDPAU
implementation.")
    (license (license:x11-style "file://COPYING"))))

(define-public libvdpau-va-gl
  (package
    (name "libvdpau-va-gl")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/i-rinat/libvdpau-va-gl/"
                            "releases/download/v" version "/libvdpau-va-gl-"
                            version ".tar.gz"))
        (sha256
         (base32
          "1x2ag1f2fwa4yh1g5spv99w9x1m33hbxlqwyhm205ssq0ra234bx"))
        (patches (search-patches "libvdpau-va-gl-unbundle.patch"))
        (modules '((guix build utils)))
        (snippet '(begin (delete-file-recursively "3rdparty")
                         #t))))
    (build-system cmake-build-system)
    (arguments
     '(#:tests? #f)) ; Tests require a running X11 server, with VA-API support.
    (native-inputs
     `(("libvdpau" ,libvdpau)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("libva" ,libva)
       ("mesa" ,mesa)))
    (home-page "https://github.com/i-rinat/libvdpau-va-gl")
    (synopsis "VDPAU driver with VA-API/OpenGL backend")
    (description
     "Many applications can use VDPAU to accelerate portions of the video
decoding process and video post-processing to the GPU video hardware.  Since
there is no VDPAU available on Intel chips, they fall back to different drawing
techniques.  This driver uses OpenGL under the hood to accelerate drawing and
scaling and VA-API (if available) to accelerate video decoding.")
    (license license:expat)))

(define-public recordmydesktop
  (package
    (name "recordmydesktop")
    (version "0.3.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/" name "/" name "/"
                                  version "/recordmydesktop-" version ".tar.gz"))
              (sha256
               (base32
                "133kkl5j0r877d41bzj7kj0vf3xm8x80yyx2n8nqxrva304f58ik"))))
    (build-system gnu-build-system)
    (inputs `(("popt" ,popt)
              ("zlib" ,zlib)
              ("libx11" ,libx11)
              ("libice" ,libice)
              ("libsm" ,libsm)
              ("libxfixes" ,libxfixes)
              ("libxdamage" ,libxdamage)
              ("libxext" ,libxext)
              ("alsa-lib" ,alsa-lib)
              ("libvorbis" ,libvorbis)
              ("libtheora" ,libtheora)))
    (home-page "http://recordmydesktop.sourceforge.net/")
    (synopsis "Desktop session video recorder")
    (description
     "recordMyDesktop is a command-line tool that captures the activity in
your graphical desktop and encodes it as a video.  This is a useful tool for
making @dfn{screencasts}.")
    (license license:gpl2+)))

(define-public simplescreenrecorder
  (package
    (name "simplescreenrecorder")
    (version "0.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MaartenBaert/ssr")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1dzp5yzqlha65crzklx2qlan6ssw1diwzfpc4svd7gnr858q2292"))))
    (build-system cmake-build-system)
    ;; Although libx11, libxfixes, libxext are listed as build dependencies in
    ;; README.md, the program builds and functions properly without them.
    ;; As a result, they are omitted. Please add them back if problems appear.
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("ffmpeg" ,ffmpeg)
       ("glu" ,glu)
       ("jack" ,jack-1)
       ("libxi" ,libxi)
       ("libxinerama" ,libxinerama)
       ("pulseaudio" ,pulseaudio)
       ("qtbase" ,qtbase-5)
       ("qtx11extras" ,qtx11extras-5)))
    (native-inputs `(("pkg-config" ,pkg-config)))
    (arguments
     `(#:configure-flags
       (list "-DWITH_QT5=TRUE")
       #:tests? #f))                    ; no test suite
    ;; Using HTTPS causes part of the page to be displayed improperly.
    (home-page "https://www.maartenbaert.be/simplescreenrecorder/")
    (synopsis "Screen recorder")
    (description "SimpleScreenRecorder is an easy to use screen recorder with
a graphical user interface.  It supports recording the entire screen, or a
part of it, and allows encoding in many different codecs and file formats.
Other features include a live preview and live streaming.")
    (license (list license:gpl3+ ; most files
                   license:zlib ; glinject/elfhacks.*
                   license:isc ; glinject/*
                   license:x11)))) ; build-aux/install-sh

(define-public libsmpeg
  (package
    (name "libsmpeg")
    (version "0.4.5-401")
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                    (url "svn://svn.icculus.org/smpeg/trunk/")
                    (revision 401))) ; last revision before smpeg2 (for SDL 2.0)
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "18yfkr70lr1x1hc8snn2ldnbzdcc7b64xmkqrfk8w59gpg7sl1xn"))))
    (build-system gnu-build-system)
    (arguments
     ;; libsmpeg fails to build with -std=c++11, which is the default with
     ;; GCC 7.  Also, 'configure' does CXXFLAGS=$CFLAGS, hence this hack.
     '(#:configure-flags '("CFLAGS=-O2 -g -std=c++03")))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)))
    (inputs
     `(("sdl" ,sdl2)))
    (home-page "https://icculus.org/smpeg/")
    (synopsis "SDL MPEG decoding library")
    (description
     "SMPEG (SDL MPEG Player Library) is a free MPEG1 video player library
with sound support.  Video playback is based on the ubiquitous Berkeley MPEG
player, mpeg_play v2.2.  Audio is played through a slightly modified mpegsound
library, part of splay v0.8.2.  SMPEG supports MPEG audio (MP3), MPEG-1 video,
and MPEG system streams.")
    (license (list license:expat
                   license:lgpl2.1
                   license:lgpl2.1+
                   license:gpl2))))

;; for btanks
(define-public libsmpeg-with-sdl1
  (package (inherit libsmpeg)
    (name "libsmpeg")
    (version "0.4.5-399")
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                    (url "svn://svn.icculus.org/smpeg/trunk/")
                    (revision 399))) ; tagged release 0.4.5
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "0jfi085rf3fa5xsn0vd3nqf32my8ph9c6a9445y7a8lrlz4dms64"))))
    (inputs
     `(("sdl" ,sdl)))))

(define-public libbdplus
  (package
    (name "libbdplus")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ftp.videolan.org/pub/videolan/libbdplus/"
                           version "/" name "-" version ".tar.bz2"))
       (sha256
        (base32 "02n87lysqn4kg2qk7d1ffrp96c44zkdlxdj0n16hbgrlrpiwlcd6"))))
    (inputs
     `(("libgcrypt" ,libgcrypt)))
    (build-system gnu-build-system)
    (home-page "https://www.videolan.org/developers/libbdplus.html")
    (synopsis "Library for decrypting certain Blu-Ray discs")
    (description "libbdplus is a library which implements the BD+ System
specifications.")
    (license license:lgpl2.1+)))

(define-public libaacs
  (package
    (name "libaacs")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ftp.videolan.org/pub/videolan/libaacs/"
                           version "/libaacs-" version ".tar.bz2"))
       (sha256
        (base32 "11skjqjlldmbjkyxdcz4fmcn6y4p95r1xagbcnjy4ndnzf0l723d"))))
    (inputs
     `(("libgcrypt" ,libgcrypt)))
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)))
    (build-system gnu-build-system)
    (home-page "https://www.videolan.org/developers/libaacs.html")
    (synopsis "Library for decrypting certain Blu-Ray discs")
    (description "libaacs is a library which implements the Advanced Access
Content System specification.")
    (license license:lgpl2.1+)))

(define-public mps-youtube
  (package
    (name "mps-youtube")
    (version "0.2.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mps-youtube/mps-youtube")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1w1jhw9rg3dx7vp97cwrk5fymipkcy2wrbl1jaa38ivcjhqg596y"))))
    (build-system python-build-system)
    (arguments
     ;; Tests need to be disabled until #556 upstream is fixed. It reads as if the
     ;; test suite results differ depending on the country and also introduce
     ;; non-determinism in the tests.
     ;; https://github.com/mps-youtube/mps-youtube/issues/556
     `(#:tests? #f))
    (propagated-inputs
     `(("python-pafy" ,python-pafy)
       ("python-pygobject" ,python-pygobject))) ; For mpris2 support
    (home-page "https://github.com/mps-youtube/mps-youtube")
    (synopsis "Terminal based YouTube player and downloader")
    (description
     "@code{mps-youtube} is based on mps, a terminal based program to
search, stream and download music.  This implementation uses YouTube as
a source of content and can play and download video as well as audio.
It can use either mpv or mplayer for playback, and for conversion of
formats ffmpeg or libav is used.  Users should install one of the
supported players in addition to this package.")
    (license license:gpl3+)))

(define-public handbrake
  (package
    (name "handbrake")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/HandBrake/HandBrake/"
                                  "releases/download/" version "/"
                                  "HandBrake-" version "-source.tar.bz2"))
              (sha256
               (base32
                "11bzhyp052bmng5119x74xvdj5632smx6qsk537ygda8bzckg2i1"))
              (modules '((guix build utils)))
              (snippet
               ;; Remove "contrib" and source not necessary for
               ;; building/running under a GNU environment.
               '(begin
                  (for-each delete-file-recursively
                            '("contrib" "macosx" "win")) ; 540KiB, 11MiB, 5.9MiB resp.
                  (substitute* "make/include/main.defs"
                    ;; Disable unconditional inclusion of "contrib" libraries
                    ;; (ffmpeg, libvpx, libdvdread, libdvdnav, and libbluray),
                    ;; which would lead to fetching and building of these
                    ;; libraries.  Use our own instead.
                    (("MODULES \\+= contrib") "# MODULES += contrib"))
                  #t))))
    (build-system  glib-or-gtk-build-system)
    (native-inputs
     `(("automake" ,automake)           ; GUI subpackage must be bootstrapped
       ("autoconf" ,autoconf)
       ("intltool" ,intltool)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)
       ("python" ,python-2)))           ; For configuration
    (inputs
     `(("bzip2" ,bzip2)
       ("dbus-glib" ,dbus-glib)
       ("ffmpeg" ,ffmpeg)
       ("fontconfig" ,fontconfig)
       ("freetype" ,freetype)
       ("glib" ,glib)
       ("gstreamer" ,gstreamer)
       ("gst-plugins-base" ,gst-plugins-base)
       ("gtk+" ,gtk+)
       ("jansson" ,jansson)
       ("lame" ,lame)
       ("libass" ,libass)
       ("libbluray" ,libbluray)
       ("libdav1d" ,dav1d)
       ("libdvdnav" ,libdvdnav)
       ("libdvdread" ,libdvdread)
       ("libgudev" ,libgudev)
       ("libmpeg2" ,libmpeg2)
       ("libnotify" ,libnotify)
       ("libnuma" ,numactl)
       ("libogg" ,libogg)
       ("libopus" ,opus)
       ("libsamplerate" ,libsamplerate)
       ("libtheora" ,libtheora)
       ("libvorbis" ,libvorbis)
       ("libvpx" ,libvpx)
       ("libxml2" ,libxml2)
       ("libx264" ,libx264)
       ("speex" ,speex)
       ("x265" ,x265)
       ("zlib" ,zlib)))
    (arguments
     `(#:tests? #f             ;tests require Ruby and claim to be unsupported
       #:configure-flags
       (list "--disable-gtk-update-checks"
             "--disable-nvenc"
             (string-append "CPPFLAGS=-I"
                            (assoc-ref %build-inputs "libxml2")
                            "/include/libxml2")
             "LDFLAGS=-lx265")
       #:phases
       (modify-phases %standard-phases
         (replace 'bootstrap
           ;; Run bootstrap ahead of time so that shebangs get patched.
           (lambda _
             (setenv "CONFIG_SHELL" (which "sh"))
             ;; Patch the Makefile so that it doesn't bootstrap again.
             (substitute* "gtk/module.rules"
               ((".*autoreconf.*") ""))
             (with-directory-excursion "gtk"
               (invoke "autoreconf" "-fiv"))))
         (add-before 'configure 'patch-SHELL
           (lambda _
             (substitute* "gtk/po/Makefile.in.in"
               (("SHELL = /bin/sh") "SHELL = @SHELL@"))
             #t))
         (add-before 'configure 'relax-reqs
           (lambda _
             (substitute* "make/configure.py"
               ;; cmake is checked for so that it can be used to build
               ;; contrib/harfbuzz and contrib/x265, but we get these as
               ;; inputs, so don't abort if it's not found.  Similarly, meson
               ;; and ninja are only needed for contrib/libdav1d, and nasm
               ;; only for libvpx
               (("((cmake|meson|ninja|nasm) *=.*abort=)True" _ &)
                (string-append & "False")))
             #t))
         (replace 'configure
           (lambda* (#:key outputs configure-flags #:allow-other-keys)
             ;; 'configure' is not an autoconf-generated script, and
             ;; errors on unrecognized arguments,
             ;; e.g. --enable-fast-install
             (let ((out (assoc-ref outputs "out")))
               (apply invoke "./configure"
                      (string-append "--prefix=" out)
                      (or configure-flags '())))))
         (add-after 'configure 'chdir-build
           (lambda _ (chdir "./build") #t)))))
    (home-page "https://handbrake.fr")
    (synopsis "Video transcoder")
    (description
     "HandBrake is a tool for converting video from any format to a selection
of modern, widely supported codecs.")
    ;; Some under GPLv2+, some under LGPLv2.1+, and portions under BSD3.
    ;; Combination under GPLv2.  See LICENSE.
    (license license:gpl2)))

(define-public intel-vaapi-driver
  (package
    (name "intel-vaapi-driver")
    (version "2.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/intel/intel-vaapi-driver")
             (commit version)))
       (sha256
        (base32 "1cidki3av9wnkgwi7fklxbg3bh6kysf8w3fk2qadjr05a92mx3zp"))
       (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("libdrm" ,libdrm)
       ("libva" ,libva)
       ("libx11" ,libx11)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-target-directory
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (setenv "LIBVA_DRIVERS_PATH" (string-append out "/lib/dri"))
               #t))))))
    ;; XXX Because of <https://issues.guix.gnu.org/issue/22138>, we need to add
    ;; this to all VA-API back ends instead of once to libva.
    (native-search-paths
     (list (search-path-specification
            (variable "LIBVA_DRIVERS_PATH")
            (files '("lib/dri")))))
    (supported-systems '("i686-linux" "x86_64-linux"))
    (home-page "https://01.org/linuxmedia/vaapi")
    (synopsis "VA-API video acceleration driver for Intel GEN Graphics devices")
    (description
     "This is the @acronym{VA-API, Video Acceleration API} back end required for
hardware-accelerated video processing on Intel GEN Graphics devices supported by
the i915 driver, such as integrated Intel HD Graphics.  It provides access to
both hardware and shader functionality for faster encoding, decoding, and
post-processing of video formats like MPEG2, H.264/AVC, and VC-1.")
    (license (list license:bsd-2        ; src/gen9_vp9_const_def.c
                   license:expat))))    ; the rest, excluding the test suite

(define-public openh264
  (package
    (name "openh264")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cisco/openh264")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0ffav46pz3sbj92nipd62z03fibyqgclfq9w8lgr80s6za6zdk5s"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("nasm" ,nasm)
       ("python" ,python)))
    (arguments
     '(#:make-flags (list (string-append "PREFIX=" (assoc-ref %outputs "out"))
                          "CC=gcc")
       #:test-target "test"
       #:phases (modify-phases %standard-phases
                  ;; no configure script
                  (delete 'configure))))
    (home-page "https://www.openh264.org/")
    (synopsis "H264 decoder library")
    (description
     "Openh264 is a library which can decode H264 video streams.")
    (license license:bsd-2)))

(define-public libmp4v2
  (package
    (name "libmp4v2")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       ;; XXX: The new location of upstream is uncertain and will become relevant the
       ;; moment when the googlecode archive shuts down. It is past the date it
       ;; should've been turned off. I tried to communicate with upstream, but this
       ;; wasn't very responsive and not very helpful. The short summary is, it is
       ;; chaos when it comes to the amount of forks and only time will tell where
       ;; the new upstream location is.
       (uri (string-append "https://storage.googleapis.com/google-"
                           "code-archive-downloads/v2/"
                           "code.google.com/mp4v2/mp4v2-" version ".tar.bz2"))
       (file-name (string-append name "-" version ".tar.bz2"))
       (patches (search-patches "libmp4v2-c++11.patch"))
       (sha256
        (base32
         "0f438bimimsvxjbdp4vsr8hjw2nwggmhaxgcw07g2z361fkbj683"))))
    (build-system gnu-build-system)
    (outputs '("out"
               "static")) ; 3.7MiB .a file
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'remove-dates
           (lambda _
             ;; Make the build reproducible.
             (substitute* "configure"
               (("PROJECT_build=\"`date`\"") "PROJECT_build=\"\"")
               (("ac_abs_top_builddir=$ac_pwd") "ac_abs_top_builddir=\"\""))
             #t))
         (add-after 'install 'move-static-libraries
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Move static libraries to the "static" output.
             (let* ((out    (assoc-ref outputs "out"))
                    (lib    (string-append out "/lib"))
                    (static (assoc-ref outputs "static"))
                    (slib   (string-append static "/lib")))
               (mkdir-p slib)
               (for-each (lambda (file)
                           (install-file file slib)
                           (delete-file file))
                         (find-files lib "\\.a$"))
               #t))))))
    (native-inputs
     `(("help2man" ,help2man)
       ("dejagnu" ,dejagnu)))
    (home-page "https://code.google.com/archive/p/mp4v2/")
    (synopsis "API to create and modify mp4 files")
    (description
     "The MP4v2 library provides an API to create and modify mp4 files as defined by
ISO-IEC:14496-1:2001 MPEG-4 Systems.  This file format is derived from Apple's QuickTime
file format that has been used as a multimedia file format in a variety of platforms and
applications.  It is a very powerful and extensible format that can accommodate
practically any type of media.")
    (license license:mpl1.1)))

(define-public libmediainfo
  (package
    (name "libmediainfo")
    (version "21.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mediaarea.net/download/source/"
                                  name "/" version "/"
                                  name "_" version ".tar.xz"))
              (sha256
               (base32
                "1jm4mk539wf3crgpcddgwdixshwdzm37mkb5441lifhcz2mykdsn"))))
    ;; TODO add a Big Buck Bunny webm for tests.
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)
       ("zlib" ,zlib)
       ("tinyxml2" ,tinyxml2)
       ("curl" ,curl)
       ("libzen" ,libzen)))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f ; see above TODO
       #:phases
       ;; build scripts not in root of archive
       (modify-phases %standard-phases
         (add-after 'unpack 'change-to-build-dir
           (lambda _
             (chdir "Project/GNU/Library")
             #t)))))
    (home-page "https://mediaarea.net/en/MediaInfo")
    (synopsis "Library for retrieving media metadata")
    (description "MediaInfo is a library used for retrieving technical
information and other metadata about audio or video files.  A non-exhaustive
list of the information MediaInfo can retrieve from media files include:

@itemize
@item General: title, author, director, album, track number, date, duration...
@item Video: codec, aspect, fps, bitrate...
@item Audio: codec, sample rate, channels, language, bitrate...
@item Text: language of subtitle
@item Chapters: number of chapters, list of chapters
@end itemize

MediaInfo supports the following formats:

@itemize
@item Video: MKV, OGM, AVI, DivX, WMV, QuickTime, Real, MPEG-1,
MPEG-2, MPEG-4, DVD (VOB)...
@item Video Codecs: DivX, XviD, MSMPEG4, ASP, H.264, AVC...)
@item Audio: OGG, MP3, WAV, RA, AC3, DTS, AAC, M4A, AU, AIFF...
@item  Subtitles: SRT, SSA, ASS, SAMI...
@end itemize\n")
    (license license:bsd-2)))

;; TODO also have a GUI version available
(define-public mediainfo
  (package
    (name "mediainfo")
    (version "21.03")
    (source (origin
              (method url-fetch)
              ;; Warning: This source has proved unreliable 1 time at least.
              ;; Consider an alternate source or report upstream if this
              ;; happens again.
              (uri (string-append "https://mediaarea.net/download/source/"
                                  name "/" version "/"
                                  name "_" version ".tar.xz"))
              (sha256
               (base32
                "07h2a1lbw5ak6c9bcn8qydchl0wpgk945rf9sfcqjyv05h5wll6y"))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)
       ("zlib" ,zlib)
       ("libmediainfo" ,libmediainfo)
       ("libzen" ,libzen)))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f ; lacks tests
       #:phases
       ;; build scripts not in root of archive
       (modify-phases %standard-phases
         (add-after 'unpack 'change-to-build-dir
           (lambda _
             (chdir "Project/GNU/CLI")
             #t)))))
    (home-page "https://mediaarea.net/en/MediaInfo")
    (synopsis "Utility for reading media metadata")
    (description "MediaInfo is a utility used for retrieving technical
information and other metadata about audio or video files.  It supports the
many codecs and formats supported by libmediainfo.")
    (license license:bsd-2)))

(define-public atomicparsley
  (package
    (name "atomicparsley")
    (version "20200701.154658.b0d6223")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wez/atomicparsley")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1kym2l5y34nmbrrlkfmxsf1cwrvch64kb34jp0hpa0b89idbhwqh"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f ;; no tests included
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-cmake-version
           (lambda* _
             (substitute* "CMakeLists.txt"
               ;; At the time of writing, Guix has CMake at 3.16, but
               ;; AtomicParsley uses 3.17.  This brings the required CMake
               ;; version down to what Guix can afford.
               (("VERSION 3.17") "VERSION 3.16"))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (install-file "AtomicParsley" bin))
             #t)))))
    (inputs
     `(("zlib" ,zlib)))
    (synopsis "Metadata editor for MPEG-4 files")
    (description "AtomicParsley is a lightweight command line program for
reading, parsing and setting metadata into MPEG-4 files, in particular,
iTunes-style metadata.")
    (home-page "https://github.com/wez/atomicparsley")
    (license license:gpl2+)))

(define-public livemedia-utils
  (package
    (name "livemedia-utils")
    (version "2020.11.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.videolan.org/contrib/live555/live."
                    version ".tar.gz"))
              (sha256
               (base32
                "16w6yxdbmjdhvffnrb752dn4llf3l0wb00dgdkyia0vqsv2qqyn7"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:make-flags (list (string-append "CC=" ,(cc-for-target))
                          (string-append "CXX=" ,(cxx-for-target))
                          (string-append "LDFLAGS=-Wl,-rpath="
                                         (assoc-ref %outputs "out") "/lib")
                          (string-append "PREFIX="
                                         (assoc-ref %outputs "out")))
       #:phases (modify-phases %standard-phases
                  (add-before 'configure 'fix-makefiles-generation
                    (lambda _
                      (substitute* "genMakefiles"
                        (("/bin/rm") "rm"))
                      #t))
                  (replace 'configure
                    (lambda _
                      (invoke "./genMakefiles"
                              "linux-with-shared-libraries"))))))
    (inputs
     `(("openssl" ,openssl)))
    (home-page "http://www.live555.com/liveMedia/")
    (synopsis "Set of C++ libraries for multimedia streaming")
    (description "This code forms a set of C++ libraries for multimedia
streaming, using open standard protocols (RTP/RTCP, RTSP, SIP).  The libraries
can be used to stream, receive, and process MPEG, H.265, H.264, H.263+, DV or
JPEG video, and several audio codecs.  They can easily be extended to support
additional (audio and/or video) codecs, and can also be used to build basic
RTSP or SIP clients and servers.")
    (license license:lgpl3+)))

(define-public libdvbpsi
  (package
    (name "libdvbpsi")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.videolan.org/pub/libdvbpsi/"
                    version "/libdvbpsi-" version ".tar.bz2"))
              (sha256
               (base32
                "04h1l3vrkrdsrvkgzcr51adk10g6hxcxvgjphyyxz718ry5rkd82"))))
    (build-system gnu-build-system)
    (home-page "https://www.videolan.org/developers/libdvbpsi.html")
    (synopsis "Library for decoding and generation of MPEG TS and DVB PSI
tables")
    (description "libdvbpsi is a simple library designed for decoding and
generation of MPEG TS and DVB PSI tables according to standards ISO/IEC 13818s
and ITU-T H.222.0.")
    (license license:lgpl2.1)))

(define-public ffms2
  (package
    (name "ffms2")
    (version "2.23")
    (home-page "https://github.com/FFMS/ffms2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FFMS/ffms2")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0dkz5b3gxq5p4xz0qqg6l2sigszrlsinz3skyf0ln4wf3zrvf8m5"))))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags
       (list "--enable-avresample")))
    (inputs
     `(("zlib" ,zlib)))
    (propagated-inputs
     `(("ffmpeg" ,ffmpeg)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (synopsis "Cross-platform wrapper around ffmpeg/libav")
    (description
      "FFMpegSource is a wrapper library around ffmpeg/libav that allows
programmers to access a standard API to open and decompress media files.")
    ;; sources are distributed under a different license that the binary.
    ;; see https://github.com/FFMS/ffms2/blob/master/COPYING
    (license license:gpl2+))); inherits from ffmpeg

(define-public aegisub
  (package
    (name "aegisub")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "http://ftp.aegisub.org/pub/archives/releases/source/"
                     name "-" version ".tar.xz"))
              (sha256
               (base32
                "11b83qazc8h0iidyj1rprnnjdivj1lpphvpa08y53n42bfa36pn5"))
              (patches (search-patches "aegisub-icu59-include-unistr.patch"
                                       "aegisub-make43.patch"
                                       "aegisub-boost68.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list "--disable-update-checker"
             "--without-portaudio"
             "--without-openal"
             "--without-oss"
             "CXXFLAGS=-DU_USING_ICU_NAMESPACE=1")
       ;; tests require busted, a lua package we don't have yet
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'fix-ldflags
           (lambda _
             (setenv "LDFLAGS" "-pthread")
             #t))
         (add-after 'unpack 'fix-boost-headers
               (lambda _
                 (substitute*
                     '("src/subtitles_provider_libass.cpp"
                       "src/colour_button.cpp"
                       "src/video_provider_dummy.cpp"
                       "./src/video_frame.cpp")
                   (("#include <boost/gil/gil_all.hpp>")
                    "#include <boost/gil.hpp>"))
                 #t)))))
    (inputs
     `(("boost" ,boost)
       ("ffms2" ,ffms2)
       ("fftw" ,fftw)
       ("hunspell" ,hunspell)
       ("mesa" ,mesa)
       ("libass" ,libass)
       ("alsa-lib" ,alsa-lib)
       ("pulseaudio" ,pulseaudio)
       ("libx11" ,libx11)
       ("freetype" ,freetype)
       ("wxwidgets-gtk2" ,wxwidgets-gtk2)))
    (native-inputs
     `(("intltool" ,intltool)
       ("desktop-file-utils" ,desktop-file-utils)
       ("pkg-config" ,pkg-config)))
    (home-page "http://www.aegisub.org/")
    (synopsis "Subtitle engine")
    (description
      "Aegisub is a tool for creating and modifying subtitles.  Aegisub makes
it quick and easy to time subtitles to audio, and features many powerful
tools for styling them, including a built-in real-time video preview.")
    (license (list license:bsd-3 ; the package is licensed under the bsd-3, except
                   license:mpl1.1 ; for vendor/universalchardet under the mpl1.1
                   license:expat)))) ; and src/gl that is under a license similar
   ; the the Expat license, with a rewording (Software -> Materials). (called MIT
   ; by upstream). See https://github.com/Aegisub/Aegisub/blob/master/LICENCE
   ; src/MatroskaParser.(c|h) is under bsd-3 with permission from the author

(define-public pitivi
  ;; Pitivi switched to a non-semantic versioning scheme close before 1.0
  (let ((latest-semver "0.999.0")
        (%version "2021.01.0"))
   (package
     (name "pitivi")
     (version (string-append latest-semver "-" %version))
     (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://gitlab.gnome.org/GNOME/pitivi.git")
              (commit %version)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "1jics10l16ismi5br6wxi4jxz3dd4p0c0xv8l0l3nvksvda4aafi"))))
     (build-system meson-build-system)
     (inputs
      `(("glib" ,glib)
        ("gst-editing-services" ,gst-editing-services)
        ("gstreamer" ,gstreamer)
        ("gst-plugins-base" ,gst-plugins-base)
        ("gst-plugins-good" ,gst-plugins-good)
        ("gst-plugins-bad"
         ,(gst-plugins/selection gst-plugins-bad
                                 #:plugins '("debugutils" "transcoder")
                                 #:configure-flags '("-Dintrospection=enabled")))
        ("gst-libav" ,gst-libav)
        ("gsound" ,gsound)
        ("gtk+" ,gtk+)
        ("gdk-pixbuf+svg" ,gdk-pixbuf+svg)
        ("libpeas" ,libpeas)
        ("libnotify" ,libnotify)
        ("pango" ,pango)
        ("python-gst" ,python-gst)
        ("python-numpy" ,python-numpy)
        ("python-matplotlib" ,python-matplotlib)
        ("python-pycairo" ,python-pycairo)
        ("python-pygobject" ,python-pygobject)))
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib:bin" ,glib "bin")
       ("itstool" ,itstool)
       ("pkg-config" ,pkg-config)))
     (arguments
      `(#:glib-or-gtk? #t
        #:phases
        (modify-phases %standard-phases
          (add-after 'glib-or-gtk-wrap 'wrap-other-dependencies
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((prog (string-append (assoc-ref outputs "out")
                                         "/bin/pitivi")))
                (wrap-program prog
                  `("PYTHONPATH" = (,(getenv "PYTHONPATH")))
                  `("GI_TYPELIB_PATH" = (,(getenv "GI_TYPELIB_PATH")))
                  ;; We've only added inputs for what Pitivi deems either
                  ;; necessary or optional.  Let the user's packages take
                  ;; precedence in case they have e.g. the full gst-plugins-bad.
                  `("GST_PLUGIN_SYSTEM_PATH" suffix
                    (,(getenv "GST_PLUGIN_SYSTEM_PATH")))))
                #t)))))
     (home-page "http://www.pitivi.org")
     (synopsis "Video editor based on GStreamer Editing Services")
     (description "Pitivi is a video editor built upon the GStreamer Editing
Services.  It aims to be an intuitive and flexible application that can appeal
to newbies and professionals alike.")
     (license license:lgpl2.1+))))

(define-public gavl
  (package
    (name "gavl")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/gmerlin/"
                           name "/" version "/"
                           name "-" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "1kikkn971a14zzm7svi7190ldc14fjai0xyhpbcmp48s750sraji"))))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags '("LIBS=-lm")))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("doxygen" ,doxygen)))
    (home-page "http://gmerlin.sourceforge.net")
    (synopsis "Low level library for multimedia API building")
    (description
     "Gavl is short for Gmerlin Audio Video Library.  It is a low level
library, upon which multimedia APIs can be built.  Gavl handles all the
details of audio and video formats like colorspaces, sample rates,
multichannel configurations, etc.  It provides standardized definitions for
those formats as well as container structures for carrying audio samples or
video images inside an application.

In addition, it handles the sometimes ugly task of converting between all
these formats and provides some elementary operations (copying, scaling,
alpha blending etc).")
    (license license:gpl3)))

(define-public frei0r-plugins
  (package
    (name "frei0r-plugins")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.dyne.org/frei0r/"
                           "frei0r-plugins-" version ".tar.gz"))
       (sha256
        (base32
         "0fjji3060r4fwr7vn91lwfzl80lg3my9lkp94kbyw8xwz7qgh7qv"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-Makefile
           (lambda _
             ;; XXX: The 1.7.0 Makefile looks for files that have slightly different
             ;; names in the tarball.  Try removing this for future versions.
             (substitute* "Makefile.in"
               (("README\\.md ChangeLog TODO AUTHORS")
                "README.txt ChangeLog.txt TODO.txt AUTHORS.txt"))
             #t)))))
    ;; TODO: opencv for additional face detection filters.
    (inputs
     `(("gavl" ,gavl)
       ("cairo" ,cairo)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://www.dyne.org/software/frei0r/")
    (synopsis "Minimalistic plugin API for video effects")
    (description
     "Frei0r is a minimalistic plugin API for video effects.
The main emphasis is on simplicity for an API that will round up
the most common video effects into simple filters, sources and
mixers that can be controlled by parameters.  Frei0r wants to
provide a way to share these simple effects between many
applications, avoiding their reimplementation by different projects.
It counts more than 100 plugins.")
    (license (list license:gpl2+
                   ;; The following files are licensed as LGPL2.1+:
                   ;; src/generator/ising0r/ising0r.c
                   ;; src/generator/onecol0r/onecol0r.cpp
                   ;; src/generator/nois0r/nois0r.cpp
                   ;; src/generator/lissajous0r/lissajous0r.cpp
                   ;; src/filter/ndvi/gradientlut.hpp
                   ;; src/filter/ndvi/ndvi.cpp
                   ;; src/filter/facedetect/facedetect.cpp
                   license:lgpl2.1+))))

(define-public motion
  (package
    (name "motion")
    (version "4.3.2")
    (home-page "https://motion-project.github.io/")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Motion-Project/motion")
                    (commit (string-append "release-" version))))
              (sha256
               (base32
                "09xs815jsivcilpmnrx2jkcxirj4lg5kp99fkr0p2sdxw03myi95"))
              (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("gettext" ,gettext-minimal)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("libjpeg" ,libjpeg-turbo)
       ("ffmpeg" ,ffmpeg)
       ("libmicrohttpd" ,libmicrohttpd)
       ("sqlite" ,sqlite)))
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (replace 'bootstrap
                    (lambda _
                      (patch-shebang "scripts/version.sh")
                      (invoke "autoreconf" "-vfi"))))
       #:configure-flags '("--sysconfdir=/etc")
       #:make-flags (list (string-append "sysconfdir="
                                         (assoc-ref %outputs "out")
                                         "/etc"))

       #:tests? #f))                    ; no 'check' target
    (synopsis "Detect motion from video signals")
    (description
     "Motion is a program that monitors the video signal from one or more
cameras and is able to detect if a significant part of the picture has
changed.  Or in other words, it can detect motion.")

    ;; Some files say "version 2" and others "version 2 or later".
    (license license:gpl2)))

(define-public subdl
  (let ((commit "4cf5789b11f0ff3f863b704b336190bf968cd471")
        (revision "1"))
    (package
      (name "subdl")
      (version (git-version "1.0.3" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/alexanderwink/subdl")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0kmk5ck1j49q4ww0lvas2767kwnzhkq0vdwkmjypdx5zkxz73fn8"))))
      (build-system trivial-build-system)
      (arguments
       `(#:modules ((guix build utils))
         #:builder (begin
                     (use-modules (guix build utils))
                     (let* ((out (assoc-ref %outputs "out"))
                            (bin (string-append out "/bin"))
                            (source (assoc-ref %build-inputs "source"))
                            (python (assoc-ref %build-inputs "python")))
                       (install-file (string-append source "/subdl") bin)
                       (patch-shebang (string-append bin "/subdl")
                                      (list (string-append python "/bin")))))))
      (inputs `(("python" ,python)))
      (synopsis "Command-line tool for downloading subtitles from opensubtitles.org")
      (description "Subdl is a command-line tool for downloading subtitles from
opensubtitles.org.  By default, it will search for English subtitles, display
the results, download the highest-rated result in the requested language and
save it to the appropriate filename.")
      (license license:gpl3+)
      (home-page "https://github.com/alexanderwink/subdl"))))

(define-public l-smash
  (package
    (name "l-smash")
    (version "2.14.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/l-smash/l-smash")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0rcq9727im6kd8da8b7kzzbzxdldvmh5nsljj9pvr4m3lj484b02"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ;no tests
       #:make-flags
       (list (string-append "LDFLAGS=-Wl,-L.,-rpath="
                            (assoc-ref %outputs "out") "/lib"))
       #:phases
       (modify-phases %standard-phases
         ;; configure fails if it is followed by CONFIG_SHELL
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (invoke "./configure" (string-append "--prefix=" out)
                       "--disable-static")))))))
    (native-inputs
     `(("which" ,which)))
    (home-page "https://l-smash.github.io/l-smash/")
    (synopsis "MP4 multiplexer and demultiplexer library")
    (description
     "L-SMASH is a cross-platform library that handles the ISO base media file
format and some of its derived file formats, including MP4.  It operates as a
multiplexer and demultiplexer, and can mux video and audio in several formats
using standalone executable files.")
    (license license:isc)))

(define-public qtfaststart
  (package
    (name "qtfaststart")
    (version "1.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "qtfaststart" version))
              (sha256
               (base32
                "0hcjfik8hhb1syqvyh5c6aillpvzal26nkjflcq1270z64aj6i5h"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f)) ; no test suite
    (synopsis "Move QuickTime and MP4 metadata to the beginning of the file")
    (description "qtfaststart enables streaming and pseudo-streaming of
QuickTime and MP4 files by moving metadata and offset information to the
beginning of the file.  It can also print some useful information about the
structure of the file.  This program is based on qt-faststart.c from the FFmpeg
project, which is released into the public domain, as well as ISO 14496-12:2005
(the official spec for MP4), which can be obtained from the ISO or found
online.")
    (home-page "https://github.com/danielgtaylor/qtfaststart")
    (license license:expat)))

(define-public vidstab
  (let ((commit "aeabc8daa7904f9edf7441a11f293965a5ef53b8")
        (revision "0"))
    (package
      (name "vidstab")
      (version (git-version "1.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/georgmartius/vid.stab")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "042iy0f3khwzr68djzvqgn301sy21ljvkf52rnc2c73q7ircnzzn"))))
      (build-system cmake-build-system)
      (arguments
       '(#:tests? #f)) ; tests are not run as part of standard build process
      (home-page "http://public.hronopik.de/vid.stab/")
      (synopsis "Video stabilization library")
      (description "Vidstab is a video stabilization library which can be used
with FFmpeg.  A video acquired using a hand-held camera or a camera mounted on a
vehicle typically suffers from undesirable shakes and jitters.  Activities such
as surfing, skiing, riding and walking while shooting videos are especially
prone to erratic camera shakes.  Vidstab targets these video contents to help
create smoother and stable videos.")
      (license license:gpl2+))))

(define-public libopenshot
  (package
    (name "libopenshot")
    (version "0.2.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenShot/libopenshot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1mxjkgjmjzgf628y3rscc6rqf55hxgjpmvwxlncfk1216i5xskwp"))
              (modules '((guix build utils)))
              (snippet '(begin
                          ;; Allow overriding of the python installation dir
                          (substitute* "src/bindings/python/CMakeLists.txt"
                            (("(SET\\(PYTHON_MODULE_PATH.*)\\)" _ set)
                             (string-append set " CACHE PATH "
                                            "\"Python bindings directory\")")))
                          (delete-file-recursively "thirdparty")
                          #t))))
    (build-system cmake-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("python" ,python)
       ("swig" ,swig)
       ("unittest++" ,unittest-cpp)))
    (propagated-inputs                  ;all referenced in installed headers
     `(("cppzmq" ,cppzmq)
       ("ffmpeg" ,ffmpeg)
       ("imagemagick" ,imagemagick)
       ("jsoncpp" ,jsoncpp)
       ("libopenshot-audio" ,libopenshot-audio)
       ("qtbase" ,qtbase-5)
       ("qtmultimedia" ,qtmultimedia)
       ("zeromq" ,zeromq)))
    (arguments
     `(#:configure-flags
       (list (string-append "-DPYTHON_MODULE_PATH:PATH=" %output "/lib/python"
                            ,(version-major+minor (package-version python))
                            "/site-packages")
             "-DUSE_SYSTEM_JSONCPP:BOOL=ON")
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-vars
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "LIBOPENSHOT_AUDIO_DIR"
                     (assoc-ref inputs "libopenshot-audio"))
             (setenv "ZMQDIR"
                     (assoc-ref inputs "zeromq"))
             (setenv "UNITTEST_DIR"
                     (string-append (assoc-ref inputs "unittest++")
                                    "/include/UnitTest++"))
             #t)))))
    (home-page "https://openshot.org")
    (synopsis "Video-editing, animation, and playback library")
    (description "OpenShot Library (libopenshot) is a powerful C++ video
editing library with a multi-threaded and feature rich video editing
API.  It includes bindings for Python, Ruby, and other languages.")
    (license license:lgpl3+)))

(define-public openshot
  (package
    (name "openshot")
    (version "2.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenShot/openshot-qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0qc5i0ay6j2wab1whl41sjb71cj02pg6y79drf7asrprq8b2rmfq"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; TODO: Unbundle jquery and others from src/timeline/media
           (delete-file-recursively "src/images/fonts") #t))))
    (build-system python-build-system)
    (inputs
     `(("ffmpeg" ,ffmpeg)
       ("font-ubuntu" ,font-ubuntu)
       ("libopenshot" ,libopenshot)
       ("python" ,python)
       ("python-pyqt" ,python-pyqt)
       ("python-pyzmq" ,python-pyzmq)
       ("python-requests" ,python-requests)
       ("qtsvg" ,qtsvg-5)))
    (arguments
     `(#:modules ((guix build python-build-system)
                  (guix build qt-utils)
                  (guix build utils))
       #:imported-modules (,@%python-build-system-modules
                            (guix build qt-utils))
       #:phases (modify-phases %standard-phases
                  (delete 'build)       ;install phase does all the work
                  (replace 'check
                    (lambda _
                      (setenv "QT_QPA_PLATFORM" "offscreen")
                      (invoke "python" "src/tests/query_tests.py")))
                  (add-after 'unpack 'patch-font-location
                    (lambda* (#:key inputs #:allow-other-keys)
                      (let ((font (assoc-ref inputs "font-ubuntu")))
                        (substitute* "src/classes/app.py"
                          (("info.IMAGES_PATH") (string-append "\"" font "\""))
                          (("fonts") "share/fonts/truetype")))
                      #t))
                  (add-before 'install 'set-tmp-home
                    (lambda _
                      ;; src/classes/info.py "needs" to create several
                      ;; directories in $HOME when loaded during build
                      (setenv "HOME" "/tmp")
                      #t))
                  (add-after 'install 'wrap-program
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let ((out (assoc-ref outputs "out")))
                        (wrap-qt-program out "openshot-qt"))
                      #t)))))
    (home-page "https://www.openshot.org/")
    (synopsis "Video editor")
    (description "OpenShot takes your videos, photos, and music files and
helps you create the film you have always dreamed of.  Easily add sub-titles,
transitions, and effects and then export your film to many common formats.")
    (license license:gpl3+)))

(define-public dav1d
  (package
    (name "dav1d")
    (version "0.9.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://code.videolan.org/videolan/dav1d.git")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
         (base32 "0ki3wlyaqr80gl1srbbd18dd5bs1sl9icxym8ar62abpvgzxl5yk"))))
    (build-system meson-build-system)
    (native-inputs `(("nasm" ,nasm)))
    (home-page "https://code.videolan.org/videolan/dav1d")
    (synopsis "AV1 decoder")
    (description "dav1d is a new AV1 cross-platform decoder, and focused on
speed and correctness.")
    (license license:bsd-2)))

(define-public wlstream
  (let ((commit "182076a94562b128c3a97ecc53cc68905ea86838")
        (revision "1"))
    (package
      (name "wlstream")
      (version (git-version "0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/atomnuker/wlstream")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "01qbcgfl3g9kfwn1jf1z9pdj3bvf5lmg71d1vwkcllc2az24bjqp"))))
      (build-system meson-build-system)
      (native-inputs `(("libdrm" ,libdrm)
                       ("pkg-config" ,pkg-config)))
      (inputs `(("ffmpeg" ,ffmpeg)
                ("pulseaudio" ,pulseaudio)
                ("wayland" ,wayland)
                ("wayland-protocols" ,wayland-protocols)))
      (home-page "https://github.com/atomnuker/wlstream")
      (synopsis "Screen capture tool for Wayland sessions")
      (description "Wlstream is a screen capture tool for recording audio and
video from a Wayland session.")
      (license license:lgpl2.1+))))

(define-public gaupol
  (package
    (name "gaupol")
    (version "1.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/otsaloma/gaupol/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1mmjg8nwhif2hmmp8i11643izwzdf839brqdai3ksfg0qkh8rnxk"))))
    (build-system python-build-system)
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("python-pygobject" ,python-pygobject)
       ("gtk+" ,gtk+)
       ("python-pycairo" ,python-pycairo) ; Required or else clicking on a subtitle line fails.
       ("python-chardet" ,python-chardet) ; Optional: Character encoding detection.
       ("gtkspell3" ,gtkspell3)           ; Optional: Inline spell-checking.
       ("iso-codes" ,iso-codes)           ; Optional: Translations.
       ("gstreamer" ,gstreamer)
       ("gst-libav" ,gst-libav)
       ("gst-plugins-base" ,gst-plugins-base)
       ("gst-plugins-good" ,gst-plugins-good)
       ("gst-plugins-bad" ,gst-plugins-bad)
       ("gst-plugins-ugly" ,gst-plugins-ugly)))
    (arguments
     `(#:tests? #f                      ; Tests seem to require networking.
       #:phases
       (modify-phases %standard-phases
         ;; gaupol's setup.py script does not support one of the Python build
         ;; system's default flags, "--single-version-externally-managed".
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (invoke "python" "setup.py" "install"
                     (string-append "--prefix=" (assoc-ref outputs "out"))
                     "--root=/")))
         (add-after 'install 'wrap-gaupol
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (gst-plugin-path (getenv "GST_PLUGIN_SYSTEM_PATH"))
                   (gi-typelib-path (getenv "GI_TYPELIB_PATH")))
               (wrap-program (string-append out "/bin/gaupol")
                 `("GST_PLUGIN_SYSTEM_PATH" ":" prefix (,gst-plugin-path))
                 `("GI_TYPELIB_PATH" ":" prefix (,gi-typelib-path))))
             #t))
         (add-after 'unpack 'patch-data-dir
           ;; Fix some path variables that setup.py seems to garble.
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (substitute* "setup.py"
                 (("DATA_DIR = \\{!r\\}\"\\.format\\(data_dir\\)")
                  (string-append "DATA_DIR = '" out "/share/gaupol'\""))
                 (("LOCALE_DIR = \\{!r\\}\"\\.format\\(locale_dir\\)")
                  (string-append "LOCALE_DIR = '" out "/share/locale'\"")))
               #t))))))
    (synopsis "Editor for text-based subtitles")
    (description
     "Gaupol supports multiple subtitle file formats and provides means of
creating subtitles, editing texts and timing subtitles to match video.  The
user interface features a builtin video player and is designed with attention
to convenience of translating and batch processing of multiple documents.")
    (home-page "https://otsaloma.io/gaupol/")
    (license license:gpl3+)))

(define-public theorafile
  (let ((commit "404b14d7602b5918d117eaa64e8aa6601ede8593"))
    (package
      (name "theorafile")
      (version (git-version "0.0.0" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/FNA-XNA/Theorafile")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "128c3pjzqbgrj020glm5jd6ss18vl19471lj615w2brjwb7c1f0z"))))
      (build-system gnu-build-system)
      (arguments
       '(#:make-flags '("CC=gcc")
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (replace 'check
             (lambda _
               (setenv "CC" "gcc")
               (invoke "make" "test")))
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (install-file "libtheorafile.so" (string-append out "/lib"))
                 (install-file "theorafile.h" (string-append out "/include")))
               #t)))))
      (native-inputs
       ;; For tests.
       `(("sdl2" ,sdl2)))
      (home-page "https://github.com/FNA-XNA/Theorafile")
      (synopsis "Ogg Theora Video Decoder Library")
      (description "Theorafile is a library for quickly and easily decoding Ogg
Theora videos.  Theorafile was written to be used for FNA's VideoPlayer.")
      (license license:zlib))))

(define-public dvdbackup
  (package
    (name "dvdbackup")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/dvdbackup/dvdbackup/"
                           "dvdbackup-" version "/"
                           "dvdbackup-" version ".tar.xz"))
       (sha256
        (base32 "1rl3h7waqja8blmbpmwy01q9fgr5r0c32b8dy3pbf59bp3xmd37g"))))
    (build-system gnu-build-system)
    (inputs
     `(("libdvdcss" ,libdvdcss)
       ("libdvdread" ,libdvdread)))
    (home-page "http://dvdbackup.sourceforge.net")
    (synopsis "DVD video ripper")
    (description
     "A simple command line tool to backup video from a DVD.  Decrypts the
DVD using @command{libdvdcss}, but does @strong{not} demux, remux,
transcode or reformat the videos in any way, producing perfect backups.")
    (license license:gpl3+)))

(define-public svt-av1
  (package
    (name "svt-av1")
    (version "0.8.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/AOMediaCodec/SVT-AV1.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xlxb6kn6hqz9dxz0nd905m4i2mwjwq1330rbabwzmg4b66cdslg"))))
    (build-system cmake-build-system)
    ;; SVT-AV1 only supports 64-bit Intel-compatible CPUs.
    (supported-systems '("x86_64-linux"))
    (arguments
      ;; The test suite tries to download test data and git clone a 3rd-party
      ;; fork of libaom.  Skip it.
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'install-documentation
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref %outputs "out"))
                    (doc (string-append out "/share/doc/svt-av1-" ,version)))
               (copy-recursively "../source/Docs" doc)
               #t))))))
    (native-inputs
     `(("yasm" ,yasm)))
    (synopsis "AV1 video codec")
    (description "SVT-AV1 is an AV1 codec implementation.  The encoder is a
work-in-progress, aiming to support video-on-demand and live streaming
applications.  It only supports Intel-compatible CPUs (x86).")
    (home-page "https://gitlab.com/AOMediaCodec/SVT-AV1")
    (license license:bsd-2)))

(define-public svt-vp9
  (package
    (name "svt-vp9")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/OpenVisualCloud/SVT-VP9")
                     (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1ypdiw4cq22llvm8jyszxdq6r1aydkj80dsxjarjn5b7c1f2q3ar"))))
    ;; SVT-VP9 only supports 64-bit Intel-compatible CPUs.
    (supported-systems '("x86_64-linux"))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f ; No test suite
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'install-documentation
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref %outputs "out"))
                    (doc (string-append out "/share/doc/" ,name "-" ,version)))
               (copy-recursively "../source/Docs" doc)
               #t))))))
    (native-inputs
     `(("yasm" ,yasm)))
    (home-page "https://github.com/OpenVisualCloud/SVT-VP9")
    (synopsis "VP9 video encoder")
    (description "SVT-VP9 is a VP9 video encoder implementation.  It is focused
on supporting video-on-demand and live encoding on Intel Xeon processors.")
    (license license:bsd-2)))

(define-public w-scan
  (package
    (name "w-scan")
    (version "20170107")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gen2vdr.de/wirbel/w_scan/w_scan-"
                           version ".tar.bz2"))
       (sha256
        (base32 "1zkgnj2sfvckix360wwk1v5s43g69snm45m0drnzyv7hgf5g7q1q"))))
    (build-system gnu-build-system)
    (synopsis "Scan ATSC/DVB-C/DVB-S/DVB-T channels")
    (description
     "This is a small command line utility used to perform frequency scans for
DVB and ATSC transmissions without initial tuning data.  It can print the
result in several formats:
@itemize
@item VDR channels.conf,
@item czap/tzap/xine/mplayer channels.conf,
@item Gstreamer dvbsrc plugin,
@item VLC xspf playlist,
@item XML,
@item initial tuning data for scan or dvbv5-scan.
@end itemize\n")
    (home-page "https://www.gen2vdr.de/wirbel/w_scan/index2.html")
    (license license:gpl2+)))

(define-public rav1e
  (package
    (name "rav1e")
    (version "0.3.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rav1e" version))
        (file-name
         (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0c40gq4qid2apmlgzx98f6826jmn2n61prk0rn7sjxaw7yimw854"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-aom-sys" ,rust-aom-sys-0.2)
        ("rust-arbitrary" ,rust-arbitrary-0.2)
        ("rust-arg-enum-proc-macro" ,rust-arg-enum-proc-macro-0.3)
        ("rust-arrayvec" ,rust-arrayvec-0.5)
        ("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-bitstream-io" ,rust-bitstream-io-0.8)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-cc" ,rust-cc-1)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-clap" ,rust-clap-2)
        ("rust-console" ,rust-console-0.11)
        ("rust-dav1d-sys" ,rust-dav1d-sys-0.3)
        ("rust-fern" ,rust-fern-0.6)
        ("rust-image" ,rust-image-0.23)
        ("rust-interpolate-name" ,rust-interpolate-name-0.2)
        ("rust-itertools" ,rust-itertools-0.9)
        ("rust-ivf" ,rust-ivf-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-nasm-rs" ,rust-nasm-rs-0.2)
        ("rust-noop-proc-macro" ,rust-noop-proc-macro-0.2)
        ("rust-num-derive" ,rust-num-derive-0.3)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-paste" ,rust-paste-0.1)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rand-chacha" ,rust-rand-chacha-0.2)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-rust-hawktracer" ,rust-rust-hawktracer-0.7)
        ("rust-rustc-version" ,rust-rustc-version-0.2)
        ("rust-scan-fmt" ,rust-scan-fmt-0.2)
        ("rust-serde" ,rust-serde-1)
        ("rust-signal-hook" ,rust-signal-hook-0.1)
        ("rust-simd-helpers" ,rust-simd-helpers-0.1)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-vergen" ,rust-vergen-3)
        ("rust-y4m" ,rust-y4m-0.5))
       #:cargo-development-inputs
       (("rust-assert-cmd" ,rust-assert-cmd-1)
        ("rust-criterion" ,rust-criterion-0.3)
        ("rust-interpolate-name" ,rust-interpolate-name-0.2)
        ("rust-pretty-assertions" ,rust-pretty-assertions-0.6)
        ("rust-rand" ,rust-rand-0.7)
        ("rust-rand-chacha" ,rust-rand-chacha-0.2)
        ("rust-semver" ,rust-semver-0.9))
       #:phases
       (modify-phases %standard-phases
         (replace 'build
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (invoke "cargo" "cinstall" "--release"
                       (string-append "--prefix=" out))))))))
    (native-inputs
     `(("cargo-c" ,rust-cargo-c)))
    (inputs
     `(("nasm" ,nasm)))
    (home-page "https://github.com/xiph/rav1e/")
    (synopsis "The fastest and safest AV1 encoder")
    (description
     "The fastest and safest AV1 encoder.")
    (license license:bsd-2)))

(define-public peek
  (package
    (name "peek")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/phw/peek")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xwlfizga6hvjqq127py8vabaphsny928ar7mwqj9cyqfl6fx41x"))))
    (build-system meson-build-system)
    (arguments '(#:glib-or-gtk? #t))
    (inputs
     `(("gtk+" ,gtk+)))
    (native-inputs
     `(("desktop-file-utils" ,desktop-file-utils) ; for update-desktop-database
       ("gettext" ,gettext-minimal)
       ("glib:bin" ,glib "bin")         ; for glib-compile-resources
       ("gtk+-bin" ,gtk+ "bin")         ; For gtk-update-icon-cache
       ("pkg-config" ,pkg-config)
       ("vala" ,vala)))
    (home-page "https://github.com/phw/peek")
    (synopsis "Simple animated GIF screen recorder")
    (description
     "Peek makes it easy to create short screencasts of a screen area.  It was
built for the specific use case of recording screen areas, e.g. for easily
showing UI features of your own apps or for showing a bug in bug reports.
With Peek, you simply place the Peek window over the area you want to record
and press \"Record\".  Peek is optimized for generating animated GIFs, but you
can also directly record to WebM or MP4 if you prefer.")
    (license license:gpl3+)))

(define-public wf-recorder
  (package
    (name "wf-recorder")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ammen99/wf-recorder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1cw6kpcbl33wh95pvy32xrsrm6kkk1awccr3phyh885xjs3b3iim"))))
    (build-system meson-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("ffmpeg" ,ffmpeg)
       ("pulseaudio" ,pulseaudio)
       ("wayland" ,wayland)
       ("wayland-protocols" ,wayland-protocols)
       ("libx264" ,libx264)))
    (home-page "https://github.com/ammen99/wf-recorder")
    (synopsis "Screen recorder for wlroots-based compositors")
    (description
     "@code{wf-recorder} is a utility program for screen recording of
wlroots-based compositors.  More specifically, those that support
@code{wlr-screencopy-v1} and @code{xdg-output}.")
    (license license:expat)))

(define-public guvcview
  (package
    (name "guvcview")
    (version "2.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/guvcview/source/guvcview-"
                                  "src-" version ".tar.gz"))
              (sha256
               (base32
                "11byyfpkcik7wvf2qic77zjamfr2rhji97dpj1gy2fg1bvpiqf4m"))))
    (build-system gnu-build-system)
    (arguments
     ;; There are no tests and "make check" would fail on an intltool error.
     '(#:tests? #f))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("intltool" ,intltool)))
    (inputs
     `(("gtk+" ,gtk+)
       ("eudev" ,eudev)
       ("libusb" ,libusb)
       ("v4l-utils" ,v4l-utils)                   ;libv4l2
       ("ffmpeg" ,ffmpeg)                         ;libavcodec, libavutil
       ("sdl2" ,sdl2)
       ("gsl" ,gsl)
       ("portaudio" ,portaudio)
       ("alsa-lib" ,alsa-lib)))
    (home-page "http://guvcview.sourceforge.net/")
    (synopsis "Control your webcam and capture videos and images")
    (description
     "GTK+ UVC Viewer (guvcview) is a graphical application to control a
webcam accessible with Video4Linux (V4L2) and to capture videos and images.
It provides control over precise settings of the webcam such as exposure,
brightness, contrast, and frame rate.")

    ;; 'COPYING' is GPLv3 but source headers say GPLv2+.
    (license license:gpl2+)))

(define-public get-iplayer
  (package
    (name "get-iplayer")
    (version "3.27")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/get-iplayer/get_iplayer")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "077y31gg020wjpx5pcivqgkqawcjxh5kjnvq97x2gd7i3wwc30qi"))))
    (build-system perl-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (man (string-append out "/share/man/man1")))
               (install-file "get_iplayer" bin)
               (install-file "get_iplayer.cgi" bin)
               (install-file "get_iplayer.1" man))
             #t))
         (add-after 'install 'wrap-program
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (perllib (string-append out "/lib/perl5/site_perl/"
                                            ,(package-version perl))))
               (wrap-program (string-append out "/bin/get_iplayer")
                 `("PERL5LIB" ":"
                   prefix (,(string-append perllib ":" (getenv "PERL5LIB")))))
               (wrap-program (string-append out "/bin/get_iplayer.cgi")
                 `("PERL5LIB" ":"
                   prefix (,(string-append perllib ":" (getenv "PERL5LIB")))))
               #t))))))
    (inputs
     `(("perl-mojolicious" ,perl-mojolicious)
       ("perl-lwp-protocol-https" ,perl-lwp-protocol-https)
       ("perl-xml-libxml" ,perl-xml-libxml)))
    (home-page "https://github.com/get-iplayer/get_iplayer")
    (synopsis "Download or stream available BBC iPlayer TV and radio programmes")
    (description "@code{get_iplayer} lists, searches and records BBC iPlayer
TV/Radio, BBC Podcast programmes.  Other third-party plugins may be available.
@code{get_iplayer} has three modes: recording a complete programme for later
playback, streaming a programme directly to a playback application, such as
mplayer; and as a @dfn{Personal Video Recorder} (PVR), subscribing to search
terms and recording programmes automatically.  It can also stream or record live
BBC iPlayer output.")
    (license license:gpl3+)))

(define-public ogmtools
  (package
    (name "ogmtools")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.bunkus.org/videotools/ogmtools/ogmtools-"
                                  version
                                  ".tar.bz2"))
              (sha256
               (base32
                "1spx81p5wf59ksl3r3gvf78d77sh7gj8a6lw773iv67bphfivmn8"))))
    (build-system gnu-build-system)
    (inputs
     `(("libvorbis" ,libvorbis)
       ("libdvdread" ,libdvdread)))
    (synopsis "Information, extraction or creation for OGG media streams")
    (description
     "These tools allow information about (@code{ogminfo}) or extraction from
\(@code{ogmdemux}) or creation of (@code{ogmmerge}) OGG media streams.  It
includes @code{dvdxchap} tool for extracting chapter information from DVD.")
    (license license:gpl2)
    (home-page "https://www.bunkus.org/videotools/ogmtools/")))

(define-public libcaption
  (package
    (name "libcaption")
    (version "0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/szatmary/libcaption")
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "16mhw8wpl7wdjj4n7rd1c294p1r8r322plj7z91crla5aah726rq"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f ; Cannot figure out how to run the unit tests
       #:configure-flags '("-DENABLE_RE2C=ON")))
    (native-inputs
     `(("re2c" ,re2c)))
    (synopsis "CEA608 / CEA708 closed-caption codec")
    (description "Libcaption creates and parses closed-caption data,
providing an encoder / decoder for the EIA608 and CEA708 closed-caption
standards.

608 support is currently limited to encoding and decoding the necessary control
and preamble codes as well as support for the Basic North American, Special
North American and Extended Western European character sets.

708 support is limited to encoding the 608 data in NTSC field 1 user data type
structure.

In addition, utility functions to create h.264 SEI (Supplementary enhancement
information) NALUs (Network Abstraction Layer Unit) for inclusion into an h.264
elementary stream are provided.")
    (home-page "https://github.com/szatmary/libcaption")
    (license license:expat)))
