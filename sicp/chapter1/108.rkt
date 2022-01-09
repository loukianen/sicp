#lang sicp

(#%require rackunit)

(define (square x) (* x x))
(define (cube x) (* x x x))

(define (abs x)
  (if (< x 0) (- x) x))

(define (good-enough? guess x)
  (< (/ (abs (- (cube guess) x))
        x)
      0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (cbrt x)
        (cbrt-iter 1.0 x))

#| Tests |#
(define-simple-check (check-within-tolerance? value exp-value tolerance)
                     (and (< (/ value exp-value) (+ 1 tolerance))
                          (> (/ value exp-value) (- 1 tolerance))))

(check-within-tolerance? (cbrt 0.000000008) 0.002 0.001)
(check-within-tolerance? (cbrt 8000000000000000) 200000 0.001)
