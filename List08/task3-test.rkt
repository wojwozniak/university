#lang racket

(require "task3.rkt")

; Tworzenie pustej kolejki
(define q (make-mqueue))

; Sprawdzamy czy kolejka jest pusta
(displayln "Sprawdzamy czy kolejka jest pusta:")
(displayln (mqueue-empty? q)) ; oczekiwany output: #t

; Dodajemy elementy do kolejki
(displayln "Dodajemy elementy do kolejki:")
(mqueue-push-back q 1)
(mqueue-push-front q 2)
(mqueue-push-back q 3)
(mqueue-push-front q 4)

; Sprawdzamy czy kolejka jest pusta
(displayln "Sprawdzamy czy kolejka jest pusta:")
(displayln (mqueue-empty? q)) ; oczekiwany output: #f

; Wypisujemy zawartość kolejki
(displayln "Wypisujemy zawartość kolejki:")
(mqueue-print q)
