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
               (+ test-divisor 1)))))

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

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
; times are 9, 6, 6, 5, 5, 5, 5, 4, 4, 4 (avg: 5.3)

(search-for-primes 10000 10093)
; times are 10, 10, 11, 11, 10, 10, 10, 10, 10, 11 (avg: 10.3)

(search-for-primes 100000 100151)
; times are 47, 41, 36, 34, 33, 33, 34, 33, 32, 33 (avg: 35.6)

(search-for-primes 1000000 1000151)
; times are 102, 89, 90, 89, 98, 97, 94, 90, 90, 91 (avg: 93)

; aside from the smallest primes, the average times appear to increase
; by approximately 10^(1/2) each time the numbers being tested
; increase tenfold, consistent with a time complexity of O(n^(1/2))
