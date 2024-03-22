;; ivy settings 

(use-package ivy
  :diminish
  :bind (;;("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("RET" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("TAB" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 ("<backtab>" . ivy-previous-line))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config
  (setq ivy-initial-input-alist nil))

(use-package flx
  :defer t
  :init
  (setq ivy-flx-limit 10000))

(use-package smex
  :defer 1
  :after counsel)
