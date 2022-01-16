#lang sicp

(#%require rackunit)

#| the recursive process |#
(define (r-func n)
  (if (< n 3)
      n
      (+ (r-func (- n 1))
         (* (r-func (- n 2)) 2)
         (* (r-func (- n 3)) 3))))

#| the iterative process |#
(define (i-func n)
  (if (< n 3)
      n
      (i-func-iter 2 1 0 n)))
(define (i-func-iter a b c count)
  (if (= count 3)
      (+ a (* b 2) (* c 3))
      (i-func-iter (+ a (* b 2) (* c 3)) a b (- count 1))))

(check-equal? (r-func -5) -5)
(check-equal? (r-func 2) 2)
(check-equal? (r-func 4) 11)
(check-equal? (i-func -5) -5)
(check-equal? (i-func 2) 2)
(check-equal? (i-func 4) 11)
