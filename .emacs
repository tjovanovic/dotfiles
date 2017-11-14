(setq inhibit-startup-screen t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; non-specific functionality
(setq vc-follow-symlinks t)


(use-package zenburn-theme :ensure t)

;; custom functions & variables

(defun switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

;; this may need to be moved into the helm use-package section.
(defun helm-save-and-paste ()
  (interactive)
  (kill-new (x-get-clipboard))
  (helm-show-kill-ring))

;; move this somewhere more useful...
(global-set-key (kbd "M-p") 'helm-save-and-paste)

(use-package smart-tabs-mode
  :ensure t
  :config
  (smart-tabs-insinuate 'python)
  (smart-tabs-advice python-indent-line-1 python-indent)
  (add-hook 'python-mode-hook
    (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 4))
    )
  )

(use-package magit
  :ensure t
  :config
  (setq
   magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))


(use-package better-defaults :ensure t)

;; custom keybindings
(let ((map (make-sparse-keymap)))
  (define-key map "gs" 'magit-status)
  (define-key map "mm" 'mu4e)
  (define-key map "/" 'helm-projectile-ag)
  (define-key map "bs" 'switch-to-scratch)
  ;; bind to Meta-Space
  (define-key global-map (kbd "M-SPC") map))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode t)
  (evil-leader/set-leader "<SPC>" "C-")
  (evil-leader/set-key
    ;; toggles
    "tt"  'whitespace-mode

    "q"   'delete-frame
    "bd"  'evil-delete-buffer
    "w"   'save-buffer
    "TAB" 'mode-line-other-buffer
    "pb"  'helm-projectile-switch-to-buffer
    "pf"  'helm-projectile-find-file
    "pp"  'helm-projectile-switch-project
    "bb"  'helm-buffers-list
    "bs"  'switch-to-scratch
    "oo"  'other-frame
    "kb"  'kill-buffer
    "gs"  'magit-status
    "/"   'helm-projectile-ag))


(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package idle-highlight-mode :ensure t)

(use-package paredit
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

(use-package scpaste :ensure t)

(use-package helm
  :config
  (helm-mode)
  (global-set-key (kbd "M-x") 'helm-M-x))

(use-package helm-ag
  :ensure t)

(use-package helm-projectile
  :ensure t
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

;; start the server
;; (server-start)
(global-undo-tree-mode t)

;; language specific configs
(use-package go-mode
  :no-require t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook
            (lambda ()
              (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(use-package nix-mode
  :no-require t)

(use-package haskell-mode
  :no-require t)

(use-package dockerfile-mode
  :no-require t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )