#lang racket

; Zadanie 1

; Zdefiniuj procedurę cycle!, która zapętla listę mutowalną, 
; czyli przepina wskaźnik ogona ostatniego elementu na początek listy.

; Użyte funkcje:
; last-pair - zwraca ostatni element listy (ten o cdr równym null) 
; set-cdr! - mutuje listę, przepinając wskaźnik cdr podanej pary na drugi argument

; Definicja procedury cycle! (Przyjmuje jedną listę jako argument) 
(define (cycle! lst)
    ; Zapisujemy resztę listy jako tail
    (define tail (cdr lst))

    ; Ustawiamy wskaźnik ostatniego elementu na początek listy
    (set-mcdr! (last-pair lst) lst)

    ; Zwracamy tail (resztę listy)
    tail
)