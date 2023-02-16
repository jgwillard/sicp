#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

(integral square 0 1 0.001)
(integral square 0 2 0.001)
(integral cube 0 1 0.001)
(integral cube 0 2 0.001)

(define (simpsons-integral f a b n)
  (define (h)
    (/ (- b a) n))
  (define (y k)
    (f (* a (* k (h)))))
  (define (term k)
    (cond ((= k 0)
           (y k))
          ((even? k)
           (* 2 (y k)))
          (else
           (* 4 (y k)))))
  (define (simpsons-integral-rec f a b k)
    (if (> k n)
        0
        (+ (simpsons-integral-rec f a b (+ k 1)) (term k))))
  (* (simpsons-integral-rec f a b 0) (/ (h) 3.0)))

(simpsons-integral square 0 1 100)
(simpsons-integral square 0 2 100)
(simpsons-integral cube 0 1 100)
(simpsons-integral cube 0 2 100)
