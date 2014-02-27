#lang racket
(require gigls/unsafe)

;;;Problem 1

(define canvas (image-new 300 300))
(define t (turtle-new canvas))
(turtle-teleport! t 50 50)
(turtle-face! t 0)
(turtle-set-brush! t "Pixel (1x1 square)")
(image-show canvas)

(define one-side
  (lambda (turtle side-length sides)
    (turtle-forward! turtle side-length)
    (turtle-turn! turtle (/ 360 sides))))

(define turtle-polygon!
  (lambda (turtle side-length sides)
    (repeat! sides one-side turtle side-length sides)))


;;;Problem 2

(define one-polygon
  (lambda (turtle side-length sides angle)
    (o (turtle-polygon! turtle side-length sides) (turtle-turn! turtle angle))))

(define turtle-reset!
  (lambda (turtle angle)
    (turtle-face! turtle angle)))

(define turtle-spin-polygon!
  (lambda (turtle side-length sides angle copies)
    (o (turtle-reset! t 0) (repeat! copies one-polygon turtle side-length sides angle))))



;;;Problem 3

(define turtle-scale-polygon!
  (lambda (turtle initial-side-length sides scale-factor copies)
    (map (lambda (x) (turtle-polygon! turtle x sides))
         (map (lambda (x) (* initial-side-length x))
              (map (lambda (x) (expt scale-factor x))
                   (iota copies))))))



;;;Problem 4

;;; Procedure
;;;      turtle-centered-polygon!
;;; Parameters
;;;      turtle, name of the turtle
;;;      radius, a real number
;;;      sides,  an integer
;;; Purpose
;;;      To create a polygon
;;; Produces
;;;      a polygon of radius and sides inputed
;;; Preconditions
;;;      turtle-polygon! draws the first side of the polygon before turning
;;;      [sides > 0]
;;; Postconditions
;;;      polygon has more than two sides
;;;      polygon is enclosed

(define turtle-centered-polygon!
  (lambda (turtle radius sides)
    (let ([interior-angle (/ (* 180 (- sides 2)) sides)])                    ;This is necessary to get the interior angle
      (turtle-up! turtle)                                                    ;This is necessary so that it moves to the edge without drawing a line
      (turtle-forward! turtle radius)                                        ;Turtle goes to the edge
      (turtle-down! turtle)                                                  ;Brings the brush down
      (turtle-turn! turtle (- 180 (/ interior-angle 2)))                     ;Makes the turtle turn
      (turtle-polygon! turtle (* 2 radius (sin (/ pi sides))) sides)         ;It find the side length of the polygon by getting the hypotenuse of a triangle made by the radius
      (turtle-turn! turtle (/ interior-angle 2))                             ;Makes the turtle turn
      (turtle-up! turtle)                                                    ;Pulls the brush up
      (turtle-forward! turtle radius)                                        ;Brings turtle to center without drawing a line
      (turtle-turn! turtle 180)                                              ;Brings back to original angle
      (turtle-down! turtle))))                                               ;Puts brush down             


;;;Problem 5

(define one-centered-polygon
  (lambda (turtle radius sides angle)
    (o (turtle-centered-polygon! turtle radius sides) (turtle-turn! turtle angle))))  

(define turtle-spin-centered-polygon!
  (lambda (turtle radius sides angle copies)
    (o (turtle-reset! t 30) (repeat! copies one-centered-polygon turtle radius sides angle) )))

(define turtle-scale-centered-polygon!
  (lambda (turtle initial-radius sides scale-factor copies)
    (map (lambda (x) (turtle-centered-polygon! turtle x sides))
         (map (lambda (x) (* initial-radius x))
              (map (lambda (x) (expt scale-factor x))
                   (iota copies))))))

;;;Problem 6

(define turtle-spin-and-scale-centered-polygon!
  (lambda (turtle initial-radius sides angle scale-factor copies)
    (map (lambda (x) (one-centered-polygon turtle x sides angle))
         (map (lambda (x) (* initial-radius x))
              (map (lambda (x) (expt scale-factor x))
                   (iota copies))))))


;;;Problem 7

(define canvas (image-new 300 300))
(define t (turtle-new canvas))
(turtle-face! t 0)
(turtle-set-brush! t "Pixel (1x1 square)")
(image-show canvas)

(define one-side
  (lambda (turtle side-length sides)
    (turtle-forward! turtle side-length)
    (turtle-turn! turtle (/ 360 sides))))

(define turtle-polygon!
  (lambda (turtle side-length sides)
    (repeat! sides one-side turtle side-length sides)))

(define turtle-centered-polygon!
  (lambda (turtle radius sides)
    (let ([interior-angle (/ (* 180 (- sides 2)) sides)])
      (turtle-up! turtle)
      (turtle-forward! turtle radius)
      (turtle-down! turtle)
      (turtle-turn! turtle (- 180 (/ interior-angle 2)))
      (turtle-polygon! turtle (* 2 radius (sin (/ pi sides))) sides)
      (turtle-turn! turtle (/ interior-angle 2))
      (turtle-turn! turtle 100))))

(define one-centered-polygon
  (lambda (turtle radius sides angle)
    (o (turtle-centered-polygon! turtle radius sides) (turtle-turn! turtle angle))))

(define turtle-reset!
  (lambda (turtle angle left top)
    (o (turtle-turn! turtle angle) (turtle-teleport! turtle left top))))

(define creative-spiral!
  (lambda (turtle initial-radius sides angle scale-factor copies color left top)
    (o (turtle-reset! turtle 0 left top) (turtle-set-color! turtle color) (map (lambda (x) (one-centered-polygon turtle x sides angle))
                                                                               (map (lambda (x) (* initial-radius x))
                                                                                    (map (lambda (x) (expt scale-factor x))
                                                                                         (iota copies)))))))

(define creative-polygon!
  (lambda (turtle initial-radius sides angle scale-factor copies spiral-copies color left top)
    (repeat! spiral-copies creative-spiral! turtle initial-radius sides angle scale-factor copies color left top)))
