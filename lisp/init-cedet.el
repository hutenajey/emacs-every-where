(require 'cedet)
 
;; Enable EDE (Project Management) features
(global-ede-mode 1)

(custom-set-variables
 '(semantic-default-submodes (quote (global-semantic-decoration-mode global-semantic-idle-completions-mode
                                     global-semantic-idle-scheduler-mode global-semanticdb-minor-mode
                                     global-semantic-idle-summary-mode global-semantic-mru-bookmark-mode)))
 '(semantic-idle-scheduler-idle-time 3))

(semantic-mode)

;; smart complitions
;;
(require 'semantic/ia)
(setq-mode-local c-mode semanticdb-find-default-throttle
                  '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                  '(project unloaded system recursive))

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))

(add-hook 'semantic-init-hooks 'my-semantic-hook)

;;;; Semantic DataBase存储位置
(setq semanticdb-default-save-directory
      (expand-file-name "~/.emacs.d/semanticdb"))

;; 使用 gnu global 的TAGS。
(require 'semantic/db-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;;;;  缩进或者补齐
;;; hippie-try-expand settings
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        semantic-ia-complete-symbol
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs))

(defun indent-or-complete ()
  "Complete if point is at end of a word, otherwise indent line."
  (interactive)
  (if (looking-at "//>")
      (hippie-expand nil)
    (indent-for-tab-command)))

(defun yyc/indent-key-setup ()
  "Set tab as key for indent-or-complete"
  (local-set-key  [(tab)] 'indent-or-complete))

;;;; C-mode-hooks .
(defun yyc/c-mode-keys ()
  "description"
  ;; Semantic functions.
  (semantic-default-c-setup)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)

;; Indent or complete
  (local-set-key  [(tab)] 'indent-or-complete))

(add-hook 'c-mode-common-hook 'yyc/c-mode-keys)


(defadvice push-mark (around semantic-mru-bookmark activate)
    "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
If `semantic-mru-bookmark-mode' is active, also push a tag onto
the mru bookmark stack."
    (semantic-mrub-push semantic-mru-bookmark-ring
                        (point)
                        'mark)
      ad-do-it)

(global-set-key (kbd "C-c .") 'global-edebug-prefix)

;; 折叠和展开
(require 'semantic-tag-folding nil 'noerror)
;;(setq global-semantic-tag-folding-mode 1)
;;(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
;;(define-key semantic-tag-folding-mode-map (kbd "C-c , =") 'semantic-tag-folding-show-block)
;; 整个buffer所有函数折叠与展开
;;(define-key semantic-tag-folding-mode-map (kbd "C-c . -") 'semantic-tag-folding-fold-all)
;;(define-key semantic-tag-folding-mode-map (kbd "C-c . =") 'semantic-tag-folding-show-all)  

(provide 'init-cedet)
