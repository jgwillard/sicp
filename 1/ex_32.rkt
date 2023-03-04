#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product identity 1 inc n))

(factorial 5)

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(factorial 5)

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (sum-cubes-iter a b)
  (sum-iter cube a inc b))

(sum-cubes-iter 1 10)
