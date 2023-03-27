#lang sicp

; this generates a recursive procedure whose space requirements grow
; linearly with k
(define (cont-frac-rec n d k)
  (define (rec i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (rec (+ i 1))))))
  (rec 1))

; the following procedure approximates the quantity 1/phi
; for k >= 11, we get an approximation that is accurate to four decimal
; places
(cont-frac-rec (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

; this generates an iterative process requiring a constant amount of
; space
(define (cont-frac-iter n d k)
  (define (iter i result)
     (if (= i k)
       result
       (iter (+ i 1) (/ (n (- k i)) (+ (d (- k i)) result)))))
  (iter 0 0))

; it requires the same number of steps to reach the same approximation
; as the recursive implementation
(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
