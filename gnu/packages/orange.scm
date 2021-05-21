;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2021 Vinicius Monego <monego@posteo.net>
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

(define-module (gnu packages orange)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages graph)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt))

(define-public python-orange-canvas-core
  (package
    (name "python-orange-canvas-core")
    (version "0.1.19")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "orange-canvas-core" version))
       (sha256
        (base32 "03wav2msfm32y8zwq69v1v6qyh1ld76xla2z60avf49yhbwjgwal"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'check-setup
           (lambda _
             ;; This test fails with: RuntimeError: Event loop is closed.
             (substitute* "orangecanvas/application/tests/test_mainwindow.py"
               (("test_help_requests") "_test_help_requests"))
             (setenv "HOME" "/tmp")
             (setenv "QT_QPA_PLATFORM" "offscreen")
             #t)))))
    (propagated-inputs
     `(("python-anyqt" ,python-anyqt)
       ("python-cachecontrol" ,python-cachecontrol)
       ("python-commonmark" ,python-commonmark)
       ("python-dictdiffer" ,python-dictdiffer)
       ("python-docutils" ,python-docutils)
       ("python-pyqt" ,python-pyqt)
       ("python-qasync" ,python-qasync)
       ("python-requests" ,python-requests)))
    (home-page "https://github.com/biolab/orange-canvas-core")
    (synopsis "Core component of Orange Canvas")
    (description
     "Orange Canvas Core is a framework for building graphical user interfaces
for editing workflows.  It is a component used to build the Orange Canvas
data-mining application.")
    (license license:gpl3)))

(define-public python-orange-widget-base
  (package
    (name "python-orange-widget-base")
    (version "4.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "orange-widget-base" version))
       (sha256
        (base32 "13sy3s8rdqs3i3ghixljpqvnfz81qmbb0kqlasw39zvf39qc22kz"))))
    (build-system python-build-system)
    (arguments
     `(;; unittest fails to load one test, all other tests are passing:
       ;; AttributeError: module 'orangewidget' has no attribute 'version'.
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'check 'check-setup
           (lambda _
             (setenv "HOME" "/tmp")
             (setenv "QT_QPA_PLATFORM" "offscreen")
             #t)))))
    (propagated-inputs
     `(("python-anyqt" ,python-anyqt)
       ("python-matplotlib" ,python-matplotlib)
       ("python-orange-canvas-core"
        ,python-orange-canvas-core)
       ("python-pyqtgraph" ,python-pyqtgraph)))
    (home-page "https://github.com/biolab/orange-widget-base")
    (synopsis "Base Widget for Orange Canvas")
    (description
     "Orange Widget Base provides a base widget component for a interactive
GUI based workflow.  It is primarily used in the Orange framework.")
    (license license:gpl3+)))

(define-public orange
  (package
    (name "orange")
    (version "3.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Orange3" version))
       (sha256
        (base32 "1ac4xjjkx06z10hl7k0zh1z3qhkl5vng15l9jkpkmck9spinbzil"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'preparations
           (lambda _
             ;; Delete test that opens an outgoing connection.
             (delete-file "Orange/tests/test_url_reader.py")
             ;; This is a binary data file and it breaks runpath validation.
             (delete-file "Orange/tests/datasets/binary-blob.tab")
             ;; Skip the test which uses that binary file.
             (substitute* "Orange/tests/test_txt_reader.py"
               (("test_read_nonutf8_encoding") "_test_read_nonutf8_encoding"))
             ;; We use a correct version of PyQtWebEngine, but the build scripts
             ;; consider it incorrect anyways. Remove the constraint entirely to
             ;; work around this bug.
             (substitute* "requirements-gui.txt" (("PyQtWebEngine>=5.12") ""))
             #t))
         (add-before 'check 'set-HOME
           ;; Tests need a writable home.
           (lambda _ (setenv "HOME" "/tmp") #t))
         (add-after 'install 'wrap-executable
           ;; Ensure that icons are found at runtime.
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (wrap-program (string-append out "/bin/orange-canvas")
                 `("QT_PLUGIN_PATH" prefix
                   ,(list (string-append (assoc-ref inputs "qtsvg")
                                         "/lib/qt5/plugins/")))))
             #t)))))
    (native-inputs
     `(("python-cython" ,python-cython)))
    (inputs
     `(("python-anyqt" ,python-anyqt)
       ("python-baycomp" ,python-baycomp)
       ("python-bottleneck" ,python-bottleneck)
       ("python-chardet" ,python-chardet)
       ("python-httpx" ,python-httpx)
       ("python-joblib" ,python-joblib)
       ("python-keyring" ,python-keyring)
       ("python-keyrings.alt" ,python-keyrings.alt)
       ("python-louvain" ,python-louvain)
       ("python-matplotlib" ,python-matplotlib)
       ("python-networkx" ,python-networkx)
       ("python-numpy" ,python-numpy)
       ("python-openpyxl" ,python-openpyxl)
       ("python-opentsne" ,python-opentsne)
       ("python-orange-canvas-core"
        ,python-orange-canvas-core)
       ("python-orange-widget-base"
        ,python-orange-widget-base)
       ("python-pandas" ,python-pandas)
       ("python-pyqt" ,python-pyqt)
       ("python-pyqtgraph" ,python-pyqtgraph)
       ("python-pyqtwebengine" ,python-pyqtwebengine)
       ("python-pyyaml" ,python-pyyaml)
       ("python-requests" ,python-requests)
       ("python-scikit-learn" ,python-scikit-learn)
       ("python-scipy" ,python-scipy)
       ("python-serverfiles" ,python-serverfiles)
       ("python-xlrd" ,python-xlrd)
       ("python-xlsxwriter" ,python-xlsxwriter)
       ("qtbase" ,qtbase-5)
       ("qtsvg" ,qtsvg)
       ("xdg-utils" ,xdg-utils)))
    (home-page "https://orangedatamining.com/")
    (synopsis "Component-based data mining framework")
    (description
     "Orange is a component-based, graphical framework for machine learning,
data analysis, data mining and data visualization.")
    (license license:gpl3+)))

(define-public python-serverfiles
  (package
    (name "python-serverfiles")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "serverfiles" version))
       (sha256
        (base32 "1qgbzgnaxj4wsp2rdas53qxsh0j7xpibq25w6lviwyaqwwrgq42y"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-requests" ,python-requests)))
    (home-page "https://github.com/biolab/serverfiles")
    (synopsis "Utility to access files on a HTTP server and store them locally")
    (description
     "This package provides an utility that accesses files on a HTTP server
and stores them locally for reuse.  It is primarily used by the Orange
framework.")
    (license license:gpl3+)))
