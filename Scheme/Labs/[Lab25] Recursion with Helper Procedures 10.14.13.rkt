#lang racket
(require gigls/unsafe)

(provide (all-defined-out))

;;; File:
;;;   helper-recursion-lab.scm
;;; Authors:
;;;   Janet Davis
;;;   Samuel A. Rebelsky
;;;   Jerod Weinman
;;;   YOUR NAME HERE
;;; Summary:
;;;   Code for the lab entitled "Recursion with Helper Procedures"

; +------------------+----------------------------------------------------------
; | Turtle Utilities |
; +------------------+

(define turtle-step!
  (lambda (turtle)
    (turtle-forward! turtle 100)
    (turtle-turn! turtle 180)
    (turtle-forward! turtle 100)
    (turtle-turn! turtle 180)
    (turtle-turn! turtle 7)))

; +----------------+------------------------------------------------------------
; | Counting Steps |
; +----------------+
(define canvas (image-show (image-new 200 200)))
(define counter (turtle-new canvas))
(turtle-teleport! counter 100 100)
(define reset!
  (lambda ()
    (image-select-all! canvas)
    (image-clear-selection! canvas)
    (image-select-nothing! canvas)
    (context-update-displays!)
    (turtle-teleport! counter 100 100)
    (turtle-face! counter 0)))

(define rgb-brightest
  (lambda (colors)
    (turtle-step! counter)
    (rgb-brightest-helper (car colors) (cdr colors))))

(define rgb-brightest-helper
  (lambda (brightest-so-far colors-remaining)
    (if (null? colors-remaining)
        brightest-so-far
        (rgb-brightest-helper
         (if (>= (rgb-brightness brightest-so-far) 
                 (rgb-brightness (car colors-remaining)))
             brightest-so-far
             (car colors-remaining))
         (cdr colors-remaining)))))

;(define rgb-brightest
;  (lambda (colors)
;    (cond
;      ((null? (cdr colors))
;       (car colors))
;      ((>= (rgb-brightness (car colors)) 
;           (rgb-brightness (rgb-brightest (cdr colors))))
;       (car colors))
;      (else
;       (rgb-brightest (cdr colors))))))

; +-----------------+-----------------------------------------------------------
; | Color Utilities |
; +-----------------+

;;; Procedure:
;;;   rgb-brightness
;;; Parameters:
;;;   color, an RGB color
;;; Purpose:
;;;   Computes the brightness of color on a 0 (dark) to 100 (light) scale.
;;; Produces:
;;;   b, an integer
;;; Preconditions:
;;;   color is a valid RGB color.  That is, each component is between
;;;     0 and 255, inclusive.
;;; Postconditions:
;;;   If color1 is likely to be perceived as lighter than color2,
;;;     then (brightness color1) > (brightness color2).
;;;   0 <= b <= 100
(define rgb-brightness
  (lambda (color)
    (round (* 100 (/ (+ (* 0.30 (rgb-red color))
                        (* 0.59 (rgb-green color))
                        (* 0.11 (rgb-blue color)))
                      255)))))

; +------------+----------------------------------------------------------------
; | Arithmetic |
; +------------+

;;; Procedure:
;;;   new-sum
;;; Parameters:
;;;   numbers, a list of numbers.
;;; Purpose:
;;;   Find the sum of the elements of a given list of numbers
;;; Produces:
;;;   total, a number.
;;; Preconditions:
;;;   All the elements of numbers must be numbers.
;;; Postcondition:
;;;   total is the result of adding together all of the elements of numbers.
;;;   If all the values in numbers are exact, total is exact.
;;;   If any values in numbers are inexact, total is inexact.
(define new-sum
  (lambda (numbers)
    (new-sum-helper 0 numbers)))

;;; Procedure:
;;;   new-sum-helper
;;; Parameters:
;;;   sum-so-far, a number.
;;;   remaining, a list of numbers.
;;; Purpose:
;;;   Add sum-so-far to the sum of the elements of a given list of numbers
;;; Produces:
;;;   total, a number.
;;; Preconditions:
;;;   All the elements of remaining must be numbers.
;;;   sum-so-far must be a number.
;;; Postcondition:
;;;   total is the result of adding together sum-so-far and all of the
;;;     elements of remaining.
;;;   If both sum-so-far and all the values in remaining are exact,
;;;     total is exact.
;;;   If either sum-so-far or any values in remaining are inexact,
;;;     total is inexact.
(define new-sum-helper
  (lambda (sum-so-far remaining)
     (if (null? remaining)
         sum-so-far
         (new-sum-helper (+ sum-so-far (car remaining))
                         (cdr remaining)))))

