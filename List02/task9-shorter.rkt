#lang racket

(define (najmniejszy-element lista)
    (cond
        [(null? lista) #f]
        [(null? (cdr lista)) (car lista)]
        [else (min (car lista) (najmniejszy-element (cdr lista)))]
    )
)

(define (usun-element lista wartosc)
    (cond
        [(null? lista) lista]
        [(equal? (car lista) wartosc) (cdr lista)]
        [else (cons (car lista) (usun-element (cdr lista) wartosc))]
    )
)

(define (select xs)
    (if (eq? (najmniejszy-element xs) #f)
        xs
        (cons (najmniejszy-element xs) (usun-element xs (najmniejszy-element xs)))
    )  
)

(define (select-sort xs)
    (if (null? xs) 
        '()
        (cons (najmniejszy-element xs) (select-sort (usun-element xs (najmniejszy-element xs)))) 
    )
)