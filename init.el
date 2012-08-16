(setq my-init-base-path "~/.emacs.d/")
(load-file (concat my-init-base-path "init/base.el"))

;;; start ;;; package
(require 'package)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/" ) t)
(package-initialize)
;; package config
;;; end ;;; package

;;; start ;;; el-get
(setq my-el-get-path (concat my-init-base-path "el-get/"))
(add-to-list 'load-path (concat my-el-get-path "el-get") )
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))
;; el-get config
(setq el-get-sources '())
(load-file-or-dir (concat my-init-base-path "init/el-get"))

(setq my-el-get-packages
      (append '(el-get)
              (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-el-get-packages)
;;; end ;;; el-get

;;; start ;;; person
;; persion config
(load-file-or-dir (concat my-init-base-path "init/personal"))
;;; end ;;; person
