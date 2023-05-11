#lang sicp

; in this implementation of cons, (cons x y) returns a procedure z that
; takes as an argument another procedure m, and invokes it with the
; arguments x and y
(define (cons x y)
  (lambda (m) (m x y)))

; car then takes z (the procedure produced by cons) and invokes it with
; a procedure m as its argument that takes two arguments and returns the
; first one
; since z invokes m with x and y as its arguments, the p and q here will
; be the same values as the x and y above, and since the lambda returns
; p, car will return x
(define (car z)
  (z (lambda (p q) p)))

; cdr works in an analogous way; the lambda simply returns the second
; argument (that is, y) instead of the first
(define (cdr z)
  (z (lambda (p q) q)))

; test
(define test (cons 1 2))

(car test)
; 1

(cdr test)
; 2
