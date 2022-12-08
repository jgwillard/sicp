#lang sicp

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

;(define (fast-multiply a b)
;  (fast-multiply-iter))