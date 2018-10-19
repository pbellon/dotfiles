;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(show-paren-mode 1)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; DEBUG
;(setq debug-on-error t)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")
			 ))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Line Number setup
(use-package nlinum
  :ensure t
  :config
  (add-hook 'prog-mode-hook '(lambda () (nlinum-mode t)))
  (setq nlinum--width 4)
  (setq line-number-mode nil))

;; Evil conf
(use-package evil
  :ensure t
  :init
  (setq evil-search-module 'evil-search1
    evil-want-C-u-scroll t
    evil-want-C-w-in-emacs-state t)
  (define-key global-map (kbd "C-." ) nil)
  (global-unset-key (kbd "C-."))
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; Evil Numbers
(use-package evil-numbers
  :after evil
  :ensure t
  :config
  (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt))

;; Evil Collection
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Helm Swoop
(use-package helm-swoop
  :ensure t
  :init
  (global-set-key (kbd "C-c i") 'helm-swoop)
  (global-set-key (kbd "C-c I") 'helm-swoop-back-to-last-point))

;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-swoop evil-collection nlinum evil-number evil-numbers zzz-to-char zenburn-theme yasnippet-snippets which-key use-package swiper sudo-edit spaceline rainbow-mode rainbow-delimiters projectile popup-kill-ring org-evil org-bullets neotree mark-multiple magit key-chord hungry-delete htmlize helm expand-region dashboard company-shell company-lua company-jedi beacon))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
