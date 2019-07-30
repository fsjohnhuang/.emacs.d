;; REACT CUSTOMIZATION
;; github: https://github.com/rudolfolah/emacs-flow-jsx
;; It is a *major* mode that is a replacement for js2-mode and js-mode.
;; ---------------------

(load-file "~/.emacs.d/lisp-packages/emacs-flow-jsx/emacs-flow-jsx-mode.el")
(add-to-list 'auto-mode-alist '("\\.js\\'" . flow-jsx-mode))
(add-hook 'flow-jsx-mode-hook 'flycheck-mode)
(add-hook 'flow-jsx-mode-hook 'flyspell-mode)

(provide 'react-init)
