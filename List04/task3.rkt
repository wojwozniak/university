#lang racket
(require rackunit)

; Definicja struktur
(define-struct leaf () #:transparent)
(define-struct node (l elem r) #:transparent)

; Przykładowe drzewo
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

; Przykładowe drzewo 2
(define t2
    (node
        (node ( leaf ) 2 ( leaf ))
        20
        (node 
            (node ( leaf ) 6 ( leaf ))
            8
            (node ( leaf ) 9 ( leaf ))
        )
    )
)

; Definicja (bst? t)
(define (bst? t)
    ; Wewnętrzna pętla pomocnicza
    (define (bst?-pom t min max)
        (cond
            ; Jeśli jest liściem to zawsze zwraca #t
            [(leaf? t) #t]
            ; Jeśli nie jest liściem to sprawdza czy element jest w przedziale min-max
            [
                (and 
                    (>= (node-elem t) min) 
                    (<= (node-elem t) max)
                )
                (and 
                    (bst?-pom (node-l t) min (node-elem t))
                    (bst?-pom (node-r t) (node-elem t) max)
                )
            ]
            ; Jeśli nie jest w przedziale lub wywołanie rekurencyjne zwróci #f to zwraca #f
            [else #f]
        )
    )
    ; Na początku min = -inf.0, max = +inf.0
    (bst?-pom t -inf.0 +inf.0)
)

; Testy
(define (test-bst?)
    (check-equal? (bst? t) #t)
    (check-equal? (bst? t2) #f)
)
(test-bst?)


; Definicja (sum-paths t)
(define (sum-paths t)
    ; Wewnętrzna pętla pomocnicza
    (define (sum-paths-pom t sum)
        (cond
            ; Jeśli jest liściem to zwraca liść
            [(leaf? t) (leaf)]
            ; Jeśli nie jest liściem to zwraca węzeł z sumą
            [else
                (node
                    ; Wywołanie rekurencyjne dla lewego i prawego poddrzewa
                    ; Przekazujemy sumę z aktualnego wezła + element w aktualnym wezle
                    (sum-paths-pom (node-l t) (+ sum (node-elem t)))
                    (+ sum (node-elem t))
                    (sum-paths-pom (node-r t) (+ sum (node-elem t)))
                )
            ]
        )
    )
    ; Na początku sum = 0
    (sum-paths-pom t 0)
)


; Test - wypisujemy drzewo
(displayln (sum-paths t))

; Powinno zwrócić:
;( node ( node ( leaf ) 7 ( leaf ) )
;5
;( node ( node ( leaf ) 19 ( leaf ) )
;13
;( node ( leaf ) 22 ( leaf ) ) ) ) )