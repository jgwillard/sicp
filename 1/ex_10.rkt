#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ; 1024

(A 2 4) ; 65536

(A 3 3) ; 65536

(define (f n) (A 0 n))

; f computes 2n:

(f 0) ; 0
(f 2) ; 4
(f -342) ; -684

(define (g n) (A 1 n))

; g computes 2^n:

(g 0) ; 0
(g 1) ; 2
(g 2) ; 4
(g 3) ; 8
(g 4) ; 16

(define (h n) (A 2 n))

; h computes 2^^n (tetration):

(h 0) ; 0
(h 1) ; 2
(h 2) ; 4 = 2^2
(h 3) ; 16 = 2^2^2
(h 4) ; 65536 = 2^2^2^2

; (h x) == (tetrate 2 x) for the following implementation of tetrate:
(define (tetrate a n)
  (cond ((= 0 n) 0)
        ((= 1 n) a)
        (else (expt a (tetrate a (- n 1))))))

(= (h 0) (tetrate 2 0))
(= (h 1) (tetrate 2 1))
(= (h 2) (tetrate 2 2))
(= (h 3) (tetrate 2 3))
(= (h 4) (tetrate 2 4))
