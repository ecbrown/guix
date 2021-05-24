;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2016, 2019, 2020, 2021 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2017 Nikita <nikita@n0.is>
;;; Copyright © 2017, 2018, 2019 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2018 Vijayalakshmi Vedantham <vijimay12@gmail.com>
;;; Copyright © 2019 Sam <smbaines8@gmail.com>
;;; Copyright © 2020, 2021 Marius Bakke <marius@gnu.org>
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

(define-module (gnu packages django)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages check)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xml))

(define-public python-django
  (package
    (name "python-django")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "Django" version))
              (sha256
               (base32
                "0gffaabnnpzj0sl3jl7mllvi3gc0jvab6xw2bckvyljwsrd1j78a"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-before 'check 'pre-check
           (lambda* (#:key inputs #:allow-other-keys)
             ;; The test-suite tests timezone-dependent functions, thus tzdata
             ;; needs to be available.
             (setenv "TZDIR"
                     (string-append (assoc-ref inputs "tzdata")
                                    "/share/zoneinfo"))

             ;; Disable test for incorrect timezone: it only raises the
             ;; expected error when /usr/share/zoneinfo exists, even though
             ;; the machinery gracefully falls back to TZDIR.  According to
             ;; django/conf/__init__.py, lack of /usr/share/zoneinfo is
             ;; harmless, so just ignore this test.
             (substitute* "tests/settings_tests/tests.py"
               ((".*def test_incorrect_timezone.*" all)
                (string-append "    @unittest.skipIf(True, 'Disabled by Guix')\n"
                               all)))

             ;; Preserve the PYTHONPATH created by Guix when running the tests.
             (substitute* "tests/admin_scripts/tests.py"
               (("python_path = \\[")
                (string-append "python_path = ['"
                               (string-join
                                (string-split (getenv "PYTHONPATH") #\:)
                                "','")
                               "', ")))

             #t))
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (if tests?
                 (with-directory-excursion "tests"
                   (setenv "PYTHONPATH"
                           (string-append "..:" (getenv "PYTHONPATH")))
                   (invoke "python" "runtests.py"
                           ;; By default tests run in parallel, which may cause
                           ;; various race conditions.  Run sequentially for
                           ;; consistent results.
                           "--parallel=1"))
                 (format #t "test suite not run~%"))))
         ;; XXX: The 'wrap' phase adds native inputs as runtime dependencies,
         ;; see <https://bugs.gnu.org/25235>.  The django-admin script typically
         ;; runs in an environment that has Django and its dependencies on
         ;; PYTHONPATH, so just disable the wrapper to reduce the size from
         ;; ~710 MiB to ~203 MiB.
         (delete 'wrap))))
    ;; TODO: Install extras/django_bash_completion.
    (native-inputs
     `(("tzdata" ,tzdata-for-tests)
       ;; Remaining packages are test requirements taken from
       ;; tests/requirements/py3.txt
       ("python-docutils" ,python-docutils)
       ;; optional for tests: ("python-geoip2" ,python-geoip2)
       ;; optional for tests: ("python-memcached" ,python-memcached)
       ("python-numpy" ,python-numpy)
       ("python-pillow" ,python-pillow)
       ("python-pyyaml" ,python-pyyaml)
       ;; optional for tests: ("python-selenium" ,python-selenium)
       ("python-tblib" ,python-tblib)))
    (propagated-inputs
     `(("python-asgiref" ,python-asgiref)
       ("python-pytz" ,python-pytz)
       ("python-sqlparse" ,python-sqlparse)

       ;; Optional dependencies.
       ("python-argon2-cffi" ,python-argon2-cffi)
       ("python-bcrypt" ,python-bcrypt)

       ;; This input is not strictly required, but in practice many Django
       ;; libraries need it for test suites and similar.
       ("python-jinja2" ,python-jinja2)))
    (home-page "https://www.djangoproject.com/")
    (synopsis "High-level Python Web framework")
    (description
     "Django is a high-level Python Web framework that encourages rapid
development and clean, pragmatic design.  It provides many tools for building
any Web site.  Django focuses on automating as much as possible and adhering
to the @dfn{don't repeat yourself} (DRY) principle.")
    (license license:bsd-3)
    (properties `((cpe-name . "django")))))

(define-public python-django-2.2
  (package
    (inherit python-django)
    (version "2.2.22")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "Django" version))
              (sha256
               (base32
                "0q30zjcmnvwp1v1syn739wapahs2dx784n0yjyypq0cr3kdi88nv"))))
    (native-inputs
     `(;; XXX: In 2.2 and 3.0, selenium is required for the test suite.
       ("python-selenium" ,python-selenium)
       ,@(package-native-inputs python-django)))))

(define-public python-django-extensions
  (package
    (name "python-django-extensions")
    (version "3.0.6")
    (source
     (origin
       (method git-fetch)
       ;; Fetch from the git repository, so that the tests can be run.
       (uri (git-reference
             (url "https://github.com/django-extensions/django-extensions")
             (commit version)))
       (file-name (string-append name "-" version))
       (sha256
        (base32
         "0sra6hazqvspxd1pnx5cj7gia1rkaz3hn06ib4wd0frc167f5afy"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f)) ;XXX: requires a Postgres or MySQL database
    (propagated-inputs
     `(("python-six" ,python-six)
       ("python-vobject" ,python-vobject)
       ("python-werkzeug" ,python-werkzeug)
       ("python-dateutil" ,python-dateutil)))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-mock" ,python-mock)
       ("python-factory-boy" ,python-factory-boy)
       ("python-tox" ,python-tox)
       ("python-pytest" ,python-pytest)
       ("python-pytest-cov" ,python-pytest-cov)
       ("python-pytest-django" ,python-pytest-django)
       ("python-shortuuid" , python-shortuuid)))
    (home-page
     "https://github.com/django-extensions/django-extensions")
    (synopsis "Custom management extensions for Django")
    (description
     "Django-extensions extends Django providing, for example, management
commands, additional database fields and admin extensions.")
    (license license:expat)))

(define-public python-django-simple-math-captcha
  (package
    (name "python-django-simple-math-captcha")
    (version "1.0.9")
    (home-page "https://github.com/alsoicode/django-simple-math-captcha")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0fhy9k8haqa1296v0qpg1b5w7y3pyw9qi9z9laj5ijry1gk35qaw"))))
    (build-system python-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (add-after 'unpack 'patch-six-imports
                    (lambda _
                      ;; Django no longer bundles six, adjust the imports
                      ;; accordingly.  The six dependency can likely be
                      ;; removed in the next version.
                      (substitute* (find-files "." "\\.py$")
                        (("from django\\.utils import six")
                         "import six"))
                      #t))
                  (replace 'check
                    (lambda _
                      (invoke "python" "runtests.py"))))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-mock" ,python-mock)))
    (propagated-inputs
     `(("python-six" ,python-six)))
    (synopsis "Easy-to-use math field/widget captcha for Django forms")
    (description
     "A multi-value-field that presents a human answerable question,
with no settings.py configuration necessary, but instead can be configured
with arguments to the field constructor.")
    (license license:asl2.0)))

(define-public python-django-classy-tags
  (package
    (name "python-django-classy-tags")
    (version "2.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "django-classy-tags" version))
        (sha256
         (base32
          "1javam3zqi3y3j0r490mm61v48yh75jaha99gb7lsxkaz6yri7fm"))))
    (build-system python-build-system)
    ;; FIXME: How to make the test templates available to Django?
    (arguments '(#:tests? #f))
    (home-page "https://github.com/divio/django-classy-tags")
    (synopsis "Class based template tags for Django")
    (description
     "@code{django-classy-tags} is an approach at making writing template tags
in Django easier, shorter and more fun.  It provides an extensible argument
parser which reduces most of the boiler plate code you usually have to write
when coding custom template tags.")
    (license license:bsd-3)))

(define-public python-django-taggit
  (package
    (name "python-django-taggit")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "django-taggit" version))
       (sha256
        (base32
         "0bbkabbs77z229ps0800gxfhf75yagp4x4j5jzfysbac3zvkp0sa"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke "python3" "-m" "django" "test" "--settings=tests.settings"))))))
    (propagated-inputs
     `(("python-isort" ,python-isort)))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-pytest" ,python-pytest)
       ("python-mock" ,python-mock)))
    (home-page
     "https://github.com/jazzband/django-taggit")
    (synopsis
     "Reusable Django application for simple tagging")
    (description
     "Django-taggit is a reusable Django application for simple tagging.")
    (license license:bsd-3)))

(define-public python-easy-thumbnails
  (package
    (name "python-easy-thumbnails")
    (version "2.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "easy-thumbnails" version))
       (sha256
        (base32
         "14gzp5cv24z0qhxb7f7k7v9jgzpaj4n8yhjq83ynpx8183fs1rz4"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-pillow" ,python-pillow)))
    (home-page "https://github.com/SmileyChris/easy-thumbnails")
    (synopsis "Easy thumbnails for Django")
    (description
     "Easy thumbnails is a Django plugin to dynamically create thumbnails
based on source images.  Multiple thumbnails can be created from a single
source image, using different options to control parameters like the image
size and quality.")
    (license license:bsd-3)))

(define-public python-pytest-django
  (package
    (name "python-pytest-django")
    (version "3.10.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pytest-django" version))
              (sha256
               (base32
                "19nvqsb7b9kz3ikpb50m8ppf7mfhzrapdxsqd5hhd1pdfz8dprjd"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? inputs outputs #:allow-other-keys)
             (if tests?
                 (begin
                   (add-installed-pythonpath inputs outputs)
                   (setenv "PYTHONPATH"
                           (string-append ".:" ;for pytest_django_test
                                          (getenv "PYTHONPATH")))
                   (setenv "PYTEST_DJANGO_TEST_RUNNER" "pytest")
                   (setenv "DJANGO_SETTINGS_MODULE"
                           "pytest_django_test.settings_sqlite_file")
                   (invoke "pytest" "-vv" "-k"
                           ;; FIXME: these tests fail to locate Django templates ...
                           (string-append "not test_django_not_loaded_without_settings"
                                          " and not test_settings"
                                          ;; ... and this does not discover
                                          ;; 'pytest_django_test'.
                                          " and not test_urls_cache_is_cleared")))
                 (format #t "test suite not run~%"))
             #t)))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-setuptools-scm" ,python-setuptools-scm)

       ;; For tests.
       ("python-pytest-xdist" ,python-pytest-xdist)))
    (propagated-inputs
     `(("python-pytest" ,python-pytest-6)))
    (home-page "https://pytest-django.readthedocs.org/")
    (synopsis "Django plugin for py.test")
    (description "Pytest-django is a plugin for py.test that provides a set of
useful tools for testing Django applications and projects.")
    (license license:bsd-3)))

(define-public python-django-haystack
  (package
    (name "python-django-haystack")
    (version "2.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "django-haystack" version))
        (sha256
         (base32
          "1302fqsrx8w474xk5cmnmg3hjqfprlxnjg9qlg86arsr4v4vqm4b"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'loosen-verion-restrictions
           (lambda _
             (substitute* "setup.py"
               (("geopy.*") "geopy',\n"))
             #t))
         (add-before 'check 'set-gdal-lib-path
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "GDAL_LIBRARY_PATH"
                     (string-append (assoc-ref inputs "gdal")
                                    "/lib"))
             #t)))
       #:tests? #f)) ; OSError: libgdal.so.27: cannot open shared object file
    (native-inputs
     `(("gdal" ,gdal)
       ("python-coverage" ,python-coverage)
       ("python-django" ,python-django)
       ("python-dateutil" ,python-dateutil)
       ("python-geopy" ,python-geopy)
       ("python-mock" ,python-mock)
       ("python-nose" ,python-nose)
       ("python-requests" ,python-requests)
       ("python-setuptools-scm" ,python-setuptools-scm)
       ("python-pysolr" ,python-pysolr)
       ("python-whoosh" ,python-whoosh)))
    (home-page "http://haystacksearch.org/")
    (synopsis "Pluggable search for Django")
    (description "Haystack provides modular search for Django.  It features a
unified, familiar API that allows you to plug in different search backends
(such as Solr, Elasticsearch, Whoosh, Xapian, etc.) without having to modify
your code.")
    (license license:bsd-3)))

(define-public python-django-filter
  (package
    (name "python-django-filter")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-filter" version))
              (sha256
               (base32
                "1bz5qzdk9pk4a2lp2yacrdnqmkv24vxnz4k3lykrnpc3b7bkvrhi"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke "python" "runtests.py"))))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-djangorestframework" ,python-djangorestframework)
       ("python-django-crispy-forms" ,python-django-crispy-forms)
       ("python-mock" ,python-mock)))
    (home-page "https://django-filter.readthedocs.io/en/latest/")
    (synopsis "Reusable Django application to filter querysets dynamically")
    (description
     "Django-filter is a generic, reusable application to alleviate writing
some of the more mundane bits of view code.  Specifically, it allows users to
filter down a queryset based on a model’s fields, displaying the form to let
them do this.")
    (license license:bsd-3)))

(define-public python-django-allauth
  (package
    (name "python-django-allauth")
    (version "0.42.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "django-allauth" version))
       (sha256
        (base32
         "0c0x8izvrnjhrr48w6pwsfk9ddbi6yfxg7v3hh5dm1vz1d0hjwpi"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (setenv "DJANGO_SETTINGS_MODULE" "test_settings")
             (invoke "django-admin" "test" "allauth.tests"
                     "--pythonpath=."))))))
    (propagated-inputs
     `(("python-openid" ,python-openid)
       ("python-requests" ,python-requests)
       ("python-requests-oauthlib" ,python-requests-oauthlib)))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-mock" ,python-mock)))
    (home-page "https://github.com/pennersr/django-allauth")
    (synopsis "Set of Django applications addressing authentication")
    (description
     "Integrated set of Django applications addressing authentication,
registration, account management as well as 3rd party (social)
account authentication.")
    (license license:expat)))

(define-public python-django-debug-toolbar
  (package
    (name "python-django-debug-toolbar")
    (version "3.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jazzband/django-debug-toolbar")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1m1j2sx7q0blma0miswj3c8hrfi5q4y5cq2b816v8gagy89xgc57"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-sqlparse" ,python-sqlparse)))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-django-jinja" ,python-django-jinja)
       ("python-html5lib" ,python-html5lib)))
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke "make" "test"))))))
    (home-page
     "https://github.com/jazzband/django-debug-toolbar")
    (synopsis "Toolbar to help with developing Django applications")
    (description
     "A configurable set of panels that display information about the current
request and response as a toolbar on the rendered page.")
    (license license:bsd-3)))

(define-public python-django-debug-toolbar-alchemy
  (package
    (name "python-django-debug-toolbar-alchemy")
    (version "0.1.5")
    (home-page "https://github.com/miki725/django-debug-toolbar-alchemy")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-debug-toolbar-alchemy" version))
              (sha256
               (base32
                "1kmpzghnsc247bc1dl22s4y62k9ijgy1pjms227018h5a4frsa5b"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))          ;XXX: 'make check' does "echo TODO"
    (propagated-inputs
     `(("python-django-debug-toolbar" ,python-django-debug-toolbar)
       ("python-jsonplus" ,python-jsonplus)
       ("python-six" ,python-six)
       ("python-sqlalchemy" ,python-sqlalchemy)))
    (synopsis "Django Debug Toolbar panel for SQLAlchemy")
    (description
     "This package completely mimics the default Django Debug Toolbar SQL
panel (internally it is actually subclassed), but instead of displaying
queries done via the Django ORM, SQLAlchemy generated queries are displayed.")
    (license license:expat)))

(define-public python-django-gravatar2
  (package
    (name "python-django-gravatar2")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "django-gravatar2" version))
       (sha256
        (base32
         "1vn921fb6jjx7rf5dzhy66rkb71nwmh9ydd0xs9ys72icw4jh4y8"))))
    (build-system python-build-system)
    (arguments
     '(;; TODO: The django project for the tests is missing from the release.
       #:tests? #f))
    (inputs
     `(("python-django" ,python-django)))
    (home-page "https://github.com/twaddington/django-gravatar")
    (synopsis "Gravatar support for Django, improved version")
    (description
     "Essential Gravatar support for Django.  Features helper methods,
templatetags and a full test suite.")
    (license license:expat)))

(define-public python-django-assets
  (package
    (name "python-django-assets")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-assets" version))
              (sha256
               (base32
                "0fc6i77faxxv1gjlp06lv3kw64b5bhdiypaygfxh5djddgk83fwa"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-django" ,python-django)
       ("python-nose" ,python-nose)))
    (propagated-inputs
     `(("python-webassets" ,python-webassets)))
    (home-page "https://github.com/miracle2k/django-assets")
    (synopsis "Asset management for Django")
    (description
      "Asset management for Django, to compress and merge CSS and Javascript
files.  Integrates the webassets library with Django, adding support for
merging, minifying and compiling CSS and Javascript files.")
    (license license:bsd-2)))

(define-public python-django-jinja
  (package
    (name "python-django-jinja")
    (version "2.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/niwinz/django-jinja")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "06ldbkfkm6sc0p9sqpjph06gxrqpj78ih3dc2yik2fcba2y5mak1"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-jinja2" ,python-jinja2)
       ("python-pytz" ,python-pytz)
       ("python-django-pipeline" ,python-django-pipeline)))
    (arguments
     '(;; TODO Tests currently fail due to issues with the configuration for
       ;; django-pipeline
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (or
              (not tests?)
              (with-directory-excursion "testing"
                (invoke "python" "runtests.py"))))))))
    (home-page
     "https://niwinz.github.io/django-jinja/latest/")
    (synopsis "Simple jinja2 templating backend for Django")
    (description
     "This package provides a templating backend for Django, using Jinja2.  It
provides certain advantages over the builtin Jinja2 backend in Django, for
example, explicit calls to callables from templates and better performance.")
    (license license:bsd-3)))

;; JSONField is now built-in to Django, obsoleting this package.
(define-public python-django-jsonfield
  (deprecated-package "python-django-jsonfield" python-django))

(define-public python-dj-database-url
  (package
    (name "python-dj-database-url")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "dj-database-url" version))
              (sha256
               (base32
                "0qs16g5y3lflxibsl8gwkwap21crhmmv98l60rdq6x1wawgypsja"))))
    (build-system python-build-system)
    (home-page "https://github.com/kennethreitz/dj-database-url")
    (synopsis "Use Database URLs in your Django Application")
    (description
      "This simple Django utility allows you to utilize the 12factor inspired
DATABASE_URL environment variable to configure your Django application.

The dj_database_url.config method returns a Django database connection
dictionary, populated with all the data specified in your URL.  There is also a
conn_max_age argument to easily enable Django’s connection pool.")
    (license license:bsd-2)))

(define-public python-django-picklefield
  (package
    (name "python-django-picklefield")
    (version "3.0.1")
    (home-page "https://github.com/gintas/django-picklefield")
    ;; Use a git checkout because the PyPI release lacks tests.
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url home-page)
              (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "0ni7bc86k0ra4pc8zv451pzlpkhs1nyil1sq9jdb4m2mib87b5fk"))))
    (build-system python-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (replace 'check
                    (lambda _
                      (invoke "python" "-m" "django" "test" "-v2"
                              "--settings=tests.settings"))))))
    (native-inputs
     ;; XXX: Picklefield has not been updated in 10+ years and fails tests
     ;; with Django 3.2.
     `(("python-django@2.2" ,python-django-2.2)))
    (synopsis "Pickled object field for Django")
    (description "Pickled object field for Django")
    (license license:expat)))

(define-public python-django-bulk-update
  (package
    (name "python-django-bulk-update")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-bulk-update" version))
              (sha256
               (base32
                "0dxkmrm3skyw82i0qa8vklxw1ma1y308kh9w2hcnvhpacn5cxdss"))))
    (build-system python-build-system)
    (arguments
     ;; XXX: Tests require a Postgres database.
     `(#:tests? #f))
    (home-page "https://github.com/aykut/django-bulk-update")
    (synopsis "Simple bulk update over Django ORM or with helper function")
    (description
      "Simple bulk update over Django ORM or with helper function.  This
project aims to bulk update given objects using one query over Django ORM.")
    (license license:expat)))

(define-public python-django-contact-form
  (package
    (name "python-django-contact-form")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-contact-form" version))
              (sha256
               (base32
                "1zv7bcjfrg32gcsq3bclkld79l6mcy2wcvlj81h7q2ppv1wm8vqs"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (setenv "PYTHONPATH"
                     (string-append "./build/lib:"
                                    (getenv "PYTHONPATH")))
             (invoke "coverage" "run" "--source" "contact_form"
                     "runtests.py"))))))
    (native-inputs
     `(("python-coverage" ,python-coverage)
       ("python-django" ,python-django)))
    (home-page "https://github.com/ubernostrum/django-contact-form")
    (synopsis "Contact form for Django")
    (description
      "This application provides simple, extensible contact-form functionality
for Django sites.")
    (license license:bsd-3)))

(define-public python-django-contrib-comments
  (package
    (name "python-django-contrib-comments")
    (version "1.9.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-contrib-comments" version))
              (sha256
               (base32
                "0ccdiv784a5vnpfal36km4dyg12340rwhpr0riyy0k89wfnjn8yi"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-six" ,python-six)))
    (home-page "https://github.com/django/django-contrib-comments")
    (synopsis "Comments framework")
    (description
      "Django used to include a comments framework; since Django 1.6 it's been
separated to a separate project.  This is that project.  This framework can be
used to attach comments to any model, so you can use it for comments on blog
entries, photos, book chapters, or anything else.")
    (license license:bsd-3)))

(define-public python-django-pipeline
  (package
    (name "python-django-pipeline")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "django-pipeline" version))
       (sha256
        (base32
         "19vrbd5s12qw4qlg5n8ldv7zz2rs5y2sdid1i7lvgp92m71dayvc"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-source
           (lambda _
             (substitute* "tests/tests/test_compiler.py"
               (("\\/usr\\/bin\\/env")
                (which "env")))))
         (replace 'check
           (lambda*(#:key tests? #:allow-other-keys)
             (or
              (not tests?)
              (begin
                (setenv "PYTHONPATH"
                        (string-append (getcwd) ":"
                                       (getenv "PYTHONPATH")))
                (setenv "DJANGO_SETTINGS_MODULE" "tests.settings")
                (invoke "django-admin" "test" "tests"))))))))
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-css-html-js-minify" ,python-css-html-js-minify)
       ("python-slimit" ,python-slimit)
       ("python-jsmin" ,python-jsmin)))
    (home-page
     "https://github.com/jazzband/django-pipeline")
    (synopsis "Asset packaging library for Django")
    (description
     "Pipeline is an asset packaging library for Django, providing both CSS
and JavaScript concatenation and compression, built-in JavaScript template
support, and optional data-URI image and font embedding.")
    (license license:expat)))

