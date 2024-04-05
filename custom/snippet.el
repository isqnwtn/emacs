;; yasnippet
(use-package yasnippet                  ; Snippets
  :ensure t
  :config
  (setq yas-verbosity 1)                      ; No need to be so verbose
  (setq yas-wrap-around-region t)

  (with-eval-after-load 'yasnippet
    (setq yas-snippet-dirs '(yasnippet-snippets-dir)))

  (yas-reload-all)
  (yas-global-mode)
  :bind
  (:map yas-minor-mode-map
        ("C-`". yas-expand)
        ([(tab)] . nil)
        ("TAB" . nil))
  )

(use-package yasnippet-snippets         ; Collection of snippets
  :ensure t)
