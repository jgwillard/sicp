#lang sicp

(define (average x y)
  (/ (+ x y) 2.0))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (make-point
     (average (x-point start) (x-point end))
     (average (y-point start) (y-point end)))))

(define origin (make-point 0 0))

(define p (make-point 10 10))

(define s (make-segment origin p))

(print-point (midpoint-segment s))