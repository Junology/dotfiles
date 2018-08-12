;; ---------------
;; Window Setting
;; ---------------
;; font setting
(when (display-graphic-p) (progn
  (set-default-font "Monospace-12")
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("Takaoゴシック" . "unicode-bmp"))))

;; Compute a better frame size from the display resolution
(defvar workarea-list
  (assq 'workarea (car (display-monitor-attributes-list))))
(unless workarea-list
  (lambda ()
	(setq workarea-list
		  (0 0 (x-display-pixel-width) (x-display-pixel-height)))))

(defconst workarea-left (nth 1 workarea-list))
(defconst workarea-top (nth 2 workarea-list))
(defconst workarea-width (nth 3 workarea-list))
(defconst workarea-height (nth 4 workarea-list))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (when (display-graphic-p)
	(progn
      (add-to-list 'default-frame-alist
                   (cons 'width (max 80 (/ (/ workarea-width 1.5)
                                           (frame-char-width)))))
	  (add-to-list 'default-frame-alist 
				   (cons 'height (/ (- workarea-height 20)
									(frame-char-height)))))))

(set-frame-size-according-to-resolution)

;; misc
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq truncate-partial-width-windows nil)
