;; MARKDOWN CUSTOMIZATION
;; ------------------------
;; https://jblevins.org/projects/markdown-mode/

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README.md\\'" . gfm-mode))

(provide 'markdown-init)

