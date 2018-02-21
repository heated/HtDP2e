;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 27
(define average-attendence 120)
(define average-price 5.0)
(define fixed-cost 0)
(define seat-cost 1.5)
(define price-sensitivity (/ 15 0.1))

(define (attendees ticket-price)
  (- average-attendence
     (* (- ticket-price average-price)
        price-sensitivity)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* seat-cost (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

; Exercise 28
(profit 2.92)

; Exercise 29: The owner's new savings save him from making more.
(profit 3.65)
