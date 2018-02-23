;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH-OF-WORLD 200)

(define WHEEL-RADIUS 5)
(define WHEEL-DIAMETER (* WHEEL-RADIUS 2))
(define WHEEL-GAP WHEEL-DIAMETER)
(define WHEEL-DISTANCE (+ WHEEL-GAP WHEEL-DIAMETER))
(define V 3)
(define X-TREE (/ WIDTH-OF-WORLD -4))

(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define HEIGHT-OF-WORLD (max (* WHEEL-DIAMETER 4)
                             (image-height TREE)))
(define BACKGROUND
  (rectangle WIDTH-OF-WORLD HEIGHT-OF-WORLD "solid" "white"))
(define SCENE
  (overlay/offset TREE X-TREE 0 BACKGROUND))
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle (* WHEEL-RADIUS 2) WHEEL-RADIUS 0 "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
(define HOOD
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "lightblue"))
(define CHASSIS
  (rectangle (* WHEEL-RADIUS 8) (* WHEEL-RADIUS 2)
             "solid" "lightblue"))
(define TOP
  (overlay/offset HOOD 0 (* WHEEL-RADIUS 1.5) CHASSIS))
(define CAR
  (overlay/offset BOTH-WHEELS 0 (* -1.5 WHEEL-RADIUS) TOP))
(define Y-CAR (- HEIGHT-OF-WORLD
                 (/ (image-height CAR) 2)))
(define HALF-CAR-WIDTH (/ (image-width CAR) 2))
(define FINAL-POSITION (+ WIDTH-OF-WORLD
                          (image-width CAR)))

; A Position is a Number.
; interpretation the number of pixels between
; the left border of the scene and the right edge of the car

; Position -> Image
; places the right side of the image of the car x pixels from
; the left margin of the BACKGROUND image
(define (render x)
  (place-image CAR (- x HALF-CAR-WIDTH) Y-CAR SCENE))
 
; Position -> Position
; adds V to x to move the car right
(check-expect (tock 5) 8)
(check-expect (tock 8) 11)
(define (tock x) (+ x V))

; Position -> Bool
; checks if the position is past the right side
; of the screen
(check-expect (end? 50) #false)
(check-expect (end? 300) #true)
(define (end? x) (> x FINAL-POSITION))

; Position Number Number String -> Position
; places the car at x-mouse
; if the given me is "button-down"
(check-expect (hyper 5 9 7 "") 5)
(check-expect (hyper 20 1 70 "button-down") 1)
(define (hyper x-car x-mouse y-mouse me)
  (if (string=? me "button-down") x-mouse x-car))

; Position -> Position
; launches the program from some initial position 
(define (main x)
   (big-bang x
     [on-tick tock]
     [to-draw render]
     [stop-when end?]
     [on-mouse hyper]))

; TODO: Exercise 41
(main 1)
