;; --------
;; init.el
;; --------

;; start the emacsclient server
; (server-start)

;; Auto-generated codes should be separated.
(setq custom-file (expand-file-name "~/.config/emacs/custom-file.el"))
(load-file custom-file)


;; Package repositories
(require 'package)
(add-to-list 'package-archives
			 '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; Fix broken connection to elpa in emacs 26.1 and 26.2
(when (and (eq emacs-major-version 26)
		   (< emacs-minor-version 3))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
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

;; prefer no tabs
(setq-default indent-tabs-mode nil)

;; spell checker
(setq-default ispell-program-name "aspell")
(with-eval-after-load "ispell"
  (setq ispell-program-name "aspell")
  (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; highlighting tabs
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
;(setq whitespace-space-regexp "\\(\u3000+\\)")
;(setq whitespace-display-mappings
;	  '((tab-mark ?\t [?\xBB ?\t])
;		(space-mark ?\  [?\xB7] [?.])
;		(space-mark ?\xA0 [?\xA4] [?_])))
(add-hook 'font-lock-mode-hook
		  '(lambda ()
			 (whitespace-mode t)
			 (setq whitespace-style
				   '(face
					 trailing
					 tabs
					 newline
					 ;spaces
					 ;space-mark
					 newline-mark
					 tab-mark))
			 (set-face-foreground 'whitespace-space "gray96")
			 (set-face-background 'whitespace-space nil)
			 (set-face-foreground 'whitespace-tab "gray64")
			 (set-face-background 'whitespace-tab "gray96")
			 (set-face-foreground 'whitespace-newline "gray80")
			 (set-face-background 'whitespace-newline nil)
			 (set-face-foreground 'whitespace-trailing nil)
			 (set-face-background 'whitespace-trailing "red")
			 (set-face-background 'whitespace-hspace "pink96")
			 (setq whitespace-display-mappings
				   '((newline-mark ?\n [?\xB6 ?\n] [?$ ?\n])
					 (space-mark ?\  [?\x2423] [?_])
					 (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))))

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


