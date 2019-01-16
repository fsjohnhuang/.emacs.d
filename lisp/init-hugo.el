;; ox-hugo
(require 'ox-hugo-auto-export)
(with-eval-after-load 'ox
  (require 'ox-hugo))

;; easy-hugo
(setq easy-hugo-basedir "~/blog/")
(setq easy-hugo-postdir "content/blog")
(setq easy-hugo-url "https://fsjohnuang.github.io")
;;(setq easy-hugo-sshdomain "blogdomain")
;;(setq easy-hugo-root "/home/blog/")
(setq easy-hugo-previewtime "300")
;;(define-key global-map (kbd "C-c C-e") 'easy-hugo)

(provide 'init-hugo)
