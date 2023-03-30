#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iterative-improve-iter v1 v2)
    (if (good-enough? v1 v2)
        v1
        (iterative-improve-iter (improve v1 v2) v2)))
  iterative-improve-iter)

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-prime x)
  ((iterative-improve good-enough? improve) 1.0 x))



(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-prime f first-guess)
  (define tolerance 0.00001)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (improve x _)
    (f x))
  ((iterative-improve good-enough? improve) first-guess (f first-guess)))
