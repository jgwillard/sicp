#lang racket/base

(require racket/trace)

(define (halve x)
  (/ x 2))

(define (double x)
  (+ x x))

(define (multiply-rec a b)
  (if (= b 0)
      0
      (+ a (multiply-rec a (- b 1)))))

(define (multiply a b)
  (multiply-iter a b 0))

(define (multiply-iter a b total)
  (if (= b 0)
      total
      (multiply-iter a (- b 1) (+ total a))))

(multiply 3 9)

(define (fast-multiply-rec a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (double (fast-multiply-rec a (halve b))))
        (else
         (+ a (fast-multiply-rec a (- b 1))))))

; fast-multiply uses ceiling(log_2(b)) steps

(define (fast-multiply a b)
  (fast-multiply-iter a b 0))

; maintain as invariant ab + n
; if b is odd, then in the next iteration
; let a'=a, b'=b-1, n'=n + a
; a'b' + n
; = a(b - 1) + n + a
; = ab - a + n + a
; = ab + n

; if b is even, then in the next iteration
; let a'=2a, b'=b/2, n'=n
; a'b' + n'
; 2a * b/2 + n
; = 2a/1 * b/2 + n
; = 2ab/2 + n
; = ab + n

(define (fast-multiply-iter a b total)
  (cond ((= b 0)
      total)
     ((even? b)
      (fast-multiply-iter (double a) (halve b) total))
     (else
      (fast-multiply-iter a (- b 1) (+ total a)))))

(trace fast-multiply-iter)
(fast-multiply 2 144)
