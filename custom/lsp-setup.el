

;; lsp setup
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp)
	 (haskell-mode .lsp)
	 (zig-mode . lsp)
	 )
  :config
  (lsp-enable-which-key-integration t)
  :commands lsp
  )

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
              (("RET" . company-complete-selection)
	       ("TAB" . company-complete-common)
	       ("C-q" . company-abort)
	       ("C-w" . company-select-previous)
	       ("C-s" . company-select-next))
	      )
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :bind (:map lsp-ui-peek-mode-map (
			       ("k" . lsp-ui-peek--select-prev)
			       ("j" . lsp-ui-peek--select-next)
			       ))
  :config
  (setq lsp-ui-doc-position 'top)
  ;;(setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-hover 1)
  (setq lsp-ui-doc-show-with-cursor 1)
  (setq lsp-ui-sideline-show-code-actions 1)
  ;; both sideline and docs are disabled by default
  (setq lsp-ui-sideline-mode nil)
  (setq lsp-ui-doc-mode nil)
  )

(use-package lsp-treemacs
  :after lsp
  :bind (:map treemacs-mode-map(
				("P" . 'treemacs-peek-mode)
				))
  )

(use-package lsp-ivy)
(use-package consult-lsp)

;; a few overrides for rust
(add-hook 'rust-mode-hook (lambda () (interactive)
			    (setq fill-column 100)
			    (setq lsp-ui-sideline-show-hover nil)
			    (setq lsp-ui-doc-show-with-cursor nil)
			    ))

;; rust mode
(use-package rust-mode)

;; haskell mode
(use-package lsp-haskell)

;; dot language
(use-package graphviz-dot-mode
  :ensure t)

(use-package zig-mode)
