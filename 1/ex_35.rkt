#lang sicp

; phi = (1 + 5^(1/2)) / 2
; which satisfies the equation
; phi^2 = phi + 1

; let x = phi, then
; x^2 = x + 1
; x   = (x + 1)/x
; x   = x/x + 1/x
; x   = 1 + 1/x

; therefore phi is a fixed point of the function f(x) = 1 + 1/x

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1.0)
