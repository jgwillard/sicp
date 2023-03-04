#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(factorial 5)

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(factorial-iter 5)

(define (approximate-pi n)

  (define (upper-term n)
    (if (even? n)
        (+ n 2)
        (+ n 1)))

  (define (lower-term n)
    (if (even? n)
        (+ n 1)
        (+ n 2)))

  (* 4.0 (/
   (product-iter upper-term 1 inc n)
   (product-iter lower-term 1 inc n))))

(approximate-pi 10)
; 3.2751010413348074
(approximate-pi 100)
; 3.1570301764551676
(approximate-pi 1000)
; 3.1431607055322663
(approximate-pi 10000)
; 3.1417497057380523
