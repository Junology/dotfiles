;; ---------------
;; Window Setting
;; ---------------
(when (display-graphic-p)
  (progn
	;; Fonts
	(create-fontset-from-ascii-font "DejaVu Sans Mono 16"nil "DejaVu_MPlusM_Noto")
	(set-fontset-font "fontset-DejaVu_MPlusM_Noto"
					  'unicode
					  (font-spec :family "DejaVu Sans Mono" :size 16))
	(set-fontset-font "fontset-DejaVu_MPlusM_Noto"
					  'unicode
					  (font-spec :family "M+ 1m" :size 16)
					  nil 'append)
	(set-fontset-font "fontset-DejaVu_MPlusM_Noto"
					  'unicode (font-spec :family "Noto Sans Mono" :size 16)
					  nil 'append)
	(add-to-list 'default-frame-alist
				 '(font . "fontset-DejaVu_MPlusM_Noto"))
	;; Frame size
	(add-to-list 'default-frame-alist
				 (cons 'width (cons 'text-pixels (max (* 120 (frame-char-width)) (/ (x-display-pixel-width) 1.5)))))
	(add-to-list 'default-frame-alist 
				 (cons 'height (cons 'text-pixels (- (x-display-pixel-height) 20))))
	(setq-default left-fringe-width 10)
	(set-window-buffer nil (current-buffer))
	;; Display line numbers
	(global-display-line-numbers-mode)
	(custom-set-faces
	 '(line-number ((t (:inherit (shadow default) :background "midnight blue" :foreground "white"))))
	 '(line-number-current-line ((t (:inherit line-number :background "firebrick" :foreground "white" :weight bold)))))
	;; misc
	(setq inhibit-splash-screen t)
	(tool-bar-mode -1)
	(menu-bar-mode -1)
	(setq truncate-partial-width-windows nil)))
