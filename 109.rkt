;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |109|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH 100)
(define HEIGHT 100)
;(define BG (rectangle WIDTH HEIGHT "solid" "white"))

; ExpectsToSee is one of:
; – AA
; – BB
; – DD 
; – ER

(define AA "start, expect an 'a'")
(define BB "expect 'b', 'c', or 'd'")
(define DD "finished")
(define ER "error, illegal key")

; ExpectsToSee -> Image
; render the current state s
(define (display-state s)
  (rectangle WIDTH HEIGHT "solid"
             (cond [(equal? s AA) "white"]
                   [(equal? s BB) "yellow"]
                   [(equal? s DD) "green"]
                   [(equal? s ER) "red"])))

; ExpectsToSee KeyEvent -> ExpectsToSee
; handle key k transitions from state s!
(check-expect (handle AA "a") BB)
(check-expect (handle AA "b") ER)
(check-expect (handle BB "b") BB)
(check-expect (handle BB "c") BB)
(check-expect (handle BB "d") DD)
(check-expect (handle BB "a") ER)
(check-expect (handle BB "e") ER)
(check-expect (handle BB " ") ER)
(check-expect (handle DD "a") DD)
(check-expect (handle DD "d") DD)
(check-expect (handle DD " ") DD)
(check-expect (handle ER "a") ER)
(define (handle s k)
  (cond [(equal? s AA)
         (if (key=? k "a") BB ER)]
        [(equal? s BB)
         (cond [(key=? k "b") BB]
               [(key=? k "c") BB]
               [(key=? k "d") DD]
               [else ER])]
        [else s]))

(big-bang AA
  [to-draw display-state]
  [on-key handle])