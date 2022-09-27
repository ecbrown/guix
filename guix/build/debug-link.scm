;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2018 Ludovic Courtès <ludo@gnu.org>
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

(define-module (guix build debug-link)
  #:use-module (guix elf)
  #:use-module ((guix build utils)
                #:select (find-files elf-file? make-file-writable))
  #:use-module (rnrs bytevectors)
  #:use-module (rnrs io ports)
  #:use-module (srfi srfi-1)
  #:use-module (system foreign)
  #:use-module (ice-9 match)
  #:export (debuglink-crc32
            elf-debuglink
            set-debuglink-crc

            graft-debug-links))

;;; Commentary:
;;;
;;; This module provides tools to deal with '.gnu_debuglink' sections in ELF
;;; files.  These sections are created by 'objcopy --add-gnu-debuglink' to
;;; create separate debug files (info "(gdb) Separate Debug Files").
;;;
;;; The main facility of this module is 'graft-debug-links', which allows us
;;; to update the cyclic redundancy check (CRC) that appears in
;;; '.gnu_debuglink' sections when grafting, such that separate debug files
;;; remain usable after grafting.  Failing to do that, GDB would complain
;;; about CRC mismatch---see <https://issues.guix.gnu.org/19973>.
;;;
;;; Code:

(define %crc32-table
  ;; CRC table taken from "(gdb) Separate Debug Files".
  ;; TODO: Wouldn't it be nice to generate it "from source" with a macro?
  #(#x00000000 #x77073096 #xee0e612c #x990951ba #x076dc419
    #x706af48f #xe963a535 #x9e6495a3 #x0edb8832 #x79dcb8a4
    #xe0d5e91e #x97d2d988 #x09b64c2b #x7eb17cbd #xe7b82d07
    #x90bf1d91 #x1db71064 #x6ab020f2 #xf3b97148 #x84be41de
    #x1adad47d #x6ddde4eb #xf4d4b551 #x83d385c7 #x136c9856
    #x646ba8c0 #xfd62f97a #x8a65c9ec #x14015c4f #x63066cd9
    #xfa0f3d63 #x8d080df5 #x3b6e20c8 #x4c69105e #xd56041e4
    #xa2677172 #x3c03e4d1 #x4b04d447 #xd20d85fd #xa50ab56b
    #x35b5a8fa #x42b2986c #xdbbbc9d6 #xacbcf940 #x32d86ce3
    #x45df5c75 #xdcd60dcf #xabd13d59 #x26d930ac #x51de003a
    #xc8d75180 #xbfd06116 #x21b4f4b5 #x56b3c423 #xcfba9599
    #xb8bda50f #x2802b89e #x5f058808 #xc60cd9b2 #xb10be924
    #x2f6f7c87 #x58684c11 #xc1611dab #xb6662d3d #x76dc4190
    #x01db7106 #x98d220bc #xefd5102a #x71b18589 #x06b6b51f
    #x9fbfe4a5 #xe8b8d433 #x7807c9a2 #x0f00f934 #x9609a88e
    #xe10e9818 #x7f6a0dbb #x086d3d2d #x91646c97 #xe6635c01
    #x6b6b51f4 #x1c6c6162 #x856530d8 #xf262004e #x6c0695ed
    #x1b01a57b #x8208f4c1 #xf50fc457 #x65b0d9c6 #x12b7e950
    #x8bbeb8ea #xfcb9887c #x62dd1ddf #x15da2d49 #x8cd37cf3
    #xfbd44c65 #x4db26158 #x3ab551ce #xa3bc0074 #xd4bb30e2
    #x4adfa541 #x3dd895d7 #xa4d1c46d #xd3d6f4fb #x4369e96a
    #x346ed9fc #xad678846 #xda60b8d0 #x44042d73 #x33031de5
    #xaa0a4c5f #xdd0d7cc9 #x5005713c #x270241aa #xbe0b1010
    #xc90c2086 #x5768b525 #x206f85b3 #xb966d409 #xce61e49f
    #x5edef90e #x29d9c998 #xb0d09822 #xc7d7a8b4 #x59b33d17
    #x2eb40d81 #xb7bd5c3b #xc0ba6cad #xedb88320 #x9abfb3b6
    #x03b6e20c #x74b1d29a #xead54739 #x9dd277af #x04db2615
    #x73dc1683 #xe3630b12 #x94643b84 #x0d6d6a3e #x7a6a5aa8
    #xe40ecf0b #x9309ff9d #x0a00ae27 #x7d079eb1 #xf00f9344
    #x8708a3d2 #x1e01f268 #x6906c2fe #xf762575d #x806567cb
    #x196c3671 #x6e6b06e7 #xfed41b76 #x89d32be0 #x10da7a5a
    #x67dd4acc #xf9b9df6f #x8ebeeff9 #x17b7be43 #x60b08ed5
    #xd6d6a3e8 #xa1d1937e #x38d8c2c4 #x4fdff252 #xd1bb67f1
    #xa6bc5767 #x3fb506dd #x48b2364b #xd80d2bda #xaf0a1b4c
    #x36034af6 #x41047a60 #xdf60efc3 #xa867df55 #x316e8eef
    #x4669be79 #xcb61b38c #xbc66831a #x256fd2a0 #x5268e236
    #xcc0c7795 #xbb0b4703 #x220216b9 #x5505262f #xc5ba3bbe
    #xb2bd0b28 #x2bb45a92 #x5cb36a04 #xc2d7ffa7 #xb5d0cf31
    #x2cd99e8b #x5bdeae1d #x9b64c2b0 #xec63f226 #x756aa39c
    #x026d930a #x9c0906a9 #xeb0e363f #x72076785 #x05005713
    #x95bf4a82 #xe2b87a14 #x7bb12bae #x0cb61b38 #x92d28e9b
    #xe5d5be0d #x7cdcefb7 #x0bdbdf21 #x86d3d2d4 #xf1d4e242
    #x68ddb3f8 #x1fda836e #x81be16cd #xf6b9265b #x6fb077e1
    #x18b74777 #x88085ae6 #xff0f6a70 #x66063bca #x11010b5c
    #x8f659eff #xf862ae69 #x616bffd3 #x166ccf45 #xa00ae278
    #xd70dd2ee #x4e048354 #x3903b3c2 #xa7672661 #xd06016f7
    #x4969474d #x3e6e77db #xaed16a4a #xd9d65adc #x40df0b66
    #x37d83bf0 #xa9bcae53 #xdebb9ec5 #x47b2cf7f #x30b5ffe9
    #xbdbdf21c #xcabac28a #x53b39330 #x24b4a3a6 #xbad03605
    #xcdd70693 #x54de5729 #x23d967bf #xb3667a2e #xc4614ab8
    #x5d681b02 #x2a6f2b94 #xb40bbe37 #xc30c8ea1 #x5a05df1b
    #x2d02ef8d))

(define (debuglink-crc32 port)
  "Compute the 32-bit CRC used in in '.gnu_debuglink' over the data read from
PORT and return it."                      ;(info "(gdb) Separate Debug Files")
  (let loop ((crc #xffffffff))
    (let ((byte (get-u8 port)))
      (if (eof-object? byte)
          (logand (lognot crc) #xffffffff)
          (let* ((index (logand (logxor crc byte) #xff))
                 (lhs   (vector-ref %crc32-table index)))
            (loop (logxor lhs (ash crc -8))))))))

(define (section-contents elf section)     ;XXX: copied from linux-modules.scm
  "Return the contents of SECTION in ELF as a bytevector."
  (let* ((contents (make-bytevector (elf-section-size section))))
    (bytevector-copy! (elf-bytes elf) (elf-section-offset section)
                      contents 0
                      (elf-section-size section))
    contents))

(define null-terminated-bytevector->string
  (compose pointer->string bytevector->pointer))

(define (elf-debuglink elf)
  "Return two values: the '.gnu_debuglink' file name of ELF and its CRC.
Return #f for both if ELF lacks a '.gnu_debuglink' section."
  (let ((section (elf-section-by-name elf ".gnu_debuglink")))
    (if section
        (let ((size       (elf-section-size section))
              (bv         (section-contents elf section))
              (endianness (elf-byte-order elf)))
          (values (null-terminated-bytevector->string bv)
                  (bytevector-u32-ref bv (- size 4) endianness)))
        (values #f #f))))

(define (elf-debuglink-crc-offset elf)
  "Return the offset of the '.gnu_debuglink' 32-bit CRC, or #f if ELF lacks a
'.gnu_debuglink' section."
  (let ((section (elf-section-by-name elf ".gnu_debuglink")))
    (and section
         (+ (elf-section-offset section)
            (elf-section-size section)
            -4))))

(define (set-debuglink-crc file debug-file)
  "Compute the CRC of DEBUG-FILE and set it as the '.gnu_debuglink' CRC in
FILE."
  (let* ((elf    (parse-elf (call-with-input-file file get-bytevector-all)))
         (offset (elf-debuglink-crc-offset elf)))
    (and offset
         (let* ((crc (call-with-input-file debug-file debuglink-crc32))
                (bv  (make-bytevector 4)))
           (bytevector-u32-set! bv 0 crc (elf-byte-order elf))
           (let ((port (open file O_RDWR)))
             (set-port-position! port offset)
             (put-bytevector port bv)
             (close-port port))))))


;;;
;;; Updating debuglink CRC.
;;;

(define (find-elf-files outputs)
  "Return the list of ELF files found in OUTPUTS, a list of top-level store
directories."
  (define directories
    (append-map (lambda (output)
                  (list (string-append output "/bin")
                        (string-append output "/sbin")
                        (string-append output "/lib")
                        (string-append output "/libexec")))
                outputs))

  (append-map (lambda (directory)
                (filter elf-file?
                        (with-error-to-port (%make-void-port "w")
                          (lambda ()
                            (find-files directory)))))
              directories))

(define* (graft-debug-links old-outputs new-outputs mapping
                            #:key (log-port (current-error-port)))
  "Update the '.gnu_debuglink' CRCs found in ELF files of NEW-OUTPUTS,
provided NEW-OUTPUTS contains a \"debug\" output, such that those CRCs match
those of the corresponding '.debug' files found in the \"debug\" output.

This procedure is meant to be used as a \"grafting hook\" by (guix build
graft)."
  (match (assoc-ref new-outputs "debug")
    (#f #t)                                       ;nothing to do
    (debug-directory
     (let ((files (find-elf-files (filter-map (match-lambda
                                                (("debug" . _)
                                                 #f)
                                                ((name . directory)
                                                 directory))
                                              new-outputs))))
       (for-each (lambda (file)
                   (let ((debug (string-append debug-directory
                                               "/lib/debug" file ".debug")))
                     (when (file-exists? debug)
                       (format log-port
                               "updating '.gnu_debuglink' CRC in '~a'~%"
                               file)
                       (make-file-writable file)
                       (set-debuglink-crc file debug))))
                 files)))))
