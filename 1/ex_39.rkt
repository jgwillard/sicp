#lang sicp

; a version of cont-frac that uses subtraction instead of addition
(define (cont-frac-sub n d k)
  (define (iter i result)
     (if (= i k)
       result
       (iter (+ i 1) (/ (n (- k i)) (- (d (- k i)) result)))))
  (iter 0 0))

(define (tan-cf x k)

  (define (n i)
    (if (= i 1)
        x
        (* x x)))

  (define (d i)
    (- (* 2 i) 1))

  (cont-frac-sub n d k))

(tan-cf 1.0 10)