(define-public python-django-redis
  (package
    (name "python-django-redis")
    (version "4.12.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-redis" version))
              (sha256
               (base32
                "0qvsm8yjchl0d3i7g20wba6px9lb5gv8kp3fcnr6hr0y0b3qjr9h"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke "redis-server" "--daemonize" "yes")
             (with-directory-excursion "tests"
               (invoke "python" "runtests.py")))))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-fakeredis" ,python-fakeredis)
       ("python-hiredis" ,python-hiredis)
       ("python-mock" ,python-mock)
       ("python-msgpack" ,python-msgpack)
       ("redis" ,redis)))
    (propagated-inputs
     `(("python-redis" ,python-redis)))
    (home-page "https://github.com/niwibe/django-redis")
    (synopsis "Full featured redis cache backend for Django")
    (description
      "Full featured redis cache backend for Django.")
    (license license:bsd-3)))

(define-public python-django-rq
  (package
    (name "python-django-rq")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-rq" version))
              (sha256
               (base32
                "0lksnjn3q3f7y72bj2yr8870w28a5b6x0vjnd9nhpq2ah6xfz6pf"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke "redis-server" "--daemonize" "yes")
             (invoke "django-admin.py" "test" "django_rq"
                     "--settings=django_rq.tests.settings"
                     "--pythonpath=."))))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-django-redis" ,python-django-redis)
       ("python-mock" ,python-mock)
       ("python-rq-scheduler" ,python-rq-scheduler)
       ("redis" ,redis)))
    (propagated-inputs
     `(("python-rq" ,python-rq)))
    (home-page "https://github.com/ui/django-rq")
    (synopsis "Django integration with RQ")
    (description
      "Django integration with RQ, a Redis based Python queuing library.
Django-RQ is a simple app that allows you to configure your queues in django's
settings.py and easily use them in your project.")
    (license license:expat)))

