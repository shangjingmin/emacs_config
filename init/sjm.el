(defun designed-column-to-list (begin end)
  "designed columns to a list: || ---> ((a s)(a s)...)"
  (let ((ret-list ()))
    (goto-char begin)
    (while (< (point) end)
      (setq str-line (buffer-substring (line-beginning-position) (line-end-position))) ; 读取行
      (setq str-line-list (split-string str-line " *\| *")) ; 分割列值
      ; 构造需要的数据列表
      (if (string= "-" (substring (nth 1 str-line-list) 0 1))
          ()
        (progn
          (add-to-list 'ret-list (list (nth 1 str-line-list) (nth 2 str-line-list)) 'true)))
      (next-line))
    ret-list
    ))

(defun concat-list (list linker)
  "concat list elements with linker charater"
  (if list
      (concat (car list)
              (if (cdr list)
                  (concat linker (concat-list (cdr list) linker))
                nil))
    nil))

(defun designed-column-list-to-string (cols)
  "trans column list to string: ((f1 t1) (f2 t2)) ---> \"f1:t1 f2:t2\""
  (concat-list (mapcar #'(lambda (l) (concat-list l ":"))
                       cols) " "))

(defun ror-sjm-desined-column-to-generate ()
  "designed column to generate || ---> a:s"
  (interactive)
  (save-excursion
    (let ((begin (region-beginning))
          (end (region-end)))
      (setq str-cols (designed-column-list-to-string (designed-column-to-list begin end))) ; list 转为字符串
      (insert str-cols)
      )))

(defun list-loop-replace ()
  "loop replace for list elements"
  (interactive)
  (save-excursion
    (let ((start-line 73)
          ; (rlist '("1151" "1152"))
          (rlist '("101" "1001" "1002" "1003" "1131" "1132" "1151" "1152" "2121" "2125" "1243001" "1243002" "5501003" "5501005" "5501006" "5501008" "5501009" "5501013" "5501016" "5501017" "5501023" "5501024" "5501025" "5501026" "5501028" "5501033" "5501035" "5501999" "5503004" "5101001001" "5401001001" "5503001001" "5503001002" "5503003001" "5503003002" "2171001001002" "2171001001005" "2171001005005" "2171001007002" "5101001002001" "5101001002002" "5101001002003" "5101001002004" "5401001002001" "5401001002002" "5401001002005" "5401001002006" "5401001002007" "5401001002010" "5401001002011"))
          )
      (dolist (element rlist)
        (goto-line start-line)
        (query-replace (concat "'" element "'") (concat "@km" element))
        ;(replace (concat "'" element "'") (concat "@km" element))
        ))))
