;; lsp setup
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui)

(add-hook 'rust-mode-hook #'lsp)
(add-hook 'haskell-mode-hook #'lsp)

;; rust mode
(use-package rust-mode)

;; haskell mode
(use-package lsp-haskell)

;; dot language
(use-package graphviz-dot-mode
  :ensure t)
