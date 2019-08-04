;;; html-init --- Summary
;;; HTML CONFIGURATION
;;; Commentary:


;;; Code:
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(defun html-init/web-html-setup()
  "Setup for web-mode html files."
  (message "web-mode use html related setup")
  ;; basic setting
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-css-colorization t)
  ;; syntax check
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-select-checker 'html-tidy)
  ;; auto complete
  (add-to-list (make-local-variable 'company-backends)
               '(company-web-html company-files company-css company-capf company-keywords)))


(add-hook 'web-mode-hook
          (lambda ()
            (cond ((equal web-mode-content-type "html")
                   (html-init/web-html-setup)))))


(provide 'html-init)
;;; html-init.el ends here
