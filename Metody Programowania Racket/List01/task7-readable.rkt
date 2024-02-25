#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define rocket .)


; Najpierw deklaracje sceny
(define scene-width 100)
(define scene-height 600)
(define margin 20)
(define rocket-x (/ scene-width 2))
(define scene (empty-scene scene-width scene-height))


; Na tej wysokosci zatrzyma sie rakieta
(define rocket-center-to-top
  (- scene-height margin (/ (image-height rocket) 2)))

; Definiujemy pozycje rakiety. Zaczynamy na dole sceny
(define (scene-with-rocket rocket-y)
  (define rocket-position (- scene-height (+ margin rocket-y)))
  (place-image rocket rocket-x rocket-position scene))

; Definiujemy przyspieszenie rakiety
(define rocket-a 0.25)

; Opoźnienie startu
(define framerate 28)
(define seconds-of-delay 7)
(define delay (* seconds-of-delay framerate))

; Funkcja rysująca tekst z odliczaniem
(define (delay-text t)
  (cond ((< t delay) (text (number->string (ceiling (- seconds-of-delay (/ t framerate)))) 20 "black"))
        (else empty-image)))

; Ostateczna funkcja rysujaca lot rakiety
(define (lot t)
  ; Predkosc obliczana wzorem (a*t^2)/2
  (define distance (* rocket-a (- t delay) (- t delay) 0.5))
  ; Najpierw czekamy na koniec odliczania
  ; pozniej tak jak w funkcji z wykladu, gdy rakieta dociera do "granicy", zatrzymuje sie
  (cond ((< t delay) (scene-with-rocket 0))
        ((< distance rocket-center-to-top) (scene-with-rocket distance))
        (else (scene-with-rocket rocket-center-to-top)))
  )

; Wywołanie animate z funkcją opóźniającą
(animate (lambda (t) (underlay (lot t) (delay-text t))))