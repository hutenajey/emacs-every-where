;; should be loaded after yasnippet
(require-package 'fuzzy)
(require-package 'popup)
(require-package 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories
             (expand-file-name "lisp/custom-dicts" user-emacs-directory))

;; if TAB is pressed, first indent current line, then try to complete
(setq tab-always-indent 'complete)

;; prevent auto-complete from automatically expanding
(setq-default ac-expand-on-auto-complete nil)
(setq-default ac-auto-start nil)
;; use TAB to explicitily trigger the auto-complete func
(ac-set-trigger-key "TAB")
;; (setq-default ac-dwim nil)


;; use pos-tip instead of popup
(require-package 'pos-tip)
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)
;; use quick-help to show the documents
;; (setq ac-use-quick-help t)
;; (setq ac-quick-help-delay 1.0)

;; use fuzzy matching. needs manually triggering.
(setq ac-fuzzy-enable t)

(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
(after-load 'init-yasnippet
  (set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer
               ac-source-functions
               ac-source-yasnippet)))


(global-set-key "\M-/" 'auto-complete)  ;; 补全的快捷键，用于需要提前补全
;; Show menu 0.8 second later
(setq ac-auto-show-menu 0.8)
;; 选择菜单项的快捷键
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;; menu设置为12 lines
(setq ac-menu-height 12)

;; add custom sources
;;(require 'init-ac-source)
(provide 'init-auto-complete)
