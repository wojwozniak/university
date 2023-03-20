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

; Definicja fold-tree
; Przyjmujemy funkcję f, wartość początkową acc oraz drzewo t
(define (fold-tree f acc t)
    ; Jeśli t to liść, zwracamy jego wartość. Jeśli nie to wywołujemy rekurencyjnie f na jego liściach, a następnie łączymy je z wartością węzła za pomocą funkcji f
    (cond 
        [(leaf? t) acc]
        [(node? t) 
            (f
                (node-elem t)
                (fold-tree f acc (node-l t))
                (fold-tree f acc (node-r t))
            )
        ]
    )
)



; Definicja tree-sum
(define (tree-sum t)
    (fold-tree 
        (lambda (e left right) (+ e left right)) 0 t
    )
)

; Testujemy tree-sum na drzewie z zad 1
(define (test-tree-sum)
    (check-equal? (tree-sum t) 30)
)
(test-tree-sum)



; Definicja tree-flip
(define (tree-flip t)
    ; Funkcja flip-node zamienia miejscami lewe i prawe poddrzewo
    (define (flip-node l v r) (node r v l))
    ; Wywołujemy fold-tree z funkcją flip-node
    (fold-tree flip-node t)
)



; Deficja tree-height
(define (tree-height t)
    ; Jeśli t jest liściem zwracamy zero, w.p.p wywołujemy na jego poddrzewach rekurencyjnie tree-height i zwracamy największą z nich + 1
    (cond
        [(leaf? t) 0]
        [(node? t) 
            (+ 1 
                (max
                    (tree-height (node-l t)) 
                    (tree-height (node-r t))
                )
            )
        ]
    )
)

; Testujemy tree-height na drzewie z zad 1
(define (test-tree-height)
    (check-equal? (tree-height t) 3)
)
(test-tree-height)



; Definicja tree-span - najpierw zdefiniujemy pomocnicze tree-min i tree-max
(define (tree-min t)
    (fold-tree 
        (lambda (left val right)
            (min val (min left right))
        )
        +inf.0
        t
    )
)

(define (tree-max t)
    (fold-tree 
        (lambda (left val right)
            (max val (max left right))
        )
        -inf.0
        t
    )
)

; Teraz definiujemy tree-span
(define (tree-span t)
    (list (tree-min t) (tree-max t))
)


; Testujemy tree-span na drzewie z zad 1
(define (test-tree-span)
    (check-equal? (tree-span t) '(2.0 9.0))
)
(test-tree-span)



; Definicja tree-flatten
(define (flatten t)
    (fold-tree 
        (lambda 
            (x left right) (append left (cons x right))
        ) 
        '() 
        t
    )
)

; Testujemy tree-flatten na drzewie z zad 1
(define (test-tree-flatten)
    (check-equal? (flatten t) '(2 5 6 8 9))
)
(test-tree-flatten)