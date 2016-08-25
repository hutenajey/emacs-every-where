(setq load-path (cons "~/.emacs.d/elpa/ecb" load-path));

(require 'ecb)
(require 'ecb-autoloads)

(global-set-key (kbd "<f7>") 'ecb-minor-mode)   ; 打开ejb
;;;ejb 快捷键
(global-set-key (kbd "C-<left>") 'windmove-left)   ;左边窗口
(global-set-key (kbd "C-<right>") 'windmove-right)  ;右边窗口
(global-set-key (kbd "C-<up>") 'windmove-up)     ; 上边窗口
(global-set-key (kbd "C-<down>") 'windmove-down)   ; 下边窗口


(provide 'init-ecb)
