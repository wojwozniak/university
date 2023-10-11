#lang racket

; Zadanie: Zareprezentuj zbiory wartości Racketowych przy użyciu predykatów charakterystycznych

; Dla każdej wartości zwracamy wartość logiczną określającą czy wartość należy do zbioru czy nie


; empty-set - zbiór pusty
(define (empty-set)
    (lambda (x) #f)
)

; singleton - zbiór zawierający jeden element
(define (singleton a)
    (lambda (x) (equal? x a))
)

; in - sprawdza czy element a należy do zbioru s
(define (in a s)
    (s a)
)

; union - suma zbiorów
(define (union s t)
    (lambda (x) (or (s x) (t x)))
)


; intersect - przecięcie zbiorów
(define (intersect s t)
    (lambda (x) (and (s x) (t x)))
)


; Przykładowe użycia
(define s1 (singleton 1)) ; zbiór {1}
(define s2 (singleton 2)) ; zbiór {2}
(define s3 (singleton 3)) ; zbiór {3}

(define s4 (union s1 s2)) ; zbiór {1, 2}
(define s5 (intersect s1 s4)) ; zbiór {1}

(in 2 s4) ; #t
(in 3 s4) ; #f