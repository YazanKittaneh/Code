#lang racket
(require gigls/unsafe)
(define canvas
    (image-new 4 3)
  )
(image-show canvas)

(define fave1 (color-name->rgb "moccasin"))
(define fave2 (color-name->rgb "sienna"))
(define fave3 (color-name->rgb "peru"))

(image-set-pixel! canvas 0 1 (rgb-lighter fave1))
(image-set-pixel! canvas 1 1  fave1)
(image-set-pixel! canvas 2 1 (rgb-darker fave1))
(image-set-pixel! canvas 0 0  fave1)

(image-set-pixel! canvas 0 0 
                  (rgb-darker (image-get-pixel canvas 0 0)))
(image-transform-pixel! canvas 1 1 rgb-darker)

(define c0 (rgb-new 64 128 196))
(define c1 (rgb-new 32 96 255))
(define c2 (rgb-new 240 0 127))

(define newcolor1 (rgb-darker (rgb-complement fave1)))
(define newcolor2 (rgb-complement (rgb-darker fave1)))

(image-set-pixel! canvas 0 0 (rgb-new 5 0 165))
(image-set-pixel! canvas 1 0 (rgb-new 255 0 0))
(image-set-pixel! canvas 2 0 (rgb-new 0 159 0))
(image-set-pixel! canvas 3 0 (rgb-new 123 0 255))
(image-set-pixel! canvas 0 1 (rgb-new 255 2 255))
(image-set-pixel! canvas 1 1 (rgb-new 255 0 96))
(image-set-pixel! canvas 2 1 (rgb-new 100 255 100))
(image-set-pixel! canvas 3 1 (rgb-new 0 255 255))
(image-set-pixel! canvas 0 2 (rgb-new 25 12 195))
(image-set-pixel! canvas 1 2 (rgb-new 127 195 245))
(image-set-pixel! canvas 2 2 (rgb-new 200 63 127))

(image-transform-pixel! canvas 0 0 rgb-complement)
(image-transform-pixel! canvas 0 1 rgb-complement)
(image-transform-pixel! canvas 0 2 rgb-complement)

(image-transform-pixel! canvas 1 0 rgb-complement)
(image-transform-pixel! canvas 1 1 rgb-complement)
(image-transform-pixel! canvas 1 2 rgb-complement)

(image-transform-pixel! canvas 2 0 rgb-complement)
(image-transform-pixel! canvas 2 1 rgb-complement)
(image-transform-pixel! canvas 2 2 rgb-complement)

(image-transform-pixel! canvas 0 0 rgb-complement)
(image-transform-pixel! canvas 0 1 rgb-complement)
(image-transform-pixel! canvas 0 2 rgb-complement)

(image-transform-pixel! canvas 1 0 rgb-complement)
(image-transform-pixel! canvas 1 1 rgb-complement)
(image-transform-pixel! canvas 1 2 rgb-complement)

(image-transform-pixel! canvas 2 0 rgb-complement)
(image-transform-pixel! canvas 2 1 rgb-complement)
(image-transform-pixel! canvas 2 2 rgb-complement)

(image-transform-pixel! canvas 0 0 rgb-complement)
(image-transform-pixel! canvas 0 1 rgb-complement)
(image-transform-pixel! canvas 0 2 rgb-complement)

(image-transform-pixel! canvas 1 0 rgb-complement)
(image-transform-pixel! canvas 1 1 rgb-complement)
(image-transform-pixel! canvas 1 2 rgb-complement)

(image-transform-pixel! canvas 2 0 rgb-complement)
(image-transform-pixel! canvas 2 1 rgb-complement)
(image-transform-pixel! canvas 2 2 rgb-complement)

(define greener2
  (lambda (color)
    (rgb-greener
     (rgb-greener
      (rgb-greener
       (rgb-darker
        (rgb-darker color)))))))

(define bound
  (lambda (val lower upper)
    (min (max val lower) upper)))
(define rgb-bound
  (lambda (rgb)
    (rgb-new (bound (rgb-red rgb) 64 192)
             (bound (rgb-green rgb) 64 192)
             (bound (rgb-blue rgb) 64 192))))

(define reddify 
  (lambda (redder color)
    (rgb-new 
     (+ (rgb-red color) redder)
     (rgb-green color)
     (rgb-blue color)
)))

(image-refresh-display! canvas)

