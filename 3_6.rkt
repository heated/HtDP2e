;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH-OF-WORLD 200)
 
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define V 3)
(define Y-CAR (* WHEEL-RADIUS 3))

(define BACKGROUND
  (rectangle WIDTH-OF-WORLD WHEEL-DISTANCE "solid" "white"))
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle (* WHEEL-RADIUS 2) WHEEL-RADIUS 0 "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
(define HOOD
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "lightblue"))
(define CHASSIS
  (rectangle (* WHEEL-DISTANCE 1.5) (* WHEEL-RADIUS 2)
             "solid" "lightblue"))
(define TOP
  (overlay/offset HOOD 0 (* WHEEL-RADIUS 1.5) CHASSIS))
(define CAR
  (overlay/offset BOTH-WHEELS 0 (* -1.5 WHEEL-RADIUS) TOP))

; A Position is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; Position -> Image
; places the image of the car x pixels from
; the left margin of the BACKGROUND image
(define (render x)
  (place-image CAR x Y-CAR BACKGROUND))
 
; Position -> Position
; adds V to x to move the car right
(check-expect (tock 5) 8)
(check-expect (tock 8) 11)
(define (tock x) (+ x V))

; Position -> Position
; launches the program from some initial position 
(define (main x)
   (big-bang x
     [on-tick tock]
     [to-draw render]))

; TODO: Exercise 41
(main 13)
