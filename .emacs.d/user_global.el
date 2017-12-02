;; --------------------
;; Put global settings
;; --------------------

;; Turn off the alarm bell
(setq ring-bell-function 'ignore)

;; Do not create backup files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)
(setq delete-auto-save-files t)

;; Keybinds
(keyboard-translate ?\C-h ?\C-?) ;; C-h as Backspace
(define-key ctl-x-map "l" 'goto-line) ;; C-x l as goto-line

;; Editor
(setq scroll-conservatively 2)
(show-paren-mode 1)
(column-number-mode 1)
(line-number-mode 1)
(setq-default tab-width 4)
;(setq tab-stop-list
;	  '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))

;; Coloring
(global-font-lock-mode t)
(setq font-lock-support-mode 'jit-lock-mode)
(setq font-lock-maximum-decoration t)

;; clipboard
(cond (window-system (setq x-select-enable-clipboard t)))

;; downcase and upcase regions
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
