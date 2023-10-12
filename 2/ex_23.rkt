#lang sicp

(define (for-each proc items)
  (if (null? items)
      nil
      ((lambda ()
         (proc (car items))
         (for-each proc (cdr items))
         #t))))

(for-each
 (lambda (x) (newline) (display x))
 (list 57 321 88))
