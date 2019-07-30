;; INSTALL PACKAGES
;; ------------------------
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.emacs-china.org/gnu/")
        ("melpa" . "http://elpa.emacs-china.org/melpa/")
        ;; ("org" . "http://orgmode.org/elpa/")
        )) 

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme
    ;; Python
    elpy
    flycheck
    py-isort
    py-autopep8
    ;; Web
    js2-mode
    json-mode
    yaml-mode
    web-mode
    ;; Text
    markdown-mode
    org
    ;; Mini buffer
    smex
    ;; Highlight
    rainbow-delimiters))


(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)


;; BASIC CUSTOMIZATION
;; ----------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(column-number-mode t) ;; show column number
(mouse-avoidance-mode 'animate) ;; hide the mouse when cursor are close to
(global-font-lock-mode t) ;; syntax highlight
(global-hl-line-mode t) ;; highlight current line
(global-auto-revert-mode t) ;; update buffer when file change
(setq scroll-margin 3 scroll-conservatively 10000) ;; scroll down when cursor are close to the bottom margin 3 lines
(fset 'yes-or-no-p 'y-or-n-p) ;; use abbreviation to yes or no on confirm
(setq auto-save-file nil) ;; do not save automatically
(setq make-backup-files nil) ;; do not make backup files
;; setting for tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list ())

(show-paren-mode t) ;; highlight parenthese i.e. (), <>, ""
(setq show-paren-style 'expression) ;; highlight the whole expression around by parenthese
(electric-pair-mode t) ;; auto complete parenthese
(electric-layout-mode t)
(which-func-mode t) ;; show function name in mode-line on which cursor is
(require 'window-numbering-init)

;; Developing CUSTOMIZATION
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'python-init)
(require 'markdown-init)
(require 'yaml-init)
(require 'smex-init)
(require 'org-init)

