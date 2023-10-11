#lang sicp

(define (square-list items)
  (if (null? items)
      nil
      (let ((first (car items)))
        (cons (* first first) (square-list (cdr items))))))

(square-list (list 1 2 3 4))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(square-list-map (list 1 2 3 4))
