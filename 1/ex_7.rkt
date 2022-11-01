#lang sicp

(define (sqrt-iter current-guess last-guess x)
  (if (new-good-enough? current-guess last-guess)
      current-guess
      (sqrt-iter (improve current-guess x)
                 current-guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (new-good-enough? current-guess last-guess)
  (< (/ (abs (- current-guess last-guess)) current-guess) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

(define (square x)
  (* x x))

; breaks after 1e48 with original good-enough? function, keeps working with new-good-enough? function
(square (sqrt 100000000000000000000000000000000000000000000000000))

; returns 0.00104... with original good-enough? function, 0.000100... with new-good-enough? function
(square (sqrt 0.0001))

; if we are trying to get the square root of a number smaller than 0.001, then obviously measuring
; whether the guess squared is within 0.001 of the original number will give inaccurate results,
; because it will stop iterating too soon
; likewise, with very large numbers, checking whether the guess squared is within 0.001 of the number
; will fail because large numbers cannot be stored with enough precision to be able to use 0.001 as a
; consistent test
