;; -------
;; AUCTeX
;; -------
;(require 'tex)
;(require 'tex-jp)
;(require 'font-latex)
;(setq TeX-default-mode 'japanese-latex-mode)
;(setq japanese-TeX-command-default "pTeX")
;(setq japanese-LaTeX-command-default "pLaTeX")
;(setq japanese-LaTeX-default-style "jarticle")
;(setq kinsoku-limit 10)
(setq LaTeX-indent-level 0)
(setq LaTeX-item-indent 2)
(setq TeX-output-view-style '(("^dvi$" "." "xdvi-ja '%d'")))
(setq preview-image-type 'dvipng)
(add-hook 'TeX-mode-hook 'prettify-symbols-mode)
(setq prettify-symbols-unprettify-at-point t)
;(add-hook 'LaTeX-mode-hook (function (lambda ()
;  (add-to-list 'TeX-command-list
;    '("pTeX" "ptex %`%S%(PDFout)%(mode)%' %t"
;     TeX-run-TeX nil (plain-tex-mode) :help "Run ASCII pTeX"))
;  (add-to-list 'TeX-command-list
;    '("pLaTeX" "platex %`%S%(PDFout)%(mode)%' %t"
;     TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
;  (add-to-list 'TeX-command-list
;    '("xpdf" "acroread '%s.pdf' " TeX-run-command t nil))
;  (add-to-list 'TeX-command-list
;    '("pdf" "dvipdfmx -V 4 '%s' " TeX-run-command t nil))
;  (add-to-list 'TeX-command-list
;    '("View" "xdvi-ja '%d'" TeX-run-command t nil)))))
(add-hook 'LaTeX-mode-hook '(lambda ()
  (setq TeX-PDF-mode t)
  (setq TeX-parse-self t)
  (TeX-fold-mode 1)
  (outline-minor-mode t)
  ;; extra outline headers
  (setq TeX-outline-extra
		'(("^\\\\begin{thebibliography}" 1)
		  ("^\\\\end{thebibliography}" 1)
		  ("^\\\\bibliographystyle" 1)
		  ("^\\\\bibliography" 1)))))
(defun my-flyspell-fixed-on-tex ()
  (flyspell-mode t)
  (message "Hello, flyspell!")
  ; Backup the original flyspell TeX command regexp
  (defconst flyspell-tex-command-regexp-orig
	flyspell-tex-command-regexp)
  ; Make flyspell ignore \cref and \Cref in addition to \ref
  (setq flyspell-tex-command-regexp
		(replace-regexp-in-string
		 "\|ref\\\\" "\|[cC]?ref\\\\"
		 flyspell-tex-command-regexp))
  ; Define function that registers given string as a TeX command.
  (defconst flyspell-tex-command-regexp-target
	"\|documentclass\\\\"
	"Used in registering new TeX command so that flyspell ignores it")
  (defun add-flyspell-tex-command (texcom)
	(setq flyspell-tex-command-regexp
		  (replace-regexp-in-string
		   flyspell-tex-command-regexp-target
		   (concat "\|" texcom "\\\\"
				   flyspell-tex-command-regexp-target)
		   flyspell-tex-command-regexp)))
  (add-flyspell-tex-command "usetikzlibrary")
  (add-flyspell-tex-command "tikzset")
  (add-flyspell-tex-command "newcounter")
  (add-flyspell-tex-command "setcounter")
  (add-flyspell-tex-command "value")
  (add-flyspell-tex-command "bibliography")
  (add-flyspell-tex-command "bibliographystyle"))
(add-hook 'LaTeX-mode-hook 'my-flyspell-fixed-on-tex)
(add-hook 'LaTeX-mode-hook '(lambda ()
  (setq ispell-parser 'tex)
  (setq ispell-extra-args '("--dont-tex-check-comments"))
  (setq ispell-tex-skip-alists
		(list (append
			   (car ispell-tex-skip-alists)
			   '(("\\\\[cC]ref" ispell-tex-arg-end)
				 ("\\\\usetikzlibrary" ispell-tex-arg-end)
				 ("\\\\tikzset" ispell-tex-arg-end)
				 ("\\\\defTikzBox" ispell-tex-arg-end)
				 ("\\\\hyphenation" ispell-tex-arg-end)
				 ("\\\\addcontentsline" ispell-tex-arg-end 2)))
			  (cadr ispell-tex-skip-alists)))))
;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; shell-escape enabled using file local variable
(with-eval-after-load 'tex-site
  (add-to-list 'safe-local-variable-values
               '(TeX-command-extra-options . "-shell-escape")))

;; Turn on RefTeX in AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; found at StackOverflow https://stackoverflow.com/questions/9682592/setting-up-reftex-tab-completion-in-emacs
(defun get-bibtex-keys (file)
  (with-current-buffer (find-file-noselect file)
    (mapcar 'car (bibtex-parse-keys))))

(defun LaTeX-add-all-bibitems-from-bibtex ()
  (interactive)
  (mapc 'LaTeX-add-bibitems
        (apply 'append
               (mapcar 'get-bibtex-keys (reftex-get-bibfile-list)))))

;; Overwrite the behavior of TeX-insert-dollar function since I hate it
(with-eval-after-load 'tex
  (defun my-TeX-insert-dollar (orig-fun &optional arg)
	(insert "$"))
  (advice-add 'TeX-insert-dollar :around #'my-TeX-insert-dollar))
