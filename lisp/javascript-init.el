;;; javascript-init --- Summary
;;; JAVASCRIPT CONFIGURATION
;;; Commentary:


;;; Code:
(add-to-list 'auto-mode-alist
             '("\\.js$" . js-mode))
;;(flycheck-add-mode 'javascript-eslint 'js2-mode)
;;(add-hook 'jss-mode-hook
;;          (lambda ()
            ;; basic settings
            ;;(setq-default js2-basic-offset 4)
            ;; disable js2-mode inner syntax checker while using flycheck
            ;;(setq-default js2-mode-show-parse-errors nil)
            ;;(setq-default js2-mode-show-strict-warnings nil)
            ;; prettier-js settings
;;            (setq prettier-js-args
;;                  '("--trailing-comma" "all"
;;                    "--bracket-spacing" "false"))
;;            (tide-setup)
;;            (unless (tide-current-server)
;;              (tide-restart-server))))

;;(add-hook 'js2-mode-hook 'prettier-js-mode)

(add-hook 'js-mode-hook
          (lambda ()
            ;; basic settings
            ;;(setq-default js2-basic-offset 4)
            ;; disable js2-mode inner syntax checker while using flycheck
            ;;(setq-default js2-mode-show-parse-errors nil)
            ;;(setq-default js2-mode-show-strict-warnings nil)
            ;; prettier-js settings
            (setq prettier-js-args
                  '("--trailing-comma" "all"
                    "--bracket-spacing" "false"))
            (tide-setup)
            (unless (tide-current-server)
              (tide-restart-server))))
(add-hook 'js-mode-hook 'prettier-js-mode)

(provide 'javascript-init)
;;; javascript-init.el ends here
