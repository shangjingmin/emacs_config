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
(ecb-activate) ;;; auto open ecb
;;; end ;;; el-get

;;; start ;;; person
;; persion config
(load-file-or-dir (concat my-init-base-path "init/personal"))
;;; end ;;; person
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/home/prj/tianji/tianjicom"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
