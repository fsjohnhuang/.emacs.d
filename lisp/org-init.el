;;;-*- lexical-binding: t-*-
;; ORG CUSTOMIZATION
;; -------------------

(setq org-agenda-files (list "~/todo/"))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)     ;; disable auto truncate
                           (setq system-time-locale "C") ;; english as timestamp
                           (setq org-startup-indented t)
                           (setq org-src-tab-acts-natively t)
                           (setq org-src-fontify-natively t) ;; inline syntax highlight
                           (local-set-key (kbd "C-c '") 'org-edit-src-code)
                           (setq org-confirm-babel-evaluate nil)
                           (setq org-export-babel-evaluate nil)
                           ))

(provide 'org-init)
