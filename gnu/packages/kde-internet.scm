;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2017, 2019, 2020 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2020 Tobias Geerinckx-Rice <me@tobias.gr>
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

(define-module (gnu packages kde-internet)
  #:use-module (guix build-system qt)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-pim)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages linphone)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml))

(define-public choqok
  (package
    (name "choqok")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/choqok/"
                           (version-major+minor version)
                           "/src/choqok-" version ".tar.xz"))
       (sha256
        (base32 "0zm4nkpmvd181xlkis7ydzx54p3vn0zgpdzgh54f1hsjy6ahsq16"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("attica" ,attica)
       ("kcmutils" ,kcmutils)
       ("kconfigwidgets" ,kconfigwidgets)
       ("kcoreaddons" ,kcoreaddons)
       ("kdewebkit" ,kdewebkit)
       ("kemoticons" ,kemoticons)
       ("kglobalaccel" ,kglobalaccel)
       ("kguiaddons" ,kguiaddons)
       ("ki18n" ,ki18n)
       ("kio" ,kio)
       ("knotifications" ,knotifications)
       ("knotifyconfig" ,knotifyconfig)
       ("kparts" ,kparts)
       ("ktextwidgets" ,ktextwidgets)
       ("kwallet" ,kwallet)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kxmlgui" ,kxmlgui)
       ;; TODO: telepathy
       ("oxygen-icons" ,oxygen-icons) ; default icon set
       ("purpose" ,purpose)
       ("qca" ,qca)
       ("qoauth" ,qoauth)
       ("qtbase" ,qtbase-5)
       ("qtnetworkauth" ,qtnetworkauth)
       ("qtwebkit" ,qtwebkit)
       ("sonnet" ,sonnet)))
    (home-page "https://kde.org/applications/internet/org.kde.choqok")
    (synopsis "Micro-Blogging Client")
    (description "Choqok is a fast, efficient and simple to use micro-blogging
client for KDE.  It currently supports the twitter.com and identi.ca
microblogging services.

Other notable features include:
@itemize
@item Support for user + friends time-lines.
@item Support for @@Reply time-lines.
@item Support for sending and receiving direct messages.
@item Twitpic.com integration.
@item The ability to use multiple accounts simultaneously.
@item Support for search APIs for all services.
@item KWallet integration.
@item Support for automatic shortening urls with more than 30 characters.
@item Support for configuring status lists appearance.
@end itemize")
    (license license:gpl3+)))

(define-public kget
  (package
    (name "kget")
    (version "20.04.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/release-service/" version
                           "/src/kget-" version ".tar.xz"))
       (sha256
        (base32 "1swx58wcig8zq8ibhczhcw7l8mqjm7pq8zca9gmny9kda5q04f5m"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("boost" ,boost)
       ("gmp" ,gmp)
       ("gpgme" ,gpgme)
       ("kcmutils" ,kcmutils)
       ("kcompletion" ,kcompletion)
       ("kconfig" ,kconfig)
       ("kconfigwidgets" ,kconfigwidgets)
       ("kcoreaddons" ,kcoreaddons)
       ("kcrash" ,kcrash)
       ("kdbusaddons" ,kdbusaddons)
       ("kdelibs4support" ,kdelibs4support) ;; KLocale
       ("kdoctools" ,kdoctools)
       ("ki18n" ,ki18n)
       ("kiconthemes" ,kiconthemes)
       ("kio" ,kio)
       ("kitemviews" ,kitemviews)
       ("knotifications" ,knotifications)
       ("knotifyconfig" ,knotifyconfig)
       ("kparts" ,kparts)
       ("kservice" ,kservice)
       ("ktextwidgets" ,ktextwidgets)
       ("kwallet" ,kwallet)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwindowsystem" ,kwindowsystem)
       ("kxmlgui" ,kxmlgui)
       ("libgcrypt" ,libgcrypt)
       ("libktorrent" ,libktorrent)
       ;; TODO: libmms
       ;; TODO: LibKWorkspace - plasma-workspace?
       ("oxygen-icons" ,oxygen-icons) ; default icon set
       ("qca" ,qca)
       ("qgpgme" ,qgpgme)
       ("qtbase" ,qtbase-5)
       ))
    (home-page "http://www.kde.org/")
    (synopsis "Versatile and user-friendly download manager")
    (description "KGet is an advanced download manager with support for
Metalink and Bittorrent.  Downloads are added to the list, where they can be
paused, queued, or scheduled for later. KGet supports download via FTP anf
HTTP(S) as well as pausing downloads.

This package is part of the KDE networking module.")
    (license ;; GPL for programs, LGPL for libraries, FDL for documentation
     (list license:gpl2+ license:lgpl2.0+ license:fdl1.2+))))

