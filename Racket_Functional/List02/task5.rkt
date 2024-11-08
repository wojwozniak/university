#lang racket
; car to pierwszy element pary, cdr drugi

; Funkcja sprawdzająca czy element należy do listy
(define (elem? x xs)
    ; Jeśli lista jest pusta to x nie należy
    (cond [(null? xs) #f]
    ; Sprawdzamy czy x jest równy pierwszemu elementowi listy
    [(equal? x (car xs)) #t]
    ; W przeciwnym wypadku wywołujemy funkcję elem? dla kolejnego elementu listy
    [else (elem? x (cdr xs))]
    )
)

; Testy dla tej funkcji
(require rackunit)

(define (test-elem?)
    (check-equal? (elem? 1 '(1 2 3 4 5)) #t)
    (check-equal? (elem? "a" '("a" "b" "c")) #t)
    (check-equal? (elem? '() '(1 2 3)) #f)
    (check-equal? (elem? 0 '(3 6 9 12)) #f)
    (check-equal? (elem? 1 '(2 3 4)) #f)
)
(test-elem?)