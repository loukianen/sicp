#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (abs x)
  (if (< x 0) (- x) x))

(define (good-enough? guess x)
  (< (/ (abs (- (square guess) x))
        x)
      0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
        (sqrt-iter 1.0 x))

#| The original way to evaluate good-enough |#
(define (original-good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))

(define (original-sqrt-iter guess x)
  (if (original-good-enough? guess x)
      guess
      (original-sqrt-iter (improve guess x)
                 x)))

(define (original-sqrt x)
        (original-sqrt-iter 1.0 x))

#| Tests |#
(define-simple-check (check-within-tolerance? value exp-value tolerance)
                     (and (< (/ value exp-value) (+ 1 tolerance))
                          (> (/ value exp-value) (- 1 tolerance))))

(define-simple-check (check-not-within-tolerance? value exp-value tolerance)
                     (or (> (/ value exp-value) (+ 1 tolerance))
                          (< (/ value exp-value) (- 1 tolerance))))

(check-within-tolerance? (sqrt 0.000004) 0.002 0.001)
(check-not-within-tolerance? (original-sqrt 0.000004) 0.002 0.001)

(check-within-tolerance? (sqrt 4000000000000) 2000000 0.001)
(check-within-tolerance? (original-sqrt 4000000000000) 2000000 0.001)

#| На больших и малых числах получает приемлемую точность вычислений |#
