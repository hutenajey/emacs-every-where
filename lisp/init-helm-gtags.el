(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-ce"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-prefix-command 'helm-gtags-mode-prefix)
(global-set-key (kbd "C-c e") 'helm-gtags-mode-prefix)

(global-set-key (kbd "C-c e a") 'helm-gtags-tags-in-this-function)
(global-set-key (kbd "C-c e g") 'helm-gtags-select)
(global-set-key (kbd "C-c e d") 'helm-gtags-dwim)
(global-set-key (kbd "C-c e s") 'helm-gtags-pop-stack)
(global-set-key (kbd "C-c e p") 'helm-gtags-previous-history)
(global-set-key (kbd "C-c e n") 'helm-gtags-next-history)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)


(provide 'init-helm-gtags)

