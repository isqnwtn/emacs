
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ==================== Custom Functions ======================= ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun reload-init ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))


(defun neotree-project ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

(defun modeline-update ()
  (interactive)
  (force-mode-line-update))

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (cl-remove-if-not 'buffer-file-name (buffer-list)))))

(defun persp-switch-buffer-normal ()
  (interactive)
  (persp-counsel-switch-buffer)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ======================= General Definitions ========================= ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package general
  :init
  (general-auto-unbind-keys)
  (general-evil-setup t)
  (general-unbind '(normal motion) "C-w")
  (general-unbind '(normal motion) "C-t")
  :config
  (general-create-definer eem/leader-keys
			  :keymaps '(normal insert visual)
			  :prefix "SPC"
			  :global-prefix "C-SPC")
  (general-create-definer eem/motion-leader
    :keymaps '(normal motion)
    :prefix (kbd "m")
    )
)



(eem/leader-keys
 "wh" 'evil-window-left 
 "wl" 'evil-window-right 
 "wk" 'evil-window-up 
 "wj" 'evil-window-down
 "wv" 'evil-window-vsplit
 "ws" 'evil-window-split
 "ww" 'delete-other-windows

 "qq" 'evil-window-delete
 "qa" 'kill-emacs

 "fd" 'dired
 "ff" 'counsel-find-file
 "fz" 'project-find-file

 "ot" 'multi-vterm-project
 "om" 'magit

 "bl" 'persp-counsel-switch-buffer
 "bk" 'persp-remove-buffer
 "bi" 'persp-ibuffer

 "re" 'reload-init
 ;;"mu" 'modeline-update ;; doesn't work

 "e" 'neotree-project
 "tt" 'treemacs
 "tp" 'treemacs-peek-mode
 "tf" 'treemacs-follow-tag-mode

 "gr" 'lsp-ui-peek-find-references
 "lr" 'lsp-rename
 "lD" 'lsp-goto-type-definition
 "ls" 'lsp-ui-imenu
 "li" 'lsp-treemacs-symbols
 "le" 'lsp-treemacs-errors-list
 "lt" '(lambda() (interactive)(counsel-M-x "lsp-treemacs-"))
 "lmd" 'lsp-ui-doc-mode
 "lms" 'lsp-ui-sideline-mode

 "al" 'org-roam-buffer-toggle
 "af" 'org-roam-node-find
 "ai" 'org-roam-node-insert
 "ao" 'org-id-get-create
 "ac" 'org-roam-capture
 "av" 'org-open-at-point
 "ap" '(lambda() (interactive)(counsel-M-x "org-roam-"))
 )

(eem/motion-leader
 "e" 'evil-end-of-line
 "f" 'evil-first-non-blank
 "m" 'evil-jump-item
 )
