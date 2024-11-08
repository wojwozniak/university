#lang racket

; Definicja funkcji my-compose składającej funkcje f i g
(define (my-compose f g)
    (lambda (x)
        (f (g x))
    )
)

; Teraz prześledzenie podanych wyrażeń w modelu podstawieniowym
;
; 1) ((my-compose square inc) 5)
; (lambda (x) (square (inc x)))
; (lambda (5) (square (inc 5)))
; (square 6)
; 36
;
; 2) ((my-compose inc square) 5)
; (lambda (x) (inc (square x)))
; (lambda (5) (inc (square 5)))
; (inc 25)
; 26