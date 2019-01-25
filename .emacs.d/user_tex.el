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
(setq TeX-output-view-style '(("^dvi$" "." "xdvi-ja '%d'")))
(setq preview-image-type 'dvipng)
(add-hook 'LaTeX-mode-hook (function (lambda() (setq TeX-PDF-mode t))))
(add-hook 'LaTeX-mode-hook (function (lambda ()
  (add-to-list 'TeX-command-list
    '("pTeX" "ptex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (plain-tex-mode) :help "Run ASCII pTeX"))
  (add-to-list 'TeX-command-list
    '("pLaTeX" "platex %`%S%(PDFout)%(mode)%' %t"
     TeX-run-TeX nil (latex-mode) :help "Run ASCII pLaTeX"))
  (add-to-list 'TeX-command-list
    '("xpdf" "acroread '%s.pdf' " TeX-run-command t nil))
  (add-to-list 'TeX-command-list
    '("pdf" "dvipdfmx -V 4 '%s' " TeX-run-command t nil))
  (add-to-list 'TeX-command-list
    '("View" "xdvi-ja '%d'" TeX-run-command t nil)))))
(add-hook 'LaTeX-mode-hook '(lambda ()
    (TeX-fold-mode 1)
    (outline-minor-mode t)))
;; extra outline headers 
(setq TeX-outline-extra
    '(("^\\\\begin{thebibliography}" 2)
      ("^\\\\end{thebibliography}" 2)))

;; Turn on RefTeX in AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Activate nice interface between RefTeX and AUCTeX
(setq reftex-plug-into-AUCTeX t)

