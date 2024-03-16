

;; lsp setup
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . lsp)
	 (haskell-mode .lsp)
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
			       ("C-w" . lsp-ui-peek-jump-forward)
			       ("C-s" . lsp-ui-peek-jump-backward)
			       ))
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp
  :bind (:map treemacs-mode-map(
				("P" . 'treemacs-peek-mode)
				))
  )

(use-package lsp-ivy)

(add-hook 'rust-mode-hook #'lsp)
(add-hook 'haskell-mode-hook #'lsp)

;; rust mode
(use-package rust-mode)

;; haskell mode
(use-package lsp-haskell)

;; dot language
(use-package graphviz-dot-mode
  :ensure t)
