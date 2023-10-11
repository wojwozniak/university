#lang racket

; Funkcja sorted?
(define (sorted? xs)
    ; Jeśli w funkcji pozostało <= 1 elementów to na pewno jest już posortowana
    (cond [(or (null? xs) (null? (cdr xs))) #t]
        ; Jeśli dwa kolejne elementy się różnią, zwracamy fałsz
        [(> (car xs) (cadr xs)) #f]
        ; Jeśli się nie różnią testujemy dalej - wywołujemy rekurencyjnie
        [else (sorted? (cdr xs))]
    )
)

; Testy dla tej funkcji
(require rackunit)

(define (test-sorted?)
    (check-equal? (sorted? '()) #t)
    (check-equal? (sorted? '(1)) #t)
    (check-equal? (sorted? '(1 2 3 4 5)) #t)
    (check-equal? (sorted? '(1 3 2)) #f)
)
(test-sorted?)