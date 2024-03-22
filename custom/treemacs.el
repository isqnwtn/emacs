;; treemacs
(use-package treemacs
  :ensure t
  :bind (:map treemacs-mode-map(
				("P" . 'treemacs-peek-mode)
				))
  )

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)
