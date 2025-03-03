#lang racket

(define (quicksort lst)
    (cond
        [(empty? lst) '()]
        [else 
            (let ([pivot (car lst)])
                    (append 
                        (quicksort (filter (lambda (x) (< x pivot)) (cdr lst)))
                        (list pivot)
                        (quicksort (filter (lambda (x) (>= x pivot)) (cdr lst)))
                    )
            )
        ]
    )
)

; pusta lista - pusta lista
; w.p.p. - pierwszy element to pivot
; dajemy append z:
; -  wynikiem quicksorta dla listy elementow mniejszych od pivota, 
; pivota
; i z wynikiem quicksorta dla listy elementow wiekszych od pivota
; filter to funkcja, ktora zwraca liste elementow spelniajacych predykat
; mozna dac lambdę (i tak w tym przypadku jest najlepiej)