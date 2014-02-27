#lang racket
(require gigls/unsafe)
(define world (image-show (image-new 200 200)))
(define turtle1 (turtle-new world))
(define turtle-action-01!
  (lambda (turtle distance)
    (turtle-forward! turtle distance)
    (turtle-turn! turtle 73)))

(define turtle-action-02!
  (lambda (turtle angle)
    (turtle-forward! turtle 5)
    (turtle-turn! turtle angle)))

(define turtle-spiral!
  (lambda (turtle steps)
    (for-each (l-s turtle-action-02! turtle)
              (list-drop (iota (+ 1 steps)) 1))))


(turtle-set-color! turtle1 "blue")
;(for-each (l-s turtle-action-01! turtle1) ;angle 73
          ; (list-drop (iota 1000) 1))

(for-each (l-s turtle-action-02! turtle1) 
           (list-drop (iota 80) 1))