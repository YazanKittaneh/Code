#lang racket
(require gigls/unsafe)
(define canvas (image-show (image-new 20 20)))
(let* ([row 1]
       [alpha (rgb-new 0 255 0)]
       [beta (rgb-redder alpha)]
       [gamma (rgb-redder beta)]
       [delta (rgb-redder gamma)]
       [epsilon (rgb-redder delta)])
  (image-set-pixel! canvas 0 row alpha)
  (image-set-pixel! canvas 1 row beta)
  (image-set-pixel! canvas 2 row gamma)
  (image-set-pixel! canvas 3 row delta)
  (image-set-pixel! canvas 4 row epsilon))

(for-each (rgb-redder (rgb-new 0 255 0)) (list "alpha" "beta" "gamma" "delta" "epsilon"))

(image-refresh-display! canvas)