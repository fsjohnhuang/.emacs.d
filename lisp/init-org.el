;;;-*- lexical-binding: t-*-

;; 时间戳采用英文
(setq system-time-locale "C")


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


(provide 'init-org)
