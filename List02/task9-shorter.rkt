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