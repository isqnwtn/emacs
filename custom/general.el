
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ======================= General Definitions ========================= ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package general
  :config
  (general-auto-unbind-keys)
  (general-evil-setup t)
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

 "qq" 'evil-window-delete
 "qa" 'kill-emacs

 "fd" 'dired
 "ff" 'counsel-find-file
 "fz" 'project-find-file

 "ot" 'multi-vterm-project

 "bl" 'persp-counsel-switch-buffer
 "bk" 'kill-buffer

 "re" 'reload-init

 "e" 'neotree-project
 "tt" 'treemacs
 "tp" 'treemacs-peek-mode
 "tf" 'treemacs-follow-tag-mode

 "gr" 'lsp-ui-peek-find-references
 "lr" 'lsp-rename
 "ls" 'lsp-ui-imenu
 "li" 'lsp-treemacs-symbols
 "le" 'lsp-treemacs-errors-list
 "lt" '(lambda() (interactive)(counsel-M-x "lsp-treemacs-"))
 )

(eem/motion-leader
 "e" 'evil-end-of-line
 "f" 'evil-first-non-blank
 "m" 'evil-jump-item
 )
