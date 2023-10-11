#lang sicp

(define (filter condition? l)
  (if (null? l)
      nil
      (if (condition? (car l))
          (cons (car l) (filter condition? (cdr l)))
          (filter condition? (cdr l)))))

(define (same-parity first . rest)
  (let ((l (if (odd? first)
               (filter odd? rest)
               (filter even? rest))))
    (cons first l)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
