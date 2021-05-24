;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014, 2015, 2018, 2021, 2021 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2015 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2015 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2016–2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 Rene Saavedra <rennes@openmailbox.org>
;;; Copyright © 2021 David Larsson <david.larsson@selfhosted.xyz>
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

(define-module (gnu packages ftp)
  #:use-module ((guix licenses) #:select (gpl2 gpl2+ gpl3+ clarified-artistic))
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xml))

(define-public lftp
  (package
    (name "lftp")
    (version "4.9.2")
    (source (origin
              (method url-fetch)
              ;; See https://lftp.tech/get.html for mirrors.
              (uri (list (string-append "https://lftp.tech/ftp/lftp-"
                                        version ".tar.xz")
                         (string-append "https://lftp.tech/ftp/old/lftp-"
                                        version ".tar.xz")
                         (string-append "ftp://ftp.st.ryukoku.ac.jp/pub/network/"
                                        "ftp/lftp/lftp-" version ".tar.xz")))
              (sha256
               (base32
                "03b7y0h3mf4jfq5y8zw6hv9v44z3n6i8hc1iswax96y3z7sc85y5"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("zlib" ,zlib)
       ("readline" ,readline)
       ("gnutls" ,gnutls)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; Disable tests that require network access, which is most of them.
         (add-before 'check 'disable-impure-tests
                     (lambda _
                       (substitute* "tests/Makefile"
                         (("(ftp-cls-l|ftp-list|http-get)\\$\\(EXEEXT\\)") "")
                         (("lftp-https-get ") ""))
                       #t)))
       #:configure-flags
       (list (string-append "--with-readline="
                            (assoc-ref %build-inputs "readline")))))
    (home-page "https://lftp.tech/")
    (synopsis "Command-line file transfer program")
    (description
     "LFTP is a sophisticated FTP/HTTP client, and a file transfer program
supporting a number of network protocols.  Like Bash, it has job control and
uses the Readline library for input.  It has bookmarks, a built-in mirror
command, and can transfer several files in parallel.  It was designed with
reliability in mind.")
    (license gpl3+)))

(define-public ncftp
  (package
    (name "ncftp")
    (version "3.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "ftp://ftp.ncftp.com/ncftp/ncftp-"
                                  version "-src.tar.xz"))
              (sha256
               (base32
                "1389657cwgw5a3kljnqmhvfh4vr2gcr71dwz1mlhf22xq23hc82z"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Use the right 'rm' and 'ls'.
                  (substitute* (cons "configure"
                                     (find-files "."
                                                 "^(Makefile\\.in|.*\\.sh)$"))
                    (("/bin/(rm|ls)" _ command)
                     command))

                  ;; This is free software, avoid any confusion.
                  (substitute* (find-files "." "\\.c$")
                    (("a freeware program")
                     "free software"))
                  #t))))
    (properties
     `((release-monitoring-url . "https://www.ncftp.com/download/")))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'configure
                  (lambda* (#:key outputs #:allow-other-keys)
                    ;; This is an old 'configure' script that doesn't
                    ;; understand variables passed as arguments.
                    (let ((out (assoc-ref outputs "out")))
                      (setenv "CONFIG_SHELL" (which "sh"))
                      (setenv "SHELL" (which "sh"))
                      (invoke "./configure"
                              (string-append "--prefix=" out))))))
       #:tests? #f)) ;there are no tests
    (inputs `(("ncurses" ,ncurses)))
    (home-page "https://www.ncftp.com/ncftp/")
    (synopsis "Command-line File Transfer Protocol (FTP) client")
    (description
     "NcFTP Client (or just NcFTP) is a set of command-line programs to access
File Transfer Protocol (FTP) servers.  This includes @code{ncftp}, an interactive
FTP browser, as well as non-interactive commands such as @code{ncftpput} and
@code{ncftpget}.")
    (license clarified-artistic)))


(define-public weex
  (package
    (name "weex")
    (version "2.8.2")
    (source
      (origin
        (method url-fetch)
        (uri
          (string-append "mirror://sourceforge/weex/weex/"
                         "/weex_" version ".tar.gz"))
        (sha256
          (base32
            "1ir761hjncr1bamaqcw9j7x57xi3s9jax3223bxwbq30a0vsw1pd"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("automake" ,automake)
       ("autoconf" ,autoconf)
       ("gettext" ,gettext-minimal)))
    (home-page "http://weex.sourceforge.net/")
    (synopsis "Non-interactive client for FTP synchronization")
    (description
     "Weex is a utility designed to automate the task of remotely
maintaining a web page or other FTP archive.  It synchronizes a set of
local files to a remote server by performing uploads and remote deletes
as required.")
    (license gpl2+)))

(define-public libfilezilla
  (package
    (name "libfilezilla")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.filezilla-project.org/"
                           "libfilezilla/libfilezilla-" version ".tar.bz2"))
       (sha256
        (base32 "0f0n0kkhclp387glmc758134z4l0qk8935mi523q60b11q3j3h77"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list "--disable-static")))
    (native-inputs
     `(("cppunit" ,cppunit)
       ("gcc" ,gcc-8)                   ; XXX remove when it's the default
       ("gettext" ,gettext-minimal)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("gnutls" ,gnutls)
       ("nettle" ,nettle)))
    (home-page "https://lib.filezilla-project.org")
    (synopsis "Cross-platform C++ library used by Filezilla client")
    (description
     "This package provides some basic functionality to build high-performing,
platform-independent programs.

Some of the highlights include:
@itemize
@item
A type-safe, multi-threaded event system that's simple to use yet efficient.
@item
Timers for periodic events.
@item
A @code{datetime} class that not only tracks timestamp but also their accuracy,
which simplifies dealing with timestamps originating from different sources.
@item
Simple process handling for spawning child processes with redirected input and
output.
@end itemize\n")
    (license gpl2+)))

(define-public filezilla
  (package
    (name "filezilla")
    (version "3.54.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.filezilla-project.org/client/"
                           "FileZilla_" version "_src.tar.bz2"))
       (sha256
        (base32 "0smayigsk8hjplk7pm6dd80r1dnhr4f6xzp3n1p1ss5v2ff1jfkh"))))
    (build-system gnu-build-system)
    (arguments
      ;; Don't let filezilla phone home to check for updates.
     '(#:configure-flags '("--disable-autoupdatecheck")))
    (native-inputs
     `(("cppunit" ,cppunit)
       ("gettext" ,gettext-minimal)
       ("pkg-config" ,pkg-config)
       ("xdg-utils" ,xdg-utils)))
    (inputs
     `(("dbus" ,dbus)
       ("gnutls" ,gnutls)
       ("gtk+" ,gtk+)
       ("libfilezilla" ,libfilezilla)
       ("libidn" ,libidn)
       ("nettle" ,nettle)
       ("pugixml" ,pugixml)
       ("sqlite" ,sqlite)
       ("wxwidgets" ,wxwidgets)))
    (home-page "https://filezilla-project.org")
    (synopsis "Full-featured graphical FTP/FTPS/SFTP client")
    (description
     "Filezilla client supports FTP, FTP over SSL/TLS (FTPS),
SSH File Transfer Protocol (SFTP), HTTP/1.1, SOCKS5, FTP-Proxy, IPv6
and others features such as bookmarks, drag and drop, filename filters,
directory comparison and more.")
    (license gpl2+)
    (properties '((upstream-name . "FileZilla")))))

(define-public vsftpd
  ;; Use a significantly patched CentOS variant with TLSv1.2 support and
  ;; further bug and security fixes.
  (let ((upstream-version "3.0.3")
        (centos-version "8.3.2011")
        (revision "32.el8"))
    (package
      (name "vsftpd")
      (version (string-append upstream-version "-" revision))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://vault.centos.org/centos/" centos-version
               "/AppStream/Source/SPackages/vsftpd-" upstream-version "-"
               revision ".src.rpm"))
         (sha256
          (base32 "1xl0kqcismf82hl99klqbvvpylpyk1yr1qjy5hd8f80cj4lyl0f4"))))
      (build-system gnu-build-system)
      (arguments
       `(#:make-flags '("LDFLAGS=-lcrypt -lssl -pie")
         #:tests? #f                    ; no tests exist
         #:phases
         (modify-phases %standard-phases
           (replace 'unpack
             (lambda* (#:key source #:allow-other-keys)
               (invoke "7z" "e" source "-ocpio")
               (invoke "cpio" "-idmv"
                       (string-append "--file=cpio/vsftpd-"
                                      ,upstream-version "-" ,revision
                                      ".src.cpio"))
               (invoke "tar" "xvf"
                       (string-append "vsftpd-" ,upstream-version ".tar.gz"))
               (chdir (string-append "vsftpd-" ,upstream-version))))
           (add-after 'unpack 'apply-CentOS-patches
             ;; Apply all patches as enumerated in vsftpd.spec, in order:
             ;; simply using FIND-FILES would silently corrupt the result.
             (lambda _
               (call-with-input-file "../vsftpd.spec"
                 (lambda (port)
                   (use-modules (ice-9 rdelim))
                   (let loop ()
                     (let ((line (read-line port)))
                       (unless (eof-object? line)
                         (when (string-prefix? "Patch" line)
                           (let* ((space (string-rindex line #\space))
                                  (patch (string-drop line (+ 1 space))))
                             (format #t "Applying '~a'.\n" patch)
                             (invoke "patch" "-Np1"
                                     "-i" (string-append "../" patch))))
                         (loop))))))))
           (add-after 'unpack 'patch-installation-directory
             (lambda* (#:key outputs #:allow-other-keys)
               (substitute* "Makefile"
                 (("/usr") (assoc-ref outputs "out")))
               #t))
           (add-before 'install 'mkdir
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (mkdir-p out)
                 (mkdir (string-append out "/sbin"))
                 (mkdir (string-append out "/man"))
                 (mkdir (string-append out "/man/man5"))
                 (mkdir (string-append out "/man/man8"))
                 #t)))
           (delete 'configure))))
      (native-inputs
       ;; Used to unpack the source RPM.
       `(("p7zip" ,p7zip)
         ("cpio" ,cpio)))
      (inputs
       `(("libcap" ,libcap)
         ("linux-pam" ,linux-pam)
         ("openssl" ,openssl)))
      (home-page "https://security.appspot.com/vsftpd.html")
      (synopsis "Share files securely over FTP or FTPS")
      (description "@command{vsftpd} is a daemon that listens on a TCP socket
for clients and gives them access to local files via File Transfer
Protocol.")
      (license gpl2))))
