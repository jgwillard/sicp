#lang sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (square x)
  (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
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
; times are 25, 26, 24, 24, 20, 19, 21, 19, 19, 18 (avg. 21.5)

(search-for-primes 10000 10093)
; times are 25, 24, 25, 25, 25, 25, 25, 27, 28, 26 (avg. 25.5)

(search-for-primes 100000 100151)
; times are 28, 29, 29, 28, 29, 29, 32, 37, 34, 37 (avg. 31.2)

(search-for-primes 1000000 1000151)
; times are 48, 39, 63, 68, 38, 38, 39, 39, 37, 39 (avg. 44.8)

(search-for-primes 10000000 10000229)
; times are 57, 59, 45, 45, 43, 46, 46, 85, 77, 61 (avg. 56.4)

(search-for-primes 100000000 100000213)
; times are 51, 57, 59, 57, 60, 58, 53, 62, 55, 59 (avg. 57.1)

; We should expect O(log n) growth for this algorithm (the Fermat
; method), so increasing n by a factor of 10 should cause the runtime to
; increase by a constant. That appeared to be the case for the first 3
; tests but broke down after that.
