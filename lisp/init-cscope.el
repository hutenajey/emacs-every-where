(add-to-list 'load-path "~/.emacs.d/elpa/xcscope")
(require 'xcscope)
(setq cscope-do-not-update-database t)

(define-prefix-command 'xcscope-mode-prefix)
(global-set-key (kbd "C-c s") 'xcscope-mode-prefix)
(define-key global-map (kbd "C-c s i")  'cscope-set-initial-directory)
(define-key global-map (kbd "C-c s I")  'cscope-unset-initial-directory)
(define-key global-map (kbd "C-c s s")  'cscope-find-this-symbol)
(define-key global-map (kbd "C-c s d")  'cscope-find-global-definition)
(define-key global-map (kbd "C-c s G")  'cscope-find-global-definition-no-prompting)
(define-key global-map (kbd "C-c s u")  'cscope-pop-mark)
(define-key global-map (kbd "C-c s n")  'cscope-next-symbol)
(define-key global-map (kbd "C-c s N") 'cscope-next-file)
(define-key global-map (kbd "C-c s p") 'cscope-prev-symbol)
(define-key global-map (kbd "C-c s P") 'cscope-prev-file)
(define-key global-map (kbd "C-c s b") 'cscope-display-buffer)
(define-key global-map (kbd "C-c s B") 'cscope-display-buffer-toggle)
(define-key global-map (kbd "C-c s c") 'cscope-find-functions-calling-this-function)
(define-key global-map (kbd "C-c s C") 'cscope-find-called-functions)
(define-key global-map (kbd "C-c s t") 'cscope-find-this-text-string)
(define-key global-map (kbd "C-c s e") 'cscope-find-egrep-pattern)
(define-key global-map (kbd "C-c s F") 'cscope-find-files-including-file)
(define-key global-map (kbd "C-c s f") 'cscope-find-this-file)



(provide 'init-cscope)
