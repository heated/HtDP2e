;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define x 12)
(define y 5)

; Exercise 1
(sqrt (+ (sqr x) (sqr y)))

(define prefix "hello")
(define suffix "world")

; Exercise 2
(string-append prefix "_" suffix)

(define str "helloworld")
(define i 5)

; Exercise 3
(string-append (substring str 0 i) "_" (substring str i))

; Exercise 4
; i must be an integer in [0, str.len)
(string-append (substring str 0 i) (substring str (+ i 1)))
