(setq el-get-sources
 (append el-get-sources '((:name sdcv-mode
                                 :description "emacs dictionary, need stardict and shell command sdcv"
                                 :type git
                                 :url "https://github.com/gucong/emacs-sdcv"
                                 :branch "master"
                                 :load-path(".")
                                 :after(lambda ()
                                         (require 'sdcv-mode)
                                         ))
                          (:name showtip
                                 :description "show tooltip near the cursor"
                                 :type git
                                 :url "https://github.com/emacsmirror/showtip"
                                 :branch "master"
                                 :load-path("."))
                          (:name sdcv
                                 :description "emacs dictionary, can show tooltips"
                                 :type git
                                 :url "https://github.com/emacsmirror/sdcv"
                                 :branch "master"
                                 :load-path(".")
                                 :after(lambda ()
                                         (require 'sdcv)
                                         (setq sdcv-dictionary-simple-list
                                               '("懒虫简明英汉词典" "懒虫简明汉英词典"))
                                         (setq sdcv-dictionary-complete-list
                                               '("牛津英汉双解美化版" "懒虫简明英汉词典" "懒虫简明汉英词典"))
                                         ))
                          (:name weibo.emacs
                                 :description "emacs weibo"
                                 :type git
                                 :url "https://github.com/austin-----/weibo.emacs"
                                 :branch "master"
                                 :load-path(".")
                                 :after(lambda ()
                                         (require 'weibo)
                                         ))
                          (:name git-emacs
                                 :after (lambda ()
                                          (defun gitk-files ()
                                            (interactive)
                                            (start-process "gitk" nil gitk-program buffer-file-name))
                                          ))
                          )))
