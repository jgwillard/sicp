#lang racket/base

(require racket/trace)

(define (inc n)
  (+ 1 n))

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(trace sum)

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (trace iter)
  (iter a 0))

(define (sum-cubes-iter a b)
  (sum-iter cube a inc b))

(sum-cubes 1 10)
(sum-cubes-iter 1 10)

; output:
; >(sum #<procedure:cube> 1 #<procedure:inc> 10)
; > (sum #<procedure:cube> 2 #<procedure:inc> 10)
; > >(sum #<procedure:cube> 3 #<procedure:inc> 10)
; > > (sum #<procedure:cube> 4 #<procedure:inc> 10)
; > > >(sum #<procedure:cube> 5 #<procedure:inc> 10)
; > > > (sum #<procedure:cube> 6 #<procedure:inc> 10)
; > > > >(sum #<procedure:cube> 7 #<procedure:inc> 10)
; > > > > (sum #<procedure:cube> 8 #<procedure:inc> 10)
; > > > > >(sum #<procedure:cube> 9 #<procedure:inc> 10)
; > > > > > (sum #<procedure:cube> 10 #<procedure:inc> 10)
; > > > >[10] (sum #<procedure:cube> 11 #<procedure:inc> 10)
; < < < <[10] 0
; < < < < < 1000
; < < < < <1729
; < < < < 2241
; < < < <2584
; < < < 2800
; < < <2925
; < < 2989
; < <3016
; < 3024
; <3025
; 3025
; >(iter 1 0)
; >(iter 2 1)
; >(iter 3 9)
; >(iter 4 36)
; >(iter 5 100)
; >(iter 6 225)
; >(iter 7 441)
; >(iter 8 784)
; >(iter 9 1296)
; >(iter 10 2025)
; >(iter 11 3025)
; <3025
; 3025
