
(defun load-file-or-dir (file-dir)
  "load this file or files in the directory"
  (if (file-exists-p file-dir)
      (if (file-directory-p file-dir)
      (mapc 'load-file-or-dir
        (directory-files file-dir t "^[a-zA-z0-9].*"))
    (safe-load file-dir))))

(defun safe-load (file)
  "only load *.el file"
  (if (and (file-regular-p file)
       (file-readable-p file)
       (equal (file-name-extension file)
          "el"))
      (load file)))