(define-public python-django-q
  (package
    (name "python-django-q")
    (version "1.3.4")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "django-q" version))
        (sha256
         (base32 "03z1pf6wlf47i7afr79a8fiiidfk1vq19yaqnv0m4qdny7f58gaj"))))
    (build-system python-build-system)
    ;; FIXME: Tests require disque, Redis, MongoDB, Docker.
    (arguments '(#:tests? #f))
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-arrow" ,python-arrow)
       ("python-blessed" ,python-blessed)
       ("python-django-picklefield" ,python-django-picklefield)))
    (home-page "https://django-q.readthedocs.io/")
    (synopsis "Multiprocessing distributed task queue for Django")
    (description
     "Django Q is a native Django task queue, scheduler and worker application
using Python multiprocessing.")
    (license license:expat)))

(define-public python-django-sortedm2m
  (package
    (name "python-django-sortedm2m")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-sortedm2m" version))
              (sha256
               (base32
                "0z0yymmrr2l5cznqbzwziw624df0qsiflvbpqwrpan52nww3dk4a"))))
    (build-system python-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (replace 'check
                    (lambda _
                      (setenv "PYTHONPATH" (string-append "./test_project:"
                                                          "./build/lib:.:"
                                                          (getenv "PYTHONPATH")))
                      (invoke "django-admin.py" "test" "--settings=settings"))))))
    (native-inputs
     `(("python-django" ,python-django)))
    (home-page "https://github.com/jazzband/django-sortedm2m")
    (synopsis "Drop-in replacement for django's own ManyToManyField")
    (description
      "Sortedm2m is a drop-in replacement for django's own ManyToManyField.
The provided SortedManyToManyField behaves like the original one but remembers
the order of added relations.")
    (license license:bsd-3)))

(define-public python-django-appconf
  (package
    (name "python-django-appconf")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-appconf" version))
              (sha256
               (base32
                "101k8nkc7xlffpjdi2qbrp9pc4v8hzvmkzi12qp7vms39asxwn5y"))))
    (build-system python-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (replace 'check
                    (lambda _
                      (setenv "PYTHONPATH" (string-append ".:"
                                                          (getenv "PYTHONPATH")))
                      (setenv "DJANGO_SETTINGS_MODULE" "tests.test_settings")
                      (invoke "django-admin.py" "test" "-v2"))))))
    (native-inputs
     `(("python-django" ,python-django)))
    (home-page "https://github.com/django-compressor/django-appconf")
    (synopsis "Handle configuration defaults of packaged Django apps")
    (description
      "This app precedes Django's own AppConfig classes that act as \"objects
[to] store metadata for an application\" inside Django's app loading mechanism.
In other words, they solve a related but different use case than
django-appconf and can't easily be used as a replacement.  The similarity in
name is purely coincidental.")
    (license license:bsd-3)))

