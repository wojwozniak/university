#lang racket

(define (sm xs)
    (cond
        [(null? xs) #f]
        [(null? (cdr xs)) (car xs)]
        [else (min (car xs) (sm (cdr xs)))]
    )
)

(define (del xs val)
    (cond
        [(null? xs) xs]
        [(equal? (car xs) val) (cdr xs)]
        [else (cons (car xs) (del (cdr xs) val))]
    )
)

(define (select xs)
    (if (eq? (sm xs) #f)
        xs
        (cons (sm xs) (del xs (sm xs)))
    )  
)

(define (select-sort xs)
    (if (null? xs) 
        '()
        (cons (sm xs) (select-sort (del xs (sm xs)))) 
    )
)

; Trzy funkcje pomocnicze
; 1. Zwraca najmniejszy element listy (null dla pustej) (pierwszy element dla pierwszego) (min z pierwszego i rec dla reszty)
; 2. Usuwa pierwsze wystąpienie elementu z listy
; 3. Select - zwracamy listę jeśli pusta, w.p.p. consujemy najmniejszy element z resztą listy bez najmniejszego elementu
;
; Select-sort - zwracamy pustą listę jeśli pusta, w.p.p. consujemy najmniejszy element z resztą listy bez najmniejszego elementu
; Wszędzie rekurencja