#lang sicp

(#%require rackunit)

(define (solution depth offset)
  (cond ((< offset 2) 1)
        ((> offset (- depth 1)) 1)
        ( else (+ (solution (- depth 1) (- offset 1))
                  (solution (- depth 1) offset)))))

(check-equal? (solution 1 1) 1)
(check-equal? (solution 3 2) 2)
(check-equal? (solution 4 3) 3)
(check-equal? (solution 5 2) 4)
(check-equal? (solution 5 3) 6)
