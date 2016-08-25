(setq load-path (cons "~/.emacs.d/elpa/gtags" load-path));
(autoload 'gtags-mode "gtags" "" t) 

(require 'gtags)

(add-hook 'c-mode-common-hook 'gtags-mode)
(add-hook 'c++-mode-common-hook 'gtags-mode)
(add-hook 'java-mode-common-hook 'gtags-mode)
(add-hook 'gtags-select-mode-hook
          '(lambda ()
             (setq hl-line-face 'underline)
             (hl-line-mode 1)))

(defvar gtags-src-dir nil)
(defvar gtags-saved-tagfile-dir nil)
(defvar gtags-language-suffix nil)

(setq gtags-suggested-key-mapping t)

(defun gtags-update ()
  "Make GTAGS incremental update"
  (if
      (null gtags-src-dir)
      (message "no tags updated for gtags")
    (with-temp-buffer
      (shell-command
       (concat "cd " gtags-src-dir ";" "global " "-u")
       (buffer-name))
      )
    )
  )

                                        ;gtags生成函数
(defun generate-gtags ()
  "Generate gtag tables."
  (interactive)
  (let
      (
       (language-suffix "")
       (src-dir "")
       (saved-tag-dir "")
       )

    (setq src-dir
          (read-from-minibuffer "source directory for gtags:")

          language-suffix
          (read-from-minibuffer "suffix:")

          saved-tag-dir
          (read-from-minibuffer "gtags saved path:")
          )
                                        ;设置全局变量保存起来
    (setf gtags-src-dir src-dir)
    (setf gtags-language-suffix language-suffix)
    (setf gtags-saved-tagfile-dir saved-tag-dir)


    (with-temp-buffer
      (shell-command
       (concat "mkdir -p" " " gtags-saved-tagfile-dir " " "2>/dev/null;" "cd " gtags-src-dir ";" "find" " " gtags-src-dir " -name \"" gtags-language-suffix "\" | gtags" " " gtags-saved-tagfile-dir)
       (buffer-name)))))

                                        ;加载gtags
(defalias 'load-gtags 'gtags-visit-rootdir)


                                        ;光return键在vim模式下不起作用，所以绑定的键是alt+回车
(define-key gtags-select-mode-map [(meta return)] 'gtags-select-tag)
(define-key gtags-select-mode-map [mouse-1] 'gtags-select-tag)

                                        ;查找变量引用：gtags-find-symbol
                                        ;查找函数引用：gtags-find-rtag
(global-set-key (kbd "C-c g f") 'gtags-find-symbol)
(global-set-key (kbd "C-c g t") 'gtags-find-rtag)
(global-set-key (kbd "C-c g u") 'gtags-update)
(global-set-key (kbd "C-c g g") 'generate-gtags)
(provide 'init-gtags)
