#lang racket/base

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; how many remainder operations are performed when evaluating the
; expression below under normal order and applicative order
(gcd 206 40)

; under normal order (expanding definitions first and then evaluating
; when needed):
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 206 (remainder 206 40)))

(if #f
    206
    (gcd 206 (remainder 206 40)))

(if #f
    206
    (if (= (remainder 206 40) 40)
        (remainder 206 40)
        (gcd (remainder 206 40) (remainder 206 (remainder 206 40)))))

(if #f
    206
    (if (= 6 40)
        (remainder 206 40)
        (gcd (remainder 206 40) (remainder 206 (remainder 206 40)))))

(if #f
    206
    (if #f
        (remainder 206 40)
        (gcd (remainder 206 40) (remainder 206 (remainder 206 40)))))

(if #f
    206
    (if #f
        (remainder 206 40)
        (gcd (remainder 206 40) (remainder 206 (remainder 206 40)))))

(if #f
    206
    (if #f
        (remainder 206 40)
        (if (= (remainder 206 6) 0)
            (remainder 206 40)
            (gcd (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40)))))))

(if #f
    206
    (if #f
        (remainder 206 40)
        (if (= 2 0)
            (remainder 206 40)
            (gcd (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40)))))))

(if #f
    206
    (if #f
        (remainder 206 40)
        (if #f
            (remainder 206 40)
            (gcd (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40)))))))

(if #f
    206
    (if #f
        (remainder 206 40)
        (if #f
            (remainder 206 40)
            (if (= (remainder (remainder 206 40) (remainder 206 (remainder 206 40))))
                (remainder 206 (remainder 206 40))
                (gcd (remainder (remainder 206 40) (remainder 206 (remainder 206 40))) (remainder (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40)))))))))

(if #f
    (remainder 206 40)
    (if #f
        (remainder 206 40)
        (if (= 0 0)
            (remainder 206 (remainder 206 40))
            (gcd (remainder (remainder 206 40) (remainder 206 (remainder 206 40))) (remainder (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40))))))))

(if #f
    (remainder 206 40)
    (if #f
        (remainder 206 40)
        (if #t
            (remainder 206 (remainder 206 40))
            (gcd (remainder (remainder 206 40) (remainder 206 (remainder 206 40))) (remainder (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40))))))))

(if #f
    (remainder 206 40)
    (if #f
        (remainder 206 40)
        (if #t
            (remainder 206 6)
            (gcd (remainder (remainder 206 40) (remainder 206 (remainder 206 40))) (remainder (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40))))))))

(if #f
    (remainder 206 40)
    (if #f
        (remainder 206 40)
        (if #t
            2
            (gcd (remainder (remainder 206 40) (remainder 206 (remainder 206 40))) (remainder (remainder 206 (remainder 206 40)) (remainder (remainder 206 40) (remainder 206 (remainder 206 40))))))))

(if #f
    (remainder 206 40)
    (if #f
        (remainder 206 40)
        2))

(if #f
    (remainder 206 40)
    2)

2
