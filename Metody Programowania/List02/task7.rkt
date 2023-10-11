#lang racket
; Korzystamy ze znaku ' aby interpreter nie rozumiał nawiasu jako wywołanie funkcji

; Funkcja suffixes
(define (suffixes xs)
    ; Tworzymy funkcję rekurencyjną - jako argumenty przyjmuje wejściową listę i akumulator (początkowo pusty)
    (let rec ((xs xs) (acc '()))
        ; Jeśli lista jest pusta zwracamy listę zawierającą pustą listę i resztę akumulatora - w przeciwnym wypadku wywołujemy funkcję rekurencyjną bez pierwszego elementu (i dopisujemy starą listę do akumulatora)
        (if (null? xs)
            (cons '() acc)
            (rec (cdr xs) (cons xs acc))
        )
    )
)


; Testy dla tej funkcji (zwraca w odwrotnej kolejności niż w przykładzie - ale najpewniej można to potraktować jakimś reversem)

(require rackunit)

(define (test-suffixes)
    (check-equal? (suffixes '()) '(()))
    (check-equal? (suffixes '(1)) '((1) ()))
    (check-equal? (suffixes '(1 2)) '(() (2) (1 2)))
    (check-equal? (suffixes '(1 2 3)) '(() (3) (2 3) (1 2 3)))
    (check-equal? (suffixes '(1 2 3 4)) '(((4) (3 4) (2 3 4) (1 2 3 4))))
)

(test-suffixes)