;; loading basic Emacs configs
(load (expand-file-name "custom/settings.el" user-emacs-directory))

;;;;;;;;;;;;;;;;;;;;;;;
;; Use package setup ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; Initiallize package sources
(require 'package)

;; add melpa to list
(add-to-list 'package-archives
'("melpa" . "http://melpa.org/packages/") t)

;; initialize package
(package-initialize)

;; fetch contents if needed
(unless package-archive-contents
  (package-refresh-contents))

;; install use-package if needed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ============== Loading Rest of the Stuff ======================== ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; loading evil related settings
(load (expand-file-name "custom/evil-settings.el" user-emacs-directory))

;; projectile setup
(load (expand-file-name "custom/projectile-setup.el" user-emacs-directory))

;; loading ivy related settings
(load (expand-file-name "custom/ivy-settings.el" user-emacs-directory))

;; loading emacs perspective
(load (expand-file-name "custom/perspective-settings.el" user-emacs-directory))

;; lsp setup
(load (expand-file-name "custom/lsp-setup.el" user-emacs-directory))

;; treemacs
(load (expand-file-name "custom/treemacs.el" user-emacs-directory))

;; loading keybindings using this with general now
;;(load (expand-file-name "custom/keybindings.el" user-emacs-directory))

;; loading neotree
(load (expand-file-name "custom/neotree.el" user-emacs-directory))

;; vterm
(load (expand-file-name "custom/vterm-settings.el" user-emacs-directory))

;; general
(load (expand-file-name "custom/general.el" user-emacs-directory))


;; using modus themes for better visibility in vterm
;; (use-package modus-themes 
;;   :config (load-theme 'modus-vivendi-tinted t))
;; using doom-themes
(use-package doom-themes 
  :config (load-theme 'doom-palenight t))

(use-package magit)

;; which key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


;; disabling theme colors in term
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)


;; Emacs keeps writing this so I'm gonna keep this on the bottom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "dd16800631c492a58d162ef1af43e0c6dac8477937a5b2993a05b720e12fe29e" "9d8a0e9791afb765acdca87000382a98d19f5862ede6b194ea15d61e3cdd55c5" "7e46a3b9eab1cc85e1f5de493844225cec83047a0aa1b129ba4481c0dd5e0881" default))
 '(package-selected-packages
   '(treemacs-icons-dired treemacs-persp company-box company lsp-ivy lsp-treemacs evil-magit general graphviz-dot-mode multi-vterm haskell-mode magit which-key vterm use-package smex rust-mode projectile perspective neotree modus-themes lsp-ui ivy-rich flx filetree evil-visual-mark-mode evil-collection doom-themes doom-modeline dir-treeview counsel command-log-mode all-the-icons))
 '(warning-suppress-types '((with-editor))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
