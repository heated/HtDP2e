;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Exercise 34
; String -> String
; finds the first character of s
; given: "hello", expect: "h"
; given: "world", expect: "w"
(define (string-first s) (string-ith s 0))

; Exercise 35
; String -> String
; finds the last character of s
; given: "hello", expect: "o"
; given: "world", expect: "d"
(define (string-last s)
  (string-ith s (- (string-length s) 1)))

; Exercise 36
; Image -> Number
; finds the area of i
; given: (square 5 "solid" "blue"), expect: 25
; given: (rectangle 2 3 "solid" "blue"), expect: 6
(define (image-area i)
  (* (image-width i) (image-height i)))

; Exercise 37
; String -> String
; removes the first character of s
; given: "hi", expect: "i"
; given: "a", expect: ""
(define (string-rest s) (substring s 1))

; Exercise 38
; String -> String
; removes the last character of s
; given: "hi", expect: "h"
; given: "a", expect: ""
(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))
