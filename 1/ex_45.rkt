#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter counter composed)
    (if (= n counter)
        composed
        (repeated-iter (+ 1 counter) (compose f composed))))
  (repeated-iter 1 f))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

(define (sqrt x)
  (fixed-point
   (average-damp
    (lambda (y) (/ x y)))
   1.0))

(define (cube-root x)
  (fixed-point
   (average-damp
    (lambda (y)
      (/ x (square y))))
   1.0))

(define (fourth-root x)
  (fixed-point
   ((repeated average-damp 2)
    (lambda (y)
      (/ x (cube y))))
   1.0))

; average damping once works for n < 4
; average damping twice seems to be sufficient for n < 8
; average damping 3 times is sufficient for n < 16
; the pattern appears to be required average damping = floor(log_2(n))
(define (nth-root n x)
  (fixed-point
   ((repeated average-damp (floor (log n 2)))
    (lambda (y)
      (/ x (expt y (- n 1)))))
   1.0))

(sqrt 9)
(cube-root 27)
(fourth-root 81)
(nth-root 7 2187)
(nth-root 7 128)
(nth-root 15 32768)
(nth-root 16 65536)
(nth-root 32 4294967296)
