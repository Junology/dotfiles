;; --------------
;; General Setup
;; --------------

;; load-path setting
(setq load-path (append (list (expand-file-name "~/.elisp")) load-path))

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
			(append '((width . 100) (height . 56)) default-frame-alist))

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
(setq default-input-method "japanese-skk")
(setq default-input-method nil)
(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
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
(add-to-list 'load-path "~/.elisp/haskell-mode-2.8.0")
(require 'haskell-mode)
(require 'haskell-cabal)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

;; ----------------
;; imaxima & imath
;; ----------------
;(add-to-list 'load-path "/usr/local/share/maxima/5.34.1/emacs")
(autoload 'imaxima "imaxima" "Frontend of Maxima CAS" t)
(autoload 'imath "imath" "Interactive Math mode" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
(setq imaxima-scale-factor 1.2)

;; -------
;; Prolog
;; -------
;(require 'prolog)
;(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))
;(setq prolog-program-name "/usr/bin/gprolog")
;(setq prolog-consult-string "[user].\n")

;; ---------
;; Org-mode
;; ---------
;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)

;; --------------
;; Lilypond-mode
;; --------------
;(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
;(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
;(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
;(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; -------
;; AUCTeX
;; -------
(require 'tex-site)
(require 'tex-jp)
;(setq TeX-default-mode 'japanese-latex-mode)
(setq japanese-TeX-command-default "pTeX")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq japanese-LaTeX-default-style "jarticle")
(setq kinsoku-limit 10)
(setq LaTeX-indent-level 0)
(setq LaTeX-item-indent 2)
(setq TeX-output-view-style '(("^dvi$" "." "xdvi-ja '%d'")))
(setq preview-image-type 'dvipng)
;(add-hook 'LaTeX-mode-hook (function (lambda() (setq TeX-PDF-mode nil))))

(add-hook 'LaTeX-mode-hook (function (lambda ()
  (add-to-list 'TeX-command-list
;    '("pTeX" "%(PDF)ptex %`%S%(PDFout)%(mode)%' %t"
    '("pTeX" "ptex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (plain-tex-mode) :help "Run ASCII pTeX"))
  (add-to-list 'TeX-command-list
;    '("pLaTeX" "%(PDF)platex %`%S%(PDFout)%(mode)%' %t"
    '("pLaTeX" "platex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
  (add-to-list 'TeX-command-list
    '("acroread" "acroread '%s.pdf' " TeX-run-command t nil))
  (add-to-list 'TeX-command-list
    '("pdf" "dvipdfmx -V 4 '%s' " TeX-run-command t nil))
  (add-to-list 'TeX-command-list
    '("View" "xdvi-ja '%d'" TeX-run-command t nil))
)))
(add-hook 'LaTeX-mode-hook '(lambda ()
    (TeX-fold-mode 1)
    (outline-minor-mode t)))
;; extra outline headers 
(setq TeX-outline-extra
    '(("^\\\\begin{thebibliography}" 2)
      ("^\\\\end{thebibliography}" 2)))

;; -------
;; RefTeX
;; -------
;; Turn on RefTeX in AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Activate nice interface between RefTeX and AUCTeX
(setq reftex-plug-into-AUCTeX t)

(put 'downcase-region 'disabled nil)

