#lang racket
(require gigls/unsafe)
(provide (all-defined-out))

;;; File:
;;;   lists-of-drawings-lab.scm
;;; Authors:
;;;   Samuel A. Rebelsky
;;;   Jerod Weinman
;;;   YOUR NAME(S) HERE
;;; Summary:
;;;   Code for the lab entitled "Making and Manipulate Lists of Drawings"

; +--------------------+--------------------------------------------------------
; | Testing Procedures |
; +--------------------+

;;; Procedure:
;;;   check-drawing
;;; Parameters:
;;;   drawing, a drawing
;;; Purpose:
;;;   Renders drawing in an appropriately-sized image, making it useful 
;;;   for testing various drawings.
;;; Produces:
;;;   image, an image
;;; Preconditions:
;;;   [No additional]
;;; Postconditions:
;;;   image is a new image
;;;   image contains a rendering of drawing
;;;   image is visible on the screen
(define check-drawing
  (lambda (drawing)
    (image-show 
     (drawing->image drawing 
                     (max 100
                          (inexact->exact (ceiling (drawing-right drawing))))
                     (max 100
                          (inexact->exact (ceiling (drawing-bottom drawing))))))))

;;; Procedure:
;;;   check-drawings
;;; Parameters:
;;;   drawings, a non-empty list of drawings [unverified]
;;; Purpose:
;;;   Renders all the drawings in an image, making it useful 
;;;   for testing.
;;; Produces:
;;;   image, an image
;;; Preconditions:
;;;   The check-drawing procedure is defined.
;;; Postconditions:
;;;   image is a new image
;;;   image contains a rendering of all the drawings in drawings.
;;;   image is visible on the screen
(define check-drawings
  (lambda (drawings)
    (check-drawing (drawing-compose drawings))))

; +--------------------+--------------------------------------------------------
; | Simple Computation |
; +--------------------+

(define times5 (lambda (x) (* 5 x)))
(define times10 (lambda (x) (* 10 x)))
(define times20 (lambda (x) (* 20 x)))

(define mod5 (lambda (x) (mod x 5)))
(define mod7 (lambda (x) (mod x 7)))
(define mod20 (lambda (x) (mod x 20)))

; +---------------+-------------------------------------------------------------
; | Sample Values |
; +---------------+


(define sample-square
    (drawing-vshift
     (drawing-scale drawing-unit-square 6)
     25))

(define sample-circle
    (drawing-vshift
     (drawing-scale drawing-unit-circle 8)
     50))

(define ten-circles
  (make-list 10 sample-circle))

(define list01 (list 0 10 20 30 40 50 60 70 80 90))
(define list02 (list 10 25 33 45 60 100 110 111 112 120))
(define ten-circles-01 (map drawing-hshift ten-circles list01))
(define ten-circles-02 (map drawing-hshift ten-circles list02))
(define ten-circles-03 (map drawing-vshift ten-circles list01))
(define ten-circles-04 (map drawing-vshift ten-circles list02))
(define ten-circles-05 (map drawing-vshift ten-circles-02 list01))
(define ten-circles-06 (map drawing-hshift ten-circles-01 list01))

(define vee 
       (map increment (append (iota 25) 
                     (reverse (iota 24)))))

(define vee-circles 
  (
                                         