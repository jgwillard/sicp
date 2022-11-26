#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; 1. when (sine 12.15) is evaluated, p will be applied how many times?

; (sine 12.15)
; (p (sine (/ 12.15 3.0)))
; (p (sine 4.05))
; (p (p (sine (/ 4.05 3.0))))
; (p (p (sine 1.3499999999999999)))
; (p (p (p (sine (/ 1.3499999999999999 3.0)))))
; (p (p (p (sine 0.44999999999999996))))
; (p (p (p (p (sine (/ 0.44999999999999996 3.0))))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine (/ 0.15 3.0)))))))
; (p (p (p (p (p (sine 0.049999999999999996))))))
; (p (p (p (p (p 0.049999999999999996)))))
; (p (p (p (p 0.1495))))
; (p (p (p 0.4351345505)))
; (p (p 0.9758465331678772))
; (p -0.7895631144708228)
; -0.39980345741334

; p is applied 5 times

; 2. what is the order of growth in space and number of steps of (sine a)
; as a function of a?

; we can see from the above application that the space and time used
; is a function of the number of times a must be divided by 3 before we
; reach the base case where abs(a) < 0.1. So in order for there to be
; another division of a, a must triple in size. Because a must increase
; muliplicatively to get an additive increase in complexity, the order
; of growth is O(log a).

(sine 12.15)
