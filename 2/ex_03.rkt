#lang sicp

(define (sqrt-iter current-guess last-guess x)
  (if (good-enough? current-guess last-guess)
      current-guess
      (sqrt-iter (improve current-guess x)
                 current-guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? current-guess last-guess)
  (< (/ (abs (- current-guess last-guess)) current-guess) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

(define (square x)
  (* x x))

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

(define (length-segment s)
  (sqrt
   (+
    (square (- (x-point (start-segment s)) (x-point (end-segment s))))
    (square (- (y-point (start-segment s)) (y-point (end-segment s)))))))

; representation of rectangles in terms of two (corner) points

(define (make-rect p q)
  (cons p q))

(define (height-rect r)
  (abs (- (y-point (car r)) (y-point (cdr r)))))

(define (width-rect r)
  (abs (- (x-point (car r)) (x-point (cdr r)))))

(define (perimeter-rect r)
  (+ (* 2 (height-rect r)) (* 2 (width-rect r))))

(define (area-rect r)
  (* (height-rect r) (width-rect r)))

(define r (make-rect (make-point 0 0) (make-point 8 7)))

(display (perimeter-rect r))
(newline)
(display (area-rect r))
(newline)

; alternative representation for rectangles in terms of two segments
; this representation is nice in that it can handle non-axis-aligned
; rectangles, but because it relies on the distance formula with the
; square root procedure defined above, it loses some accuracy

(define (make-rect-prime s t)
  (cons s t))

(define (height-rect-prime r)
  (length-segment (car r)))

(define (width-rect-prime r)
  (length-segment (cdr r)))

(define s (make-rect-prime
           (make-segment (make-point 0 0) (make-point 0 7))
           (make-segment (make-point 0 0) (make-point 8 0))))

; note that these two functions are identical to the ones defined above,
; with the exception of name changes
(define (perimeter-rect-prime r)
  (+ (* 2 (height-rect-prime r)) (* 2 (width-rect-prime r))))

(define (area-rect-prime r)
  (* (height-rect-prime r) (width-rect-prime r)))

(display (perimeter-rect-prime s))
(newline)
(display (area-rect-prime s))
(newline)

; program output:

; 30
; 56
; 30.000003593118503
; 56.00001271718465
