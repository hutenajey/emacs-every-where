
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (require 'init-compat)
(require 'init-utils)

;; Needed for Emacs version < 24. must come before elpa, as it may provide package.el
;; (require 'init-site-lisp)

;; Security configuration.
;; This is commented out by default, but for security considerations
;; I strongly recommend you to uncomment it.
;; You may need `gnutls' library and the `certifi' python package to enable this.
;; see the comment in `init-security.el'
;; (require 'init-security)

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-elpa)
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

;; (require-package 'wgrep)
;; (require-package 'project-local-variables)
;; (require-package 'diminish)
;; (require-package 'scratch)
;; (require-package 'mwe-log-commands)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;; (require 'init-osx-keys)
;; (require 'init-gui-frames)
;; (require 'init-proxies)
(require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-uniquify)
;; (require 'init-ibuffer)
;; (require 'init-flycheck)



(require 'init-recentf)
(require 'init-ido)
(require 'init-yasnippet)
(require 'init-hippie-expand)

(require 'init-auto-complete)
;(require 'init-ycmd)
;; (require 'init-windows)
;; (require 'init-sessions)
(require 'init-fonts)
;; (require 'init-mmm)
(require 'init-tabbar)
(require 'init-session)
(require 'init-desktop)



(require 'init-evil)
(require 'init-matlab)

;; (require 'init-vc)
;; (require 'init-darcs)
(require 'init-git)

;; (require 'init-crontab)
;; (require 'init-textile)
(require 'init-markdown)
(require 'init-auctex)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
(require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
(require 'init-slime)
(require 'init-gtags)
(require 'init-cedet)
(require 'init-ecb)
(require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
;; (require 'init-sql)

;; (require 'init-paredit)
;; (require 'init-clojure)
;; (when (>= emacs-major-version 24)
;;   (require 'init-clojure-cider))
;; (require 'init-common-lisp)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))

;; (require 'init-marmalade)
;; (require 'init-misc)

;; (require 'init-dash)
;; (require 'init-ledger)
;; ;; Extra packages which don't require any configuration

;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (require-package 'dsvn)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (require-package 'regex-tool)
(require 'init-cscope)
(require 'init-themes)
(require 'init-helm)
(require 'init-helm-gtags)
(require 'init-unicad)
(require 'init-editing-utils)
(require 'init-fold)
(require 'init-htmlize)
(require 'init-py3)
;; ;;----------------------------------------------------------------------------
;; ;; Allow access from emacsclient
;; ;;----------------------------------------------------------------------------
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)


;; ;;----------------------------------------------------------------------------
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; ;;----------------------------------------------------------------------------
;; (require 'init-locales)

;; (add-hook 'after-init-hook
;;            (lambda ()
;;              (message "init completed in %.2fms"
;;                       (sanityinc/time-subtract-millis after-init-time before-init-time))))


(provide 'init)

;;;###autoload
(defun find-file-match (file-name match-str &optional replace-match replace-str)
  (let ((new-file-name file-name))
    (when (string-match match-str new-file-name)
      (if replace-match
          (setq new-file-name (replace-regexp-in-string replace-match replace-str new-file-name)))
      (find-file-existing new-file-name))))

(defun switch-source-file ()
  (interactive)
  (setq file-name (buffer-file-name))
  (find-file-match file-name "/include/[^/]+\.h$" "\\(.*\\)/include/\\([^/]+\\)\.h$" "\\1/src/\\2.cpp")
  (find-file-match file-name "/h/[^/]+\.h$" "\\(.*\\)/h/\\([^/]+\\)\.h$" "\\1/src/\\2.cpp")
  (find-file-match file-name "/src/[^/]+\.cpp$" "\\(.*\\)/src/\\([^/]+\\)\.cpp$" "\\1/include/\\2.h")
  (find-file-match file-name "\.h$" "\\(.*\\)\.h$" "\\1.cpp")
  (find-file-match file-name "\.cpp$" "\\(.*\\)\.cpp$" "\\1.h"))


(global-set-key (kbd "<f9>") 'switch-source-file)

(global-set-key (kbd "<f12>") 'tabbar-backward-tab)

;; Turn off sound alarms completely
(setq ring-bell-function 'ignore)

;; disable welcome page
(setq inhibit-startup-message t)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(add-to-list 'package-archives'
             ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives'
             ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
             ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
