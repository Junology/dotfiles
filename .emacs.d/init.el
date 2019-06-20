;; --------
;; init.el
;; --------

;; start the emacsclient server
; (server-start)

;; Package repositories
(require 'package)
(add-to-list 'package-archives
			 '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; load-path setting
;(setq load-path
;	  (append (list (expand-file-name "~/.elisp")) load-path))

;; To load user elisps
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory) user-emacs-directory)
        ((boundp 'user-init-directory) user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (filename)
  (interactive "f")
  (load-file (expand-file-name filename user-init-dir))
  (message "Load file:" filename))

;; Load user settings
(load-user-file "user_global.el")
(load-user-file "user_lang.el")
(when (display-graphic-p)
  (load-user-file "user_window.el"))

;; TeX
(load-user-file "user_tex.el")

;; modes for programming languages
(load-user-file "user_progmode.el")

;; ----------------
;; imaxima & imath
;; ----------------
(autoload 'imaxima "imaxima" "Frontend of Maxima CAS" t)
(autoload 'imath "imath" "Interactive Math mode" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
(setq imaxima-scale-factor 1.2) ;; TeX font size

;; ---------
;; Org-mode
;; ---------
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(lsp-haskell lsp-mode lsp-ui company-irony irony idris-mode lua-mode flycheck company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
