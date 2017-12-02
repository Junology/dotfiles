;; -----------------
;; Language setting
;; -----------------

;; Encodings
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; ddskk
(when (require 'skk-autoloads nil :noerror)
  (progn
	(global-set-key "\C-x\C-j" 'skk-mode)
	(global-set-key "\C-xj" 'skk-auto-fill-mode)
	(global-set-key "\C-xt" 'skk-tutorial)
	(setq default-input-method "japanese-skk")
	(setq default-input-method nil)
	(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
	(setq skk-preload t)))
