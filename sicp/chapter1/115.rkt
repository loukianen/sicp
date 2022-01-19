#lang racket

(#%require rackunit)

(define (cube x) (* x x x))

(define (p x) 
  (set! count (+ 1 count))
  (- (* 3 x) (* 4 (cube x))))

(define (abs x)
  (if (< x 0) (* x -1) x))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

#| Tests |#
(define count 0)

(sine 12.15)
(check-equal? count 5)

#|
Procedure p is called 5 times.
The argument decreases by a factor of 3 on each iteration, so after n iterations it will decrease by a factor of 3^n.
The orders of growth of the space and the number of steps growth is O(log n).
|#