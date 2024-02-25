#lang racket

; Funkcja split
(define (split xs)
    ; Funkcja rekurencyjna dzieląca listę na dwie połowy
    (let rec ((xs xs) (xs1 '()) (xs2 '()))
        (cond
            [(null? xs) (cons xs1 xs2)] ; Jeśli lista jest pusta, zwróć listy
            [(null? (cdr xs)) (cons (cons (car xs) xs1) xs2)] ; Jeśli lista ma jeden element, dodaje go do pierwszej listy i zwraca listy
            [else (rec (cddr xs) (cons (car xs) xs1) (cons (cadr xs) xs2))] ; W przeciwnym razie, dodaje pierwszy element do pierwszej listy, drugi element do drugiej listy, i kontynuuje rekurencyjnie z resztą listy
        )
    )
)

; Funkcja merge
(define (merge xs ys)
    (cond
        [(null? xs) ys] ; Jeśli pierwsza lista jest pusta, zwracamy drugą
        [(null? ys) xs] ; Jeśli druga lista jest pusta, zwracamy pierwszą
        [(<= (car xs) (car ys)) (cons (car xs) (merge (cdr xs) ys))] ; Jeśli pierwszy element pierwszej listy jest mniejszy lub równy pierwszemu elementowi drugiej listy, dodajemy go do wynikowej listy i kontynuujemy z resztą pierwszej listy i drugą listą
        [else (cons (car ys) (merge xs (cdr ys)))] ; W przeciwnym razie, dodajemy pierwszy element drugiej listy do wynikowej listy i kontynuujemy z pierwszą listą i resztą drugiej listy
    )
)

; Funkcja merge-sort
(define (merge-sort xs)
    (if (<= (length xs) 1)
        xs
        (merge (merge-sort (car (split xs))) (merge-sort (cdr (split xs))))
    )
)

; Jest ona strukturalnie rekurencyjna. Każde wywołanie funkcji obejmuje część oryginalnej listy (nie powoduje jednak zmian w strukturze (którą zmienia dopiero merge po dotarciu do list długości 1))

; Testy dla tej funkcji
(require rackunit)

(define (test-sorted?)
    (check-equal? (merge-sort '(5 3 8 1 9 2)) '(1 2 3 5 8 9))
    (check-equal? (merge-sort '(7)) '(7))
    (check-equal? (merge-sort '()) '())
    (check-equal? (merge-sort '(1 1 1 1 1)) '(1 1 1 1 1))
    (check-equal? (merge-sort '(1 2 3 4 5)) '(1 2 3 4 5))
    (check-equal? (merge-sort '(5 4 3 2 1)) '(1 2 3 4 5))
)
(test-sorted?)