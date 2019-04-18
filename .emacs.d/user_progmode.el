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
	(add-hook 'objc-mode-hook 'irony-mode)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    (add-to-list 'company-backends 'company-irony)))

(c-add-style "my-style"
             '("linux"
               (indent-tabs-mode . nil)
               (tab-always-indent . t)
               (c-basic-offset . 4)
               (c-offsets-alist . ((inline-open . 0)
								   (innamespace . 0)
								   (member-init-intro . +)
								   (member-init-cont . c-indent-multi-line-block)
                                   (statement-case-open . +)))))
(defun my-c-mode-common-hook ()
  (c-set-style "my-style")
  (define-key c-mode-base-map "\C-j" 'newline-and-indent)
  (when is-company-loaded
	(progn
	  (define-key c-mode-map (kbd "C-c <tab>") 'company-complete)
	  (define-key c++-mode-map (kbd "C-c <tab>") 'company-complete))))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; -------------------
;; Haskell IDE Engine
;; -------------------
(when (and (require 'lsp-mode nil :noerror)
		   (require 'lsp-ui nil :noerror)
		   (require 'lsp-haskelll nil :noerror))
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'haskell-mode-hook #'lsp-haskell-enable)
  (add-hook 'haskell-mode-hook 'flycheck-mode))
;; -------------
;; Haskell mode
;; -------------
;(when (and (require 'haskell-mode nil :noerror)
;		   (require 'haskell-cabal nil :noerror))
;  (add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
;  (add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
;  (add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))
;  (defun my-haskell-mode-hook ()
;	(interactive)
;	(turn-on-haskell-indentation)
;	(turn-on-haskell-doc-mode)
;	(font-lock-mode)
;	(setq haskell-program-name "/usr/bin/ghci")
;	(inf-haskell-mode)
;	(ghc-init)
;	(flycheck-mode))
;  (add-hook 'haskell-mode-hook 'my-haskell-mode-hook))
;;  (add-hook ’haskell-mode-hook ’interactive-haskell-mode))

;; --------
;; Idris
;; -------
(when (require 'idris-mode nil :noerror)
  (add-to-list 'auto-mode-alist '("\\.idr$" . idris-mode))
  (defun my-idris-mode-hook ()
    (font-lock-mode)
    (flycheck-mode))
  (add-hook 'idris-mode-hook 'my-idris-mode-hook))

;; -------
;; Prolog
;; -------
(when (require 'prolog nil :noerror)
  (add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))
  (setq prolog-program-name "/usr/bin/gprolog")
  (setq prolog-consult-string "[user].\n"))

;; ---------
;; Lua mode
;; ---------
(autoload 'lua-mode "lua-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; --------------
;; Lilypond-mode
;; --------------
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
