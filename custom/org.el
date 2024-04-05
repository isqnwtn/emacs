;; org mode stuff
(use-package org)

(setq org-startup-indented t)

(setq org-todo-keywords
  '(
(sequence "TODO" "DOING" "|" "DELEGATED" "POSTPONED" "DONE" "CANCELED")
(sequence "SENT" "APPROVED" "|" "PAID")
))

(setq org-modern-todo-faces
  '(("TODO" . (:foreground "#10ffa3" :weight bold))
("STARTED" . "#E35DBF")
("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
("DELEGATED" . "pink")
("POSTPONED" . "#008080")))

(use-package org-modern
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))

(use-package org-autolist
  :hook (org-mode . org-autolist-mode))

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "◀── now ─────────────────────────────────────────────────")

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/code/notes/org-roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n w" . persp-switch)
	 :map org-mode-map
	 ("C-c n v" . org-open-at-point)
	 ("C-c n w" . persp-switch))
  :config
  (org-roam-setup)[[id:FFC49FC7-6F84-422D-BDF9-010D88C84110][MainNode]])