(define-public konversation
  (package
    (name "konversation")
    (version "1.7.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/konversation/" version
                           "/src/konversation-" version ".tar.xz"))
       (sha256
        (base32 "19qqq9s8k0cl71ib33xn07f26j5ji2g4336jk65im6452cf1dv27"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("karchive" ,karchive)
       ("kbookmarks" ,kbookmarks)
       ("kconfig" ,kconfig)
       ("kconfigwidgets" ,kconfigwidgets)
       ("kcoreaddons" ,kcoreaddons)
       ("kcrash" ,kcrash)
       ("kdbusaddons" ,kdbusaddons)
       ("kemoticons" ,kemoticons)
       ("kglobalaccel" ,kglobalaccel)
       ("ki18n" ,ki18n)
       ("kiconthemes" ,kiconthemes)
       ("kidletime" ,kidletime)
       ("kio" ,kio)
       ("kitemviews" ,kitemviews)
       ("knotifications" ,knotifications)
       ("knotifyconfig" ,knotifyconfig)
       ("kparts" ,kparts)
       ("kwallet" ,kwallet)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwindowsystem" ,kwindowsystem)
       ("oxygen-icons" ,oxygen-icons) ; default icon set
       ("phonon" ,phonon)
       ("qtbase" ,qtbase-5)
       ("qca" ,qca)
       ("solid" ,solid)
       ("sonnet" ,sonnet)))
    (home-page "https://kde.org/applications/internet/org.kde.konversations")
    (synopsis "Graphical Internet Relay Chat (IRC) client for KDE")
    (description "Konversation is a graphical Internet Relay Chat client (IRC)
with KDE support.

Features are:
@itemize
@item Standard IRC features
@item SSL server support
@item Bookmarking support
@item Easy to use graphical user interface
@item Multiple servers and channels in one single window
@item DCC file transfer with resume support
@item Multiple identities for different servers
@item Text decorations and colors
@item Pattern-based message highlighting and OnScreen Display notifications
@item Automatic UTF-8 detection
@item Per channel encoding support
@item Theme support for nick icons
@item Highly configurable
@item Multi-language scripting support (with DCOP)
@item Customizable command aliases
@item NickServ-aware log-on (for registered nicknames)
@item Smart logging
@item Traditional or enhanced-shell-style nick completion
@end itemize")
    (license ;; GPL for programs, FDL for documentation
     (list license:gpl2+ license:fdl1.2+))))

