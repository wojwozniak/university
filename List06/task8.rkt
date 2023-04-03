#lang plait

; Definicja funkcji sorted? 
(define (sorted? xs)
    (cond 
        [(empty? (rest xs)) #t]
        [(> (first xs) (first(rest xs))) #f]
        [else (sorted? (rest xs))]
    )
)

; Definicja funkcji insert
(define (insert x xs)
    (cond 
        [(empty? xs) (cons x (list))]
        [(> (first xs) x) (cons x xs)]
        [else (cons (first xs) (insert x (rest xs)))]
    )
)