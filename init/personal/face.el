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
