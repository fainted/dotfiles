;;; reference http://nadeemkhedr.com/emacs-tips-and-best-plugins-to-use-with-evil-mode/

;; 配置包源
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(when (version< emacs-version "27.0")
  (package-initialize))

(when (not package-archive-contents)
  (package-refresh-contents))

(global-font-lock-mode t)

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode))   ;; should be placed before enabe evil-mode

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package find-file-in-project
  :ensure t
  :config)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
	(file-name (buffer-file-name)))
    (if project-dir
	(progn
	  (neotree-dir project-dir)
	  (neotree-find file-name))
      (message "Could not find git project root."))))

;; (global-set-key [f8] 'neotree-toggle)
(use-package neotree
  :ensure t
  :config
  (evil-leader/set-key
    "n" 'neotree-project-dir
    "m" 'neotree-toggle)
  (add-hook 'neotree-mode-hook
	    (lambda ()
	      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
	      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
	      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
	      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
	      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
	      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
	      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
	      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)
	      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

;;------------------------------------------------------------------------------
;; auto-completion
;;------------------------------------------------------------------------------
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 3)
  (setq company-selection-wrap-around t)
  (global-company-mode))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(use-package company-irony
  :ensure t
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony))

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode 'irony-mode)
  (add-hook 'c-mode 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))

;;------------------------------------------------------------------------------
;; appearance setting
;;------------------------------------------------------------------------------
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-oceanicnext t))

(use-package color-theme-approximate
  :ensure t
  :config
  (color-theme-approximate-on))

(set-face-foreground 'mode-line "#ffffff")
(set-face-background 'mode-line "Blue")
(set-face-foreground 'mode-line-inactive "#606060")
(set-face-background 'mode-line-inactive "#202020")

(global-linum-mode 1)

;;------------------------------------------------------------------------------
;; mode line config
;;------------------------------------------------------------------------------
(use-package telephone-line
  :ensure t
  :config
  (setq telephone-line-lhs
	'((evil   . (telephone-line-evil-tag-segment))
	  (accent . (telephone-line-vc-segment
		     telephone-line-erc-modified-channels-segment
		     telephone-line-process-segment))
	  (nil    . (telephone-line-minor-mode-segment
		     telephone-line-buffer-segment))))
  (telephone-line-mode 1))

;;------------------------------------------------------------------------------
;; autopair
;;------------------------------------------------------------------------------
(use-package autopair
  :ensure t
  :config
  (autopair-global-mode))

;;------------------------------------------------------------------------------
;; 多窗口
;;------------------------------------------------------------------------------
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1))

(when (fboundp 'winner-mode)
  (winner-mode 1)
  (global-set-key (kbd "C-x 4 u") 'winner-undo)
  (global-set-key (kbd "C-x 4 r") 'winner-redo))


;;------------------------------------------------------------------------------
;; 快捷键
;;------------------------------------------------------------------------------
(global-set-key (kbd "C-x <deletechar>") 'erase-buffer)  ;; clear buffer
