#lang sicp

(define a 2)
(define b 3)

(define (cons x y)
  (* (expt a x) (expt b y)))

(define (pair-iter n count base)
  (if (= 0 (modulo n base))
        (pair-iter (/ n base) (inc count) base)
        count))

(define (car p)
  (pair-iter p 0 a))

(define (cdr p)
  (pair-iter p 0 b))

(define test (cons 12 7))

(car test)
; 12
(cdr test)
; 7
