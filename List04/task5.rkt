#lang racket

(require rackunit)

; Definicja struktur
(define-struct leaf () #:transparent)
(define-struct node (l elem r) #:transparent)

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

; Insert z wykładu
(define (insert-bst x t)
    (cond 
        [(leaf? t) (node (leaf) x (leaf))]
        [(node? t)
            (cond 
                [(= x (node-elem t)) t]
                [(< x (node-elem t))
                    (node (insert-bst x (node-l t))
                       (node-elem t)
                       (node-r t)
                    )
                ]
                [else
                    (node (node-l t)
                       (node-elem t)
                       (insert-bst x (node-r t))
                    )
                ]
            )
        ]
    )
)

; Zmodyfikuj procedurę insert z wykładu (wstawiającą element do drzewa BST) tak, aby możliwe było tworzenie drzew BST z duplikatami. Możesz założyć, że elementy równe elementowi w korzeniu drzewa będą trafiać do prawego poddrzewa.

; Definicja drzewa BST z duplikatami
(define (insert-bst-dup x t)
    (cond 
        [(leaf? t) (node (leaf) x (leaf))]
        [(node? t)
            (cond 
                ; Jedyna zmiana w tej linii - usuwam test równości - jeśli nie jest mniejszy wywołamy kod dla większych (a więc zmieni się w kod dla większych lub równych)
                [(< x (node-elem t))
                    (node (insert-bst-dup x (node-l t))
                       (node-elem t)
                       (node-r t)
                    )
                ]
                [else
                    (node (node-l t)
                       (node-elem t)
                       (insert-bst-dup x (node-r t))
                    )
                ]
            )
        ]
    )
)

; Testy
(define t1 (insert-bst-dup 5 t))
(define t2 (insert-bst-dup 5 t1))
(displayln t2)



; Zaimplementuj procedurę (treesort xs), implementującą algorytm sortowania przy użyciu drzew BST:
;• Utwórz drzewo przeszukiwania składające się z elementów listy xs.
;• Zwróć listę elementów drzewa w kolejności infiksowej

; Definicja procedury treesort
(define (treesort xs)
    ; Definiujemy funkcję wstawiającą elementy z listy do drzewa BST
    (define (treesort-acc xs t)
        (cond 
            [(null? xs) t]
            [else 
                (treesort-acc (cdr xs) (insert-bst-dup (car xs) t))
            ]
        )
    )
    ; Tworzymy drzewo BST wcześniej zdefiniowaną funkcją
    (define t (treesort-acc xs (leaf)))
    ; Definiujemy funkcję zwracającą listę elementów drzewa BST w kolejności infiksowej
    (define (inorder t)
        (cond
            ; Jeśli drzewo jest liściem zwracamy pustą listę
            [(leaf? t) '()]
            ; Jeśli drzewo jest węzłem zwracamy listę składającą się z elementów lewego poddrzewa, elementu węzła i elementów prawego poddrzewa poprzez wywołanie rekurencyjne
            [(node? t)
                (append (inorder (node-l t)) (cons (node-elem t) (inorder (node-r t))))
            ]
        )
    )
    ; Wywołujemy inorder dla drzewa BST
    (inorder t)
)

; Testy
(check-equal? (treesort '(5 2 6 8 9 5)) '(2 5 5 6 8 9))