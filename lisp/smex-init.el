;; SMEX CUSTOMIZATION
;; ----------------------

(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-x") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defadvice smex (around space-inserts-hyphen activate compile)
  (let ((ido-cannot-complete-command
	 `(lambda ()
	    (interactive)
	    (if (string= " " (this-command-keys))
		(insert ?-)
	      (funcall ,ido-cannot-complete-command)))))
    ad-do-it))

(defun smex-update-after-load (unused)
  (when (boundp 'smex-cache)
    (smex-update)))
(add-hook 'after-load-functions 'smex-update-after-load)

(defadvice ido-set-matches-1 (around ido-smex-acronym-matches activate)
  "Filters ITEMS by setting acronynms first."
  (if (and (fboundp 'smex-already-running) (smex-already-running) (> (length ido-text) 1))

      ;; We use a hash table for the matches, <type> => <list of items>, where
      ;; <type> can be one of (e.g. `ido-text' is "ff"):
      ;; - strict: strict acronym match (i.e. "^f[^-]*-f[^-]*$");
      ;; - relaxed: for relaxed match (i.e. "^f[^-]*-f[^-]*");
      ;; - start: the text start with (i.e. "^ff.*");
      ;; - contains: the text contains (i.e. ".*ff.*");
      (let ((regex (concat "^" (mapconcat 'char-to-string ido-text "[^-]*-")))
	    (matches (make-hash-table :test 'eq)))

	;; Filtering
	(dolist (item items)
	  (let ((key))
	    (cond
	     ;; strict match
	     ((string-match (concat regex "[^-]*$") item)
	      (setq key 'strict))

	     ;; relaxed match
	     ((string-match regex item)
	      (setq key 'relaxed))

	     ;; text that start with ido-text
	     ((string-match (concat "^" ido-text) item)
	      (setq key 'start))

	     ;; text that contains ido-text
	     ((string-match ido-text item)
	      (setq key 'contains)))

	    (when key
	      ;; We have a winner! Update its list.
	      (let ((list (gethash key matches ())))
		(puthash key (push item list) matches)))))

	;; Finally, we can order and return the results
	(setq ad-return-value (append (gethash 'strict matches)
				      (gethash 'relaxed matches)
				      (gethash 'start matches)
				      (gethash 'contains matches))))

    ;; ...else, run the original ido-set-matches-1
    ad-do-it))

(provide 'smex-init)

