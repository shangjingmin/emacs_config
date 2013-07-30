(setq org-startup-indented t) ; 自动缩进
(setq org-export-with-sub-superscripts '{}) ; 防止下划线后内容变为下标

(setq org-todo-keywords '(
                          (sequence "TODO(t)" "DONE(d)")
                          (sequence "TODO(t!)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")
                          ))
(setq org-tag-alist '((:startgroup nil)
                      ("@job" . ?j) ("@life" . ?l) ("@work" . ?w) ("@person" . ?p)
                      (:endgroup nil)
                      ("@immediately" . ?i)
                      ("@wait" . ?a)
                      ))
(setq org-log-done 'time)
(setq org-log-done 'note)

(setq org-publish-project-alist
     '(("tj_cp"
        :base-directory "~/sjm_home/uo/tianji/cp/"
        :publishing-directory "/media/windata/tianji/doc/cp/doc"
        :section-numbers "num:t"
        ; :table-of-contents nil
        :makeindex t
        )))
