;; Elpy CUSTOMIZATION
;; ----------------------

(elpy-enable)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; enable isort import sorting
(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

;; enable autopep8 formatting on save
;; ignoring:
;; - E501 - Try to make lines fit within --max-line-length characters.
;; - W293 - Remove trailing whitespace on blank line.
;; - W391 - Remove trailing blank lines.
;; - W690 - Fix various deprecated code (via lib2to3).
;(require 'py-autopep8)
;(setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'python-init)
