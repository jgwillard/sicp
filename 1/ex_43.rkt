#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter counter composed)
    (if (= n counter)
        composed
        (repeated-iter (+ 1 counter) (compose f composed))))
  (repeated-iter 1 f))

(define (square x)
  (* x x))

((repeated square 2) 5) ; -> 625
