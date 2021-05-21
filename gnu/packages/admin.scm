;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2013 Cyril Roelandt <tipecaml@gmail.com>
;;; Copyright © 2014, 2015, 2016, 2018, 2019, 2020 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2014, 2015, 2016, 2017, 2018, 2020, 2021 Eric Bavier <bavier@posteo.net>
;;; Copyright © 2015, 2016 Taylan Ulrich Bayırlı/Kammer <taylanbayirli@gmail.com>
;;; Copyright © 2015 Alex Sassmannshausen <alex.sassmannshausen@gmail.com>
;;; Copyright © 2015 Eric Dvorsak <eric@dvorsak.fr>
;;; Copyright © 2016, 2017, 2020 Leo Famulari <leo@famulari.name>
;;; Copyright © 2016 Pjotr Prins <pjotr.guix@thebird.nl>
;;; Copyright © 2016, 2017 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2016, 2017, 2018, 2019, 2020, 2021 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016 Peter Feigl <peter.feigl@nexoid.at>
;;; Copyright © 2016 John J. Foerch <jjfoerch@earthlink.net>
;;; Copyright © 2016, 2017 Nikita <nikita@n0.is>
;;; Copyright © 2016–2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2016 John Darrington <jmd@gnu.org>
;;; Copyright © 2017 Ben Sturmfels <ben@sturm.com.au>
;;; Copyright © 2017 Ethan R. Jones <doubleplusgood23@gmail.com>
;;; Copyright © 2017 Christopher Allan Webber <cwebber@dustycloud.org>
;;; Copyright © 2017, 2018, 2020 Marius Bakke <mbakke@fastmail.com>
;;; Copyright © 2018, 2019 Arun Isaac <arunisaac@systemreboot.net>
;;; Copyright © 2018 Pierre-Antoine Rouby <pierre-antoine.rouby@inria.fr>
;;; Copyright © 2018 Rutger Helling <rhelling@mykolab.com>
;;; Copyright © 2018 Pierre Neidhardt <mail@ambrevar.xyz>
;;; Copyright © 2019 Brett Gilio <brettg@gnu.org>
;;; Copyright © 2019,2020 Björn Höfling <bjoern.hoefling@bjoernhoefling.de>
;;; Copyright © 2019 Jakob L. Kreuze <zerodaysfordays@sdf.org>
;;; Copyright © 2019 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2019 Alex Griffin <a@ajgrf.com>
;;; Copyright © 2019, 2021 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2019, 2020 Mathieu Othacehe <m.othacehe@gmail.com>
;;; Copyright © 2020 Oleg Pykhalov <go.wigust@gmail.com>
;;; Copyright © 2020 Jan (janneke) Nieuwenhuizen <janneke@gnu.org>
;;; Copyright © 2020, 2021 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020 Vincent Legoll <vincent.legoll@gmail.com>
;;; Copyright © 2020 Morgan Smith <Morgan.J.Smith@outlook.com>
;;; Copyright © 2021 Zheng Junjie <873216071@qq.com>
;;; Copyright © 2021 Stefan Reichör <stefan@xsteve.at>
;;; Copyright © 2021 qblade <qblade@protonmail.com>
;;; Copyright © 2021 Hyunseok Kim <lasnesne@lagunposprasihopre.org>
;;; Copyright © 2021 David Larsson <david.larsson@selfhosted.xyz>
;;; Copyright © 2021 WinterHound <winterhound@yandex.com>
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

(define-module (gnu packages admin)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system ruby)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autogen)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages c)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages file)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages hurd)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libftdi)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages man)
  #:use-module (gnu packages mcrypt)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages patchutils)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

;; This package uses su instead of sudo (because of SpaceFM).
(define-public ktsuss
  (package
    (name "ktsuss")
    (version "2.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/nomius/ktsuss")
         (commit version)))
       (sha256
        (base32 "0q9931f9hp47v1n8scli4bdg2rkjpf5jf8v7jj2gdn83aia1r2hz"))
       (file-name (git-file-name name version))))
    (build-system glib-or-gtk-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-file-names
           (lambda _
             (substitute* "configure.ac"
               (("supath=`which su 2>/dev/null`")
                "supath=/run/setuid-programs/su"))
             #t)))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("glib" ,glib)
       ("gtk+" ,gtk+-2)))
    (synopsis "Graphical front end for @command{su}")
    (description
     "Ktsuss stands for ``Keep the @command{su} simple, stupid''.
It is a graphical version of @command{su} written in C and GTK+ 2, with
simplicity in mind.")
    (home-page "https://github.com/nomius/ktsuss")
    (license license:bsd-3)))

(define-public aide
  (package
    (name "aide")
    (version "0.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/aide/aide/releases/download/v"
                           version "/aide-" version ".tar.gz"))
       (sha256
        (base32 "15xp47sz7kk1ciffw3f5xw2jg2mb2lqrbr3q6p4bkbz5dap9iy8p"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)))
    (inputs
     `(("libgcrypt" ,libgcrypt)
       ("libgpg-error" ,libgpg-error)
       ("libmhash" ,libmhash)
       ("pcre:static" ,pcre "static")
       ("pcre" ,pcre)
       ("zlib:static" ,zlib "static")
       ("zlib" ,zlib)))
    (synopsis "File and directory integrity checker")
    (description
     "AIDE (Advanced Intrusion Detection Environment) is a file and directory
integrity checker.  It creates a database from the regular expression rules
that it finds from its configuration files.  Once this database is initialized
it can be used to verify the integrity of the files.  It has several message
digest algorithms that are used to check the integrity of files.  All of the
usual file attributes can be checked for inconsistencies.")
    (home-page "https://aide.github.io/")
    (license license:gpl2+)))

(define-public progress
  (package
    (name "progress")
    (version "0.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Xfennec/progress")
             (commit (string-append "v" version))))
       (sha256
        (base32 "0gf10j9zd8spain94b5kigknwbdqajiy6fjsa5hhwsc1biz34hcj"))
       (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("which" ,which)))
    (inputs
     `(("ncurses" ,ncurses)))
    (arguments
     `(#:tests? #f                      ; no test suite
       #:make-flags
       (let ((target ,(%current-target-system)))
         (list ,(string-append "CC=" (cc-for-target))
               (string-append "PKG_CONFIG="
                              (if target
                                  (string-append target "-pkg-config")
                                  "pkg-config"))
               (string-append "PREFIX=" (assoc-ref %outputs "out"))))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))         ; no configure script
    (home-page "https://github.com/Xfennec/progress")
    (synopsis "Program to view the progress of the coreutils commands")
    (description "A program that looks for coreutils basic commands (cp, mv,
dd, tar, gzip/gunzip, cat, etc.) currently running on your system and displays
the percentage of copied data.  It can also show estimated time and throughput,
and provides a \"top-like\" mode (monitoring).")
    (license license:gpl3+)))

(define-public shepherd
  (package
    (name "shepherd")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnu/shepherd/shepherd-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0x9zr0x3xvk4qkb6jnda451d5iyrl06cz1bjzjsm0lxvjj3fabyk"))))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags '("--localstatedir=/var")
       #:make-flags '("GUILE_AUTO_COMPILE=0")))
    (native-inputs
     `(("pkg-config" ,pkg-config)

       ;; This is the Guile we use as a cross-compiler...
       ("guile" ,guile-3.0)))
    (inputs
     ;; ... and this is the one that appears in shebangs when cross-compiling.
     `(("guile" ,guile-3.0)

       ;; The 'shepherd' command uses Readline when used interactively.  It's
       ;; an unusual use case though, so we don't propagate it.
       ("guile-readline" ,guile-readline)))
    (synopsis "System service manager")
    (description
     "The GNU Shepherd is a daemon-managing daemon, meaning that it supervises
the execution of system services, replacing similar functionality found in
typical init systems.  It provides dependency-handling through a convenient
interface and is based on GNU Guile.")
    (license license:gpl3+)
    (home-page "https://www.gnu.org/software/shepherd/")))

(define-public guile2.2-shepherd
  (package
    (inherit shepherd)
    (name "guile2.2-shepherd")
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("guile" ,guile-2.2)))
    (inputs
     `(("guile" ,guile-2.2)
       ("guile2.2-readline" ,guile2.2-readline)))))

(define-public guile3.0-shepherd
  (deprecated-package "guile3.0-shepherd" shepherd))

