#lang sicp

(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter? a)
          (combiner (term a)
                (filtered-accumulate filter? combiner null-value term (next a) next b))
          (filtered-accumulate filter? combiner null-value term (next a) next b))))

; sum all even numbers in closed interval [a, b]
(define (sum-even a b)
  (filtered-accumulate even? + 0 identity a inc b))

(sum-even 1 10) ; 2 + 4 + 6 + 8 + 10 = 30

; prime? predicate definition
(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (if (= 1 n)
      #f
      (= n (smallest-divisor n))))

(define (sum-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-squares-of-primes 1 10) ; 4 + 9 + 25 + 49 = 87

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-relative-primes n)

  (define (relative-prime-to-n? i)
    (= 1 (gcd i n)))

  ; iterate from 2 to n - 1
  (filtered-accumulate relative-prime-to-n? * 1 identity 2 inc (- n 1)))

(product-relative-primes 10) ; 1 * 3 * 7 * 9 = 189
