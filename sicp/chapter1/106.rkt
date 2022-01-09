#lang sicp

(#%require rackunit)

#| Because the traditional order of evaluation is applicative an attempt will be made to evaluate all operands in 'new-if'.
   Thus, we will get an infinite recursion in the branch with 'sqrt-iter'.|#
