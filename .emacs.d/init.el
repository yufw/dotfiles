;; -*- lexical-binding: t; -*-

;; (set-background-color "DarkSlateGray")
;; (set-foreground-color "wheat")
;; (set-cursor-color "orchid")

(setq mac-option-modifier 'meta)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/") t)
(package-initialize)

(when (not window-system)
  (setq frame-background-mode 'dark))

(unless (eq window-system 'ns)
  (menu-bar-mode -1))

(tool-bar-mode -1)
(scroll-bar-mode -1)

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

;; evil
(evil-mode 1)
(global-undo-tree-mode)
(evil-set-initial-state 'eww-mode 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'flymake-diagnostics-buffer-mode 'emacs)
(evil-set-initial-state 'xref--xref-buffer-mode 'emacs)

;; Font
(cond ((equal system-type 'gnu/linux)
       (set-frame-font "DejaVu Sans Mono-12")
       (set-fontset-font t 'symbol "Noto Color Emoji"))
      ((equal system-type 'darwin)
       (set-frame-font "Menlo-16"))
      ((equal system-type 'windows-nt)
       (set-frame-font "Consolas-13")
       (set-fontset-font "fontset-default" 'han '("SimSun" . "unicode-bmp"))))

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

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(add-hook 'go-mode-hook #'lsp)

(add-hook 'python-mode-hook #'lsp)

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)

(xterm-mouse-mode)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(when (display-graphic-p)
  (set-face-attribute 'region nil :extend t :background "LightGoldenrod2"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(confirm-kill-emacs 'y-or-n-p)
 '(evil-undo-system 'undo-tree)
 '(indicate-buffer-boundaries t)
 '(js-indent-level 2)
 '(lsp-headerline-breadcrumb-enable nil)
 '(magit-section-visibility-indicator nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(yaml-mode lsp-mode project orderless vertico google-c-style diff-hl undo-tree evil company go-mode magit)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
