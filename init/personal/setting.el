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

