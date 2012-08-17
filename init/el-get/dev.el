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
                               )))
