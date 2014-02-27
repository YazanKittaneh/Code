#lang racket
(require gigls/unsafe)
(define grid (image-show (image-new 3 3)))
(define canvas (image-show (image-new 200 200)))
(define picture 
  (image-show (image-load "/home/rebelsky/MediaScheme/Images/kitten.png")))

(image-set-pixel! grid 0 0 (rgb-new 192 0 0))
(image-set-pixel! grid 1 0 (rgb-new 192 0 192))
(image-set-pixel! grid 2 0 (rgb-new 0 0 192))
(image-set-pixel! grid 0 1 (rgb-new 192 192 0))
(image-set-pixel! grid 1 1 (rgb-new 0 192 192))
(image-set-pixel! grid 2 1 (rgb-new 255 255 255))
(image-set-pixel! grid 0 2 (rgb-new 0 192 0))
(image-set-pixel! grid 1 2 (rgb-new 0 0 0))
(image-set-pixel! grid 2 2 (rgb-new 192 192 192))

(define rgb-brightness
  (lambda (color)
    (round (* 100 (/ (+ (* 0.30 (rgb-red color))
                        (* 0.59 (rgb-green color))
                        (* 0.11 (rgb-blue color)))
                     255)))))
(define rgb-brighter?
  (lambda (color1 color2)
    (> (rgb-brightness color1) (rgb-brightness color2))))
(define rgb-brighter-2
  (lambda (color1 color2)
    (if (rgb-brighter? color1 color2) color1 color2)))

(define grey0 (rgb-new 0 0 0))
(define grey1 (rgb-new 96 96 96))
(define grey2 (rgb-new 192 192 192))
(define grey3 (rgb-new 255 255 255))

(define rgb-4grey 
  (lambda (color)
    (if (> 25 (rgb-brightness color))
        (grey0)
        (if (> 50 (rgb-brightness color) 25)
         (grey1)
         (if (> 75 (rgb-brightness color) 50)
          (grey2)
          (if (>= (rgb-brightness color) 75)
           (grey3)
            (grey3)))))))