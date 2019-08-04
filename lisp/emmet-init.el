;;; emmet-init --- Summary
;;; EMMET MODE CONFIGURATION
;;; https://github.com/smihica/emmet-mode
;;; Commentary:


;;; Code:
;; enable emmet minor mode when major is one of web, css, scss, sgml, react.
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'scss-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'react-mode-hook 'emmet-mode)


(provide 'emmet-init)
;;; emmet-init.el ends here
