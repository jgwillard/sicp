#lang sicp

(define (cbrt-iter current-guess last-guess x)
  (if (good-enough? current-guess last-guess)
      current-guess
      (cbrt-iter (improve current-guess x)
                 current-guess
                 x)))

(define (improve y x)
  (/
   (+
    (/ x (* y y))
    (* 2 y))
   3))

(define (good-enough? current-guess last-guess)
  (<
   (/
    (abs (- current-guess last-guess))
    current-guess)
   0.001))

(define (cbrt x)
  (cbrt-iter 1.0 2.0 x))

(define (cube x)
  (* x x x))

(cube (cbrt 2))

(cube (cbrt 12345))

(cube (cbrt 100000000000000000000000000000000))

(cube (cbrt 0.0001))
