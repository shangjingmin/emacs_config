(setq org-startup-indented t) ; 自动缩进
(setq org-export-with-sub-superscripts '{}) ; 防止下划线后内容变为下标

(setq org-publish-project-alist
     '(("tj_cp"
        :base-directory "~/sjm_home/uo/tianji/cp/"
        :publishing-directory "/media/windata/tianji/doc/cp/doc"
        :section-numbers "num:t"
        ; :table-of-contents nil
        :makeindex t
        )))
