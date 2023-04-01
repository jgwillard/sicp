#lang sicp

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

; take a good-enough? procedure and an improve procedure and return a
; procedure that successively applies the improve procedure to a guess
; until (good-enough? guess) is true, then return it
(define (iterative-improve good-enough? improve)

  (define (iterative-improve-iter guess)
    (if (good-enough? guess)
        guess
        (iterative-improve-iter (improve guess))))

  iterative-improve-iter)

; we are using the method of finding a fixed point by successively
; applying a function (e.g. f(f(f(...f(x))))) until the output changes
; very little, so the improve procedure is simply f itself, and the
; good-enough? procedure checks whether the output of f is changing very
; much between two applications (when the change between the current
; guess and the next application is less than tolerance it terminates;
; note that this is a slightly different behavior from the fixed-point
; procedure given earlier)
(define (fixed-point f first-guess)

  (define (good-enough? guess)
    (let ((next (f guess)))
      (< (abs (- next guess)) tolerance)))
  
  ((iterative-improve good-enough? f) first-guess))

(fixed-point cos 1)

; we are improving square root guesses by taking the average of the
; guess and x / guess, and we apply this procedure until the difference
; between the guess squared and x is less than tolerance (note that this
; is not the best test; a better test would be similar to that used by
; the fixed-point procedure above but we are using this in order to
; demonstrate the versatility of the iterative-improve procedure)
(define (sqrt x)

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))

  (define (improve guess)
    (average guess (/ x guess)))

  ((iterative-improve good-enough? improve) 1.0))

(sqrt 9)