#lang racket
(require gigls/unsafe)

(define canvas (image-new 4 3))
(image-show canvas)

(define picture (image-load "/home/kittaneh17/Desktop/index.jpeg"))
;(image-show picture)
;(image-transform! canvas rgb-complement)
(image-set-pixel! canvas 0 1 (rgb-new 23 65 212))
(image-set-pixel! canvas 1 1 (rgb-new 12 111 69))
(image-set-pixel! canvas 2 1 (rgb-new 233 142 2))

;(image-show (image-variant canvas rgb-complement))
;(image-show (image-variant picture rgb-complement))
;(image-transform! canvas rgb-complement)
;(image-transform! picture rgb-complement)
;(image-transform! picture rgb-complement)
;(image-transform! canvas (o rgb-redder ))

(define redder-canvas (image-variant canvas rgb-redder))
(define not-redder-canvas (image-variant canvas (o rgb-complement 
                                                   rgb-redder 
                                                   rgb-complement)))
(image-show redder-canvas)
(image-show not-redder-canvas)

(image-refresh-display! canvas)