(define-public python-django-statici18n
  (package
    (name "python-django-statici18n")
    (version "2.1.0")
    (home-page "https://github.com/zyegfryed/django-statici18n")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0x0xvfqd40is2ks43d65awgqkx3wk10lvdim15scvbjhkh301b6v"))))
    (build-system python-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (replace 'check
                    (lambda _
                      (setenv "PYTHONPATH"
                              (string-append "./tests/test_project:./build/lib:"
                                             (getenv "PYTHONPATH")))
                      (setenv "DJANGO_SETTINGS_MODULE" "project.settings")
                      (invoke "pytest" "-vv"))))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-pytest" ,python-pytest)
       ("python-pytest-django" ,python-pytest-django)))
    (propagated-inputs
     `(("django-appconf" ,python-django-appconf)))
    (synopsis "Generate JavaScript catalog to static files")
    (description
      "A Django app that provides helper for generating JavaScript catalog to
static files.")
    (license license:bsd-3)))

(define-public python-django-tagging
  (package
    (name "python-django-tagging")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "django-tagging" version))
       (sha256
        (base32
         "13afxx30chssclxzd9gqnvwm9qyrdpnlbs6iswdfa18phfj8zmi8"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (setenv "DJANGO_SETTINGS_MODULE" "tagging.tests.settings")
             (invoke "django-admin" "test" "--pythonpath=."))))))
    (inputs
     `(("python-django" ,python-django)))
    (home-page "https://github.com/Fantomas42/django-tagging")
    (synopsis "Generic tagging application for Django")
    (description "This package provides a generic tagging application for
Django projects, which allows association of a number of tags with any
@code{Model} instance and makes retrieval of tags simple.")
    (license license:bsd-3)))

