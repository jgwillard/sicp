#lang sicp

(define (cont-frac n d k)
  (define (iter i result)
     (if (= i k)
       result
       (iter (+ i 1) (/ (n (- k i)) (+ (d (- k i)) result)))))
  (iter 0 0))

; the following procedures implement an approximation of a continued
; fraction due to Euler that equals e - 2 where e is the base of natural
; logarithms; n(i) = 1 and d(i) is successively 1,2,1,1,4,1,1,6,1,1,8...
(define (d i)
  (if (= 0 (modulo (+ i 1) 3))
      (* 2 (/ (+ i 1) 3))
      1))

(cont-frac (lambda (i) 1.0)
           d
           10)
