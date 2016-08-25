;slime setup
(require-package 'slime)
(setq inferior-lisp-program "~/package/bin/lisp")
;;(setq inferior-lisp-program "~/package/bin/sbcl")
(require 'slime)
(slime-setup)

(provide 'init-slime) 

