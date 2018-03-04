;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |122|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (f x y)
  (+ (* 3 x) (* y y)))

(+ (f 1 2) (f 2 1))
;(+ (+ (* 3 1) (* 2 2)) (f 2 1))
;(+ (+ 3 (* 2 2)) (f 2 1))
;(+ (+ 3 4) (f 2 1))
;(+ 7 (f 2 1))
;(+ 7 (+ (* 3 2) (* 1 1)))
;(+ 7 (+ 6 (* 1 1)))
;(+ 7 (+ 6 1))
;(+ 7 7)
;14

(f 1 (* 2 3))
;(f 1 6)
;(+ (* 3 1) (* 6 6))
;(+ 3 (* 6 6))
;(+ 3 36)
;39

(f (f 1 (* 2 3)) 19)
;(f (f 1 6) 19)
;(f (+ (* 3 1) (* 6 6)) 19)
;(f (+ 3 (* 6 6)) 19)
;(f (+ 3 36) 19)
;(f 39 19)
;(+ (* 3 39) (* 19 19))
;(+ 117 (* 19 19))
;(+ 117 361)
;478

;(if exp-test exp-then exp-else)
;==
;(cond [exp-text exp-then]
;      [else     exp-else])

(define PRICE 5)
(define SALES-TAX (* 0.08 PRICE))
;(define SALES-TAX (* 0.08 5))
;(define SALES-TAX 0.4)
(define TOTAL (+ PRICE SALES-TAX))
;(define TOTAL (+ 5 SALES-TAX)
;(define TOTAL (+ 5 0.4)
;(define TOTAL 5.4)

(define COLD-F 32)
; errors!
;(define COLD-C (fahrenheit->celsius COLD-F))
(define (fahrenheit->celsius f)
 (* 5/9 (- f 32)))

(define LEFT -100)
(define RIGHT 100)
(define (g x) (+ (* 5 (expt x 2)) 10))
(define g@LEFT (g LEFT))
(define g@RIGHT (g RIGHT))

(define-struct oops []); legal: none-type
(define-struct child [parents dob date]); legal: standard
; illegal: (child person) not a name
;(define-struct (child person) [dob date])

(define-struct point [x y z])
(define-struct none  [])

(make-point 1 2 3)
(make-point (make-point 1 2 3) 4 5)
(make-point (+ 1 2) 3 4)
(make-none)
(make-point (point-x (make-point 1 2 3)) 4 5)
; all of the above are fine: they make the associated objects
; with the specified number of parameters

(define-struct ball [x y speed-x speed-y])

(number? (make-ball 1 2 3 4)); #false
(ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3)); 3
(ball-y (make-ball (+ 1 2) (+ 3 3) 2 3)); 6
;(ball-x (make-posn 1 2)); error: not a ball
;(ball-speed-y 5); error: not a ball

;(check-member-of "green" "red" "yellow" "grey"); not a member
;(check-within (make-posn #i1.0 #i1.1)
;              (make-posn #i0.9 #i1.2)  0.01); not enough tolerance
;(check-range #i0.9 #i0.6 #i0.8); not in range
;(check-random (make-posn (random 3) (random 9))
;              (make-posn (random 9) (random 3))); not same random calls
;(check-satisfied 4 odd?); even
