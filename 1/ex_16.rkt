#lang sicp

; the following procedure implements a linear recursive for computing b^n:

(define (expt-rec b n)
  (if (= n 0) 
      1 
      (* b (expt-rec b (- n 1)))))

; this is just a direct translation of the definition of exponentiation
; into scheme:
; b^n = b * b^(n-1)
; b^0 = 1
; the above method uses O(n) steps and O(n) space

; here is an iterative version that uses constant (O(1)) space:

(define (expt b n) 
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

; we can compute exponents in fewer steps by taking advantage of the
; following fact about exponentiation:
; b^n = (b^(n/2))^2 if n is even
; ex: 2^6 = (2^3)^2 = 8^2 = 64

; combining this successive squaring method with the original recursive
; method, we get the following recursive procedure:

(define (fast-expt-rec b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt-rec b (/ n 2))))
        (else 
         (* b (fast-expt-rec b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

; this procedure grows logarithmically with n (O(log n)) in both space
; and time
; design a procedure that evolves an iterative exponentiation process
; that uses O(log n) steps and O(1) space

(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
  (cond (( = n 0)
         a)
        ((even? n)
         (fast-expt-iter a (square b) (/ n 2)))
        (else
         (fast-expt-iter (* a b) b (- n 1)))))

; in the above code, ab^n is invariant, because if n is even, then in
; the next iteration
; let a'=a, b'=b^2, n'=(n/2)
; a'b'^n'
; = ab^2^(n/2)
; = ab^n by the identity (b^m)^n = b^mn

; if n is odd, then in the next iteration
; let a'=ab, b'=b, n'=n-1
; a'b'^n'
; = abb^(n-1)
; = a(b^1 * b^(n-1))
; = ab^n by the identity b^m * b^n = b^m+n

(fast-expt 2 4)
(fast-expt 2 5)
(fast-expt 3 4)
(fast-expt 9 7)
(fast-expt 3 0)
