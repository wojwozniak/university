#lang racket

(require "task3.rkt")

; Tworzenie pustej kolejki
(define q (make-mqueue))

; Sprawdzamy czy kolejka jest pusta
(displayln "Sprawdzamy czy kolejka jest pusta:")
(displayln (mqueue-empty? q)) ; Oczekiwany output: #t

; Dodajemy elementy do kolejki
(displayln "Dodajemy elementy do kolejki:")
(mqueue-push-back q 1)
(mqueue-push-front q 2)
(mqueue-push-back q 3)
(mqueue-push-front q 4)

; Sprawdzamy czy kolejka jest pusta
(displayln "Sprawdzamy czy kolejka jest pusta:")
(displayln (mqueue-empty? q)) ; Oczekiwany output: #f

; Wypisujemy zawartość kolejki
;(displayln "Wypisujemy zawartość kolejki:")
;(mqueue-print q) ; Oczekiwany output: {4 2 1 3}

; Usuwamy elementy z kolejki
(displayln "Usuwamy elementy z kolejki:")
(mqueue-pop-front q)
(mqueue-pop-back q)

; Wypisujemy zawartość kolejki
;(displayln "Wypisujemy zawartość kolejki:")
;(mqueue-print q) ; Oczekiwany output: {2 1}