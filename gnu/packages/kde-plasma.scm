;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 Thomas Danckaert <post@thomasdanckaert.be>
;;; Copyright © 2018 Meiyo Peng <meiyo.peng@gmail.com>
;;; Copyright © 2019 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2017 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2019 Tobias Geerinckx-Rice <me@tobias.gr>
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

(define-module (gnu packages kde-plasma)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system qt)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg))

(define-public kdecoration
  (package
    (name "kdecoration")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kdecoration-" version ".tar.xz"))
              (sha256
               (base32
                "0pn8n7zyb0adzjnn92vmbcf7pmpss60k9k1rk5llamj016xzfgnf"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)))
    (inputs
     `(("ki18n" ,ki18n)
       ("qtbase" ,qtbase)))
    (home-page "https://invent.kde.org/plasma/kdecoration")
    (synopsis "Plugin based library to create window decorations")
    (description "KDecoration is a library to create window decorations.
These window decorations can be used by for example an X11 based window
manager which re-parents a Client window to a window decoration frame.")
    (license license:lgpl3+)))

(define-public kscreenlocker
  (package
    (name "kscreenlocker")
    (version "5.19.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kde/stable/plasma/" version
                                  "/kscreenlocker-" version ".tar.xz"))
              (sha256
               (base32
                "1fd5sqaqx9kj3kr0bgxpllhcm5arf8bc9pkpd9yk9c8xjy0j0fxi"))))
    (build-system qt-build-system)
    (arguments
     `(#:tests? #f ;; TODO: make tests pass
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'check-setup
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (system (string-append (assoc-ref inputs "xorg-server")
                                   "/bin/Xvfb :1 -screen 0 640x480x24 &"))
             (setenv "DISPLAY" ":1")
             #t))
         (delete 'check)
         ;; Tests use the installed library and require a DBus session.
         (add-after 'install 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (if tests?
                 (begin
                   (setenv "CTEST_OUTPUT_ON_FAILURE" "1")
                   (invoke "dbus-launch" "ctest" ".")))
             #t)))))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("pkg-config" ,pkg-config)
       ;; For tests.
       ("dbus" ,dbus)
       ("xorg-server" ,xorg-server-for-tests)))
    (inputs
     `(("kcmutils" ,kcmutils)
       ("kcrash" ,kcrash)
       ("kdeclarative" ,kdeclarative)
       ("kglobalaccel" ,kglobalaccel)
       ("ki18n" ,ki18n)
       ("kidletime" ,kidletime)
       ("knotifications" ,knotifications)
       ("ktextwidgets" ,ktextwidgets)
       ("kwayland" ,kwayland)
       ("kwindowsystem" ,kwindowsystem)
       ("kxmlgui" ,kxmlgui)
       ("libseccomp" ,libseccomp) ;for sandboxing the look'n'feel package
       ("libxcursor" ,libxcursor) ;missing in CMakeList.txt
       ("libxi" ,libxi)           ;XInput, required for grabbing XInput2 devices
       ("linux-pam" ,linux-pam)
       ("logind" ,elogind)        ;optional loginctl support
       ("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("qtx11extras" ,qtx11extras)
       ("solid" ,solid)
       ("wayland" ,wayland)
       ("xcb-util-keysyms" ,xcb-util-keysyms)))
    (home-page "https://invent.kde.org/plasma/kscreenlocker")
    (synopsis "Screen locking library")
    (description
     "@code{kscreenlocker} is a library for creating secure lock screens.")
    (license license:gpl2+)))

(define-public libkscreen
  (package
    (name "libkscreen")
    (version "5.19.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde/stable/plasma/" version "/"
                           name "-" version ".tar.xz"))
       (sha256
        (base32 "0rf1pm0yyc069f4n5s9ipdx4glzfr9zvv5cbrmn4q9i4v6z1qd8i"))))
    (build-system qt-build-system)
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ;; For testing.
       ("dbus" ,dbus)))
    (inputs
     `(("kwayland" ,kwayland)
       ("libxrandr" ,libxrandr)
       ("qtbase" ,qtbase)
       ("qtx11extras" ,qtx11extras)))
    (arguments
     '(#:tests? #f)) ; FIXME: 55% tests passed, 5 tests failed out of 11
    (home-page "https://community.kde.org/Solid/Projects/ScreenManagement")
    (synopsis "KDE's screen management software")
    (description "KScreen is the new screen management software for KDE Plasma
Workspaces which tries to be as magic and automatic as possible for users with
basic needs and easy to configure for those who want special setups.")
    (license license:gpl2+)))

(define-public libksysguard
  (package
    (name "libksysguard")
    (version "5.19.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://kde//stable/plasma/" version
                           "/libksysguard-" version ".tar.xz"))
       (sha256
        (base32 "1kd0h3p8bf9k5pqp0frhr81pa0yyrpkckg9zznirk9p1v88v7bfq"))))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("kconfigwidgets" ,kconfigwidgets)
       ("kiconthemes" ,kiconthemes)
       ("kwindowsystem" ,kwindowsystem)
       ("ki18n" ,ki18n)
       ("kauth" ,kauth)
       ("kcompletion" ,kcompletion)
       ("kconfig" ,kconfig)
       ("kcoreaddons" ,kcoreaddons)
       ("kdeclarative" ,kdeclarative)
       ("kglobalaccel" ,kglobalaccel)
       ("kio" ,kio)
       ("knewstuff" ,knewstuff)
       ("kwidgetsaddons" ,kwidgetsaddons)
       ("kservice" ,kservice)
       ("qtbase" ,qtbase)
       ("qtdeclarative" ,qtdeclarative)
       ("qtscript" ,qtscript)
       ("qtwebkit" ,qtwebkit)
       ("qtx11extras" ,qtx11extras)
       ("plasma" ,plasma-framework)
       ("zlib" ,zlib)))
    (build-system qt-build-system)
    (arguments
     `(#:configure-flags
       `(,(string-append "-DKDE_INSTALL_DATADIR="
                         (assoc-ref %outputs "out") "/share"))
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'patch-cmakelists
           (lambda _
             ;; TODO: Verify: This should no longer be necessary, since
             ;; KF5AuthConfig.cmake.in contains this already.
             (substitute* "processcore/CMakeLists.txt"
               (("KAUTH_HELPER_INSTALL_DIR") "KDE_INSTALL_LIBEXECDIR"))))
         (replace 'check
           (lambda _
             ;; TODO: Fix this failing test-case
             (invoke "ctest" "-E" "processtest"))))))
    (home-page "https://userbase.kde.org/KSysGuard")
    (synopsis "Network enabled task and system monitoring")
    (description "KSysGuard can obtain information on system load and
manage running processes.  It obtains this information by interacting
with a ksysguardd daemon, which may also run on a remote system.")
    (license license:gpl3+)))

