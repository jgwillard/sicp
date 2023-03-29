#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter counter composed)
    (if (= n counter)
        composed
        (repeated-iter (+ 1 counter) (compose f composed))))
  (repeated-iter 1 f))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/
     (+
      (f (- x dx))
      (f x)
      (f (+ x dx)))
     3)))

(define (square x)
  (* x x))

(define (smooth-n-fold f n)
  ((repeated smooth n) f))

(square 17) ; -> 289
((smooth square) 17) ; -> 289.0000000000667
((smooth-n-fold square 10) 17) ; -> 289.0000000006666
