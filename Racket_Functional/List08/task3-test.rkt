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

; Druga kolejka
(define q2 (make-mqueue))
(mqueue-push-front q2 11)
(mqueue-push-back q2 12)

; Łączymy kolejki
(displayln "Łączymy kolejki:")
(mqueue-join q q2)
(mqueue-print q) ; Oczekiwany output: {2 1 11 12}
(mqueue-print q2) ; Oczekiwany output: "Kolejka jest pusta"