#lang sicp

; if is a special form that only evaluates either
; the consequent or the alternate, not both
; using new-if breaks sqrt-iter because it will
; evaluate both the consequent `guess` and the
; alternate `(sqrt-iter (improve guess x) x)`,
; resulting in an infinite recursion
; see http://community.schemewiki.org/?sicp-ex-1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

(sqrt 100)