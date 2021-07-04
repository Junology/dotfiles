;; ---------------
;; Window Setting
;; ---------------

;; misc
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq truncate-partial-width-windows nil)

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

(defconst suggested-width
  (truncate (max (/ workarea-width 1.5)
				 (* 80 (frame-char-width)))))
(defconst suggested-height
  (- workarea-height 20))

(defun set-default-frame-size-according-to-resolution ()
  (interactive)
  (when (display-graphic-p)
	(progn
	  (setq default-frame-alist
			'(
              (width . (text-pixels . suggested-width))
			  (height . (text-pixels . suggested-height)))))))

(when (display-graphic-p)
  (progn
	(set-default-frame-size-according-to-resolution)
	(set-frame-size (selected-frame) suggested-width suggested-height t)))

(when (require 'image-mode nil :noerror)
  (setq image-auto-resize "fit-width"))

