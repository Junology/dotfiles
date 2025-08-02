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
(global-unset-key (kbd "C-x C-l")) ;; Disable lowercase region
(global-unset-key (kbd "C-x C-u")) ;; Disable uppercase region

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

;; tabbar.el
;; in Debian/Ubuntu, it is contained in "emacs-goodies-el" package.
(when (require 'tabbar nil :noerror)
  (progn
	(setq tabbar-use-image nil)
	(defun my-tabbar-buffer-groups ()
	  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
				  ((eq major-mode 'dired-mode) "emacs")
				  (t "user"))))
	(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
	(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
	(global-set-key (kbd "<C-iso-lefttab>") 'tabbar-backward-tab)
	(tabbar-mode)))
