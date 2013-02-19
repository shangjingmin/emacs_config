(setq el-get-sources
      (append el-get-sources '((:name yasnippet
                                      :url "https://github.com/capitaomorte/yasnippet"
                                      :type git)
                               (:name textmate)
                               (:name highlight-parentheses
                                      :after (lambda ()
                                               (add-hook 'find-file-hooks 'highlight-hooks)
                                               (defun highlight-hooks()
                                                 (highlight-parentheses-mode t)
                                                 (setq highlight-symbol-idle-delay 0.5)
                                                 ;(highlight-symbol-mode t)
                                                 )
                                               ))
                               )))
