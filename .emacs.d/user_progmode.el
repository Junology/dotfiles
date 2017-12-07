;; -------
;; general
;; -------
(defconst is-company-loaded (require 'company nil :noerror))
(when is-company-loaded
  (progn
	(add-hook 'after-init-hook 'global-company-mode)
	(setq company-backends (delete 'company-semantics company-backends))))

;; ---------------
;; C/C++ Language
;; ---------------
(when (require 'irony nil :noerror)
  (progn 
	(add-hook 'c++-mode-hook 'irony-mode)
	(add-hook 'c-mode-hook 'irony-mode)
	(add-hook 'objc-mode-hook 'irony-mode)))
;;	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

(defun my-c-mode-common-hook ()
  (c-set-style "linux")
  (define-key c-mode-base-map "\C-j" 'newline-and-indent)
  (when is-company-loaded
	(progn
	  (define-key c-mode-map "\C-c tab" 'company-complete)
	  (define-key c++-mode-map "\C-c tab" 'company-complete)))
  (setq tab-always-indent nil)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)) ;; indent width
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; -------------
;; Haskell mode
;; -------------
(when (and (require 'haskell-mode nil :noerror)
		   (require 'haskell-cabal nil :noerror))
  (add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
  (add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
  (add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode)))

;; -------
;; Prolog
;; -------
(when (require 'prolog nil :noerror)
  (add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))
  (setq prolog-program-name "/usr/bin/gprolog")
  (setq prolog-consult-string "[user].\n"))

;; --------------
;; Lilypond-mode
;; --------------
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

