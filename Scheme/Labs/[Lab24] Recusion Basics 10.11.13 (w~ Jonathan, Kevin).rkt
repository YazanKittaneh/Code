#lang racket
(require gigls/unsafe)

;;; File:
;;;   recursion-basics-lab.scm
;;; Authors:
;;;   Janet Davis
;;;   Samuel A. Rebelsky
;;;   Jerod Weinman
;;;   YOUR NAME HERE
;;; Summary:
;;;   Code for the lab entitled "Recursion Basics"

; +-----------------+-----------------------------------------------------------
; | Color Utilities |
; +-----------------+

;;; Procedure:
;;;   rgb-dark?
;;; Parameters:
;;;   color, an RGB color
;;; Purpose:
;;;   Determine if the color appears dark.
;;; Produces:
;;;   dark?, a Boolean
;;; Preconditions:
;;;   [No additional]
;;; Postconditions:
;;;   If color is relatively dark, then dark? is #t.
;;;   Otherwise, dark? is #f.
(define rgb-dark?
  (lambda (color)
     (> 33 (rgb-brightness color))))

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
;;;   sum
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
(define sum
  (lambda (numbers)
    (if (null? numbers)
        0
        (+ (car numbers) (sum (cdr numbers))))))

; +------------------+----------------------------------------------------------
; | Filtering Colors |
; +------------------+

;;; Procedure:
;;;   rgb-filter-out-dark
;;; Parameters:
;;;   colors, a list of RGB colors.
;;; Purpose:
;;;   Create a new list of colors, consiting only of non-dark colors.
;;; Produces:
;;;   not-dark, a list of RGB colors.
;;; Preconditions:
;;;   rgb-dark? is defined.
;;; Postconditions:
;;;   Every element of not-dark appears in colors.
;;;   If (not (rgb-dark? (list-ref colors i))) holds for some i,
;;;     then the corresponding color appears in not-dark.
(define rgb-filter-out-dark
  (lambda (colors)
    (cond
     ((null? colors)
      null)
     ((rgb-dark? (car colors))
      (rgb-filter-out-dark (cdr colors)))
     (else
      (cons (car colors) (rgb-filter-out-dark (cdr colors)))))))

(define my-colors
  (map color->rgb
       (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"
             "black" "white" "grey" "purple")))

(define list-length
  (lambda (list)
    (if
      (null? list)
       0
      (+ 1 (list-length (cdr list))))))

(define product
 (lambda (numbs)
    (if (null? numbs)
        1
        (* (car numbs) (sum (cdr numbs))))))

(define rgb-tally-dark
  (lambda (colors)
    (if (null? colors)
        0
        (+ 1 (rgb-tally-dark (car colors))))))
                        