(define-public python-djangorestframework
  (package
    (name "python-djangorestframework")
    (version "3.12.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/encode/django-rest-framework")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "16n17dw35wqv47m8k8fixn0yywrvd6v4r573yr4nx6lbbiyi2cqn"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             ;; Add a fix from the master branch for compatibility with Django
             ;; 3.2: https://github.com/encode/django-rest-framework/pull/7911
             ;; Remove for versions > 3.12.4.
             (substitute* "tests/test_fields.py"
               (("class MockTimezone:")
                "class MockTimezone(pytz.BaseTzInfo):"))
             (if tests?
                 (invoke "python" "runtests.py" "--nolint")
                 (format #t "test suite not run~%")))))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-pytest" ,python-pytest)
       ("python-pytest-django" ,python-pytest-django)))
    (home-page "https://www.django-rest-framework.org")
    (synopsis "Toolkit for building Web APIs with Django")
    (description
     "The Django REST framework is for building Web APIs with Django.  It
provides features like a Web-browsable API and authentication policies.")
    (license license:bsd-2)))

(define-public python-django-sekizai
  (package
    (name "python-django-sekizai")
    (version "2.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "django-sekizai" version))
        (sha256
         (base32
          "0vrkli625b5s1wldri3dyrfvqbxg7zxy2pg0rpjixw3b1ndz0ag8"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f)) ; Tests not included with release.
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-django-classy-tags" ,python-django-classy-tags)
       ("python-six" ,python-six)))
    (home-page "https://github.com/divio/django-sekizai")
    (synopsis "Template blocks for Django projects")
    (description "Sekizai means blocks in Japanese, and that is what this app
provides.  A fresh look at blocks.  With @code{django-sekizai} you can define
placeholders where your blocks get rendered and at different places in your
templates append to those blocks.  This is especially useful for css and
javascript.  Your subtemplates can now define css and javscript files to be
included, and the css will be nicely put at the top and the javascript to the
bottom, just like you should.  Also sekizai will ignore any duplicate content in
a single block.")
    (license license:bsd-3)))

(define-public python-django-crispy-forms
  (package
    (name "python-django-crispy-forms")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "django-crispy-forms" version))
       (sha256
        (base32
         "0fxlf233f49hjax786p4r650rd0ilvhnpyvw8hv1d1aqnkxy1wgj"))))
    (build-system python-build-system)
    (arguments
     '(;; No included tests
       #:tests? #f))
    (native-inputs
     `(("python-django" ,python-django)))
    (home-page
     "http://github.com/maraujop/django-crispy-forms")
    (synopsis "Tool to control Django forms without custom templates")
    (description
     "@code{django-crispy-forms} lets you easily build, customize and reuse
forms using your favorite CSS framework, without writing template code.")
    (license license:expat)))

(define-public python-django-compressor
  (package
    (name "python-django-compressor")
    (version "2.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "django_compressor" version))
        (sha256
         (base32 "1q0m0hfg7sqmj5km924g4dgy3nx51aszzsprlp6gsin10mv0fn1k"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (if tests?
               (begin
                 (setenv "DJANGO_SETTINGS_MODULE" "compressor.test_settings")
                 (invoke "django-admin" "test"
                         "--pythonpath=."))
               #t))))
       ;; Tests fail with beautifulsoup 4.9+
       ;; https://github.com/django-compressor/django-compressor/issues/998
       #:tests? #f))
    (propagated-inputs
     `(("python-django-appconf" ,python-django-appconf)
       ("python-rcssmin" ,python-rcssmin)
       ("python-rjsmin" ,python-rjsmin)))
    (native-inputs
     `(("python-beautifulsoup4" ,python-beautifulsoup4)
       ("python-brotli" ,python-brotli)
       ("python-csscompressor" ,python-csscompressor)
       ("python-django-sekizai" ,python-django-sekizai)
       ("python-mock" ,python-mock)))
    (home-page "https://django-compressor.readthedocs.io/en/latest/")
    (synopsis
     "Compress linked and inline JavaScript or CSS into single cached files")
    (description
     "Django Compressor combines and compresses linked and inline Javascript or
CSS in a Django templates into cacheable static files by using the compress
template tag.")
    (license license:expat)))

(define-public python-django-override-storage
  (package
    (name "python-django-override-storage")
    (version "0.3.0")
    (home-page "https://github.com/danifus/django-override-storage")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "081kzfk7mmybhihvc92d3hsdg0r2k20ydq88fs1fgd348sq1ax51"))))
    (build-system python-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (replace 'check
                    (lambda _
                      (invoke "python" "runtests.py"))))))
    (native-inputs
     `(("python-django" ,python-django)
       ("python-mock" ,python-mock)))
    (synopsis "Django test helpers to manage file storage side effects")
    (description
     "This project provides tools to help reduce the side effects of using
FileFields during tests.")
    (license license:expat)))

