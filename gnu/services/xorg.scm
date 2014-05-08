;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014 Ludovic Courtès <ludo@gnu.org>
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

(define-module (gnu services xorg)
  #:use-module (gnu services)
  #:use-module (gnu system linux)                 ; 'pam-service'
  #:use-module ((gnu packages base) #:select (guile-final))
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages slim)
  #:use-module (gnu packages ratpoison)
  #:use-module (gnu packages gnustep)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages bash)
  #:use-module (guix gexp)
  #:use-module (guix monads)
  #:use-module (guix derivations)
  #:export (xorg-start-command
            slim-service))

;;; Commentary:
;;;
;;; Services that relate to the X Window System.
;;;
;;; Code:

(define* (xorg-start-command #:key
                             (guile guile-final)
                             (xorg-server xorg-server))
  "Return a derivation that builds a GUILE script to start the X server from
XORG-SERVER.  Usually the X server is started by a login manager."

  (define (xserver.conf)
    (text-file* "xserver.conf" "
Section \"Files\"
  FontPath \"" font-adobe75dpi "/share/font/X11/75dpi\"
  ModulePath \"" xf86-video-vesa "/lib/xorg/modules/drivers\"
  ModulePath \"" xf86-input-mouse "/lib/xorg/modules/input\"
  ModulePath \"" xf86-input-keyboard "/lib/xorg/modules/input\"
  ModulePath \"" xorg-server "/lib/xorg/modules\"
  ModulePath \"" xorg-server "/lib/xorg/modules/extensions\"
  ModulePath \"" xorg-server "/lib/xorg/modules/multimedia\"
EndSection

Section \"ServerFlags\"
  Option \"AllowMouseOpenFail\" \"on""
EndSection

Section \"Monitor\"
  Identifier \"Monitor[0]\"
EndSection

Section \"InputClass\"
  Identifier \"Generic keyboard\"
  MatchIsKeyboard \"on\"
  Option \"XkbRules\" \"base\"
  Option \"XkbModel\" \"pc104\"
EndSection

Section \"ServerLayout\"
  Identifier \"Layout\"
  Screen \"Screen-vesa\"
EndSection

Section \"Device\"
  Identifier \"Device-vesa\"
  Driver \"vesa\"
EndSection

Section \"Screen\"
  Identifier \"Screen-vesa\"
  Device \"Device-vesa\"
EndSection"))

  (mlet %store-monad ((config (xserver.conf)))
    (define script
      ;; Write a small wrapper around the X server.
      #~(begin
          (setenv "XORG_DRI_DRIVER_PATH" (string-append #$mesa "/lib/dri"))
          (setenv "XKB_BINDIR" (string-append #$xkbcomp "/bin"))

          (apply execl (string-append #$xorg-server "/bin/X")
                 "-ac" "-logverbose" "-verbose"
                 "-xkbdir" (string-append #$xkeyboard-config "/share/X11/xkb")
                 "-config" #$config
                 "-nolisten" "tcp" "-terminate"

                 ;; Note: SLiM and other display managers add the
                 ;; '-auth' flag by themselves.
                 (cdr (command-line)))))

    (gexp->script "start-xorg" script)))

(define* (xinitrc #:key
                  (guile guile-final)
                  (ratpoison ratpoison)
                  (windowmaker windowmaker))
  "Return a system-wide xinitrc script that starts the specified X session."
  (define builder
    #~(begin
        (use-modules (ice-9 match))

        ;; TODO: Check for ~/.xsession.
        (match (command-line)
          ((_ "ratpoison")
           (execl (string-append #$ratpoison "/bin/ratpoison")))
          (_
           (execl (string-append #$windowmaker "/bin/wmaker"))))))

  (gexp->script "xinitrc" builder))

(define* (slim-service #:key (slim slim)
                       (allow-empty-passwords? #t) auto-login?
                       (default-user "")
                       (xauth xauth) (dmd dmd) (bash bash)
                       startx)
  "Return a service that spawns the SLiM graphical login manager, which in
turn start the X display server with STARTX, a command as returned by
'xorg-start-command'.

When ALLOW-EMPTY-PASSWORDS? is true, allow logins with an empty password.
When AUTO-LOGIN? is true, log in automatically as DEFAULT-USER."
  (define (slim.cfg)
    (mlet %store-monad ((startx  (or startx (xorg-start-command)))
                        (xinitrc (xinitrc)))
      (text-file* "slim.cfg"  "
default_path /run/current-system/bin
default_xserver " startx "
xserver_arguments :0 vt7
xauth_path " xauth "/bin/xauth
authfile /var/run/slim.auth

# The login command.  '%session' is replaced by the chosen session name, one
# of the names specified in the 'sessions' setting: 'wmaker', 'xfce', etc.
login_cmd  exec " xinitrc "%session
sessions   wmaker,ratpoison

halt_cmd " dmd "/sbin/halt
reboot_cmd " dmd "/sbin/reboot
" (if auto-login?
      (string-append "auto_login yes\ndefault_user " default-user)
      ""))))

  (mlet %store-monad ((slim.cfg (slim.cfg)))
    (return
     (service
      (documentation "Xorg display server")
      (provision '(xorg-server))
      (requirement '(user-processes host-name))
      (start
       ;; XXX: Work around the inability to specify env. vars. directly.
       #~(make-forkexec-constructor
          (string-append #$bash "/bin/sh") "-c"
          (string-append "SLIM_CFGFILE=" #$slim.cfg
                         " " #$slim "/bin/slim" " -nodaemon")))
      (stop #~(make-kill-destructor))
      (respawn? #t)
      (pam-services
       ;; Tell PAM about 'slim'.
       (list (unix-pam-service
              "slim"
              #:allow-empty-passwords? allow-empty-passwords?)))))))

;;; xorg.scm ends here