(define-public kopete
  (package
    (name "kopete")
    (version "20.04.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/release-service/" version
                           "/src/kopete-" version ".tar.xz"))
       (sha256
        (base32 "149gi9hkyl825kf046iqkam3gkzfwdc2sihbf8gs6njachzvb81y"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("boost" ,boost)
       ("expat" ,expat)
       ("glib" ,glib)
       ("gpgme" ,gpgme)
       ("jsoncpp" ,jsoncpp)
       ("kcmutils" ,kcmutils)
       ("kconfig" ,kconfig)
       ("kcontacts" ,kcontacts)
       ("kcoreaddons" ,kcoreaddons)
       ("kcrash" ,kcrash)
       ("kdbusaddons" ,kdbusaddons)
       ("kdelibs4support" ,kdelibs4support)
       ("kdnssd" ,kdnssd)
       ("kemoticons" ,kemoticons)
       ("khtml" ,khtml)
       ("ki18n" ,ki18n)
       ("kidentitymanagement" ,kidentitymanagement)
       ("kjs" ,kjs)
       ;; TODO? kleopatra (additionally to libkleo)
       ("knotifyconfig" ,knotifyconfig)
       ("kparts" ,kparts)
       ("kpimtextedit" ,kpimtextedit)
       ("ktexteditor" ,ktexteditor)
       ("kwallet" ,kwallet)
       ;; TODO: Libgadu
       ("libidn" ,libidn)
       ("libkleo" ,libkleo)
       ;; TODO: LibMeanwhile
       ("libotr" ,libotr)
       ("libsrtp" ,libsrtp)
       ("libxml2" ,libxml2)
       ("libxstl" ,libxslt)
       ;; TODO: Mediastreamer
       ("openssl" ,openssl)
       ("ortp" ,ortp)
       ("phonon" ,phonon)
       ("qca" ,qca)
       ("qgpgme" ,qgpgme)
       ("qtbase" ,qtbase-5)
       ("speex" ,speex)
       ("v4l-utils" ,v4l-utils)
       ;; TODO: Xmms
       ("zlib" ,zlib)))
    ;; TODO: enable video support
    (home-page "https://kde.org/applications/internet/org.kde.kopete")
    (synopsis "Instant messaging and chat application")
    (description "Kopete is an instant messenger supporting Jabber/XMPP ,AIM,
ICQ, Gadu-Gadu, Novell GroupWise Messenger, and more.  It is designed to be a
flexible and extensible multi-protocol system suitable for personal and
enterprise use.

The goal of Kopete is to provide users with a single easy-to-use way to access
all of their instant messaging systems.  The interface puts people first, and
is integrated with the system address book to let you access your contacts
from other KDE applications.

This package is part of the KDE networking module.")
    (license ;; GPL for programs, LGPL for libraries, FDL for documentation
     (list license:gpl2+ license:lgpl2.0+ license:fdl1.2+))))

(define-public krdc
  (package
    (name "krdc")
    (version "20.04.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/release-service/" version
                           "/src/krdc-" version ".tar.xz"))
       (sha256
        (base32 "1hp23k3nsrcxpv2qiynjgm71zn3l6ds00cpd4frc68szgiblrw9r"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("kbookmarks" ,kbookmarks)
       ("freerdp" ,freerdp)
       ("kcmutils" ,kcmutils)
       ("kcompletion" ,kcompletion)
       ("kconfig" ,kconfig)
       ("kdnssd" ,kdnssd)
       ("ki18n" ,ki18n)
       ("kiconthemes" ,kiconthemes)
       ("knotifications" ,knotifications)
       ("knotifyconfig" ,knotifyconfig)
       ("knotifyconfig" ,knotifyconfig)
       ("kwallet" ,kwallet)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwindowsystem" ,kwindowsystem)
       ("kxmlgui" ,kxmlgui)
       ("libssh2" ,libssh)
       ;; TODO: libvnc{server,client} - is not tigervnc-{server,client}
       ("oxygen-icons" ,oxygen-icons) ; default icon set
       ("qtbase" ,qtbase-5)))
    (home-page "https://kde.org/applications/internet/org.kde.krdc")
    (synopsis "Remote desktop client")
    (description "KRDC is a client application that allows you to view or even
control the desktop session on another machine that is running a compatible
server.  VNC and RDP are supported.

This package is part of the KDE networking module.")
    (license ;; GPL for programs, LGPL for libraries, FDL for documentation
     (list license:gpl2+ license:lgpl2.0+ license:fdl1.2+))))

