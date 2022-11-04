#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; under applicative order this fails
; because we first try to resolve the
; argument, which is circular
(test 0 (p))
; under normal order this would be ok
; because we would expand it thus:
; (test 0 (p))
; (if (= 0 0) 0 (p))
; and then reduce it thus:
; (if #t 0 (p))
; 0
; such that (p) is never evaluated