(setq ruby-insert-encoding-magic-comment nil) ; 不在文件头插入文件编码行
;(setq whitespace-global-modes nil) ; 不自动删除多余空格

(setq el-get-sources
      (append el-get-sources '((:name ruby-mode
                                      :load "ruby-mode.el")
                               (:name rvm)
			       (:name rinari ; include inf-ruby ruby-compilation
                                      :build ("rake doc:make_info") ;;; install_info format error, maybe need ginstall
                                      :after (lambda ()
                                               (require 'rinari)
                                               ))
                               )))
