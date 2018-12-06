;;; -*- lexical-binding: t -*-
(require 'package) ;; 加载包管理器
(package-initialize)

;; 设置插件资源库
(setq package-archives
      '(("gnu" . "http://elpa.emacs-china.org/gnu/")
        ("melpa" . "http://elpa.emacs-china.org/melpa/")))


;; 启动时自动刷新和安装插件
(require 'cl) ;; 加载 CommonLisp 函数和宏

(defvar my/packages
  '(;; Theme
    material-theme
    ;; Mini Buffer
    smex
    ;; Snippets
    yasnippet-snippets
    ;; Web
    web-mode
    ;; Python Major Mode
    elpy
    flycheck
    py-autopep8)
  "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 加载插件的配置
(require 'init-web-mode)
(require 'init-python-major-mode)
(require 'init-window-numbering)
(require 'init-smex)
(require 'init-yasnippet)


(provide 'init-package)
