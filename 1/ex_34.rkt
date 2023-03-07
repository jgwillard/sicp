#lang sicp

(define (f g)
  (g 2))

(f identity) ; (identity 2) => 2

(f inc) ; (inc 2) => 3

(f f)
; the above invocation will be evaluated thus:
; (f f)
; (f 2)
; (2 2)
; => error: application: not a procedure

; because 2 is a number not a procedure, the program throws an error
