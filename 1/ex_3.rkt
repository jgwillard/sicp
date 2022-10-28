#lang sicp

(define (sum-of-squares-of-two-largest x y z)
  (cond ((and (< x y) (< x z)) (+ (* y y) (* z z)))
        ((and (< y x) (< y z)) (+ (* x x) (* z z)))
        (else (+ (* x x) (* y y)))))

(sum-of-squares-of-two-largest 1 2 3) ;13