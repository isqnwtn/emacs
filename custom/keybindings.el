;; most of the keybindings are making use of evil mode
;; so we may have to disable certain keybindings before adding our own
;; so first we need to disable SPC so that it can be used as leader key

(evil-set-leader 'nil (kbd "SPC"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Emacs related stuff ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; window related key bindings
;; window motion
(evil-define-key 'normal 'global (kbd "<leader>wl") 'evil-window-right)
(evil-define-key 'normal 'global (kbd "<leader>wh") 'evil-window-left)
(evil-define-key 'normal 'global (kbd "<leader>wj") 'evil-window-down)
(evil-define-key 'normal 'global (kbd "<leader>wk") 'evil-window-up)
;; window splitting
(evil-define-key 'normal 'global (kbd "<leader>wv") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader>ws") 'evil-window-split)
;; window quit
(evil-define-key 'normal 'global (kbd "<leader>qq") 'evil-window-delete)
(evil-define-key 'normal 'global (kbd "<leader>qa") 'kill-emacs)

;; dired
(evil-define-key '(normal motion) 'global (kbd "<leader>fd") 'dired)

;; find files
(evil-define-key '(normal motion) 'global (kbd "<leader>ff") 'counsel-find-file)
(evil-define-key '(normal motion) 'global (kbd "<leader>fz") 'project-find-file)

;; terminal
(evil-define-key '(normal motion) 'global (kbd "<leader>ot") 'multi-vterm-project)

;; buffers
(evil-define-key 'normal 'global (kbd "<leader>bl") 'persp-counsel-switch-buffer)
(evil-define-key 'nil 'global (kbd "C-t") 'persp-counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bk") 'kill-buffer)


;; reload emacs
(defun reload-emacs ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))
(evil-define-key 'normal 'global (kbd "<leader>re") 'reload-emacs)


;;neotree
;; NeoTree can be opened (toggled) at projectile project root
(defun neotree-project-dir ()
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

;; need another one for python stuff, since this gets re-bound
(evil-define-key '(normal motion) 'global (kbd "<leader>e") 'neotree-project-dir)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Editing related stuff ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; comments
(evil-define-key 'visual 'global (kbd "<leader>cc") 'comment-dwim)
(evil-define-key 'visual 'global (kbd "<leader>cb") 'comment-box)

;; movement
(evil-define-key '(normal motion) 'global (kbd "<leader>mm") 'evil-jump-item)
(evil-define-key '(normal motion) 'global (kbd "<leader>me") 'evil-end-of-line)
(evil-define-key '(normal motion) 'global (kbd "<leader>mf") 'evil-first-non-blank)

;; lsp stuff
;; peek
(evil-define-key '(normal motion) 'global (kbd "<leader>lpr") 'lsp-ui-peek-find-references)
(evil-define-key '(normal motion) 'global (kbd "<leader>lpi") 'lsp-ui-peek-find-implementations)
;; list reference
;; just another keybinding for muscle memory
(evil-define-key '(normal motion) 'global (kbd "<leader>gr") 'lsp-ui-peek-find-references)
;;(evil-define-key '(normal) 'lsp-ui-mode-map (kbd "j") 'lsp-ui-peek-jump-forward)
;;(evil-define-key '(normal) 'lsp-ui-mode-map (kbd "k") 'lsp-ui-peek-jump-backward)
;; rename
(evil-define-key '(normal motion) 'global (kbd "<leader>lr") 'lsp-rename)
;; imenu
(evil-define-key '(normal motion) 'global (kbd "<leader>li") 'lsp-ui-imenu)



