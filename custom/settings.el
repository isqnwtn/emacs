;; settings for Emacs

;; inhibiting startup message
(setq inhibit-startup-message t)

;; visible bell
(setq visible-bell t)

;; disabling top level menu
(tool-bar-mode -1)
;; disabling scroll bar it's a little too extra
(scroll-bar-mode -1)

;; changing one right-command key to control
(setq mac-right-command-modifier 'control)

;; enabling full screen on startup 
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; setting font
(set-frame-font "Firacode Nerd Font Mono 18" nil t)

;;setting theme
;;(load-theme 'wombat)

;; relative line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'origami-mode)
(setq display-line-numbers-type 'absolute)

;; use escape even within emacs mode
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; to log the commands that have been entered See *Messages* buffer
;;(use-package command-log-mode)

;; smooth scrolling
(setq scroll-step            1
      scroll-conservatively  10000)

;; copy to clipboard and vice versa
(setq x-select-enable-clipboard t)

;; no git status on modline as its false
(setq-default mode-line-format
              (delete '(vc-mode vc-mode) mode-line-format))

;; auto comment
(setq fill-column 100)
(setq comment-auto-fill-only-comments 1)
(setq-default auto-fill-function 'do-auto-fill)
