;; This file is a tentative of build recipe for the Guix package manager.
;; <https://guix.gnu.org/>
;;
;; If you have Guix installed, it can be run with
;; guix shell -f capytaine.scm python -- python3 -c 'import capytaine; print(capytaine.__version__)'
;; to create a virtual environment with Python and Capytaine installed.

(define-module (gnu packages verbify-tts)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
   #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages check)
  )
(define %source-dir (dirname (current-filename)))
(package
  (name "verbify-tts")
  (version "0.0.2")
    (source (local-file %source-dir #:recursive? #t))
;;
  ;;(source ;;(local-file "/home/josh/Verbify-TTS" "Verbify-TTS")
  ;;(origin
  ;;     (method git-fetch)
  ;;     (uri (git-reference
  ;;           (url "https://github.com/OwOday/Verbify-TTS")
  ;;           (commit "0d1e75a")))
  ;;     (file-name (git-file-name name version))
  ;;     
  ;;     (sha256
  ;;      (base32 "0gcv6l771xz5rksl14bv6h48ba0002rrcsmvbc5d3xxr5vlzw3aa"))
  ;;     )
  ;;     )
  (build-system pyproject-build-system)
  (arguments '(#:tests? #f))
  (native-inputs (list python-toolchain))
  
  (propagated-inputs (list 
  python-numpy 
  python-scipy 
  python-pandas 
  python-xarray))

  (home-page "https://github.com/capytaine/capytaine")
  (synopsis "Python BEM solver for linear potential flow, based on Nemoh")
  (description "Python BEM solver for linear potential flow, based on Nemoh")
  (license license:gpl3))

;;(package
;;  (name "Verbify-TTS")
;;  (version "0.0.2")
;;  (source (git-reference
;;            (url "https://github.com/MattePalte/Verbify-TTS.git")
;;            (commit "0d1e75a")))
;;  (build-system pyproject-build-system)
;;  (propagated-inputs
;;   (list python-pyyaml))
;;  (synopsis "Hello, Guix world: An example custom Guix package")
;;  (description
;;   "GNU Hello prints the message \"Hello, world!\" and then exits.  It
;;serves as an example of standard GNU coding practices.  As such, it supports
;;command-line arguments, multiple languages, and so on.")
;;  (home-page "https://www.gnu.org/software/hello/")
;;  (license gpl3+))
