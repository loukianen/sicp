#lang sicp

(#%require rackunit)

(define (square a) (* a a))
(define (sum-of-squares b c)
        (+ (square b) (square c)))
(define (solution x y z)
        (cond ((and (> x z) (> y z)) (sum-of-squares x y))
              ((and (> x y) (> z y)) (sum-of-squares x z))
              ((and (> y x) (> z x)) (sum-of-squares z y))
              (else 0)))

(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 4 2 3) 25)
(check-equal? (solution 0 0 0) 0)
(check-equal? (solution 1 1 2) 0)
(check-equal? (solution 1 0 1) 2)
(check-equal? (solution 2 3 0) 13)