(define-public guile2.0-shepherd
  (package
    (inherit shepherd)
    (name "guile2.0-shepherd")
    (native-inputs
     `(("help2man" ,help2man)
       ("pkg-config" ,pkg-config)
       ("guile" ,guile-2.0)))
    (inputs
     `(("guile" ,guile-2.0)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-source
           (lambda _
             ;; (ice-9 threads) isn't available in guile-2.0
             (substitute* "modules/shepherd.scm"
               ((".*\\(ice-9 threads\\).*") ""))
             #t)))
       ,@(package-arguments shepherd)))))

(define-public cfm
  (package
    (name "cfm")
    (version "0.6.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/WillEccles/cfm")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14gapia902f29wa4dlrrj8jcwcff9bfvyhjccw9ddy2gxx2g8wmr"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no test suite
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         ;; Keeping xdg-open optional avoids a size increase of 293%.
         (delete 'configure))))         ; no configure script
    (home-page "https://eccles.dev/cfm/")
    (synopsis
     "Simple terminal file manager with @command{vi}-inspired key bindings")
    (description
     "The Cactus File Manager (@command{cfm}) helps you manage your files
visually from a text terminal.  It aims to be simple and fast, with key bindings
inspired by @command{vi}.")
    (license license:mpl2.0)))

(define-public cloud-utils
  (package
    (name "cloud-utils")
    (version "0.32")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://launchpad.net/cloud-utils/trunk/"
             version "/+download/cloud-utils-" version ".tar.gz"))
       (sha256
        (base32
         "0xxdi55lzw7j91zfajw7jhd2ilsqj2dy04i9brlk8j3pvb5ma8hk"))))
    (build-system gnu-build-system)
    (arguments
     '(#:make-flags
       (let ((out (assoc-ref %outputs "out")))
         (list (string-append "BINDIR=" out "/bin")
               (string-append "MANDIR=" out "/share/man/man1")
               (string-append "DOCDIR=" out "/share/doc")))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'check)
         (add-after 'install 'wrap
           (lambda* (#:key outputs inputs #:allow-other-keys)
             (let ((growpart (string-append (assoc-ref outputs "out")
                                            "/bin/growpart")))
               (wrap-program growpart
                 `("PATH" ":" prefix (,(dirname (which "sfdisk"))
                                      ,(dirname (which "readlink"))))))
             #t)))))
    (inputs
     `(("python" ,python)
       ("util-linux" ,util-linux))) ; contains sfdisk for growpart
    (home-page "https://launchpad.net/cloud-utils")
    (synopsis "Set of utilities for cloud computing environments")
    (description
     "This package contains a set of utilities for cloud computing
environments:

@itemize @bullet
@item @command{cloud-localds} Create a disk for cloud-init to utilize nocloud
@item @command{cloud-publish-image} Wrapper for cloud image publishing
@item @command{cloud-publish-tarball} Wrapper for publishing cloud tarballs
@item @command{cloud-publish-ubuntu} Import a Ubuntu cloud image
@item @command{ec2metadata} Query and display @acronym{EC2,Amazon Elastic
  Compute Cloud} metadata
@item @command{growpart} Grow a partition to fill the device
@item @command{mount-image-callback} Mount a file and run a command
@item @command{resize-part-image} Resize a partition image to a new size
@item @command{ubuntu-cloudimg-query} Get the latest Ubuntu
  @acronym{AMI,Amazon Machine Image}
@item @command{ubuntu-ec2-run} Run a @acronym{EC2,Amazon Elastic Compute
  Cloud} instance using Ubuntu
@item @command{vcs-run} Obtain a repository, and run a command
@item @command{write-mime-multipart} Handle multipart
  @acronym{MIME,Multipurpose Internet Mail Extensions} messages
@end itemize")
    (license license:gpl3)))

(define-public daemontools
  (package
    (name "daemontools")
    (version "0.76")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cr.yp.to/daemontools/"
                    "daemontools-" version ".tar.gz"))
              (sha256
               (base32
                "07scvw88faxkscxi91031pjkpccql6wspk4yrlnsbrrb5c0kamd5"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ;; No tests as far as I can tell.
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'chdir
           (lambda _
             (chdir ,(string-append "daemontools-" version))
             #t))
         (delete 'configure)
         (add-before 'build 'patch
           (lambda _
             (substitute* "src/error.h"
               (("extern int errno;")
                "#include <errno.h>"))
             #t))
         (replace 'build
           (lambda _
             (invoke "package/compile")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (for-each (lambda (file)
                           (install-file file bin))
                         (find-files "command")))
             #t)))))
    (synopsis "Tools for managing UNIX style services")
    (description
     "@code{daemontools} is a collection of tools for managing UNIX
services.")
    (license license:public-domain)
    (home-page "https://cr.yp.to/daemontools.html")))

(define-public daemonize
  (package
    (name "daemonize")
    (version "1.7.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bmc/daemonize")
             (commit (string-append "release-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0w4g0iyssyw7dd0061881z8s5czcl01mz6v00znax57zfxjqpvnm"))))
    (build-system gnu-build-system)
    (arguments '(#:tests? #f))          ; No tests available.
    (home-page "http://software.clapper.org/daemonize/")
    (synopsis "Command line utility to run a program as a daemon")
    (description
     "daemonize runs a command as a Unix daemon.  It will close all open file
descriptors, change working directory of the process to the root filesystem,
reset its umask, run in the background, ignore I/O signals, handle
@code{SIGCLD}, etc.  Most programs that are designed to be run as daemons do
that work for themselves.  However, you’ll occasionally run across one that
does not.  When you must run a daemon program that does not properly make
itself into a true Unix daemon, you can use daemonize to force it to run as a
true daemon.")
    (license license:bsd-3)))

(define-public dfc
  (package
   (name "dfc")
   (version "3.1.1")
   (source
    (origin
     (method url-fetch)
      (uri (string-append
            "https://projects.gw-computing.net/attachments/download/615/dfc-"
            version ".tar.gz"))
      (sha256
       (base32
        "0m1fd7l85ckb7bq4c5c3g257bkjglm8gq7x42pkmpp87fkknc94n"))))
   (build-system cmake-build-system)
   (arguments '(#:tests? #f)) ; There are no tests.
   (native-inputs `(("gettext" ,gettext-minimal)))
   (home-page "https://projects.gw-computing.net/projects/dfc")
   (synopsis "Display file system space usage using graphs and colors")
   (description
    "dfc (df color) is a modern version of df.  It uses colors, draws pretty
graphs and can export its output to different formats.")
   (license license:bsd-3)))

(define-public facter
  (package
    (name "facter")
    (version "4.0.52")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/puppetlabs/facter")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "05j4q87sak1f1isj7ngzr59h3j3xskfwjjwfv0xd7lhwcaxg3a3c"))))
    (build-system ruby-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'delete-facter-ng-gemspec
           (lambda _
             ;; XXX: ruby-build-system incorrectly finds
             ;; facter-ng.gemspec from this directory and tries to
             ;; build that instead of the proper facter.gemspec.
             ;; Just delete it as a workaround, as it appears to
             ;; only exist for backwards-compatibility after the
             ;; facter-ng->facter rename.
             (delete-file "agent/facter-ng.gemspec")
             #t))
         (add-after 'unpack 'embed-absolute-references
           ;; Refer to absolute executable file names to avoid propagation.
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* (find-files "lib/facter/resolvers" "\\.rb$")
               (("execute\\('(which |)([^ ']+)" _ _ name)
                (string-append "execute('" (or (which name)
                                               name))))
             #t))
         (delete 'check)
         (add-after 'wrap 'check
           (lambda* (#:key tests? outputs #:allow-other-keys)
             ;; XXX: The test suite wants to run Bundler and
             ;; complains that the gemspec is invalid.  For now
             ;; just make sure that we can run the wrapped
             ;; executable directly.
             (if tests?
                 (invoke (string-append (assoc-ref outputs "out")
                                        "/bin/facter")
                         ;; Many facts depend on /sys, /etc/os-release,
                         ;; etc, so we only run a small sample.
                         "facterversion" "architecture"
                         "kernel" "kernelversion")
                 (format #t "tests disabled~%"))
             #t)))))
    (inputs
     `(("ruby-hocon" ,ruby-hocon)
       ("ruby-sys-filesystem" ,ruby-sys-filesystem)
       ("ruby-thor" ,ruby-thor)

       ;; For ‘embed-absolute-references’.
       ("dmidecode" ,dmidecode)
       ("inetutils" ,inetutils)         ; for ‘hostname’
       ("iproute" ,iproute)
       ("pciutils" ,pciutils)
       ("util-linux" ,util-linux)))
    (synopsis "Collect and display system facts")
    (description
     "Facter is a tool that gathers basic facts about nodes (systems) such
as hardware details, network settings, OS type and version, and more.  These
facts can be collected on the command line with the @command{facter} command
or via the @code{facter} Ruby library.")
    (home-page "https://github.com/puppetlabs/facter-ng")
    (license license:expat)))

(define-public ttyload
  (let ((revision "1")
        (commit "f9495372801ce4b4dad98ad854203e694c31c1eb"))
    (package
      (name "ttyload")
      (version (git-version "0.5.3" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/lindes/ttyload")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ldb7a13b9v876c6cbrs78pkizj64drnqx95z5shfbwgpwfhr4im"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f      ; no tests
         #:make-flags
         (list (string-append "CC=" ,(cc-for-target)))
         #:phases
         (modify-phases %standard-phases
           (delete 'configure)
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (bin (string-append out "/bin")))
                 (install-file "ttyload" bin)))))))
      (home-page "https://www.daveltd.com/src/util/ttyload/")
      (synopsis "Console based color-coded graphs of CPU load average")
      (description
       "Show graphs for 1 minute, 5 minute, 15 minute load averages on the
console.")
      ;; This package uses a modified version of the "ISC License".
      (license (license:non-copyleft "file://LICENSE")))))

(define-public htop
  (package
    (name "htop")
    (version "3.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/htop-dev/htop")
             (commit version)))
       (sha256
        (base32 "10lp6cbfvigzp6pq5nwj3s3l4vs7cv92krz2r08nwrz8vl6rqdzp"))
       (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (inputs
     `(("ncurses" ,ncurses)))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)))
    (home-page "https://htop.dev")
    (synopsis "Interactive process viewer")
    (description
     "This is htop, an interactive process viewer.  It is a text-mode
application (for console or X terminals) and requires ncurses.")
    (license license:gpl2)))

(define-public bashtop
  (package
    (name "bashtop")
    (version "0.9.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aristocratos/bashtop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "07nlr6vmyb7yihaxj1fp424lmhwkdjl6mls92v90f6gsvikpa13v"))))
    (build-system gnu-build-system)
    (arguments
     '(#:make-flags (list (string-append "PREFIX=" %output))
       #:tests? #f      ; bats test fails with loading load.bash
       #:phases (modify-phases %standard-phases (delete 'configure))))
    (home-page "https://github.com/aristocratos/bashtop")
    (synopsis "Linux/OSX/FreeBSD resource monitor")
    (description "Resource monitor that shows usage and stats for processor,
memory, disks, network and processes.")
    (license license:asl2.0)))

(define-public bpytop
  (package
    (name "bpytop")
    (version "1.0.65")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "bpytop" version))
       (sha256
        (base32 "1vq51vg2ygk2p738zi21v5chn908d4bd5zkb8s4fbgf4zqp425ny"))))
    (build-system python-build-system)
    (inputs
     `(("python-psutil" ,python-psutil)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'install-themes
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((themes (string-append (assoc-ref outputs "out")
                                          "/lib/python"
                                          ,(version-major+minor
                                            (package-version python))
                                          "/site-packages/bpytop-themes")))
               (mkdir-p themes)
               (copy-recursively "bpytop-themes" themes)))))))
    (home-page
     "https://github.com/aristocratos/bpytop")
    (synopsis "Resource monitor")
    (description "Resource monitor that shows usage and stats for processor,
memory, disks, network and processes.  It's a Python port and continuation of
@command{bashtop}.")
    (license license:asl2.0)))

(define-public pies
  (package
    (name "pies")
    (version "1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://gnu/pies/pies-"
                           version ".tar.bz2"))
       (sha256
        (base32
         "11j168qljsinaj5dwmg7nkm2z1aghi6gc3d0wf0pikflnh2q2wqf"))))
    (build-system gnu-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (add-before 'build 'patch-/bin/sh
                    (lambda* (#:key inputs #:allow-other-keys)
                      ;; Use the right shell when executing user-provided
                      ;; shell commands.
                      (let ((bash (assoc-ref inputs "bash")))
                        (substitute* '("src/progman.c" "src/comp.c")
                          (("\"/bin/sh\"")
                           (string-append "\"" bash "/bin/sh\"")))
                        #t))))))
    (home-page "https://www.gnu.org.ua/software/pies/")
    (synopsis "Program invocation and execution supervisor")
    (description
     "GNU pies is a program that supervises the invocation and execution of
other programs.  It reads the list of programs to be started from its
configuration file, executes them, and then monitors their status,
re-executing them as necessary.")
    (license license:gpl3+)))

(define-public inetutils
  (package
    (name "inetutils")
    (version "1.9.4")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://gnu/inetutils/inetutils-"
                                 version ".tar.gz"))
             (patches (search-patches "inetutils-hurd.patch"))
             (sha256
              (base32
               "05n65k4ixl85dc6rxc51b1b732gnmm8xnqi424dy9f1nz7ppb3xy"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags '("--localstatedir=/var"

                           ;; Make sure 'PATH_PROCNET_DEV' gets defined when
                           ;; cross-compiling (by default it does not.)
                           ,@(if (%current-target-system)
                                 '("--with-path-procnet-dev=/proc/net/dev")
                                 '())
                           ,@(if (hurd-target?)
                                 '("--disable-rcp"
                                   "--disable-rexec"
                                   "--disable-rexecd"
                                   "--disable-rlogin"
                                   "--disable-rlogind"
                                   "--disable-rsh"
                                   "--disable-rshd"
                                   "--disable-uucpd"
                                   "--disable-whois")
                                 '()))
       ;; On some systems, 'libls.sh' may fail with an error such as:
       ;; "Failed to tell switch -a apart from -A".
       #:parallel-tests? #f))
    (inputs `(("ncurses" ,ncurses)
              ("readline" ,readline)))        ;for 'ftp'
    (native-inputs (if (member (%current-system)
                               (package-supported-systems net-tools))
                       `(("netstat" ,net-tools))  ;for tests
                       '()))
    (home-page "https://www.gnu.org/software/inetutils/")
    (synopsis "Basic networking utilities")
    (description
     "Inetutils is a collection of common network programs, such as an ftp
client and server, a telnet client and server, an rsh client and server, and
hostname.")
    (license license:gpl3+)))

(define-public shadow
  (package
    (name "shadow")
    (version "4.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shadow-maint/shadow/releases/"
                    "download/" version "/shadow-" version ".tar.xz"))
              (patches (search-patches "shadow-hurd-pctrl.patch"))
              (sha256
               (base32
                "0qmfq50sdhz6xilgxvinblll8j2iqfl7hwk45bq744y4plq4dbd3"))))
    (build-system gnu-build-system)
    (arguments
     `(;; Assume System V `setpgrp (void)', which is the default on GNU
       ;; variants (`AC_FUNC_SETPGRP' is not cross-compilation capable.)
       #:configure-flags
       '(,@(if (hurd-target?)
             '()
             '("--with-libpam"))
          "ac_cv_func_setpgrp_void=yes")

       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'set-nscd-file-name
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Use the right file name for nscd.
             (let ((libc (assoc-ref inputs
                                    ,(if (%current-target-system)
                                         "cross-libc"
                                         "libc"))))
               (substitute* "lib/nscd.c"
                 (("/usr/sbin/nscd")
                  (string-append libc "/sbin/nscd")))
               #t)))
         (add-after 'install 'remove-groups
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Remove `groups', which is already provided by Coreutils.
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (man (string-append out "/share/man")))
               (delete-file (string-append bin "/groups"))
               (for-each delete-file (find-files man "^groups\\."))
               #t))))))

    (inputs
     `(,@(if (hurd-target?)
           '()
           `(("linux-pam" ,linux-pam)))))
    (home-page "https://github.com/shadow-maint/shadow")
    (synopsis "Authentication-related tools such as passwd, su, and login")
    (description
     "Shadow provides a number of authentication-related tools, including:
login, passwd, su, groupadd, and useradd.")

    ;; The `vipw' program is GPLv2+.
    ;; libmisc/salt.c is public domain.
    (license license:bsd-3)))

(define-public mingetty
  (package
    (name "mingetty")
    (version "1.08")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://sourceforge/mingetty/mingetty/"
                                 version "/mingetty-" version ".tar.gz"))
             (sha256
              (base32
               "05yxrp44ky2kg6qknk1ih0kvwkgbn9fbz77r3vci7agslh5wjm8g"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key inputs outputs target #:allow-other-keys)
             (let* ((out    (assoc-ref outputs "out"))
                    (man8   (string-append out "/share/man/man8"))
                    (sbin   (string-append out "/sbin"))
                    (shadow (assoc-ref inputs "shadow"))
                    (login  (string-append shadow "/bin/login")))
               (substitute* "Makefile"
                 ,@(if (%current-target-system)
                       '((("CC=.*$")
                          (string-append "CC=" target "-gcc\n")))
                       '())
                 (("^SBINDIR.*")
                  (string-append "SBINDIR = " out
                                 "/sbin\n"))
                 (("^MANDIR.*")
                  (string-append "MANDIR = " out
                                 "/share/man/man8\n")))

               ;; Pick the right 'login' by default.
               (substitute* "mingetty.c"
                 (("\"/bin/login\"")
                  (string-append "\"" login "\"")))

               (mkdir-p sbin)
               (mkdir-p man8))
             #t)))
       #:tests? #f))                              ; no tests
    (inputs `(("shadow" ,shadow)))

    (home-page "https://sourceforge.net/projects/mingetty")
    (synopsis "Getty for the text console")
    (description
     "Small console getty that is started on the Linux text console,
asks for a login name and then transfers over to @code{login}.  It is extended
to allow automatic login and starting any app.")
    (license license:gpl2+)))

(define-public net-base
  (package
    (name "net-base")
    (version "5.3")
    (source (origin
             (method url-fetch)
             (uri (string-append
                   "mirror://debian/pool/main/n/netbase/netbase_"
                   version ".tar.xz"))
             (sha256
              (base32
               "12xqjwg3p4rzmmh2iib6sigm9l29y3dgk74mmnw64k84jnbwdxl1"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder (begin
                   (use-modules (guix build utils)
                                (srfi srfi-26))

                   (let* ((source (assoc-ref %build-inputs "source"))
                          (tar    (assoc-ref %build-inputs "tar"))
                          (xz     (assoc-ref %build-inputs "xz"))
                          (output (assoc-ref %outputs "out"))
                          (etc    (string-append output "/etc")))
                     (setenv "PATH" (string-append xz "/bin"))
                     (invoke (string-append tar "/bin/tar") "xvf"
                             source)
                     (chdir ,(string-append "netbase-" version))
                     (mkdir-p etc)
                     (for-each copy-file
                               '("etc-services" "etc-protocols" "etc-rpc")
                               (map (cut string-append etc "/" <>)
                                    '("services" "protocols" "rpc")))
                     #t))))
    (native-inputs `(("tar" ,tar)
                     ("xz" ,xz)))
    (synopsis "IANA protocol, port, and RPC number assignments")
    (description
     "This package provides the /etc/services, /etc/protocols, and /etc/rpc
files, which contain information about the IANA-assigned port, protocol, and
ONC RPC numbers.")
    (home-page "https://packages.debian.org/sid/netbase")
    (license license:gpl2)))

(define-public netcat
  (package
    (name "netcat")
    (version "0.7.1")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://sourceforge/netcat/netcat/" version
                                 "/netcat-" version ".tar.bz2"))
             (sha256
              (base32
               "1frjcdkhkpzk0f84hx6hmw5l0ynpmji8vcbaxg8h5k2svyxz0nmm"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       ;; By default, man and info pages are put in PREFIX/{man,info},
       ;; but we want them in PREFIX/share/{man,info}.
       (let ((out (assoc-ref %outputs "out")))
         (list (string-append "--mandir=" out "/share/man")
               (string-append "--infodir=" out "/share/info")))))
    (home-page "http://netcat.sourceforge.net")
    (synopsis "Read and write data over TCP/IP")
    (description
     "Netcat is a featured networking utility which reads and writes data
across network connections, using the TCP/IP protocol.  It is designed to be a
reliable \"back-end\" tool that can be used directly or easily driven by other
programs and scripts.  At the same time, it is a feature-rich network debugging
and exploration tool, since it can create almost any kind of connection you
would need and has several interesting built-in capabilities.")
    (license license:gpl2+)))

(define-public netcat-openbsd
  (package
    (name "netcat-openbsd")
    (version "1.217-2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://salsa.debian.org/debian/netcat-openbsd.git")
                    (commit (string-append "debian/" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "19sr52ix14w344pv13ppb0c1wyg5dxhic1fw2q0s3qfmx57b9hhp"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no test suite
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target)))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-before 'build 'patch
           (lambda _
             (setenv "QUILT_PATCHES" "debian/patches")
             (invoke "quilt" "push" "-a")
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (man (string-append out "/share/man/man1"))
                    (doc (string-append out "/share/doc/netcat-openbsd-" ,version))
                    (examples (string-append doc "/examples")))
               (install-file "nc" bin)
               (install-file "nc.1" man)
               (install-file "debian/copyright" doc)
               (copy-recursively "debian/examples" examples)
               #t))))))
    (inputs `(("libbsd" ,libbsd)))
    (native-inputs `(("pkg-config" ,pkg-config)
                     ("quilt" ,quilt)))
    (home-page "https://packages.debian.org/sid/netcat-openbsd")
    (synopsis "Read and write data over TCP/IP")
    (description
     "Netcat is a simple Unix utility which reads and writes data across
network connections using TCP or UDP protocol.  It is designed to be a reliable
\"back-end\" tool that can be used directly or easily driven by other programs
and scripts.  At the same time it is a feature-rich network debugging and
exploration tool, since it can create almost any kind of connection you would
need and has several interesting built-in capabilities.

This package contains the OpenBSD rewrite of netcat, including support for
IPv6, proxies, and Unix sockets.")
    (license (list license:bsd-3
                   license:bsd-2))))  ; atomicio.*, socks.c

(define-public sipcalc
  (package
    (name "sipcalc")
    (version "1.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.routemeister.net/projects"
                           "/sipcalc/files/sipcalc" "-" version ".tar.gz"))
       (sha256
        (base32
         "0mv3wndj4z2bsshh2k8d5sy3j8wxzgf8mzmmkvj1k8gpcz37dm6g"))))
    (build-system gnu-build-system)
    (home-page "https://www.routemeister.net/projects/sipcalc/")
    (synopsis "Command-line IP subnet calculator")
    (description
     "Sipcalc is an advanced command-line IP subnet calculator.  It can take
multiple forms of input (IPv4/IPv6/interface/hostname) and output a multitude
of information about a given subnet.

Features include:

@itemize @bullet
@item IPv4
@itemize
@item Retrieving of address information from interfaces.
@item Classfull and CIDR output.
@item Multiple address and netmask input and output formats (dotted quad, hex,
number of bits).
@item Output of broadcast address, network class, Cisco wildcard,
hosts/range, network range.
@item The ability to split a network based on a smaller netmask, now also with
recursive runs on the generated subnets.  (also IPv6)
@end itemize
@item IPv6
@itemize
@item Compressed and expanded input and output addresses.
@item Standard IPv6 network output.
@item v4 in v6 output.
@item Reverse DNS address generation.
@end itemize
@end itemize\n")
    (license license:bsd-3)))

(define-public prips
  (package
    (name "prips")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://devel.ringlet.net/files/sys/"
                           name "/" name "-" version ".tar.xz"))
       (sha256
        (base32 "1a33vbl4w603mk6mm5r3vhk87fy3dfk5wdpch0yd3ncbkg3fmvqn"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags (list (string-append "CC=" ,(cc-for-target)))
       #:test-target "test"
       #:phases (modify-phases %standard-phases
                  (delete 'configure)
                  (replace 'install
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let ((out (assoc-ref outputs "out")))
                        (install-file "prips"
                                      (string-append out "/bin"))))))))
    (native-inputs `(("perl-test-harness" ,perl-test-harness)))
    (synopsis "Tool that prints the IP addresses in a given range")
    (description "Prips can be used to print all of the IP addresses in
 a given range.  This allows the enhancement of tools only work
 on one host at a time (e.g. whois).")
    (home-page "https://devel.ringlet.net/sysutils/prips/")
    (license license:gpl2+)))

(define-public alive
  (package
    (name "alive")
    (version "2.0.3")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://gnu/alive/alive-"
                                 version ".tar.xz"))
             (sha256
              (base32
               "053hfp7s66lnilm1ii4jrjmy44wpa2cwwh6f0sl8cyz0mm813x4b"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("alive_cv_nice_ping=yes")))
    (inputs `(("guile" ,guile-2.0)
              ("inetutils" ,inetutils)))
    (home-page "https://www.gnu.org/software/alive/")
    (synopsis "Autologin and keep-alive daemon")
    (description
     "GNU Alive sends periodic pings to a server, generally to keep a
connection alive.")
    (license license:gpl3+)))

(define-public isc-dhcp
  (let* ((bind-major-version "9")
         (bind-minor-version "11")
         (bind-patch-version "32")
         (bind-release-type "")         ; for patch release, use "-P"
         (bind-release-version "")      ; for patch release, e.g. "6"
         (bind-version (string-append bind-major-version
                                      "."
                                      bind-minor-version
                                      "."
                                      bind-patch-version
                                      bind-release-type
                                      bind-release-version)))
    (package
      (name "isc-dhcp")
      (version "4.4.2")
      (source (origin
                (method url-fetch)
                (uri (string-append "https://ftp.isc.org/isc/dhcp/"
                                    version "/dhcp-" version ".tar.gz"))
                (sha256
                 (base32
                  "08a5003zdxgl41b29zjkxa92h2i40zyjgxg0npvnhpkfl5jcsz0s"))))
      (build-system gnu-build-system)
      (arguments
       `(#:parallel-build? #f
         #:configure-flags '("--with-randomdev=/dev/random")
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'replace-bundled-bind
             (lambda* (#:key inputs native-inputs #:allow-other-keys)
               (delete-file "bind/bind.tar.gz")
               (copy-file (assoc-ref inputs "bind-source-tarball")
                          "bind/bind.tar.gz")
               (chmod "bind/bind.tar.gz" #o644)
               (substitute* "bind/version.tmp"
                 (("^MAJORVER=.*")
                  (format #f "MAJORVER=~a\n" ,bind-major-version))
                 (("^MINORVER=.*")
                  (format #f "MINORVER=~a\n" ,bind-minor-version))
                 (("^PATCHVER=.*")
                  (format #f "PATCHVER=~a\n" ,bind-patch-version))
                 (("^RELEASETYPE=.*")
                  (format #f "RELEASETYPE=~a\n" ,bind-release-type))
                 (("^RELEASEVER=.*")
                  (format #f "RELEASEVER=~a\n" ,bind-release-version)))
               #t))
           ,@(if (%current-target-system)
                 '((add-before 'configure 'fix-bind-cross-compilation
                     (lambda _
                       (substitute* "configure"
                         (("--host=\\$host")
                          "--host=$host_alias"))
                       ;; BIND needs a native compiler because the DHCP
                       ;; build system uses the built 'gen' executable.
                       (setenv "BUILD_CC" "gcc")
                       #t)))
                 '())
           (add-after 'configure 'post-configure
             (lambda* (#:key outputs #:allow-other-keys)
               ;; Point to the right client script, which will be
               ;; installed in a later phase.
               (substitute* "includes/dhcpd.h"
                 (("#define[[:blank:]]+_PATH_DHCLIENT_SCRIPT.*")
                  (let ((out (assoc-ref outputs "out")))
                    (string-append "#define _PATH_DHCLIENT_SCRIPT \""
                                   out "/libexec/dhclient-script"
                                   "\"\n"))))

               ;; During the 'build' phase, 'bind.tar.gz' is extracted, so
               ;; we must patch shebangs in there and make sure the right
               ;; shell is used.
               (with-directory-excursion "bind"
                 (substitute* "Makefile"
                   (("\\./configure ")
                    (let ((sh (which "sh")))
                      (string-append "./configure CONFIG_SHELL="
                                     sh " SHELL=" sh " "))))

                 (let ((bind-directory (string-append "bind-" ,bind-version)))
                   (invoke "tar" "xf" "bind.tar.gz")
                   (for-each patch-shebang
                             (find-files bind-directory ".*"))
                   (substitute* (string-append bind-directory "/configure")
                     (("/usr/bin/file")
                      (which "file")))
                   (invoke "tar" "cf" "bind.tar.gz"
                           bind-directory
                           ;; avoid non-determinism in the archive
                           "--sort=name"
                           "--mtime=@0"
                           "--owner=root:0"
                           "--group=root:0")))))
           (add-after 'install 'post-install
             (lambda* (#:key inputs outputs #:allow-other-keys)
               ;; Install the dhclient script for GNU/Linux and make sure
               ;; if finds all the programs it needs.
               (let* ((out       (assoc-ref outputs "out"))
                      (libexec   (string-append out "/libexec"))
                      (coreutils (assoc-ref inputs "coreutils*"))
                      (inetutils (assoc-ref inputs "inetutils"))
                      (net-tools (assoc-ref inputs "net-tools"))
                      (sed       (assoc-ref inputs "sed*")))
                 (substitute* "client/scripts/linux"
                   (("/sbin/ip")
                    (string-append (assoc-ref inputs "iproute")
                                   "/sbin/ip")))

                 (mkdir-p libexec)
                 (copy-file "client/scripts/linux"
                            (string-append libexec "/dhclient-script"))

                 (wrap-program
                     (string-append libexec "/dhclient-script")
                   `("PATH" ":" prefix
                     ,(map (lambda (dir)
                             (string-append dir "/bin:"
                                            dir "/sbin"))
                           (list inetutils net-tools coreutils sed))))
                 #t))))))

      (native-inputs
       `(("perl" ,perl)
         ("file" ,file)))

      (inputs `(("inetutils" ,inetutils)
                ,@(if (hurd-target?) '()
                      `(("net-tools" ,net-tools)
                        ("iproute" ,iproute)))

                ;; isc-dhcp bundles a copy of BIND, which has proved vulnerable
                ;; in the past.  Use a BIND-VERSION of our choosing instead.
                ("bind-source-tarball"
                 ,(origin
                    (method url-fetch)
                    (uri (string-append "https://ftp.isc.org/isc/bind9/"
                                        bind-version
                                        "/bind-" bind-version ".tar.gz"))
                    (sha256
                     (base32
                      "0hhkb4d14hvly2751cxl2s2xyim3bri8qaisgkcm456xfi5wpy6b"))))

                ("coreutils*" ,coreutils)
                ("sed*" ,sed)))

      (home-page "https://www.isc.org/products/DHCP/")
      (synopsis "Dynamic Host Configuration Protocol (DHCP) tools")
      (description
       "ISC's Dynamic Host Configuration Protocol (DHCP) distribution provides a
reference implementation of all aspects of DHCP, through a suite of DHCP
tools: server, client, and relay agent.")
      (license license:mpl2.0)
      (properties '((cpe-name . "dhcp"))))))

(define-public libpcap
  (package
    (name "libpcap")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tcpdump.org/release/libpcap-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "07ibr6zzfh1wk5gqcbnlyh6v0dfmhpfd0fqj5y3yxvzf4ckb84ld"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)))
    (arguments
     ;; There are some tests in testprogs/, but no automated test suite.
     '(#:tests? #f))
    (home-page "https://www.tcpdump.org")
    (synopsis "Network packet capture library")
    (description
     "libpcap is an interface for user-level packet capture.  It provides a
portable framework for low-level network monitoring.  Applications include
network statistics collection, security monitoring, network debugging, etc.")
    (license (list license:bsd-4        ; fad-*.c and several other source files
                   license:bsd-3        ; pcap/, sockutils.* & others
                   license:bsd-2))))    ; the rest

(define-public tcpdump
  (package
    (name "tcpdump")
    (version "4.99.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.tcpdump.org/release/tcpdump-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0hmqh2fx8rgs9v1mk3vpywj61xvkifz260q685xllxr8jmxg3wlc"))))
    (build-system gnu-build-system)
    (inputs `(("libpcap" ,libpcap)
              ("openssl" ,openssl)))
    (native-inputs `(("perl" ,perl)))        ; for tests
    (home-page "https://www.tcpdump.org/")
    (synopsis "Network packet analyzer")
    (description
     "Tcpdump is a command-line tool to analyze network traffic passing
through the network interface controller.")
    (license license:bsd-3)))

(define-public jnettop
  (package
    (name "jnettop")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri
               (string-append "https://web.archive.org/web/20161221100811/"
                              "http://jnettop.kubs.info/dist/jnettop-"
                              version ".tar.gz"))
              (sha256
               (base32
                "1855np7c4b0bqzhf1l1dyzxb90fpnvrirdisajhci5am6als31z9"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("glib" ,glib)
       ("ncurses" ,ncurses)
       ("libpcap" ,libpcap)))
    (home-page
     "https://web.archive.org/web/20160703195221/http://jnettop.kubs.info/wiki/")
    (synopsis "Visualize network traffic by bandwidth use")
    (description
     "Jnettop is a traffic visualiser, which captures traffic going
through the host it is running from and displays streams sorted
by bandwidth they use.")
    (license license:gpl2+)))

(define-public clusterssh
  (package
    (name "clusterssh")
    (version "4.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://sourceforge/clusterssh/"
                                  "2.%20ClusterSSH%20Series%204/"
                                  "App-ClusterSSH-v" version ".tar.gz"))
              (sha256
               (base32
                "0rmk2p3f2wz1h092anidjclh212rv3gxyk0c641qk3frlrjnw6mp"))))
    (build-system perl-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'refer-to-inputs
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* (list "lib/App/ClusterSSH/Config.pm"
                                "t/15config.t")
               (("xterm")
                (which "xterm")))
             #t))
         (add-before 'check 'delete-failing-tests
           (lambda _
             ;; This checks whether all code is nicely formatted.  The above
             ;; ‘refer-to-inputs’ phase breaks this pedantry, so disable it.
             (delete-file "t/perltidy.t")
             ;; Update the manifest so t/manifest.t happily passes.
             (substitute* "MANIFEST"
               (("t/perltidy.t\n") ""))
             #t))
         (add-after 'install 'augment-library-path
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (with-directory-excursion bin
                 (for-each
                  (lambda (program)
                    (wrap-program program
                      `("PERL5LIB" ":" prefix
                        ,(map (lambda (file-name)
                                (string-append file-name
                                               "/lib/perl5/site_perl"))
                              (cons out
                                    (map (lambda (input)
                                           (assoc-ref inputs input))
                                         ;; These may be propagated and hence
                                         ;; not explicitly listed as inputs.
                                         (list "perl-class-data-inheritable"
                                               "perl-devel-stacktrace"
                                               "perl-exception-class"
                                               "perl-tk"
                                               "perl-try-tiny"
                                               "perl-x11-protocol"
                                               "perl-x11-protocol-other")))))))
                  (find-files "." ".*")))
               #t))))))
    (native-inputs
     `(("perl-cpan-changes" ,perl-cpan-changes)
       ("perl-file-slurp" ,perl-file-slurp)
       ("perl-file-which" ,perl-file-which)
       ("perl-module-build" ,perl-module-build)
       ("perl-readonly" ,perl-readonly)
       ("perl-test-differences" ,perl-test-differences)
       ("perl-test-distmanifest" ,perl-test-distmanifest)
       ("perl-test-perltidy" ,perl-test-perltidy)
       ("perl-test-pod" ,perl-test-pod)
       ("perl-test-pod-coverage" ,perl-test-pod-coverage)
       ("perl-test-trap" ,perl-test-trap)
       ("perltidy" ,perltidy)))
    (inputs
     `(("perl-exception-class" ,perl-exception-class)
       ("perl-sort-naturally" ,perl-sort-naturally)
       ("perl-tk" ,perl-tk)
       ("perl-try-tiny" ,perl-try-tiny)
       ("perl-x11-protocol" ,perl-x11-protocol)
       ("perl-x11-protocol-other" ,perl-x11-protocol-other)
       ("xterm" ,xterm)))
    ;; The clusterssh.sourceforge.net address requires login to view
    (home-page "https://sourceforge.net/projects/clusterssh/")
    (synopsis "Secure concurrent multi-server terminal control")
    (description
     "ClusterSSH controls a number of xterm windows via a single graphical
console window to allow commands to be interactively run on multiple servers
over ssh connections.")
    (license license:gpl2+)))

(define-public rename
  (package
    (name "rename")
    (version "1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RM/RMBARKER/File-Rename-"
                    version ".tar.gz"))
              (sha256
               (base32
                "137m8s06r4n038ivlr5r1d9a7q9l7shmwpvnyx053r9ndhvbnkh5"))))
    (build-system perl-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'install 'find-itself
           ;; Fix run-time 'Can't locate File/Rename.pm in @INC' failure.
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (with-directory-excursion bin
                 (for-each
                  (lambda (program)
                    (wrap-program program
                      `("PERL5LIB" ":" prefix
                        (,(string-append out "/lib/perl5/site_perl")))))
                  (find-files "." ".*")))
               #t))))))
    (native-inputs
     `(("perl-module-build" ,perl-module-build)
       ("perl-test-pod" ,perl-test-pod)
       ("perl-test-pod-coverage" ,perl-test-pod-coverage)))
    (home-page "https://metacpan.org/pod/distribution/File-Rename/rename.PL")
    (synopsis "Perl extension for renaming multiple files")
    (description
     "This package provides a Perl interface (@code{Perl::Rename}) as well
as a command-line utility (@command{rename}) that can rename multiple files
at once based on a Perl regular expression.")
    (license license:perl-license)))

(define-public rottlog
  (package
    (name "rottlog")
    (version "0.72.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnu/rottlog/rottlog-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0751mb9l2f0jrk3vj6q8ilanifd121dliwk0c34g8k0dlzsv3kd7"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (substitute* "Makefile.in"
                    (("-o \\$\\{LOG_OWN\\} -g \\$\\{LOG_GROUP\\}")
                     ;; Don't try to chown root.
                     "")
                    (("mkdir -p \\$\\(ROTT_STATDIR\\)")
                     ;; Don't attempt to create /var/lib/rottlog.
                     "true"))
                  #t))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags (list "ROTT_ETCDIR=/etc/rottlog" ;rc file location
                               "--localstatedir=/var")

       ;; Install example config files in OUT/etc.
       #:make-flags (list (string-append "ROTT_ETCDIR="
                                         (assoc-ref %outputs "out")
                                         "/etc"))

       #:phases (modify-phases %standard-phases
                  (add-after 'unpack 'patch-paths
                    (lambda* (#:key inputs #:allow-other-keys)
                      (substitute* "rc/rc"
                        (("/usr/sbin/sendmail")
                         (string-append (assoc-ref inputs "mailutils")
                                        "/bin/mail")))
                      #t))
                  (add-after 'unpack 'fix-configure
                    (lambda* (#:key inputs native-inputs #:allow-other-keys)
                      ;; Replace outdated config.sub and config.guess:
                      (for-each (lambda (file)
                                  (install-file
                                   (string-append
                                    (assoc-ref
                                     (or native-inputs inputs) "automake")
                                    "/share/automake-"
                                    ,(version-major+minor
                                      (package-version automake))
                                    "/" file) "."))
                                '("config.sub" "config.guess"))
                      #t))
                  (add-after 'build 'set-packdir
                    (lambda _
                      ;; Set a default location for archived logs.
                      (substitute* "rc/rc"
                        (("packdir=\"\"")
                         "packdir=\"/var/log\""))
                      #t))
                  (add-before 'install 'tweak-rc-weekly
                    (lambda* (#:key inputs #:allow-other-keys)
                      (substitute* "rc/weekly"
                        (("/bin/kill")
                         (string-append (assoc-ref inputs "coreutils*")
                                        "/bin/kill"))
                        (("syslogd\\.pid")
                         ;; The file is called 'syslog.pid' (no 'd').
                         "syslog.pid"))
                      #t))
                  (add-after 'install 'install-info
                    (lambda _
                      (invoke "make" "install-info"))))))
    (native-inputs `(("texinfo" ,texinfo)
                     ("automake" ,automake)
                     ("util-linux" ,util-linux))) ; for 'cal'
    (inputs `(("coreutils*" ,coreutils)
              ("mailutils" ,mailutils)))
    (home-page "https://www.gnu.org/software/rottlog/")
    (synopsis "Log rotation and management")
    (description
     "GNU Rot[t]log is a program for managing log files.  It is used to
automatically rotate out log files when they have reached a given size or
according to a given schedule.  It can also be used to automatically compress
and archive such logs.  Rot[t]log will mail reports of its activity to the
system administrator.")
    (license license:gpl3+)))

(define-public sudo
  (package
    (name "sudo")
    (version "1.9.7")
    (source (origin
              (method url-fetch)
              (uri
               (list (string-append "https://www.sudo.ws/sudo/dist/sudo-"
                                    version ".tar.gz")
                     (string-append "ftp://ftp.sudo.ws/pub/sudo/OLD/sudo-"
                                    version ".tar.gz")))
              (sha256
               (base32
                "0jg5vf6hc0j2bh4vqwsb4jybhryrsh4kz97r1salvf4rcqnprgib"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively "lib/zlib")
                  #t))))
    (build-system gnu-build-system)
    (outputs (list "out"))
    (arguments
     `(#:configure-flags
       (list (string-append "--docdir=" (assoc-ref %outputs "out")
                            "/share/doc/" ,name "-" ,version)

             "--with-logpath=/var/log/sudo.log"
             "--with-rundir=/var/run/sudo" ; must be cleaned up at boot time
             "--with-vardir=/var/db/sudo"
             "--with-iologdir=/var/log/sudo-io"

             ;; 'visudo.c' expects _PATH_MV to be defined, but glibc doesn't
             ;; provide it.
             (string-append "CPPFLAGS=-D_PATH_MV='\""
                            (assoc-ref %build-inputs "coreutils")
                            "/bin/mv\"'"))

       ;; Avoid non-determinism; see <http://bugs.gnu.org/21918>.
       #:parallel-build? #f

       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'pre-configure
           (lambda _
             (substitute* "src/sudo_usage.h.in"
               ;; Do not capture 'configure' arguments since we would
               ;; unduly retain references, and also because the
               ;; CPPFLAGS above would close the string literal
               ;; prematurely.
               (("@CONFIGURE_ARGS@") "\"\""))
             (substitute* (find-files "." "Makefile\\.in")
               ;; Allow installation as non-root.
               (("-o [[:graph:]]+ -g [[:graph:]]+")
                "")
               ;; Don't try to create /etc/sudoers.
               (("^install: (.*)install-sudoers(.*)" _ before after)
                (string-append "install: " before after "\n"))
               ;; Don't try to create /run/sudo.
               (("\\$\\(DESTDIR\\)\\$\\(rundir\\)")
                "$(TMPDIR)/dummy")
               ;; Install example sudo{,_logsrvd}.conf to the right place.
               (("\\$\\(DESTDIR\\)\\$\\(sysconfdir\\)")
                "$(DESTDIR)/$(docdir)/examples")
               ;; Don't try to create /var/db/sudo.
               (("\\$\\(DESTDIR\\)\\$\\(vardir\\)")
                "$(TMPDIR)/dummy"))

             ;; ‘Checking existing [/etc/]sudoers file for syntax errors’ is
             ;; not the task of the build system, and fails.
             (substitute* "plugins/sudoers/Makefile.in"
               (("^pre-install:" match)
                (string-append match "\ndisabled-" match)))
             #t)))

       ;; XXX: The 'testsudoers' test series expects user 'root' to exist, but
       ;; the chroot's /etc/passwd doesn't have it.  Turn off the tests.
       #:tests? #f))
    (native-inputs
     ;; XXX TODO: Remove on next rebuild cycle.
     (if (hurd-target?)
         '()
         `(("groff" ,groff))))
    (inputs
     `(("coreutils" ,coreutils)
       ,@(if (hurd-target?)
           '()
           `(("linux-pam" ,linux-pam)))
       ("zlib" ,zlib)))
    (home-page "https://www.sudo.ws/")
    (synopsis "Run commands as root")
    (description
     "Sudo (su \"do\") allows a system administrator to delegate authority to
give certain users (or groups of users) the ability to run some (or all)
commands as root or another user while providing an audit trail of the
commands and their arguments.")

    ;; See <http://www.sudo.ws/sudo/license.html>.
    (license license:x11)))

(define-public opendoas
  (package
    (name "opendoas")
    (version "6.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Duncaen/OpenDoas")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0gfcssm21vdfg6kcrcc7hz1h4jmhy2zv29rfqyrrj3a6r9b5ah8p"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           ;; The configure script doesn't accept most of the default flags.
           (lambda* (#:key configure-flags #:allow-other-keys)
             ;; The configure script can be told which compiler to use only
             ;; through environment variables.
             (setenv "CC" ,(cc-for-target))
             (apply invoke "./configure" configure-flags)))
         (add-before 'install 'fix-makefile
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "GNUmakefile"
               (("^\tchown.*$") ""))
             #t)))
       #:configure-flags
       (list (string-append "--prefix=" (assoc-ref %outputs "out"))
             "--with-timestamp")
       ;; Compiler choice is not carried over from the configure script.
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target)))
       #:tests? #f))                 ; no test suite
    (native-inputs
     `(("bison" ,bison)))
    (home-page "https://github.com/Duncaen/OpenDoas")
    (synopsis "Portable version of OpenBSD's doas command")
    (description "Doas is a minimal replacement for the venerable sudo.  It was
initially written by Ted Unangst of the OpenBSD project to provide 95% of the
features of sudo with a fraction of the codebase.")
    (license (list license:bsd-3        ; libbsd/*
                   license:isc))))      ; everything else

(define-public wpa-supplicant-minimal
  (package
    (name "wpa-supplicant-minimal")
    (version "2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://w1.fi/releases/wpa_supplicant-"
                    version ".tar.gz"))
              (sha256
               (base32
                "05qzak1mssnxcgdrafifxh9w86a4ha69qabkg4bsigk499xyxggw"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (substitute* "wpa_supplicant/defconfig"
                    ;; Disable D-Bus to save ~14MiB on the closure size.
                    (("^CONFIG_CTRL_IFACE_DBUS" line _)
                     (string-append "#" line)))
                  #t))
              (patches
               (search-patches "wpa-supplicant-CVE-2021-27803.patch"
                               "wpa-supplicant-CVE-2021-30004.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             (chdir "wpa_supplicant")
             (copy-file "defconfig" ".config")
             (let ((port (open-file ".config" "al")))
               (display "
      CONFIG_DEBUG_SYSLOG=y

      CONFIG_TLS=openssl

      CONFIG_DRIVER_NL80211=y
      CFLAGS += $(shell pkg-config libnl-3.0 --cflags)
      CONFIG_LIBNL32=y
      CONFIG_READLINE=y\n" port)
               (close-port port))
             ;; Make sure we have a pkg-config when cross compiling
             (substitute* '(".config"
                            "Android.mk"
                            "Makefile"
                            "dbus/Makefile")
               (("pkg-config")
                (or (which "pkg-config")
                    (which (string-append ,(%current-target-system)
                                          "-pkg-config")))))
             #t))
         (add-after 'install 'install-documentation
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out  (assoc-ref outputs "out"))
                    (doc  (string-append out "/share/doc/wpa-supplicant"))
                    (man  (string-append out "/share/man"))
                    (man5 (string-append man "/man5"))
                    (man8 (string-append man "/man8")))
               (define (copy-man-page target)
                 (lambda (file)
                   (install-file file target)))

               (mkdir-p man5) (mkdir man8)
               (for-each (copy-man-page man5)
                         (find-files "doc/docbook" "\\.5"))
               (for-each (copy-man-page man8)
                         (find-files "doc/docbook" "\\.8"))

               ;; wpa_supplicant.conf(5) does not explain all configuration
               ;; options but refers to the example config file, so install it
               ;; along with READMEs.
               (for-each (lambda (file)
                           (install-file file doc))
                         '("README" "README-DPP" "README-HS20"
                           "README-P2P" "README-WPS"
                           "wpa_supplicant.conf"))
               #t))))

      #:make-flags (list (string-append "CC=" ,(cc-for-target))
                         (string-append "BINDIR=" (assoc-ref %outputs "out")
                                        "/sbin")
                         (string-append "LIBDIR=" (assoc-ref %outputs "out")
                                        "/lib"))
      #:tests? #f))
    (inputs
     `(("readline" ,readline)
       ("libnl" ,libnl)
       ("openssl" ,openssl)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://w1.fi/wpa_supplicant/")
    (synopsis "Connecting to WPA and WPA2-protected wireless networks")
    (description
     "wpa_supplicant is a WPA Supplicant with support for WPA and WPA2 (IEEE
802.11i / RSN).  Supplicant is the IEEE 802.1X/WPA component that is used in
the client stations.  It implements key negotiation with a WPA Authenticator
and it controls the roaming and IEEE 802.11 authentication/association of the
WLAN driver.

This package provides the @code{wpa_supplicant} daemon and the @code{wpa_cli}
command.")

    ;; In practice, this is linked against Readline, which makes it GPLv3+.
    (license license:bsd-3)

    (properties `((cpe-name . "wpa_supplicant")))))

(define-public wpa-supplicant
  (package (inherit wpa-supplicant-minimal)
    (name "wpa-supplicant")
    (inputs `(("dbus" ,dbus)
              ,@(package-inputs wpa-supplicant-minimal)))
    (arguments
     (substitute-keyword-arguments (package-arguments wpa-supplicant-minimal)
       ((#:phases phases)
        `(modify-phases ,phases
           (add-after 'configure 'configure-for-dbus
             (lambda _
               (let ((port (open-file ".config" "al")))
                 (display "
      CONFIG_CTRL_IFACE_DBUS_NEW=y
      CONFIG_CTRL_IFACE_DBUS_INTRO=y\n" port)
                 (close-port port))
               #t))
          (add-after 'install-documentation 'install-dbus-conf
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (dir (string-append out "/etc/dbus-1/system.d")))
                (mkdir-p dir)
                (copy-file "dbus/dbus-wpa_supplicant.conf"
                           (string-append dir "/wpa_supplicant.conf")))
              #t))))))))

(define-public wpa-supplicant-gui
  (package
    (inherit wpa-supplicant)
    (name "wpa-supplicant-gui")
    (inputs `(("qtbase" ,qtbase-5)
              ("qtsvg" ,qtsvg-5)
              ,@(package-inputs wpa-supplicant)))
    (native-inputs
     ;; For icons.
     `(("imagemagick" ,imagemagick)
       ("inkscape" ,inkscape)
       ,@(package-native-inputs wpa-supplicant)))
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-after 'unpack 'chdir
                    (lambda _
                      (chdir "wpa_supplicant/wpa_gui-qt4")
                      #t))
                  (delete 'configure)
                  (replace 'build
                    (lambda _
                      (invoke "qmake" "wpa_gui.pro")
                      (invoke "make" "-j" (number->string (parallel-job-count)))
                      (invoke "make" "-C" "icons")))
                  (replace 'install
                    (lambda* (#:key inputs outputs #:allow-other-keys)
                      (let ((out (assoc-ref outputs "out"))
                            (qt '("qtbase" "qtsvg")))
                        (install-file "wpa_gui" (string-append out "/bin"))
                        (install-file "wpa_gui.desktop"
                                      (string-append out "/share/applications"))
                        (copy-recursively "icons/hicolor"
                                          (string-append out "/share/icons/hicolor"))
                        (wrap-program (string-append out "/bin/wpa_gui")
                          `("QT_PLUGIN_PATH" ":" prefix
                            ,(map (lambda (label)
                                    (string-append (assoc-ref inputs label)
                                                   "/lib/qt5/plugins/"))
                                  qt)))
                        #t))))))
    (synopsis "Graphical user interface for WPA supplicant")))

(define-public hostapd
  (package
    (name "hostapd")
    (version "2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://w1.fi/releases/hostapd-" version
                                  ".tar.gz"))
              (sha256
               (base32
                "1mrbvg4v7vm7mknf0n29mf88k3s4a4qj6r4d51wq8hmjj1m7s7c8"))
              (patches
               (search-patches "wpa-supplicant-CVE-2021-27803.patch"
                               "wpa-supplicant-CVE-2021-30004.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             ;; This is mostly copied from 'wpa-supplicant' above.
             (chdir "hostapd")
             (copy-file "defconfig" ".config")
             (let ((port (open-file ".config" "al")))
               (display "
      CONFIG_LIBNL32=y
      CONFIG_IEEE80211R=y
      CONFIG_IEEE80211N=y
      CONFIG_IEEE80211AC=y\n" port)
               (close-port port))
             #t))
         (add-after 'unpack 'patch-pkg-config
           (lambda _
             (substitute* "src/drivers/drivers.mak"
               (("pkg-config")
                (or (which "pkg-config")
                    (string-append ,(%current-target-system)
                                   "-pkg-config"))))
             #t))
         (add-after 'install 'install-man-pages
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out  (assoc-ref outputs "out"))
                    (man  (string-append out "/share/man"))
                    (man1 (string-append man "/man1"))
                    (man8 (string-append man "/man8")))
               (define (copy-man-page target)
                 (lambda (file)
                   (install-file file target)))

               (for-each (copy-man-page man1)
                         (find-files "." "\\.1"))
               (for-each (copy-man-page man8)
                         (find-files "." "\\.8"))
               #t))))

      #:make-flags (list (string-append "CC=" ,(cc-for-target))
                         (string-append "BINDIR=" (assoc-ref %outputs "out")
                                        "/sbin")
                         (string-append "LIBDIR=" (assoc-ref %outputs "out")
                                        "/lib"))
      #:tests? #f))
    (native-inputs `(("pkg-config" ,pkg-config)))

    ;; There's an optional dependency on SQLite.
    (inputs `(("openssl" ,openssl)
              ("libnl" ,libnl)))
    (home-page "https://w1.fi/hostapd/")
    (synopsis "Daemon for Wi-Fi access points and authentication servers")
    (description
     "hostapd is a user-space daemon for WiFi access points and authentication
servers.  It implements IEEE 802.11 access point management, IEEE
802.1X/WPA/WPA2/EAP Authenticators, RADIUS client, EAP server, and RADIUS
authentication server.")

    ;; Same license as wpa_supplicant.
    (license license:bsd-3)))

(define-public wakelan
  (package
    (name "wakelan")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "ftp://ftp.gwdg.de/pub/linux/metalab/system/network/misc/wakelan-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0vydqpf44146ir6k87gmqaq6xy66xhc1gkr3nsd7jj3nhy7ypx9x"))))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (mkdir-p (string-append out "/bin"))
               (mkdir-p (string-append out "/share/man/man1"))

               ;; It's an old configure script that doesn't understand
               ;; the extra options we pass.
               (setenv "CONFIG_SHELL" (which "bash"))
               (invoke "./configure"
                       (string-append "--prefix=" out)
                       (string-append "--mandir=" out
                                      "/share/man"))))))
       #:tests? #f))
    (home-page "https://www.kernel.org") ; really, no home page
    (synopsis "Send a wake-on-LAN packet")
    (description
     "WakeLan broadcasts a properly formatted UDP packet across the local area
network, which causes enabled computers to power on.")
    (license license:gpl2+)))

(define-public dmidecode
  (package
    (name "dmidecode")
    (version "3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://savannah/dmidecode/dmidecode-"
                           version ".tar.xz"))
       (sha256
        (base32 "0m8lzg9rf1qssasiix672bxk5qwms90561g8hfkkhk31h2kkgiw2"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                                ; no 'check' target
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "prefix="
                            (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))                   ; no configure script
    (home-page "https://www.nongnu.org/dmidecode/")
    (synopsis "Read hardware information from the BIOS")
    (description
     "Dmidecode reports information about your system's hardware as described
in your system BIOS according to the SMBIOS/DMI standard.  This typically
includes system manufacturer, model name, serial number, BIOS version, asset
tag as well as a lot of other details of varying level of interest and
reliability depending on the manufacturer.  This will often include usage
status for the CPU sockets, expansion slots (e.g. AGP, PCI, ISA) and memory
module slots, and the list of I/O ports (e.g. serial, parallel, USB).")
    (license license:gpl2+)))

(define-public acpica
  (package
    (name "acpica")
    (version "20210331")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://acpica.org/sites/acpica/files/acpica-unix2-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1h98pvc9iy1c49cid0ppjwk5zsy2m1xbvfqb72pkwkrd4rn35arx"))))
    (build-system gnu-build-system)
    (native-inputs `(("flex" ,flex)
                     ("bison" ,bison)))
    (arguments
     `(#:make-flags (list (string-append "PREFIX=" %output)
                          (string-append "CC=" ,(cc-for-target))
                          "HOST=_LINUX"
                          "OPT_CFLAGS=-Wall -fno-strict-aliasing")
       #:tests? #f                      ; no 'check' target
       #:phases (modify-phases %standard-phases (delete 'configure))))
    (home-page "https://acpica.org/")
    (synopsis "Tools for the development and debugging of ACPI tables")
    (description
     "The @acronym{ACPICA, ACPI Component Architecture} project provides an
OS-independent reference implementation of the @acronym{ACPI, Advanced
Configuration and Power Interface} specification.  ACPICA code contains those
portions of ACPI meant to be directly integrated into the host OS as a
kernel-resident subsystem, and a small set of tools to assist in developing and
debugging ACPI tables.

This package contains only the user-space tools needed for ACPI table
development, not the kernel implementation of ACPI.")
    (license license:gpl2)))            ; dual GPLv2/ACPICA Licence

(define-public s-tui
  (package
    (name "s-tui")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "s-tui" version))
       (sha256
        (base32 "1clk59wf6v1lq33h4x5qwxvz5ng9mfkp1s6ynxa58w2raq8dbmy5"))))
    (build-system python-build-system)
    (inputs
     `(("python-psutil" ,python-psutil)
       ("python-urwid" ,python-urwid)))
    (home-page "https://github.com/amanusk/s-tui")
    (synopsis "Interactive terminal stress test and monitoring tool")
    (description
     "The Stress Terminal UI displays graphs of the CPU frequency,
utilization, temperature and power.")
    (license license:gpl2+)))

(define-public stress
  (package
    (name "stress")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://debian/pool/main/s/stress/stress_"
                                  version ".orig.tar.gz"))
              (sha256
               (base32
                "0nw210jajk38m3y7h8s130ps2qsbz7j75wab07hi2r3hlz14yzh5"))))
    (build-system gnu-build-system)
    (home-page "https://packages.debian.org/sid/stress")
    (synopsis "Impose load on and stress test a computer system")
    (description
     "Stress is a tool that imposes a configurable amount of CPU, memory, I/O,
or disk stress on a POSIX-compliant operating system and reports any errors it
detects.

Stress is not a benchmark.  It is a tool used by system administrators to
evaluate how well their systems will scale, by kernel programmers to evaluate
perceived performance characteristics, and by systems programmers to expose
the classes of bugs which only or more frequently manifest themselves when the
system is under heavy load.")
    (license license:gpl2+)))

(define-public detox
  (package
    (name "detox")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dharple/detox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0q16dvjbry573j4ayh9dwskdh1dxx8dk4rj94w6f2dcv4ww37is1"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("flex" ,flex)))
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-after 'unpack 'delete-configure
                    ;; The "configure" script is present, but otherwise the
                    ;; project is not bootstrapped: missing install-sh and
                    ;; Makefile.in, so delete it so the bootstrap phase will
                    ;; take over.
                    (lambda _ (delete-file "configure") #t))
                  (replace 'check
                    (lambda _
                      (invoke "./tests/test.sh" "src/detox"))))))
    (home-page "https://github.com/dharple/detox")
    (synopsis "Clean up file names")
    (description
     "Detox is a program that renames files to make them easier to work with
under Unix and related operating systems.  Spaces and various other unsafe
characters (such as \"$\") get replaced with \"_\".  ISO 8859-1 (Latin-1)
characters can be replaced as well, as can UTF-8 characters.")
    (license license:bsd-3)))

(define-public testdisk
  (package
    (name "testdisk")
    (version "7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.cgsecurity.org/testdisk-"
                                  version ".tar.bz2"))
              (sha256
               (base32
                "1zlh44w67py416hkvw6nrfmjickc2d43v51vcli5p374d5sw84ql"))))
    (build-system gnu-build-system)
    (inputs
     `(("ntfs-3g" ,ntfs-3g)
       ("util-linux" ,util-linux "lib")
       ("openssl" ,openssl)
       ;; FIXME: add reiserfs.
       ("zlib" ,zlib)
       ("e2fsprogs" ,e2fsprogs)
       ("libjpeg" ,libjpeg-turbo)
       ("ncurses" ,ncurses)))
    (home-page "https://www.cgsecurity.org/wiki/TestDisk")
    (synopsis "Data recovery tool")
    (description
     "TestDisk is a program for data recovery, primarily designed to help
recover lost partitions and/or make non-booting disks bootable again.")
    (license license:gpl2+)))

(define-public tree
  (package
    (name "tree")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://mama.indstate.edu/users/ice/tree/src/tree-"
                    version ".tgz"))
              (sha256
               (base32 "1hmpz6k0mr6salv0nprvm1g0rdjva1kx03bdf1scw8a38d5mspbi"))))
    (build-system gnu-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases (delete 'configure))
       #:tests? #f                      ; no check target
       #:make-flags (let ((out (assoc-ref %outputs "out")))
                               (list (string-append "prefix=" out)))))
    (synopsis "Recursively list the contents of a directory")
    (description
     "Tree is a recursive directory listing command that produces a depth
indented listing of files, which is colorized ala dircolors if the LS_COLORS
environment variable is set and output is to tty.")
    (home-page "http://mama.indstate.edu/users/ice/tree/")
    (license license:gpl2+)))

(define-public lr
  (package
    (name "lr")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.vuxu.org/lr/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wv2acm4r5y5gg6f64v2hiwpg1f3lnr4fy1a9zssw77fmdc7ys3j"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:make-flags (list (string-append "CC=" ,(cc-for-target))
                          (string-append "PREFIX=" %output))
       #:phases (modify-phases %standard-phases
                  (delete 'configure))))
    (synopsis "Tool to generate customized file listings")
    (description
     "lr is a tool for generating file listings, which includes the best
features of ls(1), find(1), stat(1) and du(1).")
    (home-page "https://git.vuxu.org/lr/about")
    (license license:expat)))

(define-public direvent
  (package
    (name "direvent")
    (version "5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnu/direvent/direvent-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0m9vi01b1km0cpknflyzsjnknbava0s1n6393b2bpjwyvb6j5613"))
              (modules '((guix build utils)))
              (snippet '(begin
                          (substitute* "tests/testsuite"
                            (("#![[:blank:]]?/bin/sh")
                             "#!$SHELL"))
                          #t))))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'patch-/bin/sh
           (lambda* (#:key inputs #:allow-other-keys)
             ;; Use the right shell when executing the watcher and
             ;; user-provided shell commands.
             (let ((bash (assoc-ref inputs "bash")))
               (substitute* '("src/direvent.c" "src/progman.c")
                 (("\"/bin/sh\"")
                  (string-append "\"" bash "/bin/sh\"")))

               ;; Adjust the 'shell.at' test accordingly.
               (substitute* "tests/testsuite"
                 (("SHELL=/bin/sh")
                  (string-append "SHELL=" bash "/bin/sh")))

               #t))))))
    (home-page "https://www.gnu.org.ua/software/direvent/")
    (synopsis "Daemon to monitor directories for events such as file removal")
    (description
     "A daemon that monitors directories for events, such as creating,
deleting or modifying files.  It can monitor different sets of directories for
different events.  When an event is detected, direvent calls a specified
external program with information about the event, such as the location
within the file system where it occurred.  Thus, \"direvent\" provides an
easy way to react immediately if given files undergo changes, for example, to
track changes in important system configuration files.")
    (license license:gpl3+)))

(define-public libcap-ng
  (package
    (name "libcap-ng")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1sasp1n154aqy9fz0knlb966svm7xg1zjhg1vr4q839bgjvq7h2j"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (list "--without-python")))
    (home-page "https://people.redhat.com/sgrubb/libcap-ng/")
    (synopsis "Library for more easily working with POSIX capabilities")
    (description
     "The libcap-ng library is intended to make programming with POSIX
capabilities easier than the traditional libcap library.  It includes
utilities that can analyse all currently running applications and print out
any capabilities and whether or not it has an open ended bounding set.  The
included utilities are designed to let admins and developers spot apps from
various ways that may be running with too much privilege.")
    ;; The library is lgpl2.1+, but also ships some utils which are gpl2+.
    (license (list license:lgpl2.1+ license:gpl2+))))

(define-public smartmontools
  (package
    (name "smartmontools")
    (version "7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/smartmontools/smartmontools/"
                    version "/smartmontools-" version ".tar.gz"))
              (sha256
               (base32
                "1mlc25sd5rgj5xmzcllci47inmfdw7cp185fday6hc9rwqkqmnaw"))))
    (build-system gnu-build-system)
    (inputs `(("libcap-ng" ,libcap-ng)))
    (home-page "https://www.smartmontools.org/")
    (synopsis "S.M.A.R.T. harddisk control and monitoring tools")
    (description
     "The smartmontools package contains utility programs to control and
monitor storage systems using the Self-Monitoring, Analysis and Reporting
Technology System (@dfn{S.M.A.R.T.}) built into most modern ATA and SCSI hard
disks.  In many cases, these utilities will provide advanced warning of disk
degradation and failure.")
    (license license:gpl2+)))

(define-public fdupes
  (package
    (name "fdupes")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/adrianlopezroche/fdupes/"
                           "releases/download/v" version "/"
                           "fdupes-" version ".tar.gz"))
       (sha256
        (base32 "1g9p50xhi2sp0hqxml4w2k0kq9jv988q2yxm347z5349dlxvap6d"))))
    (build-system gnu-build-system)
    (inputs
     `(("ncurses" ,ncurses)
       ("pcre2" ,pcre2)))
    (home-page "https://github.com/adrianlopezroche/fdupes")
    (synopsis "Identify duplicate files")
    (description
     "fdupes is a program for identifying duplicate files residing within
specified directories.")
    (license license:expat)))

(define-public graphios
  (package
   (name "graphios")
   (version "2.0.3")
   (source
    (origin
      (method url-fetch)
      (uri (pypi-uri "graphios" version))
      (sha256
       (base32
        "1h87hvc315wg6lklbf4l7csd3n5pgljwrfli1p3nasdi0izgn66i"))))
   (build-system python-build-system)
   (arguments
    ;; Be warned: Building with Python 3 succeeds, but the build process
    ;; throws a syntax error that is ignored.
    `(#:python ,python-2
      #:phases
      (modify-phases %standard-phases
        (add-before 'build 'fix-setup.py
          (lambda* (#:key outputs #:allow-other-keys)
            ;; Fix hardcoded, unprefixed file names.
            (let ((out (assoc-ref outputs "out")))
              (substitute* '("setup.py")
                (("/etc") (string-append out "/etc"))
                (("/usr") out)
                (("distro_ver = .*") "distro_ver = ''"))
              #t))))))
   (home-page "https://github.com/shawn-sterling/graphios")
   (synopsis "Emit Nagios metrics to Graphite, Statsd, and Librato")
   (description
    "Graphios is a script to emit nagios perfdata to various upstream metrics
processing and time-series systems.  It's currently compatible with Graphite,
Statsd, Librato and InfluxDB.  Graphios can emit Nagios metrics to any number
of supported upstream metrics systems simultaneously.")
   (license license:gpl2+)))

(define-public ansible
  (package
    (name "ansible")
    (version "2.9.18")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ansible" version))
       (sha256
        (base32 "0g6rsnh02zq5nizamgakl2wvgz7hk1lpnjn9akldrcpa55vygzjm"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-bcrypt" ,python-bcrypt)
       ("python-pynacl" ,python-pynacl)
       ("python-httplib2" ,python-httplib2)
       ("python-passlib" ,python-passlib)
       ("python-nose" ,python-nose)
       ("python-mock" ,python-mock)
       ("python-jinja2" ,python-jinja2)
       ("python-pyyaml" ,python-pyyaml)
       ("python-paramiko" ,python-paramiko)))
    (inputs
     `(("python-cryptography" ,python-cryptography)
       ("python-jinja2" ,python-jinja2)
       ("python-pyyaml" ,python-pyyaml)
       ("python-paramiko" ,python-paramiko)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; Several ansible commands (ansible-config, ansible-console, etc.)
         ;; are just symlinks to a single ansible executable. The ansible
         ;; executable behaves differently based on the value of
         ;; sys.argv[0]. This does not work well with our wrap phase, and
         ;; therefore the following two phases are required as a workaround.
         (add-after 'unpack 'hide-wrapping
           (lambda _
             ;; Overwrite sys.argv[0] to hide the wrapper script from it.
             (substitute* "bin/ansible"
               (("import traceback" all)
                (string-append all "
import re
sys.argv[0] = re.sub(r'\\.([^/]*)-real$', r'\\1', sys.argv[0])
")))
             #t))
         (add-after 'install 'replace-symlinks
           (lambda* (#:key outputs #:allow-other-keys)
             ;; Replace symlinks with duplicate copies of the ansible
             ;; executable.
             (let ((out (assoc-ref outputs "out")))
               (for-each
                (lambda (subprogram)
                  (delete-file (string-append out "/bin/ansible-" subprogram))
                  (copy-file (string-append out "/bin/ansible")
                             (string-append out "/bin/ansible-" subprogram)))
                (list "config" "console" "doc" "galaxy"
                      "inventory" "playbook" "pull" "vault")))
             #t)))))
    (home-page "https://www.ansible.com/")
    (synopsis "Radically simple IT automation")
    (description "Ansible is a radically simple IT automation system.  It
handles configuration management, application deployment, cloud provisioning,
ad hoc task execution, and multinode orchestration---including trivializing
things like zero-downtime rolling updates with load balancers.")
    (license license:gpl3+)))

(define-public debops
  (package
    (name "debops")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/debops/debops")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "052b2dykdn35pdpn9s4prawl6nl6yzih8nyf54hpvhpisvjrm1v5"))
       (patches
        (search-patches "debops-constants-for-external-program-names.patch"
                        "debops-debops-defaults-fall-back-to-less.patch"))))
    (build-system python-build-system)
    (native-inputs
     `(("git" ,git)))
    (inputs
     `(("ansible" ,ansible)
       ("encfs" ,encfs)
       ("fuse" ,fuse)
       ("util-linux" ,util-linux)  ;; for umount
       ("findutils" ,findutils)
       ("gnupg" ,gnupg)
       ("which" ,which)))
    (propagated-inputs
     `(("python-future" ,python-future)
       ("python-distro" ,python-distro)))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'nuke-debops-update
           (lambda _
             (chmod "bin/debops-update" #o755) ; FIXME work-around git-fetch issue
             (with-output-to-file "bin/debops-update"
               (lambda ()
                 (format #t "#!/bin/sh
echo 'debops is installed via guix. guix-update is useless in this case.
Please use `guix package -u debops` instead.'")))
             #t))
         ;; patch shebangs only in actuall scripts, not in files included in
         ;; roles (which are to be delivered to the targte systems)
         (delete `patch-generated-file-shebangs)
         (replace 'patch-source-shebangs
           (lambda _
             (for-each patch-shebang
                       (find-files "bin"
                                   (lambda (file stat)
                                     ;; Filter out symlinks.
                                     (eq? 'regular (stat:type stat)))
                                   #:stat lstat))))
         (add-after 'unpack 'fix-paths
           (lambda _
             (define (substitute-program-names file)
               ;; e.g. ANSIBLE_PLAYBOOK = '/gnu/store/…/bin/ansible-playbook'
               (for-each
                (lambda (name)
                  (let ((varname (string-upcase
                                  (string-map
                                   (lambda (c) (if (char=? c #\-) #\_ c))
                                   name))))
                    (substitute* file
                      (((string-append "^(" varname " = )'.*'") line prefix)
                       (string-append prefix "'" (which name) "'")))))
                '("ansible-playbook" "encfs" "find" "fusermount"
                  "umount" "gpg" "ansible" "which")))
             (for-each substitute-program-names
                       '("bin/debops"
                         "bin/debops-padlock"
                         "bin/debops-task"
                         "debops/__init__.py"
                         "debops/cmds/__init__.py"))
             #t)))))
    (home-page "https://www.debops.org/")
    (synopsis "Collection of general-purpose Ansible roles")
    (description "The Ansible roles provided by that can be used to manage
Debian or Ubuntu hosts.  In addition, a default set of Ansible playbooks can
be used to apply the provided roles in a controlled way, using Ansible
inventory groups.

The roles are written with a high customization in mind, which can be done
using Ansible inventory.  This way the role and playbook code can be shared
between multiple environments, with different configuration in to each one.

Services can be managed on a single host, or spread between multiple hosts.
DebOps provides support for different SQL and NoSQL databases, web servers,
programming languages and specialized applications useful in a data center
environment or in a cluster.  The project can also be used to deploy
virtualization environments using KVM/libvirt, Docker or LXC technologies to
manage virtual machines and/or containers.")
    (license license:gpl3+)))

(define-public emacs-ansible-doc
  (let ((commit "86083a7bb2ed0468ca64e52076b06441a2f8e9e0"))
    (package
      (name "emacs-ansible-doc")
      (version (git-version "0.4" "1" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/lunaryorn/ansible-doc.el")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "0lap404ch74w99n3xip176jr42b38xhyzkfnkyqg0g3wk2cd3aq8"))))
      (build-system emacs-build-system)
      ;; Unmaintained by upstream.
      (home-page "https://github.com/lunaryorn/ansible-doc.el")
      (synopsis "Ansible documentation for Emacs")
      (description
       "This package provides an Ansible documentation for GNU Emacs.

@code{ansible-doc} allows you to view the documentation of an Ansible
module and @code{ansible-doc-mode} minor mode adds documentation
lookup to YAML Mode.  You could enable the mode with @code{(add-hook
'yaml-mode-hook #'ansible-doc-mode)}.")
      (license license:gpl3+))))

(define-public cpulimit
  (package
    (name "cpulimit")
    (version "0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/opsengine/cpulimit")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1dz045yhcsw1rdamzpz4bk8mw888in7fyqk1q1b3m1yk4pd1ahkh"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (delete 'configure)
                  (replace 'build
                    (lambda* (#:key make-flags #:allow-other-keys)
                      (apply invoke "make" "-Csrc" make-flags)))
                  (replace 'check
                    (lambda* (#:key tests? make-flags #:allow-other-keys)
                      (when tests?
                        (apply invoke "make" "-Ctests" make-flags))
                      #t))
                  (replace 'install
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (bin (string-append out "/bin")))
                        (install-file "src/cpulimit" bin))
                      #t)))
       #:make-flags (list (string-append "CC=" ,(cc-for-target)))))
    (home-page "https://github.com/opsengine/cpulimit")
    (synopsis "Limit CPU usage")
    (description
     "Cpulimit limits the CPU usage of a process.  It does not change the nice
value or other scheduling priority settings, but the real CPU usage, and is
able to adapt itself dynamically to the overall system load.  Children
processes and threads of the specified process may optionally share the same
limits.")
    (license license:gpl2+)))

(define-public autojump
  (package
    (name "autojump")
    (version "22.5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wting/autojump")
             (commit (string-append "release-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1rgpsh70manr2dydna9da4x7p8ahii7dgdgwir5fka340n1wrcws"))))
    (build-system gnu-build-system)
    (native-inputs                      ; for tests
     `(("python-mock" ,python-mock)
       ("python-pytest" ,python-pytest)))
    (inputs
     `(("python" ,python-wrapper)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'make-git-checkout-writable
           ;; ‘install.py’ modifies files before installing them.
           (lambda _
             (for-each make-file-writable (find-files "."))
             #t))
         (delete 'configure)
         (delete 'build)
         (replace 'check
           (lambda _
             (invoke "python" "tests/unit/autojump_utils_test.py")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (setenv "SHELL" (which "bash"))
             (invoke "python" "install.py"
                     (string-append "--destdir="
                                    (assoc-ref outputs "out"))))))))
    (home-page "https://github.com/wting/autojump")
    (synopsis "Shell extension for file system navigation")
    (description
     "Autojump provides a faster way to navigate your file system, with a \"cd
command that learns\".  It works by maintaining a database of the directories
you use the most from the command line and allows you to \"jump\" to
frequently used directories by typing only a small pattern.")
    (license license:gpl3+)))

(define-public fasd
  (package
    (name "fasd")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/clvv/fasd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1awi71jdv3mhjrmar2d4z1i90kn7apd7aq1w31sh6w4yibz9kiyj"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (delete 'configure))  ;no configuration
       #:tests? #f                      ;no tests
       #:make-flags (list (string-append "PREFIX=" %output))))
    (home-page "https://github.com/clvv/fasd")
    (synopsis "Quick access to files and directories for shells")
    (description
     "Fasd (pronounced similar to \"fast\") is a command-line productivity
booster.  Fasd offers quick access to files and directories for POSIX shells.
It is inspired by tools like autojump, z, and v.  Fasd keeps track of files
and directories you have accessed so that you can quickly reference them in
the command line.")
    (license license:x11)))

(define-public iftop
  (package
    (name "iftop")
    (version "1.0pre4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.ex-parrot.com/~pdw/iftop/download"
                                  "/iftop-" version ".tar.gz"))
              (sha256
               (base32
                "15sgkdyijb7vbxpxjavh5qm5nvyii3fqcg9mzvw7fx8s6zmfwczp"))))
    (build-system gnu-build-system)
    (inputs
      `(("libpcap" ,libpcap)
        ("ncurses" ,ncurses)))
    (synopsis "Monitor network usage")
    (description "Iftop does for network usage what @command{top} does
for CPU usage.  It listens to network traffic on a named interface and
displays a table of current bandwidth usage by pairs of hosts.")
    (home-page "http://www.ex-parrot.com/~pdw/iftop/")
    (license license:gpl2+)))

(define-public munge
  (package
    (name "munge")
    (version "0.5.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dun/munge/releases/"
                                  "download/munge-" version "/munge-"
                                  version ".tar.xz"))
              (sha256
               (base32
                "0h06sghb4rqvv1ywyd6mzsmbcgh712v6ygrff0gzm440y4ca41k6"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Don't insist on write access to /var.
                  (substitute* "src/etc/Makefile.in"
                    (("\\$\\(INSTALL\\)(.*)localstatedir" _ middle)
                     (string-append "-$(INSTALL)" middle "localstatedir"))
                    (("\\$\\(MKDIR_P\\) .*(local|run)statedir.*")
                     ""))
                  #t))))
    (inputs
     `(("openssl" ,openssl)
       ("libgcrypt" ,libgcrypt)))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags
       (list "--localstatedir=/var"
             (string-append "--with-pkgconfigdir="
                            (assoc-ref %outputs "out") "/lib/pkgconfig"))
       #:phases
       (modify-phases %standard-phases
         ;; XXX Many test series fail.  Some might be fixable, others do no-no
         ;; things like invoking ‘sudo’.
         (add-after 'unpack 'skip-failing-tests
           (lambda _
             (for-each (lambda (test)
                         (substitute* "t/Makefile.in"
                           (((string-append test "\\.t ")) "")))
                       (list "0100-munged-lock"
                             "0010-basic"
                             "0011-munged-cmdline"
                             "0012-munge-cmdline"
                             "0013-unmunge-cmdline"
                             "0101-munged-security-socket"
                             "0102-munged-security-keyfile"
                             "0103-munged-security-logfile"
                             "0110-munged-origin-addr"))
             #t)))))
    (home-page "https://dun.github.io/munge/")
    (synopsis "Cluster computing authentication service")
    (description
     "Munge is an authentication service for creating and validating
credentials.  It allows a process to authenticate the UID and GID of another
local or remote process within a group of hosts having common users and
groups.  These hosts form a security realm that is defined by a shared
cryptographic key.  Clients within this security realm can create and validate
credentials without the use of root privileges, reserved ports, or
platform-specific methods.")
    (license license:gpl3+)))

(define-public audit
  (package
    (name "audit")
    (home-page "https://people.redhat.com/sgrubb/audit/")
    (version "2.8.5")
    (source (origin
              (method url-fetch)
              (uri (string-append home-page "audit-" version ".tar.gz"))
              (sha256
               (base32
                "1dzcwb2q78q7x41shcachn7f4aksxbxd470yk38zh03fch1l2p8f"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags (list "--with-python=no"
                               "--disable-static")))
    (inputs
     `(("openldap" ,openldap)
       ("gnutls" ,gnutls)
       ("sasl" ,cyrus-sasl)))
    (synopsis "User-space component to the Linux auditing system")
    (description
     "auditd is the user-space component to the Linux auditing system, which
allows logging of system calls made by user-land processes.  It's responsible
for writing audit records to the disk.  Viewing the logs is done with the
@code{ausearch} or @code{aureport} utilities.  Configuring the audit rules is
done with the @code{auditctl} utility.")
    (license license:gpl2+)))

(define-public nmap
  (package
    (name "nmap")
    (version "7.80")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://nmap.org/dist/nmap-" version
                                  ".tar.bz2"))
              (sha256
               (base32
                "1aizfys6l9f9grm82bk878w56mg0zpkfns3spzj157h98875mypw"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (for-each delete-file-recursively
                            ;; Remove bundled lua, pcap, and pcre libraries.
                            ;; FIXME: Remove bundled liblinear once packaged.
                            '("liblua"
                              "libpcap"
                              "libpcre"
                              ;; Remove pre-compiled binares.
                              "mswin32"))
                  #t))))
    (build-system gnu-build-system)
    (inputs
     `(("openssl" ,openssl)
       ("libpcap" ,libpcap)
       ("pcre" ,pcre)
       ("lua" ,lua)
       ("zlib" ,zlib)                   ;for NSE compression support

       ;; For 'ndiff'.
       ("python" ,python-2)))

    ;; TODO Add zenmap output.
    (outputs '("out" "ndiff"))
    (arguments
     `(#:configure-flags '("--without-zenmap")
       #:phases
       (modify-phases %standard-phases
         (add-after 'configure 'patch-Makefile
           (lambda _
             (substitute* "Makefile"
               ;; Do not attempt to build lua.
               (("build-dnet build-lua") "build-dnet"))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (define (make out . args)
               (apply invoke "make"
                      (string-append "prefix=" out)
                      args))
             (define (python-path dir)
               (string-append dir "/lib/python"
                              ,(version-major+minor
                                 (package-version python))
                              "/site-packages"))
             (let ((out (assoc-ref outputs "out"))
                   (ndiff (assoc-ref outputs "ndiff")))
               (for-each mkdir-p (list out ndiff))
               (make out
                 "install-nmap"
                 "install-nse"
                 "install-ncat"
                 "install-nping")
               (make ndiff "install-ndiff")
               (wrap-program (string-append ndiff "/bin/ndiff")
                 `("PYTHONPATH" prefix
                   (,(python-path ndiff)))))
             #t))
         ;; These are the tests that do not require network access.
         (replace 'check
           (lambda _ (invoke "make"
                             "check-nse"
                             "check-ndiff"
                             "check-dns"))))
       ;; Nmap can't cope with out-of-source building.
       #:out-of-source? #f))
    (home-page "https://nmap.org/")
    (synopsis "Network discovery and security auditing tool")
    (description
     "Nmap (\"Network Mapper\") is a network discovery and security auditing
tool.  It is also useful for tasks such as network inventory, managing service
upgrade schedules, and monitoring host or service uptime.  It also provides an
advanced netcat implementation (ncat), a utility for comparing scan
results (ndiff), and a packet generation and response analysis tool (nping).")
    ;; This package uses nmap's bundled versions of libdnet and liblinear, which
    ;; both use a 3-clause BSD license.
    (license (list license:nmap license:bsd-3))))

(define-public dstat
  (package
    (name "dstat")
    (version "0.7.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dstat-real/dstat")
             (commit (string-append "v" version))))
       (file-name (git-file-name "dstat" version))
       (sha256
        (base32 "1qnmkhqmjd1m3if05jj29dvr5hn6kayq9bkkkh881w472c0zhp8v"))
       (patches (search-patches "dstat-fix-crash-when-specifying-delay.patch"
                                "dstat-skip-devices-without-io.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no make check
       #:make-flags
       (list (string-append "prefix=" (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-python3-DeprecationWarning
           (lambda _
             (substitute* "dstat"
               (("collections") "collections.abc"))
             #t))
         (delete 'configure)            ; no configure script
         (add-after 'install 'wrap
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (wrap-program (string-append out "/bin/dstat")
                 `("PYTHONPATH" ":" prefix (,(getenv "PYTHONPATH"))))
               #t))))))
    (inputs
     `(("python" ,python-wrapper)
       ("python-six" ,python-six)))
    (synopsis "Versatile resource statistics tool")
    (description "Dstat is a versatile replacement for @command{vmstat},
@command{iostat}, @command{netstat}, and @command{ifstat}.  Dstat overcomes
some of their limitations and adds some extra features, more counters and
flexibility.  Dstat is handy for monitoring systems during performance tuning
tests, benchmarks or troubleshooting.

Dstat allows you to view all of your system resources in real-time, you can,
e.g., compare disk utilization in combination with interrupts from your IDE
controller, or compare the network bandwidth numbers directly with the disk
throughput (in the same interval).")
    (home-page "http://dag.wiee.rs/home-made/dstat/")
    (license license:gpl2+)))

(define-public thefuck
  (package
    (name "thefuck")
    (version "3.30")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nvbn/thefuck")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fnf78956pwhb9cgv1jmgypnkma5xzflkivfrkfiadbgin848yfg"))
       (patches (search-patches "thefuck-test-environ.patch"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (delete 'check)
         (add-after 'install 'check
           (lambda* (#:key inputs outputs #:allow-other-keys)
             ;; Tests look for installed package
             (add-installed-pythonpath inputs outputs)
             ;; Some tests need write access to $HOME.
             (setenv "HOME" "/tmp")
             (invoke "py.test" "-v")
             #t)))))
    (propagated-inputs
     `(("python-colorama" ,python-colorama)
       ("python-decorator" ,python-decorator)
       ("python-psutil" ,python-psutil)
       ("python-pyte" ,python-pyte)
       ("python-six" ,python-six)))
    (native-inputs
     `(("go" ,go)
       ("python-mock" ,python-mock)
       ("python-pytest" ,python-pytest)
       ("python-pytest-mock" ,python-pytest-mock)))
    (home-page "https://github.com/nvbn/thefuck")
    (synopsis "Correct mistyped console command")
    (description
     "The Fuck tries to match a rule for a previous, mistyped command, creates
a new command using the matched rule, and runs it.")
    (license license:x11)))

(define-public di
  (package
    (name "di")
    (version "4.50")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/diskinfo-di/di-" version ".tar.gz"))
       (sha256
        (base32 "0aj9ldkvmj8fmrk685vd2gagz0q8lwsn2nfbx6r6mza94mn8pw42"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; obscure test failures
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)            ; no configure script
         (add-before 'build 'setup-environment
           (lambda* (#:key outputs #:allow-other-keys)
             (setenv "CC" ,(cc-for-target))
             (setenv "prefix" (assoc-ref outputs "out"))
             #t)))
       #:make-flags (list "--environment-overrides")))
    (home-page "https://gentoo.com/di/")
    (synopsis "Advanced df like disk information utility")
    (description
     "@code{di} is a disk information utility, displaying everything that your
@code{df} command does and more.  It features the ability to display your disk
usage in whatever format you prefer.  It is designed to be highly portable and
produce uniform output across heterogeneous networks.")
    (license license:zlib)))

(define-public cbatticon
  (package
    (name "cbatticon")
    (version "1.6.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/valr/cbatticon")
             (commit version)))
       (sha256
        (base32 "0ivm2dzhsa9ir25ry418r2qg2llby9j7a6m3arbvq5c3kaj8m9jr"))
       (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:make-flags
       (list (string-append "PREFIX=" (assoc-ref %outputs "out"))
             ,(string-append "CC=" (cc-for-target)))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))         ; no configure script
    (inputs
     `(("gtk+" ,gtk+)
       ("gettext" ,gettext-minimal)
       ("libnotify" ,libnotify)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (synopsis "Lightweight battery icon for the system tray")
    (description "cbatticon is a lightweight battery icon that displays
the status of your battery in the system tray.")
    (home-page "https://github.com/valr/cbatticon")
    (license license:gpl2+)))

(define-public interrobang
  (let ((revision "1")
        (commit "896543735e1c99144765fdbd7b6e6b5afbd8b881"))
    (package
      (name "interrobang")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/TrilbyWhite/interrobang")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1n13m70p1hfba5dy3i8hfclbr6k9q3d9dai3dg4jvhdhmxcpjzdf"))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f                    ; no tests
         #:phases
         (modify-phases %standard-phases
           (delete 'configure))         ; no configure script
         #:make-flags (list (string-append "PREFIX="
                                           (assoc-ref %outputs "out")))))
      (inputs
       `(("libx11" ,libx11)))
      (native-inputs
       `(("pkg-config" ,pkg-config)))
      (synopsis "Scriptable launcher menu")
      (description "Interrobang is a scriptable launcher menu with a customizable
shortcut syntax and completion options.")
      (home-page "https://github.com/TrilbyWhite/interrobang")
      (license license:gpl3+))))

(define-public pam-krb5
  (package
    (name "pam-krb5")
    (version "4.8")
    (source (origin
              (method url-fetch)
              (uri
                (list (string-append
                        "https://archives.eyrie.org/software/kerberos/"
                        "pam-krb5-" version ".tar.xz")
                      (string-append
                        "https://archives.eyrie.org/software/ARCHIVE/"
                        "pam-krb5/pam-krb5-" version ".tar.xz")))
              (patches (search-patches "pam-krb5-CVE-2020-10595.patch"))
              (sha256
               (base32
                "1qjp8i1s9bz7g6kiqrkzzkxn5pfspa4sy53b6z40fqmdf9przdfb"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'disable-tests
           (lambda _
             ;; The build container seems to interfere with some tests.
             (substitute* "tests/TESTS"
               (("module/basic\n")  ""))
             (substitute* "tests/TESTS"
               (("pam-util/vector\n")  ""))
             #t)))))
    (inputs
     `(("linux-pam" ,linux-pam)
       ("mit-krb5" ,mit-krb5)))
    (native-inputs
     `(("perl" ,perl)
       ("perl-test-pod" ,perl-test-pod))) ; required for tests
    (synopsis "Kerberos PAM module")
    (description
     "Pam-krb5 is a Kerberos PAM module for either MIT Kerberos or Heimdal.
It supports ticket refreshing by screen savers, configurable
authorization handling, authentication of non-local accounts for network
services, password changing, and password expiration, as well as all the
standard expected PAM features.  It works correctly with OpenSSH, even
with @code{ChallengeResponseAuthentication} and @code{PrivilegeSeparation}
enabled, and supports extensive configuration either by PAM options or in
krb5.conf or both.  PKINIT is supported with recent versions of both MIT
Kerberos and Heimdal and FAST is supported with recent MIT Kerberos.")
    (home-page "https://www.eyrie.org/~eagle/software/pam-krb5/")
    ;; Dual licenced under  a homebrew non-copyleft OR GPL (any version)
    ;; However, the tarball does not contain a copy of the GPL,  so unless
    ;; we put one in, we cannot distribute it under GPL without violating
    ;; clause requiring us to give all recipients a copy.
    (license license:gpl1+)))

(define (sunxi-tools-source version)
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/linux-sunxi/sunxi-tools")
             (commit (string-append "v" version))))
       (sha256
        (base32 "04f3jqg8ww4jxsf9c6ddcdgy2xbhkyp0b3l5f1hvvbv94p81rjxd"))
       (patches
        (search-patches "sunxi-tools-remove-sys-io.patch"))
       (modules '((guix build utils)))
       (snippet
        ;; Remove binaries contained in the tarball which are only for the
        ;; target and can be regenerated anyway.
        '(begin
           (delete-file-recursively "bin")
           #t))
       (file-name (git-file-name "sunxi-tools" version))))

(define sunxi-target-tools
  (package
    (name "sunxi-target-tools")
    (version "1.4.2")
    (build-system gnu-build-system)
    (source
     (sunxi-tools-source version))
    (arguments
     `(#:system "armhf-linux"
       #:tests? #f
       #:make-flags (list (string-append "PREFIX="
                                         (assoc-ref %outputs "out"))
                          (string-append "CROSS_COMPILE=")
                          "CC=gcc")
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda* (#:key make-flags #:allow-other-keys)
             (apply invoke "make" "target-tools" make-flags)))
         (replace 'install
           (lambda* (#:key make-flags #:allow-other-keys)
             (apply invoke "make" "install-target-tools"
                    make-flags))))))
    (home-page "https://github.com/linux-sunxi/sunxi-tools")
    (synopsis "Hardware management tools for Allwinner computers")
    (description "This package contains tools for Allwinner devices:
@enumerate
@item @command{sunxi-meminfo}: Prints memory bus settings.
@end enumerate")
    (license license:gpl2+)))

(define-public sunxi-tools
  (package
    (name "sunxi-tools")
    (version "1.4.2")
    (source
     (sunxi-tools-source version))
    (native-inputs
     `(("sunxi-target-tools" ,sunxi-target-tools)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("libusb" ,libusb)))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests exist
       #:make-flags (list (string-append "PREFIX="
                                         (assoc-ref %outputs "out"))
                          (string-append "CROSS_COMPILE=disabled")
                          "CC=gcc")
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda* (#:key make-flags #:allow-other-keys)
             (apply invoke "make" "tools" "misc" make-flags)))
         (replace 'install
           (lambda* (#:key inputs outputs make-flags #:allow-other-keys)
             ;; Those tools have been built for armhf but are part of the
             ;; installation in the upstream package.  So do the same
             ;; here.
             (copy-recursively (assoc-ref inputs "sunxi-target-tools")
                               (assoc-ref outputs "out"))
             (apply invoke "make" "install-tools" "install-misc"
                    make-flags))))))
    (home-page "https://github.com/linux-sunxi/sunxi-tools")
    (synopsis "Hardware management tools for Allwinner computers")
    (description "This package contains tools for Allwinner devices:
@enumerate
@item @command{sunxi-fexc}, @command{bin2fex}, @command{fex2bin}: Compile
a textual description of a board (.fex) to a binary representation (.bin).
@item @command{sunxi-fel}: Puts an Allwinner device into FEL mode which
makes it register as a special USB device (rather than USB host).
You can then connect it to another computer and flash it from there.
@item @command{sunxi-nand-part}: Partitions NAND flash.
@item @command{sunxi-bootinfo}: Reads out boot0 and boot1 (Allwinner
bootloader) parameters.
@item @command{sunxi-pio}: Sets GPIO parameters and oscillates a GPIO
in order to be able to find it.
@item @command{sunxi-meminfo}: Prints memory bus settings.
@item @command{sunxi-nand-image-builder}: Prepares raw NAND images.
@end enumerate")
    (license license:gpl2+)))

(define-public sedsed
  (package
    (name "sedsed")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aureliojargas/sedsed")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05cl35mwljdb9ynbbsfa8zx6ig8r0xncbg2cir9vwn5manndjj18"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-sed-in
           (lambda _
             (substitute* "sedsed.py"
               (("sedbin = 'sed'")
                (string-append "sedbin = '" (which "sed") "'")))
             #t))
         (delete 'build)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               ;; Just one file to copy around
               (install-file "sedsed.py" bin)
               #t)))
         (add-after 'wrap 'symlink
           ;; Create 'sedsed' symlink to "sedsed.py".
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (sed (string-append bin "/sedsed"))
                    (sedpy (string-append bin "/sedsed.py")))
               (symlink sedpy sed)
               #t))))))
    (home-page "https://aurelio.net/projects/sedsed")
    (synopsis "Sed sed scripts")
    (description
     "@code{sedsed} can debug, indent, tokenize and HTMLize your @command{sed}
script.

In debug mode, it reads your script and adds extra commands to it.  When
executed you can see the data flow between the commands, revealing all the
magic sed performs on its internal buffers.

In indent mode, your script is reformatted with standard spacing.

In tokenize mode, you can see the elements of every command you use.

In HTMLize mode, your script is converted to a beautiful colored HTML file,
with all the commands and parameters identified for your viewing pleasure.

With sedsed you can master any sed script.  No more secrets, no more hidden
buffers.")
    (license license:expat)))

(define-public igt-gpu-tools
  (package
    (name "igt-gpu-tools")
    (version "1.25")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.freedesktop.org/drm/igt-gpu-tools.git")
             (commit (string-append "igt-gpu-tools-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1lvhkdhilw0fn4nzkpfwvrhiv8d92h811qs2v6ac3p5w7v86a9zm"))))
    (build-system meson-build-system)
    (arguments
     `(#:tests? #f))            ; many of the tests try to load kernel modules
    (inputs
     `(("cairo" ,cairo)
       ("elfutils" ,elfutils)           ; libdw
       ("eudev" ,eudev)
       ("kmod" ,kmod)
       ("libdrm" ,libdrm)
       ("libpciaccess" ,libpciaccess)
       ("libunwind" ,libunwind)
       ("procps" ,procps)))
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)
       ("pkg-config" ,pkg-config)))
    (home-page "https://gitlab.freedesktop.org/drm/igt-gpu-tools")
    (synopsis "Tools for development and testing of the Intel DRM driver")
    (description "IGT GPU Tools is a collection of tools for development and
testing of the Intel DRM driver.  There are many macro-level test suites that
get used against the driver, including xtest, rendercheck, piglit, and
oglconform, but failures from those can be difficult to track down to kernel
changes, and many require complicated build procedures or specific testing
environments to get useful results.  Therefore, IGT GPU Tools includes
low-level tools and tests specifically for development and testing of the
Intel DRM Driver.")
    (supported-systems '("i686-linux" "x86_64-linux"))
    (license license:expat)))

(define-public fabric
  (package
    (name "fabric")
    (version "1.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Fabric" version))
       (sha256
        (base32
         "1a3ndlpdw6bhn8fcw1jgznl117a8pnr84az9rb5fwnrypf1ph2b6"))))
    (build-system python-build-system)
    (arguments
     `(#:python ,python-2               ; Python 2 only
       #:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke
              "nosetests" "-v" "tests/"
              ;; This test hangs indefinitely when run on a single core VM
              ;; (see GNU bug #26647 and Debian bug #850230).
              "--exclude=test_nested_execution_with_explicit_ports"
              ;; This test randomly fails in certain environments causing too
              ;; much noise to be useful (see Debian bug #854686).
              "--exclude=test_should_use_sentinel_for_tasks_that_errored"))))))
    (native-inputs
     `(("python2-fudge" ,python2-fudge) ; Requires < 1.0
       ("python2-jinja2" ,python2-jinja2) ; Requires < 3.0
       ("python2-nose" ,python2-nose) ; Requires < 2.0
       ("python2-pynacl" ,python2-pynacl)
       ("python2-bcrypt" ,python2-bcrypt)))
    (propagated-inputs
     `(("python2-paramiko" ,python2-paramiko)))
    (home-page "https://www.fabfile.org/")
    (synopsis "Simple Pythonic remote execution and deployment tool")
    (description
     "Fabric is designed to upload files and run shell commands on a number of
servers in parallel or serially.  These commands are grouped in tasks (which
are regular Python functions) and specified in a @dfn{fabfile}.

It is similar to Capistrano, except it's implemented in Python and doesn't
expect you to be deploying Rails applications.  Fabric is a simple, Pythonic
tool for remote execution and deployment.")
    (license license:bsd-2)))

(define-public neofetch
  (package
    (name "neofetch")
    (version "7.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dylanaraps/neofetch")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0i7wpisipwzk0j62pzaigbiq42y1mn4sbraz4my2jlz6ahwf00kv"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; there are no tests
       #:make-flags
       (list (string-append "PREFIX=" %output))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))         ; no configure script
    (home-page "https://github.com/dylanaraps/neofetch")
    (synopsis "System information script")
    (description "Neofetch is a command-line system information tool written in
Bash.  Neofetch displays information about your system next to an image, your OS
logo, or any ASCII file of your choice.  The main purpose of Neofetch is to be
used in screenshots to show other users what operating system or distribution
you are running, what theme or icon set you are using, etc.")
    (license license:expat)))

(define-public screenfetch
  (package
    (name "screenfetch")
    (version "3.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KittyKatt/screenFetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "04l8aqr474pb115nagn9f6y48jw92n1qfszgw7dbhgl4mpn95lcr"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((source (assoc-ref %build-inputs "source"))
               (out    (assoc-ref %outputs "out")))
           (mkdir-p (string-append out "/bin/"))
           (copy-file (string-append source "/screenfetch-dev")
                      (string-append out "/bin/screenfetch"))
           (install-file (string-append source "/screenfetch.1")
                         (string-append out "/man/man1/"))
           (install-file (string-append source "/COPYING")
                         (string-append out "/share/doc/" ,name "-" ,version))
           (substitute* (string-append out "/bin/screenfetch")
             (("/usr/bin/env bash")
              (string-append (assoc-ref %build-inputs "bash")
                             "/bin/bash")))
           (wrap-program
               (string-append out "/bin/screenfetch")
             `("PATH" ":" prefix
               (,(string-append (assoc-ref %build-inputs "bc") "/bin:"
                                (assoc-ref %build-inputs "scrot") "/bin:"
                                (assoc-ref %build-inputs "xdpyinfo") "/bin"
                                (assoc-ref %build-inputs "xprop") "/bin"))))
           (substitute* (string-append out "/bin/screenfetch")
             (("#!#f")
              (string-append "#!" (assoc-ref %build-inputs "bash")
                             "/bin/bash")))))))
    (inputs
     `(("bash" ,bash)
       ("bc" ,bc)
       ("scrot" ,scrot)
       ("xdpyinfo" ,xdpyinfo)
       ("xprop" ,xprop)))
    (home-page "https://github.com/KittyKatt/screenFetch")
    (synopsis "System information script")
    (description "Bash screenshot information tool which can be used to
generate those nifty terminal theme information and ASCII distribution logos in
everyone's screenshots nowadays.")
    (license license:gpl3)))

(define-public ufetch
  (let ((commit "98b622023e03fe24dbc137e9a68104dfe1fbd04a")
        (revision "1"))
    (package
      (name "ufetch")
      (version (git-version "0.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab.com/jschx/ufetch.git")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "09c4zmikza16xpydinnqbi3hmcibfrrn10wij7j0j1wv1pj2sl2l"))))
      (build-system trivial-build-system)
      (inputs
       `(("bash" ,bash)
         ("tput" ,ncurses)))
      (arguments
       `(#:modules ((guix build utils))
         #:builder
         (begin
           (use-modules (guix build utils))
           (let* ((source (assoc-ref %build-inputs "source"))
                  (output (assoc-ref %outputs "out"))
                  (bindir (string-append output "/bin"))
                  (docdir (string-append output "/share/doc/ufetch-" ,version))
                  (tput (string-append (assoc-ref %build-inputs "tput") "/bin/tput")))
             (install-file (string-append source "/LICENSE") docdir)
             (setenv "PATH" (string-append (assoc-ref %build-inputs "bash") "/bin"))
             (mkdir-p bindir)
             (for-each (lambda (src)
                         (let ((dst (string-append bindir "/" (basename src))))
                           (copy-file src dst)
                           (patch-shebang dst)
                           (substitute* dst (("tput") tput))))
                       (find-files source "ufetch-[[:alpha:]]*$"))
             ;; Note: the `ufetch` we create below will only work if run under
             ;; the Guix System.  I.e. a user trying to run `ufetch` on a
             ;; foreign distro will not get great results.  The `screenfetch`
             ;; program does actual runtime detection of the operating system,
             ;; and would be a better choice in such a situation.
             (symlink "ufetch-guix" (string-append bindir "/ufetch"))))))
      (home-page "https://gitlab.com/jschx/ufetch")
      (synopsis "Tiny system info")
      (description "This package provides a tiny system info utility.")
      (license license:isc))))

(define-public pfetch
  (let ((commit "e18a0959ab98b963744755ec4687e59dc11db3c5")
        (revision "0"))
    (package
      (name "pfetch")
      (version (git-version "0.7.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/dylanaraps/pfetch")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1md40av6i3xvvwig5jzhy4kf3s5sgxxk35r0vcyrjd8qyndk927l"))))
      (build-system trivial-build-system)
      (inputs `(("bash" ,bash)))
      (arguments
       `(#:modules ((guix build utils))
         #:builder
         (begin
           (use-modules (guix build utils))
           (let* ((source (lambda (f)
                            (string-append (assoc-ref %build-inputs "source") "/" f)))
                  (output (assoc-ref %outputs "out"))
                  (docdir (string-append output "/share/doc/pfetch-" ,version)))
             (install-file (source "LICENSE.md") docdir)
             (install-file (source "README.md") docdir)
             (install-file (source "pfetch") (string-append output "/bin"))
             (patch-shebang
              (string-append output "/bin/pfetch")
              (list (string-append (assoc-ref %build-inputs "bash") "/bin")))
             #t))))
      (home-page "https://github.com/dylanaraps/pfetch")
      (synopsis "System information tool")
      (description "This package provides a simple, configurable system
information tool.")
      (license license:expat))))

(define-public nnn
  (package
    (name "nnn")
    (version "4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jarun/nnn/releases/download/v"
                           version "/nnn-v" version ".tar.gz"))
       (sha256
        (base32 "0m07nh1cdfikn4bkpni29j61hr9jdwbl0n5fmlm53l1xmn7yq6d2"))))
    (build-system gnu-build-system)
    (inputs
     `(("ncurses" ,ncurses)
       ("readline" ,readline)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (arguments
     `(#:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)            ; no configure script
         (add-after 'unpack 'patch-pkg-config
           (lambda _
             (substitute* "Makefile"
               (("pkg-config")
                ,(pkg-config-for-target))))))
       #:make-flags
       (list
        (string-append "PREFIX="
                       (assoc-ref %outputs "out"))
        (string-append "CC=" ,(cc-for-target)))))
    (home-page "https://github.com/jarun/nnn")
    (synopsis "Terminal file browser")
    (description "@command{nnn} is a fork of @command{noice}, a blazing-fast
lightweight terminal file browser with easy keyboard shortcuts for
navigation, opening files and running tasks.  There is no config file and
mime associations are hard-coded.  The incredible user-friendliness and speed
make it a perfect utility on modern distros.")
    (license license:bsd-2)))

(define-public thermald
  (package
    (name "thermald")
    (version "2.4.4")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
             (url "https://github.com/intel/thermal_daemon")
             (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "1k0r2c13fihjndwfh0byw0i8ni4lzsjgwz874pvpj1l1nvjj0ajx"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags
       (let ((out (assoc-ref %outputs "out")))
         (list (string-append "--with-dbus-sys-dir="
                              out "/etc/dbus-1/system.d")
               "--localstatedir=/var"))
       #:make-flags
       (list "V=1")                     ; log build commands
       #:phases
       (modify-phases %standard-phases
         (add-before 'bootstrap 'no-early-./configure
           (lambda _
             (setenv "NO_CONFIGURE" "yet")
             ;; XXX thd_trip_point.h redefines "__STDC_LIMIT_MACROS" after
             ;; <xz>/include/lzma.h.  ./configure forcibly appends -Werror
             ;; to CXXFLAGS, overriding any -Wno-error we'd add.
             (substitute* "configure.ac"
               (("-Werror") ""))
             #t)))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("autoconf-archive" ,autoconf-archive)
       ("automake" ,automake)
       ("glib" ,glib "bin")             ; for glib-genmarshal, etc.
       ("gtk-doc" ,gtk-doc)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("dbus-glib" ,dbus-glib)
       ("libevdev" ,libevdev)
       ("libxml2" ,libxml2)
       ("upower" ,upower)
       ("xz" ,xz)))
    (home-page "https://01.org/linux-thermal-daemon/")
    (synopsis "CPU scaling for thermal management")
    (description "The Linux Thermal Daemon helps monitor and control temperature
on systems running the Linux kernel.")
    ;; arm and aarch64 don't have cpuid.h.
    (supported-systems '("i686-linux" "x86_64-linux"))
    (license license:gpl2)))

(define-public masscan
  (package
    (name "masscan")
    (version "1.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/robertdavidgraham/masscan")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q0c7bsf0pbl8napry1qyg0gl4pd8wn872h4mz9b56dx4rx90vqg"))))
    (build-system gnu-build-system)
    (inputs
     `(("libpcap" ,libpcap)))
    (arguments
     `(#:test-target "regress"
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)            ; no ./configure script
         (add-after 'unpack 'patch-path
           (lambda* (#:key outputs inputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (pcap (assoc-ref inputs "libpcap")))
               (substitute* "src/rawsock-pcap.c"
                 (("libpcap.so") (string-append pcap "/lib/libpcap.so")))
               #t))))))
    (synopsis "TCP port scanner")
    (description "MASSCAN is an asynchronous TCP port scanner.  It can detect
open ports, and also complete the TCP connection and interact with the remote
application, collecting the information received.")
    (home-page "https://github.com/robertdavidgraham/masscan")
    ;; 'src/siphash24.c' is the SipHash reference implementation, which
    ;; bears a CC0 Public Domain Dedication.
    (license license:agpl3+)))

(define-public hungrycat
  (package
    (name "hungrycat")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jwilk/hungrycat/"
                                  "releases/download/" version "/"
                                  "hungrycat-" version ".tar.gz"))
              (sha256
               (base32
                "03fc1zsrf99lvxa7b4ps6pbi43304wbxh1f6ci4q0vkal370yfwh"))))
    (build-system gnu-build-system)
    (native-inputs
     ;; For tests.
     `(("python" ,python-wrapper)
       ("python-nose" ,python-nose)))
    (arguments
     `(#:test-target "test"))
    (synopsis "A single tool that combines @command{cat} & @command{rm}")
    (description
     "hungrycat prints the contents of a file to standard output, while
simultaneously freeing the disk space it occupied.  It is useful if you need
to process a large file, don't have enough space to store both the input and
output files, and don't need the input file afterwards.
While similar in principle to running @command{cat} immediately followed by
@command{rm}, @command{hungrycat} actually frees blocks as soon as they are
printed instead of after the entire file has been read, which is often too
late.")
    (home-page "https://jwilk.net/software/hungrycat")
    (license license:expat)))

(define-public launchmon
  (package
    (name "launchmon")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LLNL/LaunchMON/releases/download/v"
                    version "/launchmon-v" version ".tar.gz"))
              (sha256
               (base32
                "0fm3nd9mydm9v2bf7bh01dbgrfnpwkapxa3dsvy3x1z0rz61qc0x"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; Fix build failure with GCC 7 due to a conversion error.
                  ;; Remove for versions > 1.0.2.
                  (substitute* "launchmon/src/linux/lmon_api/lmon_coloc_spawner.cxx"
                    ((" lmonpl = '\\\\0'")
                     " *lmonpl = '\\0'"))
                  #t))))
    (build-system gnu-build-system)
    (inputs
     `(("mpi" ,openmpi)
       ("munge" ,munge)
       ("boost" ,boost)
       ("libelf" ,libelf)
       ("libgcrypt" ,libgcrypt)
       ("libgpg-error" ,libgpg-error)))
    (synopsis "Infrastructue for large scale tool daemon launching")
    (description
     "LaunchMON is a software infrastructure that enables HPC run-time
tools to co-locate tool daemons with a parallel job.  Its API allows a
tool to identify all the remote processes of a job and to scalably
launch daemons into the relevant nodes.")
    (home-page "https://github.com/LLNL/LaunchMON")
    (supported-systems '("i686-linux" "x86_64-linux"))
    (license license:lgpl2.1)))

(define-public spindle
  (package
    (name "spindle")
    (version "0.10")
    (source (origin
              ;; We use git checkout to avoid github auto-generated tarballs
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hpc/Spindle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "15n3ay0qq81r5v7fif61q1vdjcq44pp2nynkh3fvbzc9fj3c39wd"))))
    (build-system gnu-build-system)
    (arguments '(#:configure-flags '("--enable-sec-launchmon"
                                     "--enable-sec-munge"
                                     "--enable-sec-none")))
    (inputs
     `(("mpi" ,openmpi)
       ("munge" ,munge)
       ("launchmon" ,launchmon)
       ("libgcrypt" ,libgcrypt)))
    (synopsis "Scalable library loading in HPC environments")
    (description
     "Spindle is a tool for improving the performance of dynamic library and
Python loading in HPC environments.")
    (home-page "https://github.com/hpc/Spindle")
    ;; This package supports x86_64 and PowerPC64
    (supported-systems '("x86_64-linux"))
    (license license:lgpl2.1)))

(define-public inxi-minimal
  (let ((real-name "inxi"))
    (package
      (name "inxi-minimal")
      (version "3.3.04-1")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/smxi/inxi")
               (commit version)))
         (file-name (git-file-name real-name version))
         (sha256
          (base32 "1rrhycp8i43yf9wi80n4pq2hkfhvb2rg1srz8if28bh6fhhasjzw"))))
      (build-system trivial-build-system)
      (inputs
       `(("bash" ,bash-minimal)
         ("perl" ,perl)
         ("procps" ,procps)))
      (native-inputs
       `(("gzip" ,gzip)))
      (arguments
       `(#:modules ((guix build utils))
         #:builder
         (begin
           (use-modules (guix build utils)
                        (ice-9 match)
                        (srfi srfi-26))
           (setenv "PATH" (string-append
                           (assoc-ref %build-inputs "bash") "/bin" ":"
                           (assoc-ref %build-inputs "gzip") "/bin" ":"
                           (assoc-ref %build-inputs "perl") "/bin" ":"))
           (copy-recursively (assoc-ref %build-inputs "source")
                             ,(string-append real-name "-" version))
           (with-directory-excursion ,(string-append real-name "-" version)
             (with-fluids ((%default-port-encoding #f))
               (substitute* "inxi" (("/usr/bin/env perl") (which "perl"))))
             (let ((bin (string-append %output "/bin")))
               (install-file "inxi" bin)
               (wrap-program (string-append bin "/inxi")
                 `("PATH" ":" =
                   ("$PATH"
                    ,@(map (lambda (input)
                             (match input
                               ((name . store)
                                (let ((store-append
                                       (cut string-append store <>)))
                                  (cond
                                   ((member name '("util-linux"))
                                    (string-append (store-append "/bin") ":"
                                                   (store-append "/sbin")))
                                   ((member name '("dmidecode" "iproute2"))
                                    (store-append "/sbin"))
                                   (else (store-append "/bin")))))))
                           %build-inputs)))
                 `("PERL5LIB" ":" =
                   ,(delete
                     ""
                     (map (match-lambda
                            (((? (cut string-prefix? "perl-" <>) name) . dir)
                             (string-append dir "/lib/perl5/site_perl"))
                            (_ ""))
                          %build-inputs)))))
             (invoke "gzip" "inxi.1")
             (install-file "inxi.1.gz"
                           (string-append %output "/share/man/man1")))
           #t)))
      (home-page "https://smxi.org/docs/inxi.htm")
      (synopsis "Full-featured system information script")
      (description "Inxi is a system information script that can display
various things about your hardware and software to users in an IRC chatroom or
support forum.  It runs with the @code{/exec} command in most IRC clients.")
      (license license:gpl3+))))

(define-public inxi
  (package
    (inherit inxi-minimal)
    (name "inxi")
    (inputs
     `(("dmidecode" ,dmidecode)
       ("file" ,file)
       ("bind:utils" ,isc-bind "utils") ; dig
       ("gzip" ,gzip)
       ("iproute2" ,iproute)            ; ip
       ("kmod" ,kmod)                   ; modinfo
       ("lm-sensors" ,lm-sensors)
       ("mesa-utils" ,mesa-utils)
       ("pciutils" ,pciutils)
       ("tar" ,tar)
       ("tree" ,tree)
       ("util-linux" ,util-linux)       ; lsblk
       ("usbutils" ,usbutils)           ; lsusb
       ("wmctrl" ,wmctrl)
       ("xdpyinfo" ,xdpyinfo)
       ("xprop" ,xprop)
       ("xrandr" ,xrandr)
       ("coreutils" ,coreutils)         ; uptime
       ("inetutils" ,inetutils)         ; ifconfig
       ("perl-cpanel-json-xs" ,perl-cpanel-json-xs)
       ("perl-http-tiny" ,perl-http-tiny)
       ("perl-io-socket-ssl" ,perl-io-socket-ssl)
       ("perl-json-xs" ,perl-json-xs)
       ("perl-time-hires" ,perl-time-hires)
       ("lvm2" ,lvm2)                   ; lvs
       ("mdadm" ,mdadm)
       ;; TODO: Add more inputs:
       ;; ipmi-sensors
       ;; hddtemp
       ;; perl-xml-dumper
       ;; ipmitool
       ,@(package-inputs inxi-minimal)))))

(define-public pscircle
  (package
    (name "pscircle")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/mildlyparallel/pscircle.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1sm99423hh90kr4wdjqi9sdrrpk65j2vz2hzj65zcxfxyr6khjci"))))
    (build-system meson-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("cairo" ,cairo)
       ("libpng" ,libpng)
       ("libx11" ,libx11)))
    (home-page "https://gitlab.com/mildlyparallel/pscircle")
    (synopsis "Visualize Linux processes in a form of radial tree")
    (description
     "@code{pscircle} visualizes Linux processes in the form of a radial tree.")
    (license license:gpl2+)))

(define-public python-pyudev
  (package
    (name "python-pyudev")
    (version "0.22.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pyudev" version))
        (sha256
          (base32
            "0xmj6l08iih2js9skjqpv4w7y0dhxyg91zmrs6v5aa65gbmipfv9"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f ; Tests require /sys
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-ctypes-udev
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((eudev (assoc-ref inputs "eudev")))
               (substitute* "src/pyudev/core.py"
                (("'udev'")
                 (string-append "'" eudev "/lib/libudev.so'")))
               (substitute* "src/pyudev/_ctypeslib/utils.py"
                ;; Use absolute paths instead of keys.
                (("= find_library") "= "))
               #t))))))
    (inputs
     `(("eudev" ,eudev)))
    (propagated-inputs
     `(("python-six" ,python-six)))
    (native-inputs
     `(("python-docutils" ,python-docutils)
       ("python-hypothesis" ,python-hypothesis)
       ("python-mock" ,python-mock)
       ("python-pytest" ,python-pytest)
       ("python-sphinx" ,python-sphinx)))
    (home-page "https://pyudev.readthedocs.io/")
    (synopsis "Python udev binding")
    (description "This package provides @code{udev} bindings for Python.")
    (license license:lgpl2.1)))

(define-public vmtouch
  (package
    (name "vmtouch")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoytech/vmtouch/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08da6apzfkfjwasn4dxrlfxqfx7arl28apdzac5nvm0fhvws0dxk"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("perl" ,perl)))
    (arguments
     `(#:tests? #f                      ; no tests
       #:make-flags
       (list
        (string-append "CC=" ,(cc-for-target))
        (string-append "PREFIX=" (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))
    (home-page "https://github.com/hoytech/vmtouch/")
    (synopsis "Portable file system cache diagnostics and control")
    (description
     "vmtouch is a tool for learning about and controlling the file system
cache of unix and unix-like systems.")
    (license license:bsd-3)))

(define-public solaar
  (package
    (name "solaar")
    (version "1.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pwr-Solaar/Solaar")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "04zclzfc31l2fj5shcsngnmcvcmmhnc567l3wb9yfhs8k39k9kb2"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'build 'setenv-PATH
           (lambda _
             (setenv "PYTHONPATH" (string-append "lib:" (getenv "PYTHONPATH")))
             #t)))))
    (propagated-inputs
     `(("python-pygobject" ,python-pygobject)
       ("python-pyudev" ,python-pyudev)

       ;; For GUI.
       ("python-pyyaml" ,python-pyyaml)
       ("python-psutil" ,python-psutil)
       ("python-xlib" ,python-xlib)
       ("gtk+" ,gtk+)
       ("python-pygobject" ,python-pygobject)))
    (home-page "https://pwr-solaar.github.io/Solaar/")
    (synopsis "Linux devices manager for the Logitech Unifying Receiver")
    (description "This package provides tools to manage clients of the
Logitech Unifying Receiver.")
    (license license:gpl2)))

(define-public lynis
  (package
    (name "lynis")
    ;; Also update the ‘lynis-sdk’ input to the commit matching this release.
    (version "3.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/CISOfy/lynis")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i556d8xpas6k5k3ad0xvc6ihxnw27nzrjkf14759jkcqrbpb4gy"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Remove proprietary plugins. As of now, all plugins supplied with
           ;; lynis are proprietary. In the future, if free plugins are
           ;; provided, whitelist them from deletion.
           (for-each delete-file (find-files "plugins"))
           #t))))
    (build-system gnu-build-system)
    (native-inputs
     `(;; For tests
       ("lynis-sdk"
        ,(origin
           (method git-fetch)
           (uri (git-reference
                 (url "https://github.com/CISOfy/lynis-sdk")
                 (commit "a4087770b7ee794901c5135673e006e8f84bfd3d")))
           (file-name (git-file-name "lynis-sdk" version))
           (sha256
            (base32 "00wikqydhrjcn0ampgr4qjg30y12as1gm23z94bs72ff035lhcpw"))))))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (substitute* "lynis"
               (("/usr/share/lynis")
                (string-append (assoc-ref outputs "out") "/share/lynis")))
             (substitute* "include/functions"
               (("/usr/local/etc/lynis")
                (string-append (assoc-ref outputs "out") "/etc/lynis")))
             #t))
         (delete 'build)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (install-file "lynis" (string-append out "/bin/"))
               (install-file "default.prf" (string-append out "/etc/lynis"))
               (for-each
                (lambda (dir)
                  (copy-recursively dir (string-append out "/share/lynis/" dir)))
                (list "db" "include" "plugins"))
               (install-file "lynis.8" (string-append out "/share/man/man8"))
               #t)))
         (replace 'check
           (lambda* (#:key inputs #:allow-other-keys)
             (copy-recursively (assoc-ref inputs "lynis-sdk") "../lynis-sdk")
             (setenv "LANG" "en_US.UTF-8")
             (let ((lynis-dir (getcwd)))
               (with-directory-excursion "../lynis-sdk"
                 (substitute* "config"
                   (("\\.\\./lynis") lynis-dir))
                 (substitute* "unit-tests/tests-language-translations.sh"
                   (("\\.\\./lynis") lynis-dir))
                 (invoke "sh" "lynis-devkit" "run" "unit-tests"))))))))
    (home-page "https://cisofy.com/lynis/")
    (synopsis "Security auditing tool")
    (description "Lynis is a security auditing tool.  It performs an in-depth
security scan and runs on the system itself.  The primary goal is to test
security defenses and provide tips for further system hardening.  It will also
scan for general system information, vulnerable software packages, and
possible configuration issues.")
    (license license:gpl3+)))

(define-public ngrep
  (package
    (name "ngrep")
    (version "1.47")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jpr5/ngrep/")
             (commit (string-append "V" (string-replace-substring version "." "_")))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1x2fyd7wdqlj1r76ilal06cl2wmbz0ws6i3ys204sbjh1cj6dcl7"))))
    (build-system gnu-build-system)
    (inputs
     `(("libpcap" ,libpcap)))
    (arguments
     `(#:tests? #f ;; No tests.
       #:configure-flags (list (string-append "--with-pcap-includes="
                                              (assoc-ref %build-inputs "libpcap")
                                              "/include/pcap"))))
    (home-page "https://github.com/jpr5/ngrep/")
    (synopsis "Grep-like utility to search for network packets on an interface")
    (description "@command{ngrep} is like GNU grep applied to the network
layer.  It's a PCAP-based tool that allows you to specify an extended regular
or hexadecimal expression to match against data payloads of packets.  It
understands many kinds of protocols, including IPv4/6, TCP, UDP, ICMPv4/6,
IGMP and Raw, across a wide variety of interface types, and understands BPF
filter logic in the same fashion as more common packet sniffing tools, such as
tcpdump and snoop.")
    (license license:bsd-3)))

(define-public pam-mount
  (package
    (name "pam-mount")
    (version "2.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/pam-mount/pam_mount/"
                           "pam_mount-" version ".tar.xz"))
       (sha256
        (base32 "0832nh2qf9pisgwnbgx6hkylx5d7i416l19y3ly4ifv7k1p7mxqa"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("perl" ,perl)
       ("pkg-config" ,pkg-config)))
    (inputs
     `(("cryptsetup" ,cryptsetup)
       ("libhx" ,libhx)
       ("libxml2" ,libxml2)
       ("linux-pam" ,linux-pam)
       ("lvm2" ,lvm2)
       ("openssl" ,openssl)
       ("pcre2" ,pcre2)
       ("libmount" ,util-linux "lib")
       ("util-linux" ,util-linux)))
    (arguments
     `(#:configure-flags
       (list (string-append "--with-slibdir=" %output "/lib")
             (string-append "--with-ssbindir=" %output "/sbin"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-program-paths
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((util-linux (assoc-ref inputs "util-linux"))
                   (out (assoc-ref outputs "out")))
               (substitute* "src/mtcrypt.c"
                 (("\"mount\";")
                  (string-append "\"" util-linux "/bin/mount\";"))
                 (("\"umount\";")
                  (string-append "\"" util-linux "/bin/umount\";"))
                 (("\"fsck\",")
                  (string-append "\"" util-linux "/sbin/fsck\",")))
               (substitute* "src/rdconf1.c"
                 (("\"mount\", \"")
                  (string-append "\"" util-linux "/bin/mount\", \""))
                 (("\"umount\", \"")
                  (string-append "\"" util-linux "/bin/umount\", \""))
                 (("\"fsck\", \"")
                  (string-append "\"" util-linux "/sbin/fsck\", \""))
                 (("\"pmvarrun\", \"")
                  (string-append "\"" out "/sbin/pmvarrun\", \""))))
             #t)))))
    (home-page "http://pam-mount.sourceforge.net")
    (synopsis "PAM module to mount volumes for a user session")
    (description
     "Pam-mount is a PAM module that can mount volumes when a user logs in.
It supports mounting local filesystems of any kind the normal mount utility
supports.  It can also mount encrypted LUKS volumes using the password
supplied by the user when logging in.")
    (license (list license:gpl2+ license:lgpl2.1+))))

(define-public jc
  (package
    (name "jc")
    (version "1.13.4")
    (source
     (origin
       ;; The PyPI tarball lacks the test suite.
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kellyjonbrazil/jc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rwvyyrdnw43pixp8h51rncq2inc9pbbj1j2191y5si00pjw34zr"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-pygments" ,python-pygments)
       ("python-ruamel.yaml" ,python-ruamel.yaml)
       ("python-xmltodict" ,python-xmltodict)))
    (home-page "https://github.com/kellyjonbrazil/jc")
    (synopsis "Convert the output of command-line tools to JSON")
    (description "@code{jc} JSONifies the output of many CLI tools and
file-types for easier parsing in scripts.")
    (license license:expat)))

(define-public jtbl
  (package
    (name "jtbl")
    (version "1.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kellyjonbrazil/jtbl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1zzd7rd63xva50f22d1rfja4r302aizrafarhwm67vv181swvdya"))))
    (build-system python-build-system)
    (inputs
     `(("python-tabulate" ,python-tabulate)))
    (home-page "https://github.com/kellyjonbrazil/jtbl")
    (synopsis "Command-line tool to print JSON data as a table in the terminal")
    (description "@code{jtbl} accepts piped JSON data from stdin and outputs a
text table representation to stdout.")
    (license license:expat)))

(define-public hosts
  (package
    (name "hosts")
    (version "3.6.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xwmx/hosts")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1ni4z89kxzgwm26hhx908g04f2h0fypy7lgfa0rvsz8d0wslgcsn"))))
    (build-system trivial-build-system)
    (inputs
     `(("bats" ,bats) ;for test
       ("awk" ,gawk)
       ("bash" ,bash)
       ("coreutils" ,coreutils)
       ("diffutils" ,diffutils)
       ("grep" ,grep)
       ("ncurses" ,ncurses) ;tput
       ("sed" ,sed)))
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         ;; copy source
         (copy-recursively (assoc-ref %build-inputs "source") ".")
         ;; patch-shebang phase
         (setenv "PATH"
                 (string-append (assoc-ref %build-inputs "bash") "/bin"
                                ":" (assoc-ref %build-inputs "awk") "/bin"
                                ":" (assoc-ref %build-inputs "coreutils") "/bin"
                                ":" (assoc-ref %build-inputs "diffutils") "/bin"
                                ":" (assoc-ref %build-inputs "grep") "/bin"
                                ":" (assoc-ref %build-inputs "ncurses") "/bin"
                                ":" (assoc-ref %build-inputs "sed") "/bin"
                                ":" "/run/setuid-programs"
                                ":" (getenv "PATH")))
         (substitute* "hosts"
           (("#!/usr/bin/env bash")
            (string-append "#!" (which "bash")
                           "\nPATH=" (getenv "PATH"))))
         ;; check phase
         (setenv "TERM" "linux") ;set to tty for test
         (invoke (string-append (assoc-ref %build-inputs "bats") "/bin/bats")
                 "test")
         ;; install phase
         (install-file "hosts" (string-append %output "/bin"))
         (let ((bash-completion
                (string-append %output "/etc/bash_completion.d")))
           (mkdir-p bash-completion)
           (copy-file "etc/hosts-completion.bash"
                      (string-append bash-completion "/hosts")))
         (let ((zsh-completion
                (string-append %output "/share/zsh/site-functions")))
           (mkdir-p zsh-completion)
           (copy-file "etc/hosts-completion.zsh"
                      (string-append zsh-completion "/_hosts")))
         (let ((doc (string-append %output "/share/doc/" ,name "-" ,version)))
           (mkdir-p doc)
           (install-file "LICENSE" doc)
           (install-file "README.md" doc))
         #t)))
    (home-page "https://github.com/xwmx/hosts/")
    (synopsis "Script for editing a foreign distro's @file{/etc/hosts} file")
    (description "Hosts is a command line program for managing
@file{/etc/hosts} entries.  On Guix System, @file{/etc/hosts} is managed from
the system configuration; hosts only works when using the Guix package manager
on a foreign distro.  @command{hosts} works with existing hosts files and
entries, providing commands to add, remove, comment, and search.")
    (license license:expat)))

(define-public nmrpflash
  (package
    (name "nmrpflash")
    (version "0.9.15")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/jclehner/nmrpflash")
         (commit (string-append "v" version))))
       (sha256
        (base32 "0ssfls1sfh8w748qsnkfgndlpw395100x2yynzbk5jd56scxvp20"))
       (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("libnl" ,libnl)
       ("libpcap" ,libpcap)))
    (arguments
     `(#:tests? #f ; None exist
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (add-before 'install 'prepare-install
           (lambda* (#:key outputs #:allow-other-keys)
             (mkdir-p (string-append (assoc-ref outputs "out") "/bin"))
             #t)))))
    (home-page "https://github.com/jclehner/nmrpflash")
    (synopsis "Netgear unbrick utility")
    (description "This package provides a utility to flash a new firmware
image to a Netgear device.  It has been tested on Netgear EX2700, EX6120,
EX6150v2, DNG3700v2, R6100, R6220, R7000, D7000, WNR3500, R6400, R6800,
R8000, R8500, WNDR3800, but is likely to be compatible with many other
Netgear devices.")
    (license license:gpl3+)))

(define-public atop
  (package
    (name "atop")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.atoptool.nl/download/atop-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0crzz4i2nabyh7d6xg7fvl65qls87nbca5ihidp3nijhrrbi14ab"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; no test suite
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             ;; The installer requires a choice between systemd or SysV.
             "systemdinstall"
             (string-append "DESTDIR=" (assoc-ref %outputs "out"))
             (string-append "BINPATH=/bin")
             (string-append "SBINPATH=/sbin")
             (string-append "SYSDPATH=/etc/systemd/system")
             (string-append "PMPATHD=/etc/systemd/system-sleep")
             (string-append "MAN1PATH=/share/man/man1")
             (string-append "MAN5PATH=/share/man/man5")
             (string-append "MAN8PATH=/share/man/man8")
             ;; Or else it tries to create /var/log/atop...
             (string-append "LOGPATH="))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure) ; No ./configure script
         (add-before 'build 'patch-build
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "Makefile"
               ;; We don't need to chown things in the build environment.
               (("chown.*$") "")
               ;; We can't toggle the setuid bit in the build environment.
               (("chmod 04711") "chmod 0711")
               ;; Otherwise, it creates a blank configuration file as a "default".
               (("touch.*DEFPATH)/atop") "")
               (("chmod.*DEFPATH)/atop") ""))
             #t)))))
    (inputs
     `(("ncurses" ,ncurses)
       ("python" ,python-wrapper) ; for `atopgpud`
       ("zlib" ,zlib)))
    (home-page "https://www.atoptool.nl/")
    (synopsis "Linux performance monitoring console")
    (description "Atop is an ASCII full-screen performance monitor for Linux
that is capable of reporting the activity of all processes (even processes have
finished during the monitoring interval), daily logging of system and process
activity for long-term analysis, highlighting overloaded system resources by
using colors, etc.  At regular intervals, it shows system-level activity related
to the CPU, memory, swap, disks (including LVM) and network layers, and for
every process (and thread) it shows e.g. the CPU utilization, memory growth,
disk utilization, priority, username, state, and exit code.")
    (license license:gpl2+)))

;; TODO: Unvendor u-root (pkg: forth, golang, testutil).
(define fiano
  (package
    (name "fiano")
    (version "5.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxboot/fiano.git")
                    (commit (string-append "v" version))))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "03ihdwwhb7g6bihx141cn0924sjs5ps6q3ps58pk1cg0g0srrr9h"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively "vendor/golang.org")
                  (delete-file-recursively "vendor/github.com")
                  #t))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/linuxboot/fiano"
       #:unpack-path "github.com/linuxboot/fiano"))
    (native-inputs
     `())
    (inputs
     `(("go-golang-org-x-text" ,go-golang-org-x-text)
       ("go-github.com-ulikunitz-xz" ,go-github.com-ulikunitz-xz)))
    (synopsis "UEFI image editor")
    (description "This package provides a command-line UEFI image editor.")
    (home-page "https://github.com/linuxboot/fiano")
    (license license:bsd-3)))

(define-public fiano-utk
  (package
    (inherit fiano)
    (name "fiano-utk")
    (arguments
     `(#:import-path "github.com/linuxboot/fiano/cmds/utk"
       #:unpack-path "github.com/linuxboot/fiano"))))

(define-public fiano-fmap
  (package
    (inherit fiano)
    (name "fiano-fmap")
    (arguments
     `(#:import-path "github.com/linuxboot/fiano/cmds/fmap"
       #:unpack-path "github.com/linuxboot/fiano"))))

(define-public novena-eeprom
  (package
    (name "novena-eeprom")
    (version "2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xobs/novena-eeprom.git")
                    (commit (string-append "v" version))))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "00pd71mg0g20v0820ggp3ghf9nyj5s4wavaz9mkmrmsr91hcnf7i"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f   ; No tests exist
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target)))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (out-bin (string-append out "/bin"))
                    (out-share-man (string-append out "/share/man/man8")))
               (install-file "novena-eeprom" out-bin)
               (install-file "novena-eeprom.8" out-share-man)))))))
    (inputs
     `(("i2c-tools" ,i2c-tools)))
    (synopsis "Novena EEPROM editor")
    (description "This package provides an editor for the Novena EEPROM.
Novena boards contain a device-dependent descriptive EEPROM that defines
various parameters such as serial number, MAC address, and featureset.
This program allows you to view and manipulate this EEPROM list.")
    (home-page "https://github.com/xobs/novena-eeprom/")
    (supported-systems '("armhf-linux"))
    (license license:bsd-3)))

(define-public lrzsz
  (package
    (name "lrzsz")
    (version "0.12.20")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ohse.de/uwe/releases/lrzsz-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1wcgfa9fsigf1gri74gq0pa7pyajk12m4z69x7ci9c6x9fqkd2y2"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (setenv "CONFIG_SHELL" (which "bash"))
             (invoke "./configure"
              (string-append "--prefix="
                             (assoc-ref outputs "out"))))))))
    (synopsis "Implementation of XMODEM/YMODEM/ZMODEM transfer protocols")
    (description "This package provides programs that transfer files using
the XMODEM/YMODEM/ZMODEM file transfer protocols.")
    (home-page "https://ohse.de/uwe/software/lrzsz.html")
    (license license:gpl2+)))

(define-public nq
  (package
    (name "nq")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/leahneukirchen/nq")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0sdamjzvmf6cxhjmd1rjvn7zm6k10fp5n6vabyxd3yl30cgrxw2i"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("perl" ,perl)))
    (arguments
     `(#:make-flags (list (string-append "CC=" ,(cc-for-target))
                          (string-append "PREFIX=" (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure))))
    (synopsis "Unix command line queue utility")
    (description
     "@code{nq} can create very lightweight job queue systems which require no
setup, maintenance, supervision, or any long-running processes.")
    (home-page "https://github.com/leahneukirchen/nq")
    (license license:public-domain)))
