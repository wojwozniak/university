#lang racket

(define (split xs)
    (let rec ((xs xs) (xs1 '()) (xs2 '()))
        (cond
            [(null? xs) (cons xs1 xs2)]
            [(null? (cdr xs)) (cons (cons (car xs) xs1) xs2)]
            [else (rec (cddr xs) (cons (car xs) xs1) (cons (cadr xs) xs2))]
        )
    )
)

(define (merge xs ys)
    (cond
        [(null? xs) ys]
        [(null? ys) xs]
        [(<= (car xs) (car ys)) (cons (car xs) (merge (cdr xs) ys))]
        [else (cons (car ys) (merge xs (cdr ys)))]
    )
)

(define (merge-sort xs)
    (if (<= (length xs) 1)
        xs
        (merge (merge-sort (car (split xs))) (merge-sort (cdr (split xs))))
    )
)

; Dwie funkcje pomocnicze
; 1) Podział na dwie listy (przekazujemy w argumencie)
; 2) Scalanie dwóch list (po dwa elementy)
; 
; merge-sort - merge na merge-sortach dwóch części ze splita