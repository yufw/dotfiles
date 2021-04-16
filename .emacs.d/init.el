;; -*- lexical-binding: t; -*-
;(set-background-color "DarkSlateGray")
;(set-foreground-color "wheat")
;(set-cursor-color "orchid")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; (add-to-list 'load-path "~/.emacs.d/go-mode")
;; (require 'go-mode-autoloads)

;;(setq-default solarized-italic nil)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/twilight-theme")
(load-theme 'solarized-light t)
;;(load-theme 'solarized-light t)

(when (not window-system)
  (menu-bar-mode -1)
  (setq frame-background-mode 'dark))

(tool-bar-mode -1)
(scroll-bar-mode -1)

;;(toggle-frame-maximized)
;;(set-frame-parameter nil 'background-mode 'dark)
;;(load-theme 'intellij t)

(blink-cursor-mode -1)

(setq ring-bell-function 'ignore)

(electric-pair-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)
(global-auto-revert-mode 1)

(ido-mode 1)
(setq ido-enable-flex-matching t)

(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default major-mode 'text-mode)

;; Go
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/go-mode")
;; (require 'go-mode)

;; (defun my-go-mode-hook ()
;;   (define-key go-mode-map (kbd "RET") 'newline-and-indent))
;; (add-hook 'go-mode-hook 'my-go-mode-hook)

;; CC Mode
(setq c-basic-offset 4)

(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; evil
(evil-mode 1)
(global-undo-tree-mode)
(evil-set-initial-state 'eww-mode 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)

;; Font
(set-frame-font "Menlo-16")
;;(set-frame-font "Consolas-12")
;;(set-fontset-font "fontset-default" 'han '("SimSun" . "unicode-bmp"))
;;(set-fontset-font "fontset-default" 'cjk-misc '("Source Han Sans CN" . "unicode-bmp"))


;; Ag
(setq ag-reuse-buffers t)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)

;; Ag
(setq ag-reuse-buffers t)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "<f5>") 'goto-line)        ;goto line
(global-set-key (kbd "<f6>") 'set-mark-command) ;mark
;(global-set-key (kbd "C-m") 'set-mark-command)

(global-diff-hl-mode)

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(add-hook 'go-mode-hook #'lsp)
(evil-define-key 'normal go-mode-map (kbd "g d") 'lsp-find-definition)

(add-hook 'python-mode-hook #'lsp)

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)


(xterm-mouse-mode)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(confirm-kill-emacs 'y-or-n-p)
 '(evil-undo-system 'undo-tree)
 '(global-auto-revert-mode t)
 '(global-undo-tree-mode t)
 '(indicate-buffer-boundaries t)
 '(js-indent-level 2)
 '(lsp-headerline-breadcrumb-enable nil)
 '(magit-section-visibility-indicator nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(solarized-theme undo-tree lsp-mode eglot evil bison-mode flycheck company projectile go-mode magit smex ag))
 '(x-underline-at-descent-line t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
