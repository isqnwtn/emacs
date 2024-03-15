;; perspective

;; this was being used for something else
;; removing it so that it can be the leader key for perspective
(global-unset-key (kbd "C-k"))

(use-package perspective
  :ensure t
  :bind (
	 ("C-k k" . perspective-kill-buffer*)
	 ("C-k w" . persp-switch)
	)
  :custom
  (persp-mode-prefix-key (kbd "C-k"))
  :init
  (persp-mode))
