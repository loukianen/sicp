#lang sicp

(#%require rackunit)

(define (solution x y z)
        (cond ((and (> x z) (> y z)) (+ (* x x) (* y y)))
              ((and (> x y) (> z y)) (+ (* x x) (* z z)))
              ((and (> y x) (> z x)) (+ (* y y) (* z z)))
              (else 0)))

(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 4 2 3) 25)
(check-equal? (solution 0 0 0) 0)
(check-equal? (solution 1 0 1) 2)
(check-equal? (solution 2 3 0) 13)
