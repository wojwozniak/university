#lang racket
(require rackunit)

; Definicja struktur
(define-struct leaf () #:transparent)
(define-struct node (l elem r) #:transparent)

; Drzewo z zad 1 do testów
(define t
    (node
        (node ( leaf ) 2 ( leaf ))
        5
        (node 
            (node ( leaf ) 6 ( leaf ))
            8
            (node ( leaf ) 9 ( leaf ))
        )
    )
)



; Definicja flatten
(define (flatten t)
    ; Definiujemy flat-append tak jak w wskazówce
    (define (flat-append t xs)
        ; Korzystamy z procedury match
        (match t
            ; Jeśli t jest liściem zwracamy jego wartość
            [(leaf) xs]
            ; w.p.p wywołujemy flat-append na lewym poddrzewie i liście stworzonej z elementu w korzeniu i prawego poddrzewa
            [(node l elem r)       
                (flat-append l 
                    (cons elem (flat-append r xs))
                )
            ]
        )
    )
    (flat-append t '())
)

; Testujemy flatten na drzewie z zad 1
(define (test-flatten)
    (check-equal? (flatten t) '(2 5 6 8 9))
)
(test-flatten)