;;;-*- lexical-binding: t-*-


;; 定义任务状态
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(p@/!)" "|" "Abort(a@/!)" "DONE(d@/!)")))

;; 子任务状态变化影响父任务的状态
;(defun org-summary (n-done n-not-done)
;  (org-todo (if (= n-not-done 0)
;                "DONE"
;              (if (= n-done 0) "TODO" "IN-PROCESS"))))
;(add-hook 'org-after-todo-statistics-hook 'org-summary)

;; 定义标签
(setq org-tag-alist '(("important" . ?i) ("urgent" . ?u)))

;; 全局任务文件清单
(setq org-agenda-files (list "~/todo/"))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)     ;; 自动换行
                           (setq system-time-locale "C") ;; 时间戳采用英文
                           (setq org-startup-indented t)
                           (setq org-src-tab-acts-natively t)
                           (setq org-src-fontify-natively t) ;; 内联代码语法高亮
                           (local-set-key (kbd "C-c '") 'org-edit-src-code)
                           (setq org-confirm-babel-evaluate nil)
                           (setq org-export-babel-evaluate nil)
                           ))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (js . t)
   (ditaa . t)
   (plantuml . t)
   (dot . t)
   ))

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)


(provide 'init-org)
