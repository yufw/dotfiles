;;(global-font-lock-mode -1)

(setq mac-command-modifier 'meta)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(evil-mode 1)

;;(push "/usr/local/bin" exec-path)

(add-to-list 'exec-path "~/go/bin/")
(add-to-list 'exec-path "/usr/local/bin")
;; (setq exec-path (append exec-path '("/usr/local/go/bin")))

(add-to-list 'load-path "~/.emacs.d/cl-lib")
(require 'cl-lib)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/solarized-theme")
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")

;; (add-to-list 'load-path "~/.emacs.d/go-mode")
;; (require 'go-mode-autoloads)

;;(setq-default solarized-italic nil)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/twilight-theme")
;; ;; (load-theme 'solarized-light t)
;;(load-theme 'solarized-light t)
;;(load-theme 'default-light t)

(if (not window-system)
    (menu-bar-mode -1))

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
;;(setq-default tab-width 4)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

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

;; Font

(set-frame-font "DejaVu Sans Mono-12")
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

;; projectile
(projectile-mode 1)

;; ace window
;; (global-set-key (kbd "C-x o") 'ace-window)

(global-set-key (kbd "<f5>") 'goto-line)        ;goto line
(global-set-key (kbd "<f6>") 'set-mark-command) ;mark
;(global-set-key (kbd "C-m") 'set-mark-command)

;;(w32-send-sys-command #xf030)

;; (add-hook 'go-mode-hook 'company-mode)
;; (add-hook 'go-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))
(add-hook 'go-mode-hook #'lsp)
(evil-define-key 'normal go-mode-map (kbd "g d") 'lsp-find-definition)
;;(add-hook 'go-mode-hook (lambda ()
;;                          (set (make-local-variable 'evil-goto-definition-functions) '(lsp-find-definition))))

;; Flycheck
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(defun my-make-round-corners ()
  (interactive)
  (set-background-color "gray100")
  (set-background-color "white"))

;; (defun my-toggle-frame-maximized ()
;;   (interactive)
;;   (toggle-frame-maximized)
;;   (my-make-round-corners))

;;(toggle-frame-maximized)
;;(my-make-round-corners)

;;(add-hook 'go-mode-hook 'company-mode)
;;(add-hook 'go-mode-hook (lambda ()
;;                          (set (make-local-variable 'company-backends) '(company-go))
;;                          (company-mode)))

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)

;;(setq frame-background-mode 'light)

(xterm-mouse-mode)

;; Enable mouse support
(unless window-system
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(confirm-kill-emacs 'y-or-n-p)
 '(magit-section-visibility-indicator nil)
 '(package-selected-packages
   '(lsp-mode eglot evil bison-mode flycheck company projectile go-mode magit smex ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:extend nil :background "LightGoldenrod2")))))