(define-public python-django-auth-ldap
  (package
    (name "python-django-auth-ldap")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-auth-ldap" version))
              (sha256
               (base32
                "0xk6cxiqz5j3q79bd54x64f26alrlc8p7k9wkp2c768w2k1vzz30"))))
    (build-system python-build-system)
    (arguments
     '(#:phases (modify-phases %standard-phases
                  (replace 'check
                    (lambda* (#:key inputs #:allow-other-keys)
                      (let ((openldap (assoc-ref inputs "openldap")))
                        ;; The tests need 'slapd' which is installed to the
                        ;; libexec directory of OpenLDAP.
                        (setenv "SLAPD" (string-append openldap "/libexec/slapd"))
                        (setenv "SCHEMA"
                                (string-append openldap "/etc/openldap/schema"))
                        (invoke "python" "-m" "django" "test"
                                "--settings" "tests.settings")))))))
    (native-inputs
     `(("openldap" ,openldap)
       ("python-django" ,python-django)
       ("python-mock" ,python-mock)))
    (propagated-inputs
     `(("python-ldap" ,python-ldap)))
    (home-page "https://github.com/django-auth-ldap/django-auth-ldap")
    (synopsis "Django LDAP authentication backend")
    (description
     "This package provides an LDAP authentication backend for Django.")
    (license license:bsd-2)))

