;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 Leo Famulari <leo@famulari.name>
;;; Copyright © 2016 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2017, 2018 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
;;; Copyright © 2018–2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2018, 2019 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Joshua Sierles, Nextjournal <joshua@nextjournal.com>
;;; Copyright © 2018, 2019, 2020 Julien Lepiller <julien@lepiller.eu>
;;; Copyright © 2019, 2020, 2021 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2019, 2020, 2021 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2019 Wiktor Żelazny <wzelazny@vurv.cz>
;;; Copyright © 2019 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2020 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2020 Christopher Baines <mail@cbaines.net>
;;; Copyright © 2020, 2021 Felix Gruber <felgru@posteo.net>
;;; Copyright © 2021 Sharlatan Hellseher <sharlatanus@gmail.com>
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

(define-module (gnu packages geo)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system scons)
  #:use-module (guix build-system r)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gps)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

(define-public memphis
  (package
    (name "memphis")
    (version "0.2.3")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/jiuka/memphis")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "068c3943pgbpfjq44pmvn5fmkh005ak5aa67vvrq3fn487c6w54q"))))
    (build-system glib-or-gtk-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:configure-flags
       (list
        "--disable-static"
        "--enable-gtk-doc"
        "--enable-vala"
        (string-append "--with-html-dir="
                       (assoc-ref %outputs "doc")
                       "/share/gtk-doc/html"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-autogen
           (lambda _
             (substitute* "autogen.sh"
               (("\\./configure \"\\$@\"")
                ""))
             #t))
         (add-after 'patch-autogen 'patch-docbook-xml
           (lambda* (#:key inputs #:allow-other-keys)
             (with-directory-excursion "docs/reference"
               (substitute* "libmemphis-docs.sgml"
                 (("http://www.oasis-open.org/docbook/xml/4.3/")
                  (string-append (assoc-ref inputs "docbook-xml")
                                 "/xml/dtd/docbook/"))))
             #t)))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("docbook-xml" ,docbook-xml-4.3)
       ("gobject-introspection" ,gobject-introspection)
       ("gtk-doc" ,gtk-doc/stable)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)
       ("python" ,python-wrapper)
       ("seed" ,seed)
       ("vala" ,vala)))
    (inputs
     `(("expat" ,expat)
       ("glib" ,glib)))
    (propagated-inputs
     `(("cairo" ,cairo)))
    (synopsis "Map-rendering for OpenSteetMap")
    (description "Memphis is a map-rendering application and a library for
OpenStreetMap written in C using eXpat, Cairo and GLib.")
    (home-page "http://trac.openstreetmap.ch/trac/memphis/")
    (license license:lgpl2.1+)))

(define-public geos
  (package
    (name "geos")
    (version "3.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.osgeo.org/geos/geos-"
                                  version
                                  ".tar.bz2"))
              (sha256
               (base32
                "1xqpmr10xi0n9sj47fbwc89qb0yr9imh4ybk0jsxpffy111syn22"))))
    (build-system gnu-build-system)
    (arguments `(#:phases
                 (modify-phases %standard-phases
                   (add-after
                    'unpack 'patch-test-shebangs
                    (lambda _
                      (substitute* '("tests/xmltester/testrunner.sh"
                                     "tests/geostest/testrunner.sh")
                        (("/bin/sh") (which "sh")))
                      #t)))))
    (inputs
     `(("glib" ,glib)))
    (home-page "https://geos.osgeo.org/")
    (synopsis "Geometry Engine for Geographic Information Systems")
    (description
     "GEOS provides a spatial object model and fundamental geometric
functions.  It is a C++ port of the Java Topology Suite (JTS).  As such,
it aims to contain the complete functionality of JTS in C++.  This
includes all the OpenGIS Simple Features for SQL spatial predicate
functions and spatial operators, as well as specific JTS enhanced
topology functions.")
    (license (list license:lgpl2.1+          ; Main distribution.
                   license:zlib              ; tests/xmltester/tinyxml/*
                   license:public-domain)))) ; include/geos/timeval.h

(define-public gnome-maps
  (package
    (name "gnome-maps")
    (version "3.34.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnome/sources/" name "/"
                                  (version-major+minor version) "/"
                                  name "-" version ".tar.xz"))
              (sha256
               (base32
                "00xslcnhhwslqglgfv2im7vq3awa49y2jxzr8wsby7f713k28vf5"))))
    (build-system meson-build-system)
    (arguments
     `(#:glib-or-gtk? #t
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'skip-gtk-update-icon-cache
           ;; Don't create 'icon-theme.cache'.
           (lambda _
             (substitute* "meson_post_install.py"
               (("gtk-update-icon-cache") "true"))
             #t))
         (add-after 'unpack 'patch-dbus-service
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "data/org.gnome.Maps.service.in"
               (("@pkgdatadir@/org.gnome.Maps")
                (string-append  (assoc-ref outputs "out") "/bin/gnome-maps")))
             #t))
         (add-after 'install 'wrap
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out"))
                   (gi-typelib-path (getenv "GI_TYPELIB_PATH"))
                   (geocode-glib-path (string-append
                                       (assoc-ref inputs "geocode-glib")
                                       "/lib"))
                   (goa-path (string-append
                              (assoc-ref inputs "gnome-online-accounts:lib")
                              "/lib"))
                   (gdk-pixbuf-path (string-append
                                     (assoc-ref inputs "gdk-pixbuf")
                                     "/lib"))
                   (webkitgtk-path (string-append
                                    (assoc-ref inputs "webkitgtk")
                                    "/lib")))
               (wrap-program (string-append out "/bin/gnome-maps")
                 `("GI_TYPELIB_PATH" ":" prefix (,gi-typelib-path))

                 ;; There seems to be no way to embed the path of
                 ;; libgoa-1.0.so.0, libwebkit2gtk-4.0.so.37,
                 ;; libgdk_pixbuf-2.0.so, libjavascriptcoregtk-4.0.so.18, and
                 ;; libgeocode-glib.so.0
                 `("LD_LIBRARY_PATH" ":" prefix (,goa-path
                                                 ,webkitgtk-path
                                                 ,gdk-pixbuf-path
                                                 ,geocode-glib-path)))
               #t))))))
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("gobject-introspection" ,gobject-introspection)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("evolution-data-server" ,evolution-data-server)
       ("folks" ,folks)
       ("libchamplain" ,libchamplain)
       ("libgee" ,libgee)
       ("libsecret" ,libsecret)
       ("libsoup" ,libsoup)
       ("libgweather" ,libgweather)
       ("libxml2" ,libxml2)
       ("gdk-pixbuf" ,gdk-pixbuf+svg)
       ("glib-networking" ,glib-networking)
       ("geoclue" ,geoclue)
       ("geocode-glib" ,geocode-glib)
       ("gfbgraph" ,gfbgraph)
       ("gjs" ,gjs)
       ("glib" ,glib)
       ("gnome-online-accounts:lib" ,gnome-online-accounts "lib")
       ("gsettings-desktop-schemas" ,gsettings-desktop-schemas)
       ("gtk+" ,gtk+)
       ("rest" ,rest)
       ("webkitgtk" ,webkitgtk)))
    (synopsis "Graphical map viewer and wayfinding program")
    (description "GNOME Maps is a graphical map viewer.  It uses map data from
the OpenStreetMap project.  It can provide directions for walking, bicycling,
and driving.")
    (home-page "https://wiki.gnome.org/Apps/Maps")
    (license license:gpl2+)))

(define-public libgeotiff
  (package
    (name "libgeotiff")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-"
                           version ".tar.gz"))
       (patches (search-patches
                 ;; See libgeotiff 1.5.1 issue
                 ;; https://github.com/OSGeo/libgeotiff/issues/22
                 "libgeotiff-adapt-test-script-for-proj-6.2.patch"))
       (sha256
        (base32 "0b31mlzcv5b1y7jdvb7p0pa3xradrg3x5g32ym911lbhq4rrgsgr"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Remove .csv files, distributed from EPSG under a restricted
           ;; license. See LICENSE for full license text.
           (for-each delete-file (find-files "." "\\.csv$"))
           #t))))
    (build-system gnu-build-system)
    (inputs
     `(("libjpeg-turbo" ,libjpeg-turbo)
       ("libtiff" ,libtiff)
       ("zlib" ,zlib)))
    (propagated-inputs
     `(;; libgeotiff headers include proj headers, so ensure those are available.
       ("proj" ,proj)))
    (arguments
     `(#:configure-flags
       (list "--disable-static"
             "--with-zlib" "--with-jpeg"
             (string-append "--with-libtiff=" (assoc-ref %build-inputs "libtiff")))))
    (synopsis "Library for handling GeoTIFF (geographic enabled TIFF)")
    (description "libgeotiff is a library on top of libtiff for reading and
writing GeoTIFF information tags.")
    (home-page "https://trac.osgeo.org/geotiff/")
    ;; This is a mixture of various contributions under different licenses.
    ;; Note that the EPSG database is NOT "free to use" as the LICENSE file
    ;; states, as its commercial redistribution is restricted. Hence, we have
    ;; removed it from the package.
    (license (list license:public-domain
                   license:x11
                   license:bsd-3
                   (license:non-copyleft "file://LICENSE"
                                         "See LICENSE in the distribution.")))))

(define-public librasterlite2
  (package
    (name "librasterlite2")
    (version "1.1.0-beta1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.gaia-gis.it/gaia-sins/librasterlite2-sources/"
             "librasterlite2-" version ".tar.gz"))
       (sha256
        (base32
         "1x24gqp4hsq97c31ncwxblab0x0863q8v1z42jil7lvsq3glqa7p"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("cairo" ,cairo)
       ("curl" ,curl)
       ("freetype" ,freetype)
       ("freexl" ,freexl)
       ("giflib" ,giflib)
       ("libgeotiff" ,libgeotiff)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("libpng" ,libpng)
       ("librttopo" ,librttopo)
       ("libspatialite" ,libspatialite)
       ("libtiff" ,libtiff)
       ("libwebp" ,libwebp)
       ("libxml2" ,libxml2)
       ("lz4" ,lz4)
       ("minizip" ,minizip)
       ("openjpeg" ,openjpeg)
       ("proj" ,proj)
       ("sqlite" ,sqlite)
       ("zstd" ,zstd "lib")))
    (synopsis "Library to work with huge raster coverages using a SpatiaLite")
    (description
     "librasterlite2 is a library that stores and retrieves huge raster
coverages using a SpatiaLite DBMS.")
    (home-page "https://www.gaia-gis.it/fossil/librasterlite2/index")
    ;; For the genuine librasterlite-sources holds:
    ;; Any of the licenses MPL1.1, GPL2+ or LGPL2.1+  may be picked.
    ;; Files under src/control_points are from GRASS
    ;; and are licensed under GPL2+ only.
    ;; src/md5.[ch]: Placed into the public domain by Alexander Peslyak.
    ;; The tools supporting the library (both rl2tool and wmslite) are
    ;; licensed under the GPL v3 (or any subsequent version) terms.
    ;; The test/*.svg files are placed in the public domain, except for
    ;; test/Car_Yellow.svg which is licensed under the Free Art License 1.3.
    (license (list license:gpl2+
                   license:gpl3+
                   license:lal1.3
                   license:lgpl2.1+
                   license:mpl1.1
                   license:public-domain))))

(define-public librttopo
  (package
    (name "librttopo")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.osgeo.org/gitea/rttopo/librttopo")
             (commit (string-append "librttopo-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0h7lzlkn9g4xky6h81ndy0aa6dxz8wb6rnl8v3987jy1i6pr072p"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-autogen
           (lambda _
             (let ((autoconf (which "autoconf"))
                   (autoheader (which "autoheader"))
                   (aclocal (which "aclocal"))
                   (automake (which "automake"))
                   (libtoolize (which "libtoolize")))
               (substitute* "autogen.sh"
                            (("`which autoconf 2>/dev/null`") autoconf)
                            (("`which autoheader 2>/dev/null`") autoheader)
                            (("ACLOCAL=.*$")
                             (string-append "ACLOCAL=" aclocal "\n"))
                            (("AUTOMAKE=.*$")
                             (string-append "AUTOMAKE=" automake "\n"))
                            (("LIBTOOLIZE=.*$")
                             (string-append "LIBTOOLIZE=" libtoolize "\n"))))
             #t)))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("geos" ,geos)))
    (synopsis "Library to handle SQL/MM topologies")
    (description
     "The RT Topology Library exposes an API to create and manage standard
(ISO 13249 aka SQL/MM) topologies using user-provided data stores.")
    (home-page "https://git.osgeo.org/gitea/rttopo/librttopo")
    (license license:gpl2+)))

(define-public libspatialite
  (package
    (name "libspatialite")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/libspatialite-"
                           version ".tar.gz"))
       (sha256
        (base32
         "164y82rw2lrp5glfc0rkn7n6xvx5dvlgmh7bb7815067251wkjzf"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("freexl" ,freexl)
       ("geos" ,geos)
       ("librttopo" ,librttopo)
       ("libxml2" ,libxml2)
       ("minizip" ,minizip)
       ("proj" ,proj)
       ("sqlite" ,sqlite)))
    (arguments
     `(#:configure-flags
       '("--enable-rttopo=yes")
       #:phases
       (modify-phases %standard-phases
         ;; 3 tests are failing, ignore them:
         (add-after 'unpack 'ignore-broken-tests
           (lambda _
             (substitute* '("test/Makefile.in")
               (("\tcheck_sql_stmt.* (check_sql_.*)" all tiny) (string-append "\t" tiny))
               (("(\tch.*) check_v.*ble2.*$" all vt1) (string-append vt1 " \\\n"))
               (("\tch.* (check_v.*ble4.*)$" all vt4) (string-append "\t" vt4)))
             #t)))))
    (synopsis "Extend SQLite to support Spatial SQL capabilities")
    (description
     "SpatiaLite is a library intended to extend the SQLite core to support
fully fledged Spatial SQL capabilities.")
    (home-page "https://www.gaia-gis.it/fossil/libspatialite/index")
    ;; For the genuine libspatialite-sources holds:
    ;; Any of the licenses MPL1.1, GPL2+ or LGPL2.1+  may be picked.
    ;; Files under src/control_points are from GRASS
    ;; and are licensed under GPL2+ only.
    ;; src/md5.[ch]: Placed into the public domain by Alexander Peslyak.
    (license (list license:gpl2+
                   license:lgpl2.1+
                   license:mpl1.1
                   license:public-domain))))

(define-public proj
  (package
    (name "proj")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.osgeo.org/proj/proj-"
                           version ".tar.gz"))
       (sha256
        (base32
         "1y46ij32j9b4x1kjnnlykcwk3kkjwkg44sfc1ziwm3a3g0ki3q3d"))))
    (build-system gnu-build-system)
    (inputs
     `(("sqlite" ,sqlite)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://proj.org/")
    (synopsis "Coordinate transformation software")
    (description
     "Proj is a generic coordinate transformation software that transforms
geospatial coordinates from one coordinate reference system (CRS) to another.
This includes cartographic projections as well as geodetic transformations.
PROJ includes command line applications for easy conversion of coordinates
from text files or directly from user input.  In addition, proj also exposes
an application programming interface that lets developers use the
functionality of proj in their own software.")
    (license (list license:expat
                   ;; src/projections/patterson.cpp
                   license:asl2.0
                   ;; src/geodesic.*, src/tests/geodtest.cpp
                   license:x11))))

(define-public proj.4
  (package
    (name "proj.4")
    (version "4.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.osgeo.org/proj/proj-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1xw5f427xk9p2nbsj04j6m5zyjlyd66sbvl2bkg8hd1kx8pm9139"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-test-paths
           (lambda _
             (substitute* '("nad/test27"
                            "nad/test83"
                            "nad/testvarious"
                            "nad/testdatumfile"
                            "nad/testflaky"
                            "nad/testIGNF")
               (("/bin/rm") (which "rm")))
             #t))
         ;; Precision problems on i686 and other platforms. See:
         ;; https://web.archive.org/web/20151006134301/http://trac.osgeo.org/proj/ticket/255
         ;; Disable failing test.
         (add-after 'patch-test-paths 'ignore-failing-tests
           (lambda _
             (substitute* '("nad/Makefile.in")
               (("\tPROJ_LIB.*" all) (string-append  "#" all)))
             #t)))))
    (inputs
     `(("glib" ,glib)))
    (home-page "https://proj.org/")
    (synopsis "Cartographic Projections Library")
    (description
     "Proj.4 is a library for converting coordinates between cartographic
projections.")
    (license (list license:expat
                   ;; src/PJ_patterson.c
                   license:asl2.0
                   ;; src/geodesic.c/h
                   license:x11
                   ;; Embedded EPSG database.
                   (license:non-copyleft "http://www.epsg.org/TermsOfUse")
                   ;; cmake/*
                   license:boost1.0))))

(define-public mapnik
  (package
    (name "mapnik")
    (version "3.0.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mapnik/mapnik/releases/download/v"
                           version "/mapnik-v" version ".tar.bz2"))
       (sha256
        (base32
         "06frcikaj2mgz3abfk5h0z4j3hbksi0zikwjngbjv4p5f3pwxf8q"))))
    (build-system scons-build-system)
    (inputs
     `(("boost" ,boost)
       ("cairo" ,cairo)
       ("freetype" ,freetype)
       ("harfbuzz" ,harfbuzz)
       ("icu4c" ,icu4c)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("libpng" ,libpng)
       ("libtiff" ,libtiff)
       ("libwebp" ,libwebp)
       ("libxml2" ,libxml2)
       ("proj.4" ,proj.4)
       ("sqlite" ,sqlite)
       ("zlib" ,zlib)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (arguments
     `(#:scons ,scons-python2
       #:scons-flags
       (list "CC=gcc"
             (string-append "PREFIX=" %output)
             (string-append "CUSTOM_LDFLAGS=-Wl,-rpath=" %output "/lib"))))
    (home-page "https://mapnik.org/")
    (synopsis "Toolkit for developing mapping applications")
    (description "Mapnik is a toolkit for developing mapping applications.  It
is basically a collection of geographic objects like maps, layers,
datasources, features, and geometries.  At its core is a C++ shared library
providing algorithms and patterns for spatial data access and visualization.
The library does not rely on any specific windowing system and can be deployed
to any server environment.  It is intended to play fair in a multi-threaded
environment and is aimed primarily, but not exclusively, at web-based
development.")
    (license (list license:lgpl2.1+
                   ;; demo/viewer, demo/python/rundemo.py
                   license:gpl2+
                   ;; deps/boost, deps/mapbox, deps/agg/include/agg_conv_offset.h
                   license:boost1.0
                   ;; deps/mapnik/sparsehash
                   license:bsd-3
                   ;; deps/agg
                   (license:non-copyleft "file://deps/agg/copying")))))

(define-public python2-mapnik
  (package
    (name "python2-mapnik")
    (version "3.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mapnik/python-mapnik/archive/v"
                           version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32
         "0w7wg72gnwmbjani9sqk42p2jwqkrl9hsdkawahni5m05xsifcb4"))))
    (build-system python-build-system)
    (inputs
     `(("boost" ,boost)
       ("harfbuzz" ,harfbuzz)
       ("icu4c" ,icu4c)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("libpng" ,libpng)
       ("libtiff" ,libtiff)
       ("libwebp" ,libwebp)
       ("mapnik" ,mapnik)
       ("proj.4" ,proj.4)
       ("python2-pycairo" ,python2-pycairo)))
    (native-inputs
     (let ((test-data-input
            (lambda (repository version hash)
              (origin
                (method url-fetch)
                (uri (string-append "https://github.com/mapnik/" repository
                                    "/archive/v" version ".tar.gz"))
                (file-name (string-append "python-mapnik-" repository
                                          "-" version ".tar.gz"))
                (sha256 (base32 hash))))))
       `(("python2-nose" ,python2-nose)
         ;; Test data is released as separate tarballs
         ("test-data"
          ,(test-data-input "test-data" "3.0.18"
                            "10cvgn5gxn8ldrszj24zr1vzm5w76kqk4s7bl2zzp5yvkhh8lj1n"))
         ("test-data-visual"
          ,(test-data-input "test-data-visual" "3.0.18"
                            "1cb9ghy8sis0w5fkp0dvwxdqqx44rhs9a9w8g9r9i7md1c40r80i")))))
    (arguments
     `(#:python ,python-2 ; Python 3 support is incomplete, and the build fails
       #:phases
       (modify-phases %standard-phases
         ;; Unpack test data into the source tree
         (add-after 'unpack 'unpack-submodules
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((unpack (lambda (source target)
                             (with-directory-excursion target
                               (invoke "tar" "xvf" (assoc-ref inputs source)
                                       "--strip-components=1")))))
               (unpack "test-data" "test/data")
               (unpack "test-data-visual" "test/data-visual"))))
         ;; Skip failing tests
         (add-after 'unpack 'skip-tests
           (lambda _
             (let ((skipped-tests (list "test_vrt_referring_to_missing_files"
                                        "test_unicode_regex_replace"
                                        "test_proj_antimeridian_bbox"
                                        "test_render_with_scale_factor")))
               (substitute* "setup.cfg"
                 (("\\[nosetests\\]" all)
                  (string-append all "\nexclude=^("
                                 (string-join skipped-tests "|") ")$")))))))))
    (home-page "https://github.com/mapnik/python-mapnik")
    (synopsis "Python bindings for Mapnik")
    (description "This package provides Python bindings for Mapnik.")
    (license license:lgpl2.1+)))

(define-public spatialite-gui
  (package
    (name "spatialite-gui")
    (version "2.1.0-beta1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.gaia-gis.it/gaia-sins/spatialite-gui-sources/"
             "spatialite_gui-" version ".tar.gz"))
       (sha256
        (base32 "0cyv4cycl073p9lnnnglcb72qn71g8h9g5zn4gzw7swcy5nxjj5s"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("curl" ,curl)
       ("freexl" ,freexl)
       ("geos" ,geos)
       ("giflib" ,giflib)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("librasterlite2" ,librasterlite2)
       ("librttopo" ,librttopo)
       ("libspatialite" ,libspatialite)
       ("libwebp" ,libwebp)
       ("libxlsxwriter" ,libxlsxwriter)
       ("libxml2" ,libxml2)
       ("lz4" ,lz4)
       ("minizip" ,minizip)
       ("openjpeg" ,openjpeg)
       ("postgresql" ,postgresql)
       ("proj" ,proj)
       ("sqlite" ,sqlite)
       ("virtualpg" ,virtualpg)
       ("wxwidgets" ,wxwidgets)
       ("zstd" ,zstd "lib")))
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-after 'unpack 'fix-gui
                    (lambda _
                      ;; Fix for the GUI not showing up.
                      (substitute* "Main.cpp"
                        (("Hide\\(\\);") ""))
                      #t)))))
    (synopsis "Graphical user interface for SpatiaLite")
    (description "Spatialite-gui provides a visual interface for viewing and
 maintaining a spatialite database.  You can easily see the structure of the
 tables and data contents using point and click functions, many of which
 construct common SQL queries, or craft your own SQL queries.")
    (home-page "https://www.gaia-gis.it/fossil/spatialite_gui/index")
    (license license:gpl3+)))

(define-public gdal
  (package
    (name "gdal")
    (version "3.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "http://download.osgeo.org/gdal/" version "/gdal-"
                     version ".tar.gz"))
              (sha256
               (base32
                "1p6nmlsr8wbyq350pa6c22vrp98dcsa7yjnqsbhdbp74yj53nw9r"))
              (modules '((guix build utils)))
              (snippet
                `(begin
                   ;; TODO: frmts contains a lot more bundled code.
                   (for-each delete-file-recursively
                     ;; bundled code
                     '("frmts/png/libpng"
                       "frmts/gif/giflib"
                       "frmts/jpeg/libjpeg"
                       "frmts/jpeg/libjpeg12"
                       "frmts/gtiff/libtiff"
                       "frmts/gtiff/libgeotiff"
                       "frmts/zlib"
                       "ogr/ogrsf_frmts/geojson/libjson"))))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:configure-flags
       (let-syntax ((with (syntax-rules ()
                            ((_ option input)
                             (string-append option "="
                                            (assoc-ref %build-inputs input))))))
         (list
           ;; TODO: --with-pcidsk, --with-pcraster
           (with "--with-freexl" "freexl")
           (with "--with-libjson-c" "json-c")
           (with "--with-png" "libpng")
           (with "--with-webp" "libwebp")
           (with "--with-gif" "giflib")
           (with "--with-jpeg" "libjpeg-turbo")
           (with "--with-libtiff" "libtiff")
           (with "--with-geotiff" "libgeotiff")
           (with "--with-libz" "zlib")
           (with "--with-expat" "expat")
           (with "--with-sqlite3" "sqlite")
           "--with-pcre"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'fix-path
           (lambda _
             (substitute* "frmts/mrf/mrf_band.cpp"
               (("\"../zlib/zlib.h\"") "<zlib.h>")))))))
    (inputs
     `(("expat" ,expat)
       ("freexl" ,freexl)
       ("geos" ,geos)
       ("giflib" ,giflib)
       ("json-c" ,json-c)
       ("libgeotiff" ,libgeotiff)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("libpng" ,libpng)
       ("libtiff" ,libtiff)
       ("libwebp" ,libwebp)
       ("netcdf" ,netcdf)
       ("pcre" ,pcre)
       ("postgresql" ,postgresql) ; libpq
       ("proj" ,proj)
       ("sqlite" ,sqlite)
       ("zlib" ,zlib)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://gdal.org/")
    (synopsis "Raster and vector geospatial data format library")
    (description "GDAL is a translator library for raster and vector geospatial
data formats.  As a library, it presents a single raster abstract data model
and single vector abstract data model to the calling application for all
supported formats.  It also comes with a variety of useful command line
utilities for data translation and processing.")
    (license (list
               ;; general license
               license:expat
               ;; frmts/gtiff/tif_float.c, frmts/pcraster/libcsf,
               ;; ogr/ogrsf_frmts/dxf/intronurbs.cpp, frmts/pdf/pdfdataset.cpp
               ;; frmts/mrf/
               license:bsd-3
               ;; frmts/hdf4/hdf-eos/*
               ;; similar to the expat license, but without guarantee exclusion
               (license:non-copyleft "file://frmts/hdf4/hdf-eos/README")
               ;; frmts/grib/degrib/
               license:public-domain ; with guarantee exclusion
               ;; port/cpl_minizip*
               ;; Some bsd-inspired license
               (license:non-copyleft "file://port/LICENCE_minizip")
               ;; alg/internal_libqhull
               ;; Some 5-clause license
               (license:non-copyleft "file://alg/internal_libqhull/COPYING.txt")
               ;; frmts/mrf/libLERC
               license:asl2.0))))

(define-public python-gdal
  (package (inherit gdal)
    (name "python-gdal")
    (build-system python-build-system)
    (arguments
     '(#:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'chdir
           (lambda _
             (chdir "swig/python")
             #t)))))
    (native-inputs '())
    (propagated-inputs
     `(("python-numpy" ,python-numpy)))
    (inputs
     `(("gdal" ,gdal)))
    (synopsis "GDAL (Geospatial Data Abstraction Library) python bindings")))

(define-public postgis
  (package
    (name "postgis")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.osgeo.org/postgis/source/postgis-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0z9a39243fv37mansbbjq5mmxpnhr7xzn8pv92fr7dkdb3psz5hf"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:make-flags
       (list (string-append "datadir=" (assoc-ref %outputs "out") "/share")
             (string-append "docdir="(assoc-ref %outputs "out") "/share/doc")
             (string-append "pkglibdir="(assoc-ref %outputs "out") "/lib")
             (string-append "bindir=" (assoc-ref %outputs "out") "/bin"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'fix-install-path
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* '("raster/loader/Makefile" "raster/scripts/python/Makefile")
               (("\\$\\(DESTDIR\\)\\$\\(PGSQL_BINDIR\\)")
                (string-append (assoc-ref outputs "out") "/bin"))))))))
    (inputs
     `(("gdal" ,gdal)
       ("geos" ,geos)
       ("giflib" ,giflib)
       ("json-c" ,json-c)
       ("libjpeg" ,libjpeg-turbo)
       ("libxml2" ,libxml2)
       ("pcre" ,pcre)
       ("postgresql" ,postgresql)
       ("protobuf-c" ,protobuf-c)
       ("proj" ,proj)))
    (native-inputs
     `(("perl" ,perl)
       ("pkg-config" ,pkg-config)))
    (home-page "https://postgis.net")
    (synopsis "Spatial database extender for PostgreSQL")
    (description "PostGIS is a spatial database extender for PostgreSQL
object-relational database.  It adds support for geographic objects allowing
location queries to be run in SQL.  This package provides a PostgreSQL
extension.")
    (license (list
               ;; General license
               license:gpl2+
               ;; loader/dbfopen, safileio.*, shapefil.h, shpopen.c
               license:expat
               ;; loader/getopt.*
               license:public-domain
               ;; doc/xsl
               license:bsd-3 ; files only say "BSD"
               ;; doc
               license:cc-by-sa3.0))))

(define-public tegola
  (package
    (name "tegola")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                     "https://github.com/go-spatial/tegola/archive/v"
                     version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09vnzxfn0r70kmd776kcdfqxhzdj11syxa0b27z4ci1k367v7viw"))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/go-spatial/tegola/cmd/tegola"
       #:unpack-path "github.com/go-spatial/tegola"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-version
           (lambda _
             (with-directory-excursion "src/github.com/go-spatial/tegola"
               (substitute* '("cmd/tegola/cmd/root.go"
                              "cmd/tegola_lambda/main.go")
                 (("version not set") ,version)))
             #t)))))
    (home-page "https://tegola.io")
    (synopsis "Vector tile server for maps")
    (description "Tegola is a free vector tile server written in Go.  Tegola
takes geospatial data and slices it into vector tiles that can be efficiently
delivered to any client.")
    (license (list
               license:expat
               ;; Some packages in vendor have other licenses
               license:asl2.0
               license:bsd-2
               license:bsd-3
               license:wtfpl2))))

(define-public imposm3
  (package
    (name "imposm3")
    (version "0.6.0-alpha.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/omniscale/imposm3/archive/v"
                            version ".tar.gz"))
    (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "06f0kwmv52yd5m9jlckqxqmkf0cnqy3hamakrvg9lspplyqrds80"))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/omniscale/imposm3/cmd/imposm"
       #:unpack-path "github.com/omniscale/imposm3"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-version
           (lambda _
             (substitute* "src/github.com/omniscale/imposm3/version.go"
               (("0.0.0-dev") ,version))
             #t)))))
    (inputs
     `(("geos" ,geos)
       ("leveldb" ,leveldb)))
    (home-page "https://imposm.org/")
    (synopsis "OpenStreetMap importer for PostGIS")
    (description "Imposm is an importer for OpenStreetMap data.  It reads PBF
files and imports the data into PostgreSQL/PostGIS databases.  It is designed
to create databases that are optimized for rendering/tile/map-services.")
    (license (list
               license:asl2.0
               ;; Some dependencies in vendor have different licenses
               license:expat
               license:bsd-2
               license:bsd-3))))

(define-public libosmium
  (package
    (name "libosmium")
    (version "2.15.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/osmcode/libosmium")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rqy18bbakp41f44y5id9ixh0ar2dby46z17p4115z8k1vv9znq2"))))
    (build-system cmake-build-system)
    (propagated-inputs
     `(("boost" ,boost)
       ("bzip2" ,bzip2)
       ("expat" ,expat)
       ("gdal" ,gdal)
       ("geos" ,geos)
       ("proj" ,proj)
       ("protozero" ,protozero)
       ("sparsehash" ,sparsehash)
       ("utfcpp" ,utfcpp)
       ("zlib" ,zlib)))
    (native-inputs
     `(("doxygen" ,doxygen)))
    (home-page "https://osmcode.org/libosmium/")
    (synopsis "C++ library for working with OpenStreetMap data")
    (description "Libosmium is a fast and flexible C++ library for working with
OpenStreetMap data.")
    (license license:boost1.0)))

(define-public osm2pgsql
  (package
    (name "osm2pgsql")
    (version "1.2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openstreetmap/osm2pgsql")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j35aa8qinhavliqi5pdm0viyi7lm5xyk402rliaxxs1r2hbsafn"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           (delete-file-recursively "contrib/protozero")
           (delete-file-recursively "contrib/libosmium")
           #t))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f; tests fail because we need to setup a database
       #:configure-flags
       (list (string-append "-DOSMIUM_INCLUDE_DIR="
                            (assoc-ref %build-inputs "libosmium")
                            "/include")
             (string-append "-DPROTOZERO_INCLUDE_DIR="
                            (assoc-ref %build-inputs "protozero")
                            "/include"))))
    (inputs
     `(("boost" ,boost)
       ("bzip2" ,bzip2)
       ("expat" ,expat)
       ("libosmium" ,libosmium)
       ("lua" ,lua)
       ("postgresql" ,postgresql)
       ("proj" ,proj)
       ("protozero" ,protozero)
       ("zlib" ,zlib)))
    (native-inputs
     `(("python" ,python)
       ("python-psycopg2" ,python-psycopg2)))
    (home-page "https://github.com/openstreetmap/osm2pgsql")
    (synopsis "OSM data importer to postgresql")
    (description "Osm2pgsql is a tool for loading OpenStreetMap data into a
PostgreSQL / PostGIS database suitable for applications like rendering into a
map, geocoding with Nominatim, or general analysis.")
    (license license:gpl2+)))

(define-public tippecanoe
  (package
    (name "tippecanoe")
    (version "1.36.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mapbox/tippecanoe")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0lbmhly4ivnqc6qk1k3sdqvsg6x3nfd8gnjx846bhqj4wag3f88m"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases (delete 'configure))
       #:test-target "test"
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" (assoc-ref %outputs "out")))))
    (inputs
     `(("perl" ,perl)
       ("sqlite" ,sqlite)
       ("zlib" ,zlib)))
    (home-page "https://github.com/mapbox/tippecanoe")
    (synopsis "Vector tile server for maps")
    (description "Tippecanoe creates scale-independent view of data, so that
the texture and density of features is visible at every zoom level, instead of
dropping features at lower levels.")
    (license license:bsd-2)))

(define-public osmctools
  (package
    (name "osmctools")
    (version "0.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/osm-c-tools/osmctools")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1m8d3r1q1v05pkr8k9czrmb4xjszw6hvgsf3kn9pf0v14gpn4r8f"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)))
    (inputs
     `(("zlib" ,zlib)))
    (home-page "https://gitlab.com/osm-c-tools/osmctools")
    (synopsis "Tools to convert, filter and update OpenStreetMap data files")
    (description "This project contains a few tools which are used in the
OpenStreetMap project.  They can be used to convert, filter and update
OpenStreetMap data files.")
    (license license:agpl3)))

(define-public osm-gps-map
  (package
    (name "osm-gps-map")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nzjrs/osm-gps-map/releases/download/"
             version "/osm-gps-map-" version ".tar.gz"))
       (sha256
        (base32
         "11imsf4cz1dpxdjh178k2s29axmq86rkfg1pqmn7incyxmjzhbwg"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("gnome-common" ,gnome-common)
       ("gtk-doc" ,gtk-doc/stable)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("cairo" ,cairo)
       ("glib" ,glib)
       ("gobject-introspection" ,gobject-introspection)
       ("gtk+" ,gtk+)
       ("libsoup" ,libsoup)))
    (home-page "https://nzjrs.github.io/osm-gps-map/")
    (synopsis "GTK+ widget for displaying OpenStreetMap tiles")
    (description
     "This package provides a GTK+ widget (and Python bindings) that when
given GPS coordinates,draws a GPS track, and points of interest on a moving
map display.  Downloads map data from a number of websites, including
@url{https://www.openstreetmap.org}.")
    (license license:gpl2+)))

(define-public xygrib
  (package
    (name "xygrib")
    (version "1.2.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/opengribs/XyGrib")
                     (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0xzsm8pr0zjk3f8j880fg5n82jyxn8xf1330qmmq1fqv7rsrg9ia"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively "data/fonts")
                  ;; Fixes compilation, can be removed with the next release.
                  ;; Upstream link: https://github.com/opengribs/XyGrib/pull/255
                  (substitute* "src/SkewT.h"
                    (("QMessageBox>") "QMessageBox>\n#include <QPainterPath>"))
                  #t))))
    (build-system cmake-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-directories
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((jpeg (assoc-ref inputs "openjpeg"))
                   (font (assoc-ref inputs "font-liberation")))
               (substitute* "CMakeLists.txt"
                 ;; Find libjpeg.
                 (("/usr") jpeg)
                 ;; Fix install locations.
                 (("set\\(PREFIX_BIN.*") "set(PREFIX_BIN \"bin\")\n")
                 (("set\\(PREFIX_PKGDATA.*") "set(PREFIX_PKGDATA \"share/${PROJECT_NAME}\")\n")
                 ;; Skip looking for the static library.
                 (("\"libnova.a\"") ""))
               ;; Don't use the bundled font-liberation.
               (substitute* "src/util/Font.cpp"
                 (("Util::pathFonts\\(\\)\\+\"liberation-fonts/\"")
                  (string-append "\"" font "/share/fonts/truetype/\"")))
               (substitute* "src/util/Util.h"
                 (("pathData\\(\\)\\+\"data/fonts/\"")
                  (string-append "\"" font "/share/fonts/\""))))
             #t)))
       #:tests? #f)) ; no tests
    (native-inputs
     `(("qttools" ,qttools)))
    (inputs
     `(("bzip2" ,bzip2)
       ("font-liberation" ,font-liberation)
       ("libnova" ,libnova)
       ("libpng" ,libpng)
       ("openjpeg" ,openjpeg)
       ("proj.4" ,proj.4)
       ("qtbase" ,qtbase-5)
       ("zlib" ,zlib)))
    (synopsis "Weather Forecast Visualization")
    (description
     "XyGrib is a Grib file reader and visualizes meteorological data providing
an off-line capability to analyse weather forecasts or hindcasts.  It is
intended to be used as a capable weather work station for anyone with a serious
interest in examining weather. This would include members of the sailing
community, private and sport aviators, farmers, weather buffs and many more.
XyGrib is the continuation of the zyGrib software package with a new team of
volunteers.")
    (home-page "https://opengribs.org")
    (license license:gpl3+)))

(define-public libspatialindex
  (package
    (name "libspatialindex")
    (version "1.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/libspatialindex/libspatialindex/"
                           "releases/download/" version "/spatialindex-src-"
                           version ".tar.bz2"))
       (sha256
        (base32
         "02n5vjcyk04w0djidyp21hfbxfpbbara8ifd9nml6158rwqr8lja"))))
    (build-system cmake-build-system)
    (home-page "https://libspatialindex.org")
    (synopsis "Spatial indexing library")
    (description "The purpose of this library is to provide:

@itemize
 @item An extensible framework that will support robust spatial indexing
methods.
 @item Support for sophisticated spatial queries.  Range, point location,
 nearest neighbor and k-nearest neighbor as well as parametric queries (defined
by spatial constraints) should be easy to deploy and run.
 @item Easy to use interfaces for inserting, deleting and updating information.
 @item Wide variety of customization capabilities.  Basic index and storage
characteristics like the page size, node capacity, minimum fan-out, splitting
algorithm, etc. should be easy to customize.
 @item Index persistence.  Internal memory and external memory structures
should be supported.  Clustered and non-clustered indices should be easy to be
persisted.
@end itemize
")
    (license license:expat)))

(define-public java-jmapviewer
  (package
    (name "java-jmapviewer")
    (version "2.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://svn.openstreetmap.org/applications/"
                                  "viewer/jmapviewer/releases/" version
                                  "/JMapViewer-" version "-Source.zip"))
              (sha256
               (base32
                "0sy6r5fkbb9bclw0is6gwnbzz627m7pjfnsqydxz58pbndakkhrv"))))
    (build-system ant-build-system)
    (native-inputs
     `(("unzip" ,unzip)))
    (arguments
     `(#:build-target "pack"
       #:tests? #f; No tests
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'clean
           (lambda* _
             (invoke "ant" "clean")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((dir (string-append (assoc-ref outputs "out") "/share/java/")))
               (mkdir-p dir)
               (copy-file "JMapViewer.jar" (string-append dir "JMapViewer.jar"))
               #t))))))
    (home-page "https://wiki.openstreetmap.org/wiki/JMapViewer")
    (synopsis "OSM map integration in Java")
    (description "JMapViewer is a Java component which easily
integrates an OSM map view into your Java application.  It is maintained as
an independent project by the JOSM team.")
    (license license:gpl2)))

(define-public java-opening-hours-parser
  (package
    (name "java-opening-hours-parser")
    (version "0.21.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/simonpoole/OpeningHoursParser")
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1m8sp0jbjyv1nq3ddj8rk6rf3sva3mkacc6vw7rsj0c2n57k3i50"))))
    (build-system ant-build-system)
    (arguments
     `(#:jar-name "java-opening-hours-parser.jar"
       #:source-dir "src/main/java"
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'copy-resources
           (lambda _
             (copy-recursively "src/main/resources" "build/classes")
             #t))
         (add-before 'build 'generate-parser
           (lambda* _
             (let* ((dir "src/main/java/ch/poole/openinghoursparser")
                    (file (string-append dir "/OpeningHoursParser.jj")))
               (invoke "javacc" "-DEBUG_PARSER=false"
                       "-DEBUG_TOKEN_MANAGER=false" "-JDK_VERSION=1.8"
                       "-GRAMMAR_ENCODING=UTF-8"
                       (string-append "-OUTPUT_DIRECTORY=" dir)
                       file))
             #t)))))
    (inputs
     `(("java-jetbrains-annotations" ,java-jetbrains-annotations)))
    (native-inputs
     `(("javacc" ,javacc)
       ("java-junit" ,java-junit)
       ("java-hamcrest-core" ,java-hamcrest-core)))
    (home-page "https://github.com/simonpoole/OpeningHoursParser")
    (synopsis "Java parser for the OpenStreetMap opening hour format")
    (description "This is a very simplistic parser for string values according
to the OSM opening hours specification.")
    (license license:expat)))

(define-public josm
  (package
    (name "josm")
    (version "17329")
    (source (origin
              (method svn-fetch)
              (uri (svn-reference
                     (url "https://josm.openstreetmap.de/svn/trunk")
                     (revision (string->number version))
                     (recursive? #f)))
              (sha256
               (base32
                "0bq6mirdsi0kmhjfzfp3innxi5a4395d7mas7ikxaz0cziljrz1i"))
              (file-name (string-append name "-" version "-checkout"))
              (modules '((guix build utils)))
            (snippet
             '(begin
                (for-each delete-file (find-files "." ".*.jar$"))
                #t))))
    (build-system ant-build-system)
    (native-inputs
     `(("javacc" ,javacc)))
    (inputs
     `(("java-commons-jcs" ,java-commons-jcs)
       ("java-commons-compress" ,java-commons-compress)
       ("java-jmapviewer" ,java-jmapviewer)
       ("java-jsonp-api" ,java-jsonp-api)
       ("java-jsonp-impl" ,java-jsonp-impl); runtime dependency
       ("java-metadata-extractor" ,java-metadata-extractor)
       ("java-opening-hours-parser" ,java-opening-hours-parser)
       ("java-openjfx-media" ,java-openjfx-media)
       ("java-signpost-core" ,java-signpost-core)
       ("java-svg-salamander" ,java-svg-salamander)))
    (arguments
     `(#:tests? #f
       #:jar-name "josm.jar"
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'rm-build.xml
           (lambda* _
             (delete-file "build.xml")
             #t))
         (add-before 'build 'fix-revision
           (lambda* _
             (with-output-to-file "REVISION.XML"
               (lambda _
                 (display
                   (string-append "<info><entry><commit revision=\"" ,version "\">"
                                  "<date>1970-01-01 00:00:00 +0000</date>"
                                  "</commit></entry></info>"))))
             #t))
         (add-before 'build 'fix-jcs
           (lambda _
             ;; This version of JOSM uses an unreleased version of commons-jcs,
             ;; which has renamed its classes to another namespace.  Rename them
             ;; back so they can be used with our version of jcs.
             (substitute* (find-files "." ".*.java$")
               (("jcs3") "jcs"))
             #t))
         (add-before 'build 'fix-classpath
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "CLASSPATH"
                     (string-join
                       (filter
                         (lambda (s)
                           (let ((source (assoc-ref inputs "source")))
                             (not (equal? (substring s 0 (string-length source))
                                          source))))
                         (string-split (getenv "CLASSPATH") #\:))
                       ":"))
             #t))
         (add-before 'build 'generate-parser
           (lambda* _
             (let* ((dir "src/org/openstreetmap/josm/gui/mappaint/mapcss")
                    (out (string-append dir "/parsergen"))
                    (file (string-append dir "/MapCSSParser.jj")))
               (mkdir-p "src/org/openstreetmap/josm/gui/mappaint/mapcss/parsergen")
               (invoke "javacc" "-DEBUG_PARSER=false"
                       "-DEBUG_TOKEN_MANAGER=false" "-JDK_VERSION=1.8"
                       "-GRAMMAR_ENCODING=UTF-8"
                       (string-append "-OUTPUT_DIRECTORY=" out)
                       file))
             #t))
         (add-after 'build 'generate-epsg
           (lambda _
             (system* "javac" "scripts/BuildProjectionDefinitions.java"
                      "-cp" "build/classes")
             (mkdir-p "data/projection")
             (with-output-to-file "data/projection/custom-epsg"
               (lambda _ (display "")))
             (invoke "java" "-cp" "build/classes:scripts:."
                     "BuildProjectionDefinitions" ".")
             #t))
         (add-after 'generate-epsg 'copy-resources
           (lambda _
             (copy-recursively "resources" "build/classes")
             #t))
         (add-before 'install 'regenerate-jar
           (lambda _
             ;; We need to regenerate the jar file to add data.
             (delete-file "build/jar/josm.jar")
             (invoke "jar" "-cf" "build/jar/josm.jar" "-C"
                     "build/classes" ".")
             #t))
         (add-before 'build 'copy-revision
           (lambda _
             (mkdir-p "build/classes")
             (with-output-to-file "build/classes/REVISION"
               (lambda _
                 (display
                   (string-append "Revision: " ,version "\n"
                                  "Is-Local-Build: true\n"
                                  "Build-Date: 1970-01-01 00:00:00 +0000\n"))))
             #t))
         (add-after 'install 'install-share-directories
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out               (assoc-ref outputs "out"))
                   (share-directories '("applications" "icons" "man" "menu"
                                        "metainfo" "mime" "pixmaps")))
               (for-each (lambda (directory)
                           (copy-recursively (string-append
                                              "native/linux/tested/usr/share/"
                                              directory)
                                             (string-append
                                              out "/share/" directory)))
                         share-directories))
             #t))
         (add-after 'install 'install-bin
           (lambda* (#:key outputs inputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (mkdir-p bin)
               (with-output-to-file (string-append bin "/josm")
                 (lambda _
                   (display
                     (string-append "#!/bin/sh\n"
                                    (assoc-ref inputs "jdk") "/bin/java"
                                    " -cp " out "/share/java/josm.jar:"
                                    (getenv "CLASSPATH")
                                    " org.openstreetmap.josm.gui.MainApplication"))))
               (chmod (string-append bin "/josm") #o755))
             #t)))))
    (home-page "https://josm.openstreetmap.de")
    (synopsis "OSM editor")
    (description "JOSM is an extensible editor for OpenStreetMap (OSM).  It
supports loading GPX tracks, background imagery and OSM data from local
sources as well as from online sources and allows editing the OSM data (nodes,
ways, and relations) and their metadata tags.")
    (license license:gpl2+)))

(define-public libmaxminddb
  (package
    (name "libmaxminddb")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/maxmind/libmaxminddb"
                           "/releases/download/" version "/"
                           "/libmaxminddb-" version ".tar.gz"))
       (sha256
        (base32 "0fd4a4sxiiwzbd5h74wl1ijnb7xybjyybb7q41vdq3w8nk3zdzd5"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags
       (list ,(string-append "CC=" (cc-for-target)))))
    (native-inputs
     `(("perl" ,perl)))
    (home-page "https://maxmind.github.io/libmaxminddb/")
    (synopsis "C library for the MaxMind DB file format")
    (description "The libmaxminddb library provides a C library for reading
MaxMind DB files, including the GeoIP2 databases from MaxMind.  The MaxMind DB
format is a custom, but open, binary format designed to facilitate fast
lookups of IP addresses while allowing flexibility in the type of data
associated with an address.")
    (license license:asl2.0)))

(define-public python-maxminddb
  (package
    (name "python-maxminddb")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "maxminddb" version))
       (sha256
        (base32
         "0y9giw81k4wdmpryr4k42w50z292mf364a6vs1vxf83ksc9ig6j4"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f)) ;; Tests require a copy of the maxmind database
    (inputs
     `(("libmaxminddb" ,libmaxminddb)))
    (home-page "https://www.maxmind.com/")
    (synopsis "Reader for the MaxMind DB format")
    (description "MaxMind DB is a binary file format that stores data indexed
by IP address subnets (IPv4 or IPv6).  This is a Python module for reading
MaxMind DB files.")
    (license license:asl2.0)))

(define-public python-geoip2
  (package
    (name "python-geoip2")
    (version "2.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "geoip2" version))
       (sha256
        (base32
         "1w7cay5q6zawjzivqbwz5cqx1qbdjw6kbriccb7l46p7b39fkzzp"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f)) ;; Tests require a copy of the maxmind database
    (inputs
     `(("python-maxminddb" ,python-maxminddb)
       ("python-requests" ,python-requests)))
    (home-page "https://www.maxmind.com/")
    (synopsis "MaxMind GeoIP2 API")
    (description "Provides an API for the GeoIP2 web services and databases.
The API also works with MaxMind’s free GeoLite2 databases.")
    (license license:asl2.0)))

(define-public routino
  (package
   (name "routino")
   (version "3.3.3")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "http://www.routino.org/download/routino-"
                         version ".tgz"))
     (sha256
      (base32 "1xa7l2bjn832nk6bc7b481nv8hd2gj41jwhg0d2qy10lqdvjpn5b"))))
   (build-system gnu-build-system)
   (native-inputs
    `(("perl" ,perl)))
   (inputs
    `(("bzip2" ,bzip2)
      ("xz" ,xz)
      ("zlib" ,zlib)))
   (arguments
    `(#:test-target "test"
      #:phases
      (modify-phases %standard-phases
        (replace 'configure
          (lambda* (#:key outputs #:allow-other-keys)
            (substitute* "Makefile.conf"
              (("prefix=/usr/local")
               (string-append "prefix=" (assoc-ref outputs "out")))
              (("LDFLAGS_LDSO=-Wl,-R\\.")
               "LDFLAGS_LDSO=-Wl,-R$(libdir)")
              (("#CFLAGS\\+=-DUSE_XZ")
               "CFLAGS+=-DUSE_XZ")
              (("#LDFLAGS\\+=-llzma")
               "LDFLAGS+=-llzma"))
            #t)))))
   (synopsis "Routing application for OpenStreetMap data")
   (description
    "Routino is an application for finding a route between two points
using the dataset of topographical information collected by
@url{https://www.OpenStreetMap.org}.")
   (home-page "https://www.routino.org/")
   (license license:agpl3+)))

(define-public qmapshack
  (package
    (name "qmapshack")
    (version "1.15.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Maproom/qmapshack")
             (commit (string-append "V_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1l1j2axf94pdqwirwwhwy3y6k8v1aix78ifqbv6j8sv131h2j7y7"))))
    (build-system qt-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("qttools" ,qttools)))
    (inputs
     `(("gdal" ,gdal)
       ("libjpeg-turbo" ,libjpeg-turbo)
       ("proj" ,proj)
       ("qtbase" ,qtbase-5)
       ("qtdeclarative" ,qtdeclarative-5)
       ("qtlocation" ,qtlocation-5)
       ("qtwebchannel" ,qtwebchannel-5)
       ("qtwebengine" ,qtwebengine)
       ("quazip" ,quazip)
       ("routino" ,routino)
       ("sqlite" ,sqlite)                      ; See wrap phase
       ("zlib" ,zlib)))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-cmake-modules
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "CMakeLists.txt"
               (("find_package\\(Qt5PrintSupport        REQUIRED\\)" all)
                (string-append all "\nfind_package(Qt5Positioning REQUIRED)")))
             (substitute* "cmake/Modules/FindROUTINO.cmake"
               (("/usr/local")
                (assoc-ref inputs "routino")))
             ;; The following fixes are included as patches in the sources
             ;; of QMapShack, but they are not applied by default, for
             ;; some reason...
             (invoke "patch" "-p1" "-i" "FindPROJ4.patch")
             (invoke "patch" "-p1" "-i" "FindQuaZip5.patch")
             #t))
         (add-after 'install 'wrap
           ;; The program fails to find the QtWebEngineProcess program,
           ;; so we set QTWEBENGINEPROCESS_PATH to help it.
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                   (qtwebengineprocess (string-append
                                        (assoc-ref inputs "qtwebengine")
                                        "/lib/qt5/libexec/QtWebEngineProcess")))
               (for-each (lambda (program)
                           (wrap-program program
                             `("QTWEBENGINEPROCESS_PATH" =
                               (,qtwebengineprocess))))
                         (find-files bin ".*")))
             #t)))))
    (synopsis "GPS mapping application")
    (description
     "QMapShack can be used to plan your next outdoor trip or to visualize and
archive all the GPS recordings of your past trips.  It is the successor of the
QLandkarte GT application.")
    (home-page "https://github.com/Maproom/qmapshack/wiki")
    (license license:gpl3+)))

(define-public readosm
  (package
    (name "readosm")
    (version "1.1.0a")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/"
                           "readosm-" version ".tar.gz"))
       (sha256
        (base32 "0igif2bxf4dr82glxz9gyx5mmni0r2dsnx9p9k6pxv3c4lfhaz6v"))))
    (build-system gnu-build-system)
    (inputs
     `(("expat" ,expat)
       ("zlib" ,zlib)))
    (synopsis "Data extractor for OpenStreetMap files")
    (description
     "ReadOSM is a library to extract valid data from within an OpenStreetMap
input file (in @code{.osm} or @code{.osm.pbf} format).")
    (home-page "https://www.gaia-gis.it/fossil/readosm/index")
    (license (list license:gpl2+
                   license:lgpl2.1+
                   license:mpl1.1))))

(define-public shapelib
  (package
    (name "shapelib")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OSGeo/shapelib")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lzch0jf6yqhw391phhafzw4ghmiz98zkf698h4fmq109fa2vhqd"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)))
    (home-page "http://shapelib.maptools.org/")
    (synopsis "Provides C library to write and update ESRI Shapefiles")
    (description
     "The Shapefile C Library provides the ability to write simple C programs
for reading, writing and updating (to a limited extent) ESRI Shapefiles, and the
associated attribute file (@file{.dbf}).")
    (license license:gpl2+)))

(define-public spatialite-tools
  (package
    (name "spatialite-tools")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/"
                           "spatialite-tools-" version ".tar.gz"))
       (sha256
        (base32 "070p6pg541wvwb28wkn7k0z1qdyirik2qc2jpj4pf0vzx02w414n"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("expat" ,expat)
       ("freexl" ,freexl)
       ("geos" ,geos)
       ("librttopo" ,librttopo)
       ("libspatialite" ,libspatialite)
       ("libxml2" ,libxml2)
       ("minizip" ,minizip)
       ("proj" ,proj)
       ("readosm" ,readosm)
       ("sqlite" ,sqlite)))
    (synopsis "Collection of command line tools for SpatiaLite")
    (description
     "@code{spatialite-tools} is a collection of Command Line Interface (CLI)
tools supporting SpatiaLite.")
    (home-page "https://www.gaia-gis.it/fossil/spatialite-tools/index")
    (license license:gpl3+)))

(define-public virtualpg
  (package
    (name "virtualpg")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.gaia-gis.it/gaia-sins/"
                           "virtualpg-" version ".tar.gz"))
       (sha256
        (base32 "12z0l7368r4116ljzg7nljy5hf425r11vxc540w79wlzikmynamy"))))
    (build-system gnu-build-system)
    (inputs
     `(("postgresql" ,postgresql)
       ("sqlite" ,sqlite)))
    (synopsis "Allow SQLite/SpatiaLite to access PostgreSQL/PostGIS tables")
    (description
     "VirtualPG is a dynamic extension for the SQLite DBMS.  It implements
the VirtualPostgres driver, allowing to directly exchange data between SQLite
and PostgreSQL; if SpatiaLite is available even PostGIS geometries can be
exchanged form one Spatial DBMS and the other.")
    (home-page "https://www.gaia-gis.it/fossil/virtualpg/index")
    (license (list license:gpl2+
                   license:lgpl2.1+
                   license:mpl1.1))))

(define-public opencpn
  (package
    (name "opencpn")
    (version "5.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenCPN/OpenCPN")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xv3h6svw9aay5ixpql231md3pf00qxvhg62z88daraf18hlkfja"))))
    (build-system cmake-build-system)
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("bzip2" ,bzip2)
       ("cairo" ,cairo)
       ("curl" ,curl)
       ("glu" ,glu)
       ("gtk+" ,gtk+)
       ("libarchive" ,libarchive)
       ("libelf" ,libelf)
       ("libexif" ,libexif)
       ("libsndfile" ,libsndfile)
       ("lz4" ,lz4)
       ("mesa" ,mesa)
       ("pango" ,pango)
       ("portaudio" ,portaudio)
       ("sqlite" ,sqlite)
       ("tinyxml" ,tinyxml)
       ("wxsvg" ,wxsvg)
       ("wxwidgets" ,wxwidgets)
       ("xz" ,xz)
       ("zlib" ,zlib)))
    (arguments
     `(#:configure-flags '("-DENABLE_PORTAUDIO=ON"
                           "-DENABLE_SNDFILE=ON"
                           "-DBUNDLE_TCDATA=ON"
                           "-DBUNDLE_GSHHS=CRUDE")
       #:tests? #f ; No tests defined
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-build
           (lambda _
             (substitute* "CMakeLists.txt"
               (("set\\(wxWidgets_CONFIG_OPTIONS.*--toolkit=gtk3" all)
                (string-append all " --libs all")))
             #t)))))
    (synopsis "Chart plotter and marine GPS navigation software")
    (description
     "OpenCPN is a chart plotter and marine navigation software designed to be
used at the helm station of your boat while underway.  Chart a course and
track your position right from your laptop.")
    (home-page "https://opencpn.org/")
    (license (list license:asl2.0
                   license:cc0
                   license:bsd-2
                   license:bsd-3
                   license:expat
                   license:gpl3+
                   license:lgpl2.1+
                   license:lgpl3+
                   license:sgifreeb2.0
                   license:zlib))))

(define-public grass
  (let* ((version "7.8.5")
         (majorminor (string-join (list-head (string-split version #\.) 2) ""))
         (grassxx (string-append "grass" majorminor)))
    (package
      (name "grass")
      (version version)
      (source
       (origin
         (method url-fetch)
         (uri (string-append "https://grass.osgeo.org/" grassxx
                             "/source/grass-" version ".tar.gz"))
         (sha256
          (base32 "0dzzhgcsrszzinvjir50nvzq873b8gsp0p9k8fvcrv14amkbnnd3"))))
      (build-system gnu-build-system)
      (inputs
       `(("bzip2" ,bzip2)
         ("cairo" ,cairo)
         ("fftw" ,fftw)
         ("freetype" ,freetype)
         ("gdal" ,gdal)
         ("geos" ,geos)
         ("glu" ,glu)
         ("lapack" ,lapack)
         ("libpng" ,libpng)
         ("libtiff" ,libtiff)
         ("mesa" ,mesa)
         ("mariadb-dev" ,mariadb "dev")
         ("mariadb-lib" ,mariadb "lib")
         ("netcdf" ,netcdf)
         ("openblas" ,openblas)
         ("perl" ,perl)
         ("postgresql" ,postgresql)
         ("proj.4" ,proj.4)
         ("python" ,python)
         ("python-dateutil" ,python-dateutil)
         ("python-numpy" ,python-numpy)
         ("python-wxpython" ,python-wxpython)
         ("readline" ,readline)
         ("sqlite" ,sqlite)
         ("wxwidgets" ,wxwidgets)
         ("zlib" ,zlib)
         ("zstd" ,zstd "lib")))
      (native-inputs
       `(("bash" ,bash-minimal)
         ("bison" ,bison)
         ("flex" ,flex)
         ("pkg-config" ,pkg-config)))
      (arguments
       `(#:tests? #f ; No tests
         #:modules ((guix build gnu-build-system)
                    ((guix build python-build-system) #:prefix python:)
                    (guix build utils))
         #:imported-modules (,@%gnu-build-system-modules
                             (guix build python-build-system))
         #:phases
         (modify-phases %standard-phases
           (replace 'configure
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let ((shell (string-append (assoc-ref inputs "bash")
                                           "/bin/bash")))
                 (setenv "SHELL" shell)
                 (setenv "CONFIG_SHELL" shell)
                 (setenv "LDFLAGS" (string-append "-Wl,-rpath -Wl,"
                                                  (assoc-ref outputs "out")
                                                  "/" ,grassxx "/lib")))
               (invoke "./configure"
                       (string-append "--prefix="
                                      (assoc-ref outputs "out"))
                       "--with-blas"
                       "--with-bzlib"
                       (string-append "--with-freetype-includes="
                                      (assoc-ref inputs "freetype")
                                      "/include/freetype2")
                       (string-append "--with-freetype-libs="
                                      (assoc-ref inputs "freetype")
                                      "/lib")
                       "--with-geos"
                       "--with-lapack"
                       "--with-mysql"
                       (string-append "--with-mysql-includes="
                                      (assoc-ref inputs "mariadb-dev")
                                      "/include/mysql")
                       (string-append "--with-mysql-libs="
                                      (assoc-ref inputs "mariadb-lib")
                                      "/lib")
                       "--with-netcdf"
                       "--with-postgres"
                       (string-append "--with-proj-share="
                                      (assoc-ref inputs "proj.4")
                                      "/share/proj")
                       "--with-pthread"
                       "--with-readline"
                       "--with-sqlite"
                       "--with-wxwidgets")))
           (add-after 'install 'install-links
             (lambda* (#:key outputs #:allow-other-keys)
               ;; Put links for includes and libraries in the standard places.
               (let* ((out (assoc-ref outputs "out"))
                      (dir (string-append out "/" ,grassxx)))
                 (symlink (string-append dir "/include")
                          (string-append out "/include"))
                 (symlink (string-append dir "/lib")
                          (string-append out "/lib")))
               #t))
           (add-after 'install-links 'python:wrap
             (assoc-ref python:%standard-phases 'wrap))
           (add-after 'python:wrap 'wrap-with-python-interpreter
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (wrap-program (string-append out "/bin/" ,grassxx)
                   `("GRASS_PYTHON" = (,(which "python3"))))
                 #t))))))
      (synopsis "GRASS Geographic Information System")
      (description
       "GRASS (Geographic Resources Analysis Support System), is a Geographic
Information System (GIS) software suite used for geospatial data management and
analysis, image processing, graphics and maps production, spatial modeling, and
visualization.")
      (home-page "https://grass.osgeo.org/")
      (license license:gpl2+))))

(define-public saga
  (package
    (name "saga")
    (version "7.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/saga-gis/SAGA%20-%20"
                           (version-major version) "/SAGA%20-%20" version
                           "/saga-" version ".tar.gz"))
       (sha256
        (base32 "1n051yxxkylly0k9rlkx2ih3j2lf9d4csg00sm7161r7nhjvggd1"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("swig" ,swig)))
    (inputs
     `(("curl" ,curl)
       ("fftw" ,fftw)
       ("gdal" ,gdal)
       ("hdf5" ,hdf5)
       ("jasper" ,jasper)
       ("libharu" ,libharu)
       ("libtiff" ,libtiff)
       ("opencv" ,opencv)
       ("postgresql" ,postgresql)
       ("proj" ,proj)
       ("python" ,python)
       ("qhull" ,qhull)
       ("unixodbc" ,unixodbc)
       ("vigra" ,vigra)
       ("wxwidgets" ,wxwidgets)))
    (arguments
     '(#:configure-flags '("--enable-python")))
    (synopsis "System for Automated Geoscientific Analyses")
    (description
     "SAGA (System for Automated Geoscientific Analyses) is a Geographic
Information System (GIS) software.  It has been designed for an easy and
effective implementation of spatial algorithms and it offers a comprehensive,
growing set of geoscientific methods.")
    (home-page "http://www.saga-gis.org")
    (license (list license:gpl2+ license:lgpl2.1+))))

(define-public qgis
  (package
    (name "qgis")
    (version "3.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://qgis.org/downloads/qgis-"
                           version ".tar.bz2"))
       (sha256
        (base32 "012dv8dcg7w4lf6k37i41wialwhi0kpkxw2dnq19yqqk35632mzx"))))
    (build-system cmake-build-system)
    (arguments
     `(#:modules ((guix build cmake-build-system)
                  ((guix build python-build-system) #:prefix python:)
                  (guix build qt-utils)
                  (guix build utils))
       #:imported-modules (,@%cmake-build-system-modules
                           (guix build python-build-system)
                           (guix build qt-utils))
       #:phases
       (modify-phases %standard-phases
         ;; Configure correct path to PyQt5 SIP directory
         (add-after 'unpack 'configure-pyqt5-sip-path
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "cmake/FindPyQt5.py"
               (("sip_dir = cfg.default_sip_dir")
                (string-append "sip_dir = \""
                               (assoc-ref inputs "python-pyqt+qscintilla")
                               "/share/sip\""))
               ;; Fix building with python-sip@5.
               ;;
               ;; The reason for this is that python-sip@5 introduces some
               ;; changes such as a new build system 'sip-build' as well as the
               ;; use of the path "/lib/pythonX.X/site-packages/*/bindings/"
               ;; instead of "/share/sip/" for .sip files. However, we do not
               ;; actually use that those yet. QGIS detects SIP5 and assumes we
               ;; are, messing up the build. The long term solution is to fully
               ;; upgrade SIP, use sip-build and fix all failing packages, but
               ;; for now I just want to get the build working.
               ((".pyqt_sip_dir...os.path.join.*,")
                (string-append "'pyqt_sip_dir': \""
                               (assoc-ref inputs "python-pyqt+qscintilla")
                               "/share/sip"  "\",")))
             (substitute* (list "scripts/prepare_commit.sh"
                                "scripts/qstringfixup.sh"
                                "scripts/release.pl"
                                "scripts/runtests_local_travis_config.sh"
                                "scripts/sip_include.sh"
                                "scripts/sipdiff"
                                "scripts/sipify_all.sh"
                                "scripts/spell_check/check_spelling.sh"
                                "scripts/spell_check/spell_test.sh"
                                "scripts/verify_indentation.sh"
                                "tests/code_layout/test_banned_keywords.sh"
                                "tests/code_layout/test_licenses.sh"
                                "tests/code_layout/test_shellcheck.sh"
                                "tests/code_layout/test_sip_include.sh"
                                "tests/code_layout/test_sipfiles.sh"
                                "tests/code_layout/test_sipify.sh")
               (("\\$\\(git rev-parse --show-toplevel\\)")
                (getcwd)))
             (substitute* "tests/code_layout/test_sip_include.sh"
               (("^REV=.*") "REV=currentrev\n"))
             #t))
         (replace 'check
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "HOME" "/tmp")
             (system (string-append (assoc-ref inputs "xorg-server")
                                    "/bin/Xvfb :1 &"))
             (setenv "DISPLAY" ":1")
             (setenv "TRAVIS" "true")
             (setenv "CTEST_OUTPUT_ON_FAILURE" "1")
             (invoke "ctest"
                     "-E" (string-join
                           '(;; Disable tests that require network access
                             "qgis_filedownloader"
                             ;; TODO: Find why the following tests fail
                             "ProcessingGdalAlgorithmsRasterTest"
                             "ProcessingGdalAlgorithmsVectorTest"
                             "ProcessingGrass7AlgorithmsImageryTest"
                             "ProcessingGrass7AlgorithmsRasterTest"
                             "ProcessingGrass7AlgorithmsVectorTest"
                             "ProcessingOtbAlgorithmsTest"
                             "ProcessingQgisAlgorithmsTestPt1"
                             "ProcessingQgisAlgorithmsTestPt2"
                             "ProcessingQgisAlgorithmsTestPt3"
                             "ProcessingQgisAlgorithmsTestPt4"
                             "PyCoreAdittions"
                             "PyQgsAnnotation"
                             "PyQgsAppStartup"
                             "PyQgsAuthenticationSystem"
                             "PyQgsAuxiliaryStorage"
                             "PyQgsDBManagerGpkg"
                             "PyQgsDBManagerSpatialite"
                             "PyQgsDataItem"
                             "PyQgsFieldValidator"
                             "PyQgsFileUtils"
                             "PyQgsGeometryTest"
                             "PyQgsImageCache"
                             "PyQgsImportIntoPostGIS"
                             "PyQgsLayerDependencies"
                             "PyQgsLayerMetadata"
                             "PyQgsLayout"
                             "PyQgsLayoutExporter"
                             "PyQgsLayoutHtml"
                             "PyQgsLayoutLegend"
                             "PyQgsLayoutMapGrid"
                             "PyQgsMapLayer"
                             "PyQgsMetadataBase"
                             "PyQgsOGRProvider"
                             "PyQgsOGRProviderGpkg"
                             "PyQgsOapifProvider"
                             "PyQgsPalLabelingLayout"
                             "PyQgsProject"
                             "PyQgsProviderConnectionGpkg"
                             "PyQgsProviderConnectionPostgres"
                             "PyQgsProviderConnectionSpatialite"
                             "PyQgsPythonProvider"
                             "PyQgsRasterLayer"
                             "PyQgsRulebasedRenderer"
                             "PyQgsSelectiveMasking"
                             "PyQgsSettings"
                             "PyQgsShapefileProvider"
                             "PyQgsSpatialiteProvider"
                             "PyQgsSvgCache"
                             "PyQgsSymbolExpressionVariables"
                             "PyQgsTextRenderer"
                             "PyQgsVectorFileWriter"
                             "PyQgsVectorLayer"
                             "PyQgsVectorLayerUtils"
                             "PyQgsVirtualLayerProvider"
                             "PyQgsWFSProvider"
                             "qgis_arcgisrestutilstest"
                             "qgis_authmanagertest"
                             "qgis_compositionconvertertest"
                             "qgis_coordinatereferencesystemtest"
                             "qgis_expressiontest"
                             "qgis_fontmarkertest"
                             "qgis_geometrycheckstest"
                             "qgis_geometrytest"
                             "qgis_gpsinformationwidget"
                             "qgis_grassprovidertest7"
                             "qgis_imagecachetest"
                             "qgis_labelingenginetest"
                             "qgis_layouthtmltest"
                             "qgis_layoutmanualtabletest"
                             "qgis_layoutmapgridtest"
                             "qgis_layoutmaptest"
                             "qgis_layoutpicturetest"
                             "qgis_layouttabletest"
                             "qgis_mapdevicepixelratiotest"
                             "qgis_maprendererjobtest"
                             "qgis_ogrproviderguitest"
                             "qgis_painteffecttest"
                             "qgis_pallabelingtest"
                             "qgis_processingtest"
                             "qgis_rasterlayertest"
                             "qgis_shellcheck"
                             "qgis_sip_include"
                             "qgis_sip_uptodate"
                             "qgis_sipify"
                             "qgis_styletest"
                             "qgis_svgmarkertest"
                             "qgis_taskmanagertest"
                             "qgis_wcsprovidertest"
                             "qgis_ziplayertest")
                           "|"))))
         (add-after 'install 'wrap-python
           (assoc-ref python:%standard-phases 'wrap))
         (add-after 'wrap-python 'wrap-qt
           (lambda* (#:key outputs #:allow-other-keys)
             (wrap-qt-program (assoc-ref outputs "out") "qgis")
             #t))
         (add-after 'wrap-qt 'wrap-gis
           (lambda* (#:key inputs outputs #:allow-other-keys)
             ;; TODO: Find if there is a way to get SAGA to work.
             ;; Currently QGIS says "version of SAGA not supported".
             ;; Disable it for now.
             (let* ((out (assoc-ref outputs "out"))
                    ;;(saga (string-append (assoc-ref inputs "saga") "/bin"))
                    (grass-version ,(package-version grass))
                    (grass-majorminor (string-join
                                       (list-head
                                        (string-split grass-version #\.) 2)
                                       ""))
                    (grass (string-append (assoc-ref inputs "grass")
                                          "/grass" grass-majorminor)))
               (wrap-program (string-append out "/bin/qgis")
                 ;;`("PATH" ":" prefix (,saga))
                 `("QGIS_PREFIX_PATH" = (,out))
                 `("GISBASE" = (,grass))))
             #t)))))
    (inputs
     `(("exiv2" ,exiv2)
       ("expat" ,expat)
       ("gdal" ,gdal)
       ("geos" ,geos)
       ("gpsbabel" ,gpsbabel)
       ("grass" ,grass)
       ("gsl" ,gsl)
       ("hdf5" ,hdf5)
       ("libspatialindex" ,libspatialindex)
       ("libspatialite" ,libspatialite)
       ("libxml2" ,libxml2)
       ("libzip" ,libzip)
       ("netcdf" ,netcdf)
       ("postgresql" ,postgresql)
       ("proj" ,proj)
       ("protobuf" ,protobuf)
       ("python" ,python)
       ("python-chardet" ,python-chardet)
       ("python-dateutil" ,python-dateutil)
       ("python-future" ,python-future)
       ("python-gdal" ,python-gdal)
       ("python-jinja2" ,python-jinja2)
       ("python-numpy" ,python-numpy)
       ("python-owslib" ,python-owslib)
       ("python-psycopg2" ,python-psycopg2)
       ("python-pygments" ,python-pygments)
       ("python-pyqt+qscintilla" ,python-pyqt+qscintilla)
       ("python-pytz" ,python-pytz)
       ("python-pyyaml" ,python-pyyaml)
       ("python-requests" ,python-requests)
       ("python-sip" ,python-sip)
       ("python-six" ,python-six)
       ("python-urllib3" ,python-urllib3)
       ("qca" ,qca)
       ("qscintilla" ,qscintilla)
       ("qtbase" ,qtbase-5)
       ("qtdeclarative" ,qtdeclarative-5)
       ("qtkeychain" ,qtkeychain)
       ("qtlocation" ,qtlocation-5)
       ("qtserialport" ,qtserialport-5)
       ("qtsvg" ,qtsvg-5)
       ("qtwebkit" ,qtwebkit)
       ("qwt" ,qwt)
       ;;("saga" ,saga)
       ("sqlite" ,sqlite)))
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)
       ("perl" ,perl)
       ("perl-yaml-tiny" ,perl-yaml-tiny)
       ("pkg-config" ,pkg-config)
       ("python-mock" ,python-mock)
       ("python-nose2" ,python-nose2)
       ("qttools" ,qttools)
       ("shellcheck" ,shellcheck)
       ("xorg-server" ,xorg-server-for-tests)))
    (home-page "https://qgis.org")
    (synopsis "Geographical information system")
    (description "QGIS is an easy to use Geographical Information
System (GIS).  It is a GIS data viewer and editor.  QGIS supports a number of
raster and vector data formats, with new support easily added using the plugin
architecture.")
    (license
     (list
      license:asl1.1
      license:asl2.0
      license:bsd-2
      license:bsd-3
      license:boost1.0
      license:cc-by3.0
      license:cc-by4.0
      license:cc-by-sa3.0
      license:cc-by-sa4.0
      (license:fsdg-compatible "https://www.deviantart.com/elvensword")
      (license:fsf-free "file://debian/copyright" "Go Squared")
      license:expat
      license:fdl1.2+
      (license:fsf-free
       "https://www.deviantart.com/webgoddess/art/Reddish-Inspired-Gradients-42208824")
      (license:fsf-free
       "file://debian/copyright"
       "QT-Commercial or LGPL-2.1 with Digia Qt LGPL Exception 1.1 or GPL-3")
      license:gpl2
      license:gpl2+
      license:gpl3
      license:gpl3+
      license:isc
      license:lgpl2.0+
      license:lgpl2.1
      license:lgpl2.1+
      license:lgpl3
      (license:non-copyleft "file://debian/copyright" "BSD-like-gist")
      (license:non-copyleft "file://debian/copyright" "Jim Mossman Attribution")
      (license:non-copyleft
       "https://www.ncl.ucar.edu/Download/NCL_source_license.shtml"
       "NCL Source Code License")
      license:ogl-psi1.0
      license:opl1.0+
      license:public-domain
      license:qwt1.0))))

(define-public python-geographiclib
  (package
    (name "python-geographiclib")
    (version "1.50")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "geographiclib" version))
        (sha256
         (base32
          "0cn6ap5fkh3mkfa57l5b44z3gvz7j6lpmc9rl4g2jny2gvp4dg8j"))))
    (build-system python-build-system)
    (home-page "https://geographiclib.sourceforge.io/1.50/python/")
    (synopsis "Python geodesic routines from GeographicLib")
    (description
     "This is a python implementation of the geodesic routines in GeographicLib.")
    (license license:expat)))

(define-public python-geopy
  (package
    (name "python-geopy")
    (version "2.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "geopy" version))
        (sha256
         (base32
          "0fx0cv0kgbvynpmjgsvq2fpsyngd5idiscdn8pd5201f1ngii3mq"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-geographiclib" ,python-geographiclib)))
    (native-inputs
     `(("python-async-generator" ,python-async-generator)
       ("python-coverage" ,python-coverage)
       ("python-flake8" ,python-flake8)
       ("python-isort" ,python-isort)
       ("python-pytest" ,python-pytest)
       ("python-pytest-aiohttp" ,python-pytest-aiohttp)
       ("python-readme-renderer" ,python-readme-renderer)
       ("python-pytz" ,python-pytz)))
    (home-page "https://github.com/geopy/geopy")
    (synopsis "Geocoding library for Python")
    (description "@code{geopy} is a Python client for several popular geocoding
web services.  @code{geopy} makes it easy for Python developers to locate the
coordinates of addresses, cities, countries, and landmarks across the globe
using third-party geocoders and other data sources.")
    (license license:expat)))
