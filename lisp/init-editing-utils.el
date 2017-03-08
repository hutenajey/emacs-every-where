(add-to-list 'load-path (expand-file-name "lisp/editing-utils" user-emacs-directory))
;; enhanced help mechanism
(require-package 'help-fns+)
(require 'help-fns+)

;; dimish minor mode name to save mode line space
(require-package 'diminish)

;; some default value
(setq-default
 blink-cursor-delay 0.5
 blink-cursor-interval 0.4
 buffers-menu-max-size 20
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 scroll-step 1
 scroll-margin 3
 scroll-conservatively 10000
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)
;;(set-scroll-bar-mode nil)
(tool-bar-mode 0)


;; auto-revert
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t)

;; enable auto-pairing
(require 'init-autopair)
(diminish 'autopair-mode)

;; some personal key bindings
(global-set-key (kbd "C-c r") 'replace-string)

;; newline behavior
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;; change yes-or-no to y-or-n
;; (fset 'yes-or-no-p 'y-or-n-p)

;; display time
(display-time-mode t)
(setq display-time-24hr-format t)

;; display line number
;; (require 'linum)
(require-package 'hlinum)
;; (require 'hlinum)
(hlinum-activate)

;; visual line
(global-visual-line-mode t)
;; (diminish 'global-visual-line-mode)
(diminish 'visual-line-mode)

;; expand-region
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; enable uppercase and lowercase transform for region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; whole-line-or-region-mode
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

;; enable cua mode without prefix key
(cua-selection-mode t)

;; use page-break-line to handle the ^L page-breaking symbol
(require-package 'page-break-lines)
(global-page-break-lines-mode)
(diminish 'page-break-lines-mode)

;; enable subword-mode
;; (global-subword-mode t)

;; multiple-cursors-mode
(require-package 'multiple-cursors)
;; multiple-cursors
(global-set-key (kbd "C-c c p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c c g") 'mc/mark-all-like-this)
;; From active region to multiple cursors:
(global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c c c") 'mc/edit-lines)
(global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)

;; switch-window
(require 'init-switch-window)
;; Set "C-x p" to select the previous window
(defun other-window-backward (&optional n)
  "Select the Nth previous window"
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))
(global-set-key "\C-xp" 'other-window-backward)


;; undo-tree
(require 'init-undo-tree)
(diminish 'undo-tree-mode)

;; outline-minor-mode
(require 'init-outl-minor)

;; use C-u C-u C-s/r to trigger the flexible search action
(require 'init-flex-isearch)

;; set some compilation shortcuts
(require 'init-compile)

;; spell checking
;; (when (executable-find "hunspell")
;;   (setq-default ispell-program-name "hunspell")
;;   (setq ispell-really-hunspell t)
;;   (require 'init-flyspell))
(when (executable-find "aspell")
  (setq-default ispell-program-name "aspell")
  (setq ispell-really-aspell t)
  (require 'init-flyspell))


(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))
;; turn on transient mark mode
;;(that is, we highlight the selected text)
(transient-mark-mode t)

(setq my-tab-width 4)

(c-add-style "my-c-style"
  '("awk"
    (c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)))


;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  (setq c-default-style "my-c-style")
  (c-set-style "my-c-style"))

(setq auto-mode-alist
      (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.c$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
            (cons '("\\.cpp$" . c++-mode) auto-mode-alist))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c++-mode-hook 'my-c-mode-common-hook)

(defun shift-region(numcols)
  " my trick to expand the region to the beginning and end of the area selected
 much in the handy way I liked in the Dreamweaver editor."
  (if (< (point)(mark))
      (if (not(bolp))    (progn (beginning-of-line)(exchange-point-and-mark) (end-of-line)))
    (progn (end-of-line)(exchange-point-and-mark)(beginning-of-line)))
  (setq region-start (region-beginning))
  (setq region-finish (region-end))
  (save-excursion
    (if (< (point) (mark)) (exchange-point-and-mark))
    (let ((save-mark (mark)))
      (indent-rigidly region-start region-finish numcols))))

(defun indent-block()
  (shift-region my-tab-width)
  (setq deactivate-mark nil))

(defun unindent-block()
  (shift-region (- my-tab-width))
  (setq deactivate-mark nil))

(defun indent-or-complete ()
    "Indent region selected as a block; if no selection present either indent according to mode,
or expand the word preceding point. "
    (interactive)
    (if  mark-active
        (indent-block)
      (if (looking-at "\\>")
          (hippie-expand nil)
        (insert ""  ))))

(defun my-unindent()
    "Unindent line, or block if it's a region selected.
When pressing Shift+tab, erase words backward (one at a time) up to the beginning of line.
Now it correctly stops at the beginning of the line when the pointer is at the first char of an indented line. Before the command would (unconveniently)  kill all the white spaces, as well as the last word of the previous line."
    (interactive)
    (if mark-active
        (unindent-block)
      (progn
        (unless(bolp)
          (if (looking-back "^[ \t]*")
              (progn
                ;;"a" holds how many spaces are there to the beginning of the line
                (let ((a (length(buffer-substring-no-properties (point-at-bol) (point)))))
                  (progn
                    ;; delete backwards progressively in my-tab-width steps, but without going further of the beginning of line.
                    (if (> a my-tab-width)
                        (delete-backward-char my-tab-width)
                      (backward-delete-char a)))))
            ;; delete tab and spaces first, if at least 2 exist, before removing words
            (progn
              (if(looking-back "[ \t]\\{2,\\}")
                  (delete-horizontal-space)
                (backward-kill-word 1))))))))

(add-hook 'find-file-hooks (function (lambda ()
                                       (unless (eq major-mode 'org-mode)
                                         (local-set-key (kbd "<tab>") 'indent-or-complete)))))



;; mac and pc users would like selecting text this way
(defun dave-shift-mouse-select (event)
   "Set the mark and then move point to the position clicked on with
 the mouse. This should be bound to a mouse click event type."
   (interactive "e")
   (mouse-minibuffer-check event)
   (if mark-active (exchange-point-and-mark))
   (set-mark-command nil)
   ;; Use event-end in case called from mouse-drag-region.
   ;; If EVENT is a click, event-end and event-start give same value.
   (posn-set-point (event-end event)))

;; be aware that this overrides the function for picking a font. you can still call the command
;; directly from the minibufer doing: "M-x mouse-set-font"
(define-key global-map [S-down-mouse-1] 'dave-shift-mouse-select)

;; to use in into emacs for  unix I  needed this instead
                                        ; define-key global-map [S-mouse-1] 'dave-shift-mouse-select)

(if (not (eq  major-mode 'org-mode))
    (progn
      (define-key global-map "\t" 'indent-or-complete) ;; with this you have to force tab (C-q-tab) to insert a tab after a word
      (define-key global-map [S-tab] 'my-unindent)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this final line is only necessary to escape the *scratch* fundamental-mode
;; and let this demonstration work
(text-mode)


;; For my language code setting (UTF-8)
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)

;;(auto-insert-mode)  ;;; Adds hook to find-files-hook
;;(setq auto-insert-directory "~/.emacs.d/mytemplate/") ;;; Or use custom, *NOTE* Trailing slash important
;;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
 
;;(setq auto-insert-alist
;;    (append '((org-mode . "template.org"))
;;        auto-insert-alist))




(provide 'init-editing-utils)
