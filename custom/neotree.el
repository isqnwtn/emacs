;; neotree
(use-package neotree)


;; (add-hook 'neotree-mode-hook
;; 	  (lambda ()
;; 	    (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
;; 	    ))

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
	    (evil-define-key 'normal neotree-mode-map (kbd "<leader>j") 'neotree-select-up-node)
	    (evil-define-key 'normal neotree-mode-map (kbd "<leader>k") 'neotree-select-down-node)
	    ;;(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
	    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
	    (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
	    (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
	    (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
	    (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
	    (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
	    (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
	    ))
	  
