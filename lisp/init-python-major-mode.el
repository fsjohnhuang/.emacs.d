;;; -*- lexical-binding: t -*-

;; Elpy
(elpy-enable)

;; Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; py-autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; REPL
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(provide 'init-python-major-mode)
