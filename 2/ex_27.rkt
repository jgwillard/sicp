#lang sicp

(define (reverse l)
  (define (reverse-iter l1 l2)
    (if (null? l1)
        l2
        (reverse-iter (cdr l1) (cons (car l1) l2))))
  (reverse-iter l nil))

(define (deep-reverse l)
  (define (deep-reverse-iter l1 l2)
      (cond
        ((null? l1) l2)
        ((pair? (car l1)) (deep-reverse-iter (cdr l1) (cons (deep-reverse-iter (car l1) nil) l2)))
        (else (deep-reverse-iter (cdr l1) (cons (car l1) l2)))))

  (deep-reverse-iter l nil))

(define x (list (list 1 2) (list 3 4)))

(reverse x)

(deep-reverse x)
