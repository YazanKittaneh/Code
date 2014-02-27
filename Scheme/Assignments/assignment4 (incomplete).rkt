#lang racket
(require gigls/unsafe)

;;; PART 1

(define sample-square
  (drawing-vshift (drawing-scale drawing-unit-square 50) 25))

(define list-of-colors
  (list "red" "blue" "maroon" "white" "yellow" "orange" "purple" "green" "pink" "brown"))

(define times5 (lambda (x) (* x 100)))

(define visualize-colors 
  (lambda (y x)
    (image-show 
     (drawing->image
  (drawing-compose 
   (map drawing-recolor
   (map drawing-hshift (make-list x sample-square)
                        (map times5 (map increment (iota x))))
   y))1000 100))))


;;; PART 2

