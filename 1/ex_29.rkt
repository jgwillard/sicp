#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

(integral cube 0 1 0.01)
; 0.24998750000000042
(integral cube 0 1 0.001)
; 0.249999875000001


(define (simpsons-integral f a b n)
  (define (h)
    (/ (- b a) n))
  (define (y k)
    (f (+ a (* k (h)))))
  (define (term k)
    (cond ((= k 0)
           (y k))
          ((even? k)
           (* 2 (y k)))
          (else
           (* 4 (y k)))))
  (define (simpsons-integral-rec k)
    (if (> k n)
        0
        (+ (simpsons-integral-rec (+ k 1)) (term k))))
  (* (simpsons-integral-rec 0) (/ (h) 3.0)))

(simpsons-integral cube 0 1 100)
; 0.25333333333333335
(simpsons-integral cube 0 1 1000)
; 0.25033333333333335

; Simpson's rule seems to give approximations that slightly overestimate
; the value of the definite integral, whereas the `integral` procedure
; underestimates it. As n increases, the Simpson's estimate seems to
; approach the correct value more quickly than does `integral`.
