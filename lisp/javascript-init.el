;;; javascript-init --- Summary
;;; JAVASCRIPT CONFIGURATION
;;; Commentary:


;;; Code:
(add-to-list 'auto-mode-alist
             '("\\.js$" . js2-mode))
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook
          (lambda ()
            ;; basic settings
            (setq-default js2-basic-offset 4)
            ;; disable js2-mode inner syntax checker while using flycheck
            (setq-default js2-mode-show-parse-errors nil)
            (setq-default js2-mode-show-strict-warnings nil)
            ;; prettier-js settings
            (setq prettier-js-args
                  '("--trailing-comma" "all"
                    "--bracket-spacing" "false"))))


(provide 'javascript-init)
;;; javascript-init.el ends here
