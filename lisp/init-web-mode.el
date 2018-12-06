;;;-*- lexical-bindig: t-*-
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


(provide 'init-web-mode)
