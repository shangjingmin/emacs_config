
(setq-default indent-tabs-mode nil) ;;; 不用tab键缩进
(setq default-tab-width 2)
(setq tab-stop-list ())
(setq default-major-mode 'text-mode) ;;; 缺省的 major mode 设置为 text-mode
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

(global-whitespace-mode) ;;; 启用whitespace模式
(setq whitespace-line-column 720) ;;; 每行字符数限制
(setq whitespace-style
      '(face trailing tabs lines lines-tail empty
             space-after-tab space-before-tab))
(setq fill-column 720)
(setq next-line-add-newlines nil) ;;; 文件尾不自动添加行
;(add-hook 'before-save-hook 'delete-trailing-whitespace) ;;; 保存时清除行尾空格

(setq inhibit-startup-message t) ;;; 关闭开机时的启动画面
(setq initial-scratch-message nil)
(set-scroll-bar-mode 'right) ;;; 滚动条设在右侧
(setq column-number-mode t) ;;; 显示列号
;;; 防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;;; 设置标题栏显示文件的完整路径名
(setq frame-title-format
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))))
(hl-line-mode nil) ;;; 高亮显示当前行
(tool-bar-mode -1) ;;; 关闭工具栏
(mouse-avoidance-mode 'animate) ;;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线

;;; 最大化
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

;;; theme
(load-theme 'tango)
(set-default-font "Bitstream Vera Sans Mono-10")
;;; 设置中文字体
(set-fontset-font "fontset-default"
                  'gb18030 '("WenQuanYi Bitmap Song" . "unicode-bmp"))


;; Setting English Font
;(set-face-attribute
;  'default nil :font "Consolas 12")

(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defvar font-list '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
(require 'cl) ;; find-if is in common list package
(find-if #'qiang-font-existsp font-list)

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size) 
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))
 
    ;; Set the default English font
    ;; 
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
 
    ;; Set Chinese font 
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))

(qiang-set-font
 '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=12"
 '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体")
 15
 )

; cann't work (setenv "LC_CTYPE" "zh_CN.UTF-8")
;;; add /usr/local/bin/emacs
;;   ! /bin/bash
;;   # Make ibus work in emacs
;;   export LC_CTYPE=zh_CN.UTF-8;
;;   /usr/bin/emacs $*

(setq visible-bell t) ;;; 关闭出错时的提示声
(auto-image-file-mode) ;;; 让 Emacs 可以直接打开和显示图片

;;; 让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;; 时间相关
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t) ;时间栏旁边启用邮件设置
(setq display-time-interval 10) ;时间的变化频率，单位多少来着
(display-time)

(desktop-save-mode 1) ;;; 保存桌面环境

(setq ansi-color-for-comint-mode t) ;;; shell 中乱码
(recentf-mode t) ;;; File menu recent-file item
(setq x-select-enable-clipboard t) ;;; 允许emacs和外部其他程序的粘贴
(blink-cursor-mode t) ;;; 光标闪烁
(set-cursor-color "red")
(set-fringe-style -1) ;;; 边缘
(put 'upcase-region 'disabled nil) ;;; 选中文字大写

(setq make-backup-files nil) ;;; ~
(setq auto-save-default nil) ;;; ##
(setq query-replace-highlight t)
(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(setq require-final-newline t)
(setq major-mode 'text-mode)

;;; 括号自动匹配
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)

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

(setq my-org-files-path "~/nethd/note")
;(setq my-org-publish-path "~/nethd/prj/shangjingmin.github.io")
(setq my-org-publish-path "~/nethd/prj/blog")
(setq org-directory my-org-files-path)
(setq org-agenda-files (list (concat my-org-files-path "/prj/tianji/cp13.org")
                             (concat my-org-files-path "/comp/emacs.org")
                       ))

(setq org-publish-project-alist
     '(("blog-note"
         :base-directory "~/nethd/note" ;(expand-file-name org-directory)
         :base-extension "org"
         :publishing-directory "~/nethd/blog" ;(expand-file-name my-org-publish-path)
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :section-numbers nil
         :auto-preamble t
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :author "dayigu"
         :email "dayigu at gmail dot com"
         :style    "<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/worg.css\"/>"
       )
       ("blog-static"
         :base-directory "~/nethd/note/assets" ; (expand-file-name org-directory)
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/nethd/blog/assets" (expand-file-name my-org-publish-path)
         :recursive t
         :publishing-function org-publish-attachment
       )
       ("blog" :components ("blog-notes" "blog-static"))
))

;(safe-load "sjm.el")
