#lang racket
(require gigls/unsafe)

;Time:
;11:29 p.m - 12:03 p.m
;12:20 a.m - 4:00  a.m 
;1:00  p.m - 1:15  p.m
;2:03  p.m - 2:40  p.m
;9:57  p.m - 11:40 p.m
;2:28  p.m - 4:00  p.m
;6:00  p.m - 7:00  p.m
;7:40  p.m - 10:30 p.m 

;Problem1 [x]
;Problem2 [x]
;Problem3 [x]
;Problem4 [x]
;Problem5 [x]
;Problem6 []
;Problem7 []
;Problem8 []
;Problem9 []
;Problem10[]
;____________________________________________________________________________________________
;Problem1 [Done]

;a. 

(define fold-right
  (lambda (proc lst)
    (if (null? (cdr lst))
        (car lst)
        (proc (car lst) (fold-right proc (cdr lst))))))

;Examples:
;> (fold-right + (list 1 2 3 4))
;10
;> (fold-right list (list 'a 'b 'c 'd 'e))
;(a (b (c (d e))))
;(fold-right + (list 43 2 4 4))
;53

;b. 

(define fold-left
  (lambda (proc lst)
    (let kernel ((so-far (car lst))
                 (remaining (cdr lst)))
      (if (null? remaining)
          so-far
          (kernel (proc so-far (car remaining)) 
                  (cdr remaining))))))

;Examples: 
;> (fold-left - (list 1 2 3 4))
;-8
;> (fold-left list (list 'a 'b 'c 'd 'e))
;((((a b) c) d) e)
;> (fold-left + (list 431 0 335 45))
;811

;____________________________________________________________________________________________
;Problem2 [Done]

(define tree-all? 
  (lambda (pred? tree)
    (if (pair? tree)
        (and 
         (tree-all? pred? (car tree)) 
         (tree-all? pred? (cdr tree))) 
        (pred? tree)))) 

;;; credit to the reading from "Trees"


;____________________________________________________________________________________________
;Problem3  [Done]

(define negate
  (lambda (pred?)
    (lambda (val)
      (not (pred? val)))))

(define select
  (lambda (lst pred?)
    (cond
      ((null? lst)
       null)
      ((pred? (car lst))
       (cons (car lst) (select (cdr lst) pred?)))
      (else
       (select (cdr lst) pred?)))))

(define list-member?
  (lambda (val lst)
    (and (not (null? lst))
         (or (equal? val (car lst))
             (list-member? val (cdr lst))))))
;;; Procedure:
;;;   list-subtract
;;; Parameters:
;;;   lst1, a list 
;;;   lst2, a list
;;; Purpose:
;;;   To remove the values in lst1 from lst2
;;; Produces:
;;;   A list
;;; Preconditions:
;;;   lst1 and lst2 are lists
;;; Postconditions:
;;;   The list produced contain all the values in lst2, except the ones in lst1. 
;;; Practicum:
;;;    > (list-subtract (list "red" "yellow") (list "brown" 'null "yellow" 4 "blue"))
;;;    > '("brown" null 4 "blue")
;;; Process:
;;;    This procedure removes any value lst2 that is found in lst1, then produces
;;;    a list of all the other values in lst2.

(define list-subtract
  (lambda (lst1 lst2)
    (select lst2 (negate (r-s list-member? lst1)))))


;____________________________________________________________________________________________
;Problem4  [Done]

;a. [done]
;;; Procedure:
;;;   smallest
;;; Parameters:
;;;   lst, a list
;;;   may-procede?, a numeric or string procedure
;;; Purpose:
;;;   To find the smallest element of a list
;;; Produces:
;;;   The smallest value of the list
;;; Preconditions:
;;;   The list is a list that cooresponds with the may-procede? procedure.
;;;   If may-procede? calls for strings, then the list should contain only strings.
;;;   If may-procede? calls for numbers, then the list should contain only numbers.
;;; Postconditions:
;;;   The result should be the same type as the elements in the list.

(define smallest
  (lambda (lst may-precede?)
    (if (= (length lst) 1)
        ;(null? (cdr lst))
        (car lst)
        (let ([smallest-remaining (smallest (cdr lst) may-precede?)])
          (if (may-precede? (car lst) smallest-remaining)
              (car lst) 
              smallest-remaining)))))
;b. 

;Every time the procedure is recursed, it has to find the length of the list and then 
;find if it is equal to 1. If it just asked if the cdr of the list is null, then it only 
;has to do one check. 

;From Analyzing Procedures reading.
(define counter-new  
  (lambda (name)
    (vector name 0)))

;From Analyzing Procedures reading.
(define counter-count!
  (lambda (counter)
    (vector-set! counter 1 (+ 1 (vector-ref counter 1)))
    counter))

;From Analyzing Procedures reading.
(define counter-get
  (lambda (counter)
    (vector-ref counter 1)))

;From Analyzing Procedures reading.
(define counter-reset!
  (lambda (counter)
    (vector-set! counter 1 0)
    counter))

;From Analyzing Procedures reading.
(define counter-print!
  (lambda (counter)
    (display (vector-ref counter 0))
    (display ": ")
    (display (vector-ref counter 1))
    (newline)))

(define my-length-counter (counter-new "my-length"))

(define my-length
  (lambda (lst)
    (counter-count! my-length-counter)
    (if (null? lst) 
        0
        (+ 1 (my-length (cdr lst))))))

(define smallest2
  (lambda (lst may-precede?)
    (if (= (my-length lst) 1)
        (car lst)
        (let ([smallest-remaining (smallest2 (cdr lst) may-precede?)])
          (if (may-precede? (car lst) smallest-remaining)
              (car lst) 
              smallest-remaining)))))

;c

(define re-null?
  (lambda (value)
    (counter-count! re-null?-counter)
    (eq? null value)))

(define re-null?-counter (counter-new "re-null?"))

(define smallest3
  (lambda (lst may-precede?)
    (if (re-null? (cdr lst))
        (car lst)
        (let ([smallest-remaining (smallest (cdr lst) may-precede?)])
          (if (may-precede? (car lst) smallest-remaining)
              (car lst) 
              smallest-remaining)))))


;Examples:
;> (smallest2 (list 5 1 2 3 4 0 6) <=)
;0
;> (counter-print! my-length-counter)
;my-length: 35
;> (smallest3 (list 5 1 2 3 4 0 6) <=)
;0
;> (counter-print! re-null?-counter)
;re-null?: 1


;____________________________________________________________________________________________
;Problem5  [Done w/ 1 lambda]

;a. 

(define kitty 
  (image-load "/home/kittaneh17/Desktop/kitten2.png"))


(define image-steg-decode
  (lambda (steg-image)
    (image-variant steg-image (l-s modulo (expt 2 5)))
    (image-show
     (image-variant steg-image (l-s * 32)))
    ))


;____________________________________________________________________________________________
;Problem6  [Incomplete]

;The overly simple way:
(define cube-root-simple
  (lambda (n)
    (expt n (/ 1 3))))

;The way you probably want us to do it:
(define cube-root
  (lambda (lower upper)
    ;(let* ( 
    ; [lower 0]
    ; [upper n]
    ; [average (/ (+ upper lower) 2)]
    ; [cubed (expt average 3)]
    ; )
    (cond 
      [(> (expt (/ (+ lower upper) 2) 3) upper)
       (cube-root lower (/ (+ lower upper) 2))]
      [(< (expt (/ (+ lower upper) 2) 3) upper)
       (cube-root (/ (+ lower upper) 2) upper)]
      [else (/ (+ lower upper) 2)])))



;_________________________________________________________________________
;Problem7  [......I don't know how to get image-set-pixel! to work with random]

;(stencil-quarter-circle radius n color)

(define canvas
  (image-new 200 200))

(define stencil-quarter-circle
  (lambda (radius n color)
    (cond 
      [(eq? n 0)
       "done"]
      [(> n 0)
       (image-set-pixel! canvas (floor (random radius)) (floor (random radius)) color)]
      [else (stencil-quarter-circle radius (- n 1) color)])))


;____________________________________________________________________________________________
;Problem8  [can't do this without finishing 7]




;____________________________________________________________________________________________
;Problem9  [Incomplete, all of these are failed attempts]


;For the record, I have made five ways to infinatly recurse


(define all-substrings
  (lambda (str len)
    (cond
      [(> len (string-length str))
       "Error: substrings cannot be longer than given string."]
      [(< len (string-length str))
       (list (substring str (- len len) len))]
      [else (all-substrings str (increment len))])))

(define all-substrings2
  (lambda (str len)
    (let ([start 0])
      (cond 
        [(> len (string-length str))
         "Error: substrings cannot be longer than given string."]
        [(eq? start (string-length str))
         null]     
        [else 
         (append 
          (list (substring str start len)) 
          (all-substrings2 str len))
         (increment start)]
        ))))

(define all-substrings3
  (lambda (str len)
    (let ([start 0])
      (if (> start (string-length str))
          null
          (
           (append (list (substring str start (+ start len))))
           (increment start)
           (all-substrings3 str len)
           )))))



(define all-substrings5
  (lambda (str len) 
    (letrec ((kernel 
              (lambda (start) 
                (if (> start (string-length str))
                    null 
                    ((append (list (substring str start (+ start len)))) 
                     (increment start) 
                     (all-substrings3 str len) 
                     )))))
      (kernel 0))))

(define all-substrings6
  (lambda (str len) 
    (letrec 
        [(kernel (lambda (start) 
                   (if 
                    (> start (string-length str)) 
                    null 
                    ((append (list (substring str start (+ start len)))) 
                     (increment start) 
                     (all-substrings3 str len)))))]
      (kernel 0))))

;____________________________________________________________________________________________
;Problem10