(define-public ktorrent
  (package
    (name "ktorrent")
    (version "5.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/ktorrent/" version
                           "/ktorrent-" version ".tar.xz"))
       (sha256
        (base32 "0kwd0npxfg4mdh7f3xadd2zjlqalpb1jxk61505qpcgcssijf534"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("kdoctools" ,kdoctools)))
    (inputs
     `(("boost" ,boost)
       ("gmp" ,gmp)
       ("karchive" ,karchive)
       ("kcmutils" ,kcmutils)
       ("kconfig" ,kconfig)
       ("kconfigwidgets" ,kconfigwidgets)
       ("kcoreaddons" ,kcoreaddons)
       ("kcrash" ,kcrash)
       ("kdbusaddons" ,kdbusaddons)
       ("kdewebkit" ,kdewebkit)
       ("kdnssd" ,kdnssd)
       ("ki18n" ,ki18n)
       ("kiconthemes" ,kiconthemes)
       ("kio" ,kio)
       ("knotifications" ,knotifications)
       ("knotifyconfig" ,knotifyconfig)
       ("kparts" ,kparts)
       ("kplotting" ,kplotting)
       ("kross" ,kross)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kwindowsystem" ,kwindowsystem)
       ("kxmlgui" ,kxmlgui)
       ("libgcrypt" ,libgcrypt)
       ("libktorrent" ,libktorrent)
       ;; TODO: LibKWorkspace -> plasma-workspace?
       ("oxygen-icons" ,oxygen-icons) ; default icon set
       ("phonon" ,phonon)
       ("qtbase" ,qtbase-5)
       ("qtscript" ,qtscript)
       ("qtwebkit" ,qtwebkit)
       ("solid" ,solid)
       ("syndication" ,syndication)
       ("taglib" ,taglib)))
    (home-page "https://kde.org/applications/internet/org.kde.ktorrent")
    (synopsis "BitTorrent client")
    (description "KTorrent is a BitTorrent application by KDE which allows you
to download files using the BitTorrent protocol.  It enables you to run
multiple torrents at the same time and comes with extended features to make it
a full-featured client for BitTorrent.")
    (license license:gpl2+)))

(define-public libgravatar
  (package
    (name "libgravatar")
    (version "20.04.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/release-service/" version
                           "/src/libgravatar-" version ".tar.xz"))
       (sha256
        (base32 "0981ci2kr20v4fk11h57rqya0brgslfazpgq1yk5yqiwyqqm49r2"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("kconfig" ,kconfig)
       ("ki18n" ,ki18n)
       ("kio" ,kio)
       ("kpimcommon" ,kpimcommon)
       ("ktextwidgets" ,ktextwidgets)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("qtbase" ,qtbase-5)))
    (arguments
     `(#:tests? #f)) ;; 2/7 tests fail (due to network issues?)
    (home-page "https://invent.kde.org/pim/libgravatar")
    (synopsis "Online avatar lookup library")
    (description "This library retrieves avatar images based on a
hash from a person's email address, as well as local caching to avoid
unnecessary network operations.")
    (license ;; GPL for programs, LGPL for libraries
     (list license:gpl2+ license:lgpl2.0+))))

(define-public libktorrent
  (package
    (name "libktorrent")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde//stable/ktorrent/"
                           (package-version ktorrent)
                           "/libktorrent-" version ".tar.xz"))
       (sha256
        (base32 "0051zh8bb4p9wmcfn5ql987brhsaiw9880xdck7b5dm1a05mri2w"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("boost" ,boost)
       ("gmp" ,gmp)
       ("karchive" ,karchive)
       ("kcrash" ,kcrash)
       ("ki18n" ,ki18n)
       ("kio" ,kio)
       ("libgcrypt" ,libgcrypt)
       ("qca" ,qca)
       ("qtbase" ,qtbase-5)
       ("solid" ,solid)))
    (home-page "https://invent.kde.org/network/libktorrent")
    (synopsis "BitTorrent protocol library for C++ / Qt 5 / KDE Frameworks")
    (description "The KTorrent library supports connectivity to HTTP and UDP
trackers, mainline DHT and the new generation Micro Transport
Protocol (uTP).  In addition, it provides many powerful BitTorrent network
features including but not limited to torrent downloading and seeding, torrent
creation and downloaded data verification, magnet links, advanced peer
management, IP blocking lists.")
    (license license:gpl2+)))
