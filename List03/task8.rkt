#lang racket

; 1)
; Zwracamy funkcję reprezentującą listę racketową xs
(define (list->llist xs)
    (lambda (ys)
        (if (null? xs)
            ys
            (cons (car xs) ((list->llist (cdr xs)) ys))
        )
    )
)
; Funkcja list->llist działa rekurencyjnie. Gdy xs jest pusta, funkcja zwraca listę ys.

; Wywołanie z przykładu
(define f (list->llist '(1 2)))
(f '(3 4))


; 2)
; Wywołujemy funkcję f z pustą listą jako argumentem, co powoduje zwrócenie zwykłej racketowej listy
(define (llist->list f)
    (f '())
)

; Przykładowe wywołania
(define g (list->llist '(1 2)))
(llist->list g)


; 3)
(define (llist-null)
    (lambda (ys) '())
)
; Funkcja zwraca funkcję jednoargumentową zwracającą pustą listę

; Przykładowe wywołanie
(define empty-list (llist-null))
(empty-list '(1 2 3))


; 4)
(define (llist-singleton x)
    (lambda (ys) (cons x '()))
)

; Przykładowe wywołanie
(define single-list (llist-singleton 42))
(single-list '(1 2 3))

; [WIP]