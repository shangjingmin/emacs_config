(setq-default indent-tabs-mode nil) ;;; 不用tab键缩进
(setq default-tab-width 8)
(setq tab-stop-list ())
(setq default-major-mode 'text-mode) ;;; 缺省的 major mode 设置为 text-mode
(setq make-backup-files nil)
(setq query-replace-highlight t)
(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(setq require-final-newline t)
(setq major-mode 'text-mode)
(show-paren-mode t) ;;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(setq show-paren-style 'parentheses)
(setq-default cursor-type 'bar) ;;; 将光标设置为短线，而非box
(global-font-lock-mode t) ;;; 进行语法加亮
(setq-default truncate-partial-width-windows nil) ;;分割窗口亦换行
(transient-mark-mode t)  ;;; 高亮选中
(setq hippie-expand-try-functions-list ;;; 自动补全
      '(try-expand-dabbrev ; 当前buffer
        try-expand-dabbrev-visible ; 别的可见窗口
        try-expand-dabbrev-all-buffers ; 所有打开的buffer
        try-expand-dabbrev-from-kill ; kill-ring
        try-complete-file-name-partially ; 文件名列表
        try-complete-file-name
        try-expand-all-abbrevs ; 简称列表
        try-expand-list ; list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

