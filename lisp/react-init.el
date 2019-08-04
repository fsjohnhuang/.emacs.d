;;; react-init --- Summary
;;; REACT CONFIGURATION
;;; github: https://github.com/rudolfolah/emacs-flow-jsx
;;; It is a *major* mode that is a replacement for js2-mode and js-mode.
;;; Commentary:


;;; Code:
;; create the derived mode react-mode from web-mode.
(define-derived-mode react-mode
  web-mode
  "react-mode"
  "Major mode for editing jsx code.")
(add-hook 'react-mode-hook
          '(lambda ()
             (web-mode-set-content-type "jsx")
             (message "set web-mode-content-type %s" web-mode-content-type)))

;; use react-mode for .jsx files.
(add-to-list 'auto-mode-alist '("\\.jsx$" . react-mode))

;; use eslint with react-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'react-mode)

;; adjust indents for react-mode to 2 spaces
(defun my-react-mode-hook ()
  "Hooks for react mode. Adjust indents"
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4))
(add-hook 'react-mode-hook  'my-react-mode-hook)

;; auto complete
;;(set-variable 'ycmd-server-command '("/home/john/.pyenv/versions/3.5.5/bin/python" (expand-file-name "~/ycmd/ycmd")))
;;(company-ycmd-setup)


(provide 'react-init)
;;; react-init.el ends here
