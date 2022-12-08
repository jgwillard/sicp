#lang racket/base

(require racket/trace)

(define (multiply a b)
  (if (= b 0)
      0
      (+ a (multiply a (- b 1)))))

; (multiply 3 3)
; (+ 3 (multiply 3 (- 3 1)))
; (+ 3 (multiply 3 2))
; (+ 3 (+ 3 (multiply 3 (- 2 1))))
; (+ 3 (+ 3 (multiply 3 1)))
; (+ 3 (+ 3 (+ 3 (multiply 3 (- 1 1)))))
; (+ 3 (+ 3 (+ 3 (multiply 3 0))))
; (+ 3 (+ 3 (+ 3 0)))
; (+ 3 (+ 3 3))
; (+ 3 6)
; 9

(define (halve x)
  (/ x 2))

(define (double x)
  (+ x x))

(define (fast-multiply a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (double (fast-multiply a (halve b))))
        (else
         (+ a (fast-multiply a (- b 1))))))

; fast-multiply uses ceiling(log_2(b)) steps

(trace multiply)
(trace fast-multiply)
(multiply 12 12)
(fast-multiply 2 144)
