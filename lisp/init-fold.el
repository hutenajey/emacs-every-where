(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)

(define-key global-map (kbd "C-c f h")  'hs-hide-all)
(define-key global-map (kbd "C-c f s")  'hs-show-all)
(define-key global-map (kbd "C-c f l")  'hs-hide-level)
(define-key global-map (kbd "C-c f t")  'hs-toggle-hiding)


(provide 'init-fold)
