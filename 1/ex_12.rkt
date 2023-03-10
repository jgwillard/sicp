#lang sicp

; Pascal's triangle
;
;               1                   = (x + y)^0
;          (1)x + (1)y              = (x + y)^1
;     (1)x^2 + 2xy + (1)y^2         = (x + y)^2
; (1)x^3 + 3x^2(y) + 3xy^2 + (1)y^3 = (x + y)^3
; 1      4        6       4     1
; 1  5     10        10      5  1
; 1 6   15      20       15   6 1
;
; Return the mth coefficient of the nth row (constraint: 0 <= m <= n).
;
; Take as a base case that the first and second row will be populated
; exclusively by 1s, and that the outer elements of a row will always be
; 1. In all other cases, element m of row n will be the sum of mth and
; (m - 1)th coefficients of previous row:
;
; f(m, n) =
; if n = 0, 1
; if n = 1, 1
; if m = 0, 1
; if m = n, 1
; else, f(m, n - 1) + f(m - 1, n - 1)

(define (f m n)
  (cond ((= m 0) 1) ; left edge
        ((= m n) 1) ; right edge
        (else (+ (f m (dec n)) (f (dec m) (dec n))))))

; compute 7th row of Pascal's triangle (0 indexed)
(f 0 7)
(f 1 7)
(f 2 7)
(f 3 7)
(f 4 7)
(f 5 7)
(f 6 7)
(f 7 7)
