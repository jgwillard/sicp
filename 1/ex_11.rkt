#lang sicp

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(f 2)
(f 3)
(f 4)
(f 5)

; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)
;
; let a = f(n - 1), b = f(n - 2), c = f(n - 3)
;
; for _ in 2..n:
;     a = NEWVALUE
;     b = a
;     c = b
; return a
;
; where NEWVALUE = a + 2 * b + 3 * c (the recursive equation)
;
; so in each iteration we track the values f(n - 1), f(n - 2), and f(n - 3), which we use
; to caluculate the value of f(n) after n iterations
;
; pseudo-python:
;
; if n < 3: return n
; a = 2 # f(n-1) where n = 3
; b = 1 # f(n-2)
; c = 0 # f(n-3)
; # now start off counting at 3
; for _ in 3..n:
;     a = a + 2 * b + 3 * c
;     b = a
;     c = b
; return a
;
; from https://stackoverflow.com/questions/2365993/no-idea-how-to-solve-sicp-exercise-1-11

(define (g n)
  (g-iter 2 1 0 n))

(define (g-iter a b c n)
  (if (< n 3)
      a
      (g-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (dec n))))

(g 2)
(g 3)
(g 4)
(g 5)
