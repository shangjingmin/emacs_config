(setq el-get-sources
 (append el-get-sources '((:name sdcv-mode
                                 :description "emacs dictionary, need stardict and shell command sdcv, source: http://www.cnblogs.com/bamanzi/archive/2011/06/26/emacs-stardict.html"
                                 :type git
                                 :url "https://github.com/gucong/emacs-sdcv"
                                 :branch "master"
                                 :load-path(".")
                                 :after(progn
                                         (require 'sdcv-mode)
                                         (global-set-key (kbd "C-c d") 'sdcv-search)
                                         ))
                          (:name showtip
                                 :description "show tooltip near the cursor"
                                 :type git
                                 :url "https://github.com/emacsmirror/showtip"
                                 :branch "master"
                                 :load-path("."))
                          (:name weibo.emacs
                                 :description "emacs weibo"
                                 :type git
                                 :url "https://github.com/austin-----/weibo.emacs"
                                 :branch "master"
                                 :load-path(".")
                                 :after(progn
                                         (require 'weibo)
                                         ))
                          (:name git-emacs
                                 :after (progn
                                          (defun gitk-files ()
                                            (interactive)
                                            (start-process "gitk" nil gitk-program buffer-file-name))
                                          ))
                          (:name calfw
                                 :description "org-model sync with google calendar"
                                 :after(progn
                                         (require 'calfw)
                                         (require 'calfw-org)
                                         ))
                          (:name emacs-w3m
                                 :after(progn
                                         (setq browse-url-browser-function 'w3m-browse-url)
                                         (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
                                         ;; optional keyboard short-cut
                                         (global-set-key "\C-xm" 'browse-url-at-point)
                                         ))
                          )))
