; (setq el-get-sources
;       (append el-get-sources '((:name cedet
; 				      :type bzr
; 				      :url "bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk"
;                                       :compile "cedet-devel-load.el"
; 				      ; :load-path ("." "./lisp/common" "./lisp/speedbar")
; 
; 				      :build
; 				      ;; `((,el-get-emacs "-batch" "-Q" "-l" "cedet-build.el" "-f" "cedet-build"))
; 				      `(("sh" "-c" "touch `find . -name Makefile`")
; 					("make" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs)) "clean-all")
; 					("make" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs))))
; 				      :build/berkeley-unix
; 				      `(("sh" "-c" "touch `find . -name Makefile`")
; 					("gmake" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs)) "clean-all")
; 					("gmake" ,(format "EMACS=%s" (shell-quote-argument el-get-emacs))))
; 				      :build/windows-nt ("echo #!/bin/sh > tmp.sh & echo touch `/usr/bin/find . -name Makefile` >> tmp.sh & echo make FIND=/usr/bin/find >> tmp.sh"
; 							 "sed 's/^M$//' tmp.sh > tmp2.sh"
; 							 "sh ./tmp2.sh" "rm ./tmp.sh ./tmp2.sh")
; 				      :features nil
; 				      ;; This package isn't really non-lazy, but we want to call the
; 				      ;; post-init immediately, because it handles the lazy autoload
; 				      ;; setup.
; 				      :lazy nil
; 				      :post-init
; 				      (unless (featurep 'cedet-devel-load)
; 					(load (expand-file-name "cedet-devel-load.el" pdir)))
; 				      
;                                       :after (lambda ()
; 					       (defvar cedet-path (concat my-el-get-path "cedet/") "Path of `cedet'")  
; 					       (my-add-subdirs-to-load-path cedet-path)
;                                                (load-file (concat (el-get-package-directory "cedet") "cedet-devel-load.el"))
;                                                (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;                                                (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;                                                (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
;                                                (semantic-mode 1)
;                                                (global-ede-mode 1)
;                                                ))
; 			       (:name ecb
;                                       :description "Emacs Code Browser"
;                                       :type git
;                                       :url "https://github.com/alexott/ecb/"
;                                       :branch "new-cedet"
;                                       :build `(,(concat  "make CEDET=" " EMACS=" el-get-emacs)) ; (lambda () (ecb-activate)(ecb-byte-compile)) ; 进入后编译以对应正确的cedet版本 
;                                       :after (lambda ()
;                                                ;(setq ecb-auto-activate t)
;                                                (setq ecb-tip-of-the-day nil)
;                                                (setq ecb-windows-width 0.22)))
;                                )))