(define-public python-django-logging-json
  (package
    (name "python-django-logging-json")
    (version "1.15")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-logging-json" version))
              (sha256
               (base32
                "06041a8icazzp73kg93c7k1ska12wvkq7fpcad0l0sm1qnxx5yx7"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))          ;no tests
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-certifi" ,python-certifi)
       ("python-elasticsearch" ,python-elasticsearch)
       ("python-six" ,python-six)))
    (home-page "https://github.com/cipriantarta/django-logging")
    (synopsis "Log requests/responses in various formats")
    (description
     "This package provides a Django library that logs request, response,
and exception details in a JSON document.  It can also send logs directly
to ElasticSearch.")
    (license license:bsd-2)))

(define-public python-django-netfields
  (package
    (name "python-django-netfields")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "django-netfields" version))
              (sha256
               (base32
                "1c47azr5am0q8g45x0fbn0cay7vyrack6n7k6siliw1j2p0gzi7s"))))
    (build-system python-build-system)
    (arguments '(#:tests? #f))      ;XXX: Requires a running PostgreSQL server
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-netaddr" ,python-netaddr)
       ("python-six" ,python-six)))
    (home-page "https://github.com/jimfunk/django-postgresql-netfields")
    (synopsis "PostgreSQL netfields implementation for Django")
    (description
     "This package provides mappings for the PostgreSQL @code{INET} and
@code{CIDR} fields for use in Django projects.")
    (license license:bsd-3)))

