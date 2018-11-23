;;; -*- lexical-binding: t -*-

;; Elpy
(when (require 'elpy nil t)
  ;; 启用elpy
  (elpy-enable)
  (add-hook 'python-mode-hook 'elpy-mode)
  
  ;; py-autopep8
  (require 'py-autopep8)
  ;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )

;; Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; REPL
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(provide 'init-python-major-mode)
