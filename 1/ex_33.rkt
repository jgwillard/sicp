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
  (filtered-accumulate prime? + 0 identity a inc b))

(sum-squares-of-primes 1 10) ; 2 + 3 + 5 + 7 = 17