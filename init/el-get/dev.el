(setq el-get-sources
      (append el-get-sources '((:name yasnippet
                                      :url "https://github.com/capitaomorte/yasnippet"
                                      :type git)
                               (:name textmate)
                               (:name cedet
                                      :compile "cedet-devel-load.el"
				      :load-path ("." "./lisp/common" "./lisp/speedbar")
                                      :after (lambda ()
                                               (load-file (concat (el-get-package-directory "cedet") "cedet-devel-load.el"))
                                               (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
                                               (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
                                               (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
                                               (semantic-mode 1)
                                               (global-ede-mode 1)
                                               ))
                               (:name ecb
                                      :description "Emacs Code Browser"
                                      :type git
                                      :url "https://github.com/alexott/ecb/"
                                      :branch "new-cedet"
                                      ; 进入后编译以对应正确的cedet版本 :build `(,(concat  "make CEDET=" " EMACS=" el-get-emacs)) ; (lambda () (ecb-activate)(ecb-byte-compile))
                                      :after (lambda ()
                                               (setq ecb-auto-activate t)
                                               (setq ecb-tip-of-the-day nil)))
                               )))