;;; Procedure:
;;;   difference
;;; Parameters:
;;;   lst, a list of numbers of the form (v1 v2 ... vn)
;;; Purpose:
;;;   Compute the difference of the values.
;;; Produces:
;;;   result, a number
;;; Preconditions:
;;;   lst is nonempty
;;;   lst contains only real numbers
;;; Postconditions:
;;;   result = v1 - v2 - v3 - ... - vn
(define difference
  (lambda (lst)
    (if (null? lst)
        0
        (- (car lst) (difference (cdr lst))))))

(define new-difference-helper
  (lambda (difference-so-far remaining)
    (if (null? remaining)
        difference-so-far
        (new-difference-helper (- difference-so-far (car remaining))
                               (cdr remaining)))))

(define new-difference
  (lambda (lst)
    (new-difference-helper 0 lst)))

(define newer-difference
  (lambda (lst)
    (new-difference-helper (car lst) (cdr lst))))

(define annotated-difference
  (lambda (lst)
    (annotated-difference-helper (car lst) (cdr lst))))
(define annotated-difference-helper
  (lambda (difference-so-far remaining)
    (write (list 'difference-helper difference-so-far remaining)) (newline)
    (if (null? remaining)
        difference-so-far
        (annotated-difference-helper (- difference-so-far (car remaining))
                                     (cdr remaining)))))

; +------------------+----------------------------------------------------------
; | Filtering Colors |
; +------------------+

(define rgb-filter-out-high-red
  (lambda (colors)
    (rgb-filter-out-high-red-helper null colors)))

(define rgb-filter-out-high-red-helper
  (lambda (colors-so-far remaining-colors)
    (cond
      ((null? remaining-colors)
       colors-so-far)
      ((<= 128 (rgb-red (car remaining-colors)))
       (rgb-filter-out-high-red-helper colors-so-far (cdr remaining-colors)))
      (else
       (rgb-filter-out-high-red-helper
         (cons (car remaining-colors) colors-so-far)
         (cdr remaining-colors))))))

(define my-color-names
  (map color->rgb
       (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"
             "black" "white" "grey" "purple" "brown")))

(define greys-4
  (map (lambda (n) (rgb-new (* 64 n) (* 64 n) (* 64 n)))
       (list 4 3 2 1)))
(define greys-8
  (map (lambda (n) (rgb-new (* 32 n) (* 32 n) (* 32 n)))
       (list 8 7 6 5 4 3 2 1)))
(define greys-16
  (map (lambda (n) (rgb-new (* 16 n) (* 16 n) (* 16 n)))
       (list 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)))

(define numb-list
  (list 1 2 3))

;;;Exercise 2.a

(define product-helper
  (lambda (product-so-far remainder)
  (if (null? remainder)
      product-so-far
      (product-helper (* product-so-far (car remainder))
                         (cdr remainder)))))

(define new-product
  (lambda (remainder)
    (product-helper 1 remainder)))

;;;Exercise 2.b
(define quotient-helper
  (lambda (quotient-so-far remainder)
  (if (null? remainder)
      quotient-so-far
      (quotient-helper (/ quotient-so-far (car remainder))
                         (cdr remainder)))))

(define my-quotient
  (lambda (remainder)
    (quotient-helper 1 remainder)))

;;;Exercise 3
(define sum-red
  (lambda (colors)
     (sum-red-helper 0 colors)))

(define sum-red-helper 
  (lambda (sum-so-far remaining-colors)
    (if (null?  (rgb-filter-out-high-red remaining-colors))
        sum-so-far
        (sum-red-helper (+ sum-so-far (rgb-red(car remaining-colors)))
                         (cdr remaining-colors)))))

     
;;;Exercise 4
(define more-colors
  (map color-name->rgb (list "red" "green" "blue" "yellow" "black" "white")))


;;;Exercise 5

(define grays-4 (reverse greys-4))
(define grays-8 (reverse greys-8))


 