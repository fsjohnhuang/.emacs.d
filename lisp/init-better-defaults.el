;;; -*- lexical-binding: t -*-

;; ---- 个人信息 ----
(setq user-full-name "John Huang")
(setq user-email-address "fsjohnhuang@hotmail.com")
;; ---- END 个人信息 ----

;; ---- 窗口界面 ----
(tool-bar-mode nil)
(menu-bar-mode nil)
(scroll-bar-mode nil)
(set-scroll-bar-mode nil)
;; ---- END 窗口界面 ----

;; ---- 编辑 ----
;; 行号、列号
(column-number-mode t)
(line-number-mode t)
(global-linum-mode t)
(setq linum-format "%d ")

(mouse-avoidance-mode 'animate) ;; 光标靠近鼠标时，鼠标隐藏
(global-font-lock-mode t) ;; 语法高亮
(global-hl-line-mode t) ;; 当前行高亮

;; 括号/双引号/尖括号自动匹配/补全
(show-paren-mode t)
(setq show-paren-style 'expression) ;; 高亮括号/双引号/尖括号匹配的整个表达式，不仅是括号/双引号/尖括号本身
(electric-pair-mode t) ;; 括号/双引号/尖括号自动补全
(electric-layout-mode t) ;; 当识别行分隔符时，光标自动换到下一行
(which-func-mode t) ;; 光标移动到函数时，在mode-line中显示函数名称

;; 设置tab键
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list ())

(delete-selection-mode t) ;; 对于选中区的文本，采用先删除后录入的方式

;; 文件自动保存和备份
(setq auto-save-file nil)
(setq make-backup-files nil)

(global-auto-revert-mode t) ;; 文件发生变化则自动更新缓冲区

(setq scroll-margin 3 scroll-conservatively 10000) ;; 光标靠近上下边3行开始滚动屏幕
(fset 'yes-or-no-p 'y-or-n-p) ;; 缩写二次确认提示信息
;; ---- END 编辑 ----

;; ---- 增强 ----
;; 格式化整个缓冲区
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
;; ---- END 增强 ----


(provide 'init-better-defaults)
