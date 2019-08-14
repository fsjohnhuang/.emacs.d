;;; javascript-init --- Summary
;;; JAVASCRIPT CONFIGURATION
;;; Commentary:
;;; 1. js-mode can not support the ES2015+ syntax perfectly.
;;; 2. js2-mode works bad with tide.


;;; Code:
;;(add-to-list 'auto-mode-alist
;;             '("\\.js$" . js2-mode))
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

;;(add-to-list 'auto-mode-alist
;;             '("\\.js$" . js-mode))
;;(add-hook 'js-mode-hook
;;          (lambda ()
;;            ;; basic settings
;;            (setq js-basic-offset 2)
;;            (setq js-indent-level 2) ;; indent with 2 white space
;;            ;; prettier-js settings
;;            (setq prettier-js-args
;;                  '(;;"--trailing-comma" "all"
;;                    "--bracket-spacing" "true"))
;;            (tide-setup)
;;            (unless (tide-current-server)
;;              (tide-restart-server))))
;;(add-hook 'js-mode-hook 'prettier-js-mode)

;; create the derived mode javascript-mode from web-mode.
(define-derived-mode javascript-mode
  web-mode
  "javascript-mode"
  "Major mode for editing JavaScript code.")

(add-hook 'javascript-mode-hook
          '(lambda ()
             (web-mode-set-content-type "javascript")
             (message "set web-mode-content-type %s" web-mode-content-type)
             (tide-setup)
             (unless (tide-current-server)
               (tide-restart-server))
             (setq prettier-js-args
                   '(;;"--trailing-comma" "all"
                     "--bracket-spacing" "true"))))

;; use javascript-mode for .jsx files.
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

;; use eslint with javascript-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'javascript-mode)

;; adjust indents for javascript-mode to 4 spaces
(defun my-javascript-mode-hook ()
  "Hooks for JavaScript mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'javascript-mode-hook 'my-javascript-mode-hook)
(add-hook 'javascript-mode-hook 'prettier-js-mode)


(provide 'javascript-init)
;;; javascript-init.el ends here
