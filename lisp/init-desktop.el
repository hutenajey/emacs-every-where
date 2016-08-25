
(require-package 'desktop)
(load "desktop")

(desktop-load-default)

(setq desktop-restore-frames t)
(setq desktop-restore-in-current-display t)
(setq desktop-restore-forces-onscreen nil)

;;当emacs退出时保存文件打开状态

(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save "~/.emacs.d")))


(desktop-read)

(provide 'init-desktop) 

