;; -*- lexical-binding: t; -*-

;; (set-background-color "DarkSlateGray")
;; (set-foreground-color "wheat")
;; (set-cursor-color "orchid")

(setq mac-option-modifier 'meta)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(when (not window-system)
  (setq frame-background-mode 'dark))

(unless (eq window-system 'ns)
  (menu-bar-mode -1))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode -1)

(setq ring-bell-function 'ignore)

(electric-pair-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)
(global-auto-revert-mode 1)

(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default major-mode 'text-mode)

;; CC Mode
(setq c-basic-offset 4)

(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

(add-hook 'c++-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'google-set-c-style)
;; (add-hook 'c++-mode-hook 'google-make-newline-indent)
(setq lsp-clients-clangd-args
      '("--header-insertion=never"))

;; undo tree
;; enable if buffer is not read-only
(add-hook 'after-change-major-mode-hook (lambda()
                                 (unless buffer-read-only
                                   (undo-tree-mode))))

(setq undo-tree-auto-save-history nil)

;; Font
(when (window-system)
  (cond ((equal system-type 'gnu/linux)
         (set-frame-font "DejaVu Sans Mono-12")
         (set-fontset-font t 'symbol "Noto Color Emoji"))
        ((equal system-type 'darwin)
         (set-frame-font "Menlo-16"))
        ((equal system-type 'windows-nt)
         (set-frame-font "Consolas-13")
         (set-fontset-font "fontset-default" 'han '("SimSun" . "unicode-bmp")))))

(vertico-mode)

(setq completion-styles '(orderless))
(setq orderless-matching-styles '(orderless-literal orderless-flex))

(savehist-mode)

(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)

;; Ag
(setq ag-reuse-buffers t)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "<f5>") 'goto-line)        ;goto line
(global-set-key (kbd "<f6>") 'set-mark-command) ;mark

(when (window-system)
  (global-diff-hl-mode))

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook (lambda()
                          (define-key go-mode-map (kbd "C-c C-j") 'lsp-find-definition)))

(add-hook 'python-mode-hook #'lsp)

(add-hook 'js-mode-hook #'lsp)

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)

(unless (display-graphic-p)
  (xterm-mouse-mode)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-unset-key (kbd "C-z"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(confirm-kill-emacs 'y-or-n-p)
 '(indicate-buffer-boundaries t)
 '(js-indent-level 2)
 '(lsp-headerline-breadcrumb-enable nil)
 '(magit-section-visibility-indicator nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(lsp-mode magit zenburn-theme markdown-mode yaml-mode project orderless vertico google-c-style diff-hl undo-tree company go-mode pyvenv))
 '(vc-follow-symlinks t)
 '(x-underline-at-descent-line t))

(load-theme 'zenburn t)

(let ((custom--inhibit-theme-enable nil))
  (zenburn-with-color-variables
    (custom-theme-set-faces
     'zenburn
     `(vertico-current ((t (:background ,zenburn-bg-05 :foreground ,zenburn-yellow :weight bold)))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
