(load-file "~/.emacs.d/elpa/htmlize/htmlize.el")
(require 'htmlize)

;;(setq org-src-fontify-natively t)
(defun my-org-inline-css-hook (exporter)
  "Insert custom inline css"
  (when (eq exporter 'html)
    (let* ((dir (ignore-errors (file-name-directory (buffer-file-name))))
           (path (concat dir "style.css"))
           (homestyle (or (null dir) (null (file-exists-p path))))
           (final (if homestyle "~/.emacs.d/org-style.css" path))) ;; <- set your own style file path
      (setq org-html-head-include-default-style nil)
      (setq org-html-head (concat
                           "<style type=\"text/css\">\n"
                           "<!--/*--><![CDATA[/*><!--*/\n"
                           (with-temp-buffer
                             (insert-file-contents final)
                             (buffer-string))
                           "/*]]>*/-->\n"
                           "</style>\n")))))

;;(add-hook 'org-export-before-processing-hook 'my-org-inline-css-hook)


(defconst org-html-head-include-default-style
  "<style type=\"text/css\">
  pre {
  }
  pre.src:before {
    background-color: black;
  }
  </style>")

(defconst org-html-head
  "<style type=\"text/css\">
  pre {
  background-color: #262626;
  FONT: 12pt Consola;
  line-height:130%;
  Letter-spacing:1px;
  color:white;
  }
  </style>")


(provide 'init-htmlize)


