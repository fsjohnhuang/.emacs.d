;; YAML CUSTOMIZATION
;; ------------------------

(add-hook 'yaml-mode-hook #'smartparens-mode)
(add-hook 'yaml-mode-hook #'highlight-indentation-mode)   

(provide 'yaml-init)
