;;; init --- Summary
;;; INSTALL PACKAGES
;;; Commentary:


;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.emacs-china.org/gnu/")
        ("melpa" . "http://elpa.emacs-china.org/melpa/")
        ("org" . "http://orgmode.org/elpa/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme
    ;; Python
    elpy
    py-isort
    py-autopep8
    ;; Web
    js2-mode
    json-mode
    yaml-mode
    web-mode
    scss-mode
    sgml-mode
    ;; Auto completion
    company
    ycmd
    company-ycmd
    ;; for HTML
    company-web
    ;; Text
    markdown-mode
    emmet-mode
    ;; Mini buffer
    smex
    ;; syntax checker
    flycheck
    flycheck-color-mode-line
    flycheck-pos-tip
    ;; snippets
    yasnippet-snippets
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
;; setting for encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

(display-time) ;; display time in mode-line


;; DEVELOPING CUSTOMIZATION
;; -------------------------

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; strip trailing whitespace before save
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'subword-mode) ;; regonize camlCase as two words, caml and Case.
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; use flycheck as syntax checker for all mode. offical: https://www.flycheck.org/en/latest/index.html
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-color-mode-line)
;; make the mode line colorful by status of flycheck.
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
;; effect GUI Emacs only
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; yet anther snippet
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs
             "~/.emacs.d/snipptes") ;; personal snippets place here. Run M-x yas-new-snippet to create a new snippet template.
(yas-global-mode 1)

;; company
(set-variable 'ycmd-server-command '("/home/john/.pyenv/versions/3.5.5/bin/python" (expand-file-name "~/ycmd/ycmd")))
(setq company-tooltip-limit 10)
(setq company-idle-delay 0.5)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))
(setq company-require-match nil)
(company-ycmd-setup)
(add-hook 'after-init-hook 'global-company-mode)


(require 'python-init)
(require 'markdown-init)
(require 'yaml-init)
(require 'smex-init)
(require 'org-init)
(require 'web-init)
(require 'react-init)
(require 'html-init)
(require 'css-init)
(require 'scss-init)
(require 'emmet-init)
;;; init.el ends here
