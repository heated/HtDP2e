;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A WorldState is a Number.
; interpretation number of pixels between the top and the UFO

(define WIDTH 300) ; distances in terms of pixels 
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))
(define UFO (overlay (circle 10 "solid" "green")
                     (ellipse 40 10 "solid" "gray")))

; WorldState -> WorldState
(define (main y0)
  (big-bang y0
     [on-tick nxt]
     [to-draw render]))

; WorldState -> WorldState
; computes next location of UFO 
(check-expect (nxt 11) 14)
(define (nxt y)
  (+ y 3))

; WorldState -> Image
; places UFO at given height into the center of MTSCN
(define (render y)
  (place-image (status y)
               20 20
               (place-image UFO (/ WIDTH 2) y MTSCN)))

; WorldState -> Image
; return a status image based on height
(check-expect (status 0)
              (text "descending" 11 "green"))
(define (status y)
  (cond [(< y CLOSE)  (text "descending" 11 "green")]
        [(< y HEIGHT) (text "closing in" 11 "orange")]
        [else         (text "landed" 11 "red")]))

(main 5)