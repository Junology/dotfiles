;; --------------
;; General Setup
;; --------------

;; start the emacsclient server
; (server-start)

;; turn off the alarm bell
(setq ring-bell-function 'ignore)

;; バックアップ等を作成しない
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)
(setq delete-auto-save-files t)

;; スクロールの幅
(setq scroll-conservatively 2)

;; 括弧のハイライト
(show-paren-mode 1)

;; 色分け
(global-font-lock-mode t)
(setq font-lock-support-mode 'jit-lock-mode)
(setq font-lock-maximum-decoration t)

;; 列数と行数を表示
(column-number-mode 1)
(line-number-mode 1)

;; タブ幅を設定
(setq-default tab-width 4)
;(setq tab-stop-list
;	  '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))

;; クリップボードを共有
(cond (window-system
			 (setq x-select-enable-clipboard t)))

;; C-h as Backspace
(global-set-key "\C-h" 'delete-backward-char)

;; C-x l で goto-line
(define-key ctl-x-map "l" 'goto-line)

;; ---------------
;; Window Setting
;; ---------------
;; window size
(setq default-frame-alist
			(append '((width . 43) (height . 56)) default-frame-alist))

;; no splash screen
(setq inhibit-splash-screen t)

;; remove toolbar
(tool-bar-mode -1)

;; remove menu
(menu-bar-mode -1)

;; font setting
(when window-system (progn
  (set-default-font "Monospace-12")
	(set-fontset-font (frame-parameter nil 'font)
					  'japanese-jisx0208
					  '("Takaoゴシック" . "unicode-bmp"))))

;; フレームを縦分割したときの折り返し
(setq truncate-partial-width-windows nil)

;; -----------------
;; Language setting
;; -----------------
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; coding-system
;;特に必要ないかも？
(set-default-coding-systems 'utf-8)

;; ------
;; ddskk
;; ------
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
; (setq default-input-method "japanese-skk")
(setq default-input-method nil)
; (setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
(setq skk-preload t)

;; ---------------
;; C/C++ Language
;; ---------------
(defun my-c-mode-common-hook ()
  (c-set-style "linux")
	(define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (setq tab-always-indent nil)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)) ;; indent width
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; -------------
;; Haskell mode
;; -------------
(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

;; ----------------
;; imaxima & imath
;; ----------------
(autoload 'imaxima "imaxima" "Frontend of Maxima CAS" t)
(autoload 'imath "imath" "Interactive Math mode" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
(setq imaxima-scale-factor 1.2)

;; -------
;; Prolog
;; -------
(require 'prolog)
(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))
(setq prolog-program-name "/usr/bin/gprolog")
(setq prolog-consult-string "[user].\n")

;; ---------
;; Org-mode
;; ---------
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
