#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; contrast with
(define (a-plus-b a b)
  (+ a b))

(= (a-plus-abs-b 3 1) (a-plus-abs-b 3 -1)) ;#t