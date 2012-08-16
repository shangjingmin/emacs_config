(setq el-get-sources
      (append el-get-sources '((:name ruby-mode
                                      :load "ruby-mode.el")
                               ; use rinari (:name inf-ruby)
                               ; use rinari (:name ruby-compilation)
                               (:name rvm)
			       (:name rinari))))