(define-public python-django-url-filter
  (package
    (name "python-django-url-filter")
    (version "0.3.15")
    (home-page "https://github.com/miki725/django-url-filter")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url home-page) (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0r4zhqhs8y6cnplwyvcb0zpijizw1ifnszs38n4w8138657f9026"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f            ;FIXME: Django raises "Apps aren't loaded yet"!?
       #:phases (modify-phases %standard-phases
                  (add-before 'check 'loosen-requirements
                    (lambda _
                      ;; Do not depend on compatibility package for old
                      ;; Python versions.
                      (substitute* "requirements.txt"
                        (("enum-compat") ""))
                      #t))
                  (replace 'check
                    (lambda* (#:key tests? #:allow-other-keys)
                      (if tests?
                          (begin
                            (setenv "PYTHONPATH"
                                    (string-append "./build/lib:.:"
                                                   (getenv "PYTHONPATH")))
                            (setenv "DJANGO_SETTINGS_MODULE"
                                    "test_project.settings")
                            (invoke "pytest" "-vv" "--doctest-modules"
                                    "tests/" "url_filter/"))
                          (format #t "test suite not run~%")))))))
    (native-inputs
     `(("python-django" ,python-django)))
    (propagated-inputs
     `(("python-cached-property" ,python-cached-property)
       ("python-six" ,python-six)))
    (synopsis "Filter data via human-friendly URLs")
    (description
     "The main goal of Django URL Filter is to provide an easy URL interface
for filtering data.  It allows the user to safely filter by model attributes
and also specify the lookup type for each filter (very much like
Django's filtering system in ORM).")
    (license license:expat)))
