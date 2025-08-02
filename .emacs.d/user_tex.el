;; -------
;; AUCTeX
;; -------
;(require 'tex-site)
;(require 'tex-jp)
;(require 'font-latex)
;(setq TeX-default-mode 'japanese-latex-mode)
;(setq japanese-TeX-command-default "pTeX")
;(setq japanese-LaTeX-command-default "pLaTeX")
;(setq japanese-LaTeX-default-style "jarticle")
;(setq kinsoku-limit 10)
(setq LaTeX-indent-level 0)
(setq LaTeX-item-indent 2)
;(setq TeX-output-view-style '(("^dvi$" "." "xdvi-ja '%d'")))
(setq preview-image-type 'dvipng)
; (add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)
(defun my-LaTeX-mode-hook ()
  (add-to-list 'TeX-command-list
    '("pTeX" "ptex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (plain-tex-mode) :help "Run ASCII pTeX"))
  (add-to-list 'TeX-command-list
    '("pLaTeX" "platex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
  (add-to-list 'TeX-command-list
    '("pdf" "dvipdfmx -V 4 '%s' " TeX-run-command t nil))
;  (add-to-list 'TeX-command-list
;    '("View" "xdvi-ja '%d'" TeX-run-command t nil))
  (add-to-list 'TeX-view-program-selection '(output-pdf "Zathura"))
  (add-to-list
   'TeX-command-list 
   '("Nomenclature" "makeindex %s.nlo -s nomencl.ist -o %s.nls"
	 (lambda (name command file)
	   (TeX-run-compile name command file)
	   (TeX-process-set-variable file 'TeX-command-next TeX-command-default))
	 nil t :help "Create nomenclature file"))
  (TeX-source-correlate-mode 1) ; activate forward/reverse search on PDF
  (TeX-PDF-mode 1)
  (TeX-fold-mode 1)
  ;; Pretty printer for LaTeX symbols
  (setq prettify-symbols-unprettify-at-point 'right-edge)
  (setq prettify-symbols-alist
		(append '(("\\par" . ?⏎)
				  ("\\pm" . ?±)
				  ("\\coloneqq" . ?≔)
				  ("\\coloneq" . (?: (cr cl -20 -8) ?-))
				  ("\\bigoplus" . ?⨁)
				  ("\\bigotimes" . ?⨂)
				  ("\\dots" . ?⋯)
				  ("\\varnothing" . ?∅))
				prettify-symbols-alist))
  (prettify-symbols-mode 1)
  ;; Disable auto-indent in hitting Return
  (electric-indent-mode -1)
  ;; extra outline headers 
  (outline-minor-mode t)
  (setq TeX-outline-extra
		'(("^\\\\begin{thebibliography}" 2)
		  ("^\\\\end{thebibliography}" 2)))
  ;; RefTex
  (turn-on-reftex)
  (add-to-list 'company-backends '(company-reftex-labels company-reftex-citations))
  ;; flyspell setting
  (flyspell-mode 1)
  (defun my-add-flyspell-tex-command-regexp (e)
	"Append E to the head of flyspell-tex-command-regexp."
	(setq flyspell-tex-command-regexp
	  (concat
	   (substring flyspell-tex-command-regexp 0 2)
	   e
	   "\\|"
	   (substring flyspell-tex-command-regexp 2))))
  (with-eval-after-load "ispell"
	(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
  ;; cleveref package
  (TeX-add-style-hook "cleveref"
    (lambda ()
	  (if (boundp 'reftex-ref-style-alist)
       (add-to-list
        'reftex-ref-style-alist
        '("Cleveref" "cleveref"
          (("\\cref" ?c) ("\\Cref" ?C) ("\\cpageref" ?d) ("\\Cpageref" ?D)))))
	  (reftex-ref-style-activate "Cleveref")
	  (add-to-list 'reftex-ref-style-default-list "Cleveref")
	  (TeX-add-symbols
	   '("cref" TeX-arg-ref)
	   '("Cref" TeX-arg-ref)
	   '("cpageref" TeX-arg-ref)
	   '("Cpageref" TeX-arg-ref))
	  (with-eval-after-load "flyspell"
		(my-add-flyspell-tex-command-regexp "[cC]\\(page\\)?ref[ 	]*{"))
	  ))
  (TeX-run-style-hooks "cleveref")
  )
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)

;; shell-escape enabled using file local variable
(with-eval-after-load 'tex
  (add-to-list 'safe-local-variable-values
               '(TeX-command-extra-options . "-shell-escape")))

;; Turn on RefTeX in AUCTeX
; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Activate nice interface between RefTeX and AUCTeX
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

