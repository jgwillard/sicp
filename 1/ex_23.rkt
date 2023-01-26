#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (if (= 2 test-divisor)
                   3
                   (+ 2 test-divisor))))))

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
  (if (= 2 n)
      3
      (+ 2 n)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime)
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (if (<= start end)
      (cond ((even? start)
             (search-for-primes (+ start 1) end))
            (else
             (timed-prime-test start)
             (search-for-primes (+ start 2) end)))))

(search-for-primes 1000 1061)
; times are 3, 2, 3, 3, 2, 3, 3, 5, 6, 6 (avg: 3.6) with next function
; times are 3, 6, 5, 3, 2, 2, 3, 3, 3, 6 (avg: 3.6) with inlined next function

(search-for-primes 10000 10093)
; times are 12, 15, 7, 7, 7, 7, 7, 6, 7, 7 (avg: 8.2) with next function
; times are 11, 7, 12, 11, 6, 7, 7, 7, 7, 6 (avg: 8.1) with inlined next function

(search-for-primes 100000 100151)
; times are 20, 20, 20, 20, 35, 20, 20, 20, 20, 33 (avg: 22.8) with next function
; times are 18, 18, 18, 18, 18, 36, 20, 18, 19, 33 (avg: 21.6) with inlined next function

(search-for-primes 1000000 1000151)
; times are 64, 85, 90, 143, 58, 63, 54, 54, 62, 78 (avg: 75.1) with next function
; times are 57, 53, 81, 60, 81, 78, 77, 78, 76, 74 (avg: 71.5) with inlined next function

; average times dropped (5.3 -> 3.6, 10.3 -> 8.2, 35.6 -> 22.8, 93 -> 75.1) but
; not by 1/2 as predicted. Thinking that this might be due to the overhead of an
; extra function call, I also experimented with inlining the `next` function,
; but that did not result in a significant speedup (althought it appeared to be
; getting more significant for higher values of n)
