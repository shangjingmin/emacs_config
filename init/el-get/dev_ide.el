(setq el-get-sources
      (append el-get-sources '((:name cedet
                                      :type bzr
                                      :url "bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk"
                                      :compile "cedet-devel-load.el"
                                        ; :load-path ("." "./lisp/common" "./lisp/speedbar")
                                      :build
                                      ;; `((,el-get-emacs "-batch" "-Q" "-l" "cedet-build.el" "-f" "cedet-build"))
                                      `(("sh" "-c" "touch `find . -name Makefile`")
                                        ("make" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs)) "clean-all")
                                        ("make" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs))))
                                      :build/berkeley-unix
                                      `(("sh" "-c" "touch `find . -name Makefile`")
                                        ("gmake" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs)) "clean-all")
                                        ("gmake" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs))))
                                      :build/windows-nt ("echo #!/bin/sh > tmp.sh & echo touch `/usr/bin/find . -name Makefile` >> tmp.sh & echo make FIND=/usr/bin/find >> tmp.sh"
                                                         "sed 's/^M$//' tmp.sh > tmp2.sh"
                                                         "sh ./tmp2.sh" "rm ./tmp.sh ./tmp2.sh")
                                      :features nil
                                      ;; This package isn't really non-lazy, but we want to call the
                                      ;; post-init immediately, because it handles the lazy autoload
                                      ;; setup.
                                      :lazy nil
                                      :post-init
                                      (unless (featurep 'cedet-devel-load)
                                        (load (expand-file-name "cedet-devel-load.el" pdir)))
                                      :after (progn
                                               (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
                                               (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
                                               (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
                                               ;(semantic-mode 1)
                                               (global-ede-mode 1)
                                               ))
                               (:name ecb
                                      :description "Emacs Code Browser"
                                      :type git
                                      :url "https://github.com/alexott/ecb/"
                                        ; :branch "new-cedet"
                                      :build `(,(concat  "make CEDET=" " EMACS=" el-get-emacs)) ; (progn (ecb-activate)(ecb-byte-compile)) ; 进入后编译以对应正确的cedet版本 
                                      :after (progn
                                               ;(setq ecb-auto-activate t)
                                               (setq ecb-tip-of-the-day nil)
                                               (setq ecb-windows-width 0.22)
                                               (defconst ecb-cedet-required-version-min '(1 0 1 1)
                                                 "Minimum version of cedet needed by ECB.The meaning is as follows:1. Major-version2. Minor-version3. 0 = alpha, 1 = beta, 2 = pre, 3 = nothing \(e.g. \"1.4\"), 4 = . \(e.g. \"1.4.3\"4. Subversion after the alpha, beta, pre or .")
                                               (defconst ecb-cedet-required-version-max '(2 1 4 9)
                                                 "Maximum version of CEDET currently accepted by ECB. See `ecb-required-cedet-version-min' for an explanation.")))
                               )))
