;;; css-init --- Summary
;;; CSS CONFIGURATION
;;; https://stylelint.io/
;;; Commentary:

;;; Code:
(add-to-list 'auto-mode-alist
             '("\\.css$" . css-mode))
(add-hook 'css-mode-hook
          (lambda ()
            ;; basic settings
            (setq css-indent-offset 2)
            ;; syntax check settings
            ;; set .stylelintrc under project root is as configuration file.
            (setq flycheck-stylelintrc "./.stylelintrc")
            ))


(provide 'css-init)
;;; css-init.el ends here
