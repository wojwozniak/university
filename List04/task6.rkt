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

; Zaimplementuj procedurę delete, zwracającą drzewo z usuniętym danym kluczem, dla reprezentacji drzew przeszukiwań binarnych z wykładu. Wskazówka: Aby stworzyć drzewo przeszukiwań binarnych z którego usunęliśmy korzeń, najlepiej znaleźć (jeśli istnieje) najmniejszy element większy od tego korzenia.

; Definicja delete
(define (delete t key)
    (cond
        ; Jeśli drzewo jest liściem, zwróć drzewo
        [(leaf? t) t]
        ; Jeśli klucz jest mniejszy od elementu w korzeniu, wywołaj delete dla lewego podrzewa, zwróć z powrotem drzewo z usuniętym elementem
        [(< key (node-elem t))
            (node (delete (node-l t) key) (node-elem t) (node-r t))]
        ; -,,-
        [(> key (node-elem t))
            (node (node-l t) (node-elem t) (delete (node-r t) key))]
        ; Jeśli klucz jest równy elementowi w korzeniu, usuwamy
        [else
            (cond
                ; Jeśli jedno z podrzew jest liściem, zwróć drugie
                [(leaf? (node-l t)) (node-r t)]
                [(leaf? (node-r t)) (node-l t)]
                ; w.p.p.
                [else
                    ; Definicja pomocniczej funkcji find-min
                    (define (find-min t)
                        (cond
                            ; Jeśli drzewo jest liściem, zwróć drzewo
                            [(leaf? t) t]
                            ; Jeśli lewe poddrzewo jest liściem, zwróć drzewo
                            [(leaf? (node-l t)) t]
                            ; W przeciwnym wypadku, wywołaj find-min dla lewego podrzewa
                            [else (find-min (node-l t))]
                        )
                    )
                    ; Znajdujemy najmniejszy element większy od korzenia
                    (define min (node-elem (find-min (node-r t))))

                    ; Zwracamy węzeł składający się z lewego podrzewa, znalezionego min, i prawego podrzewa z usuniętym min
                    (node (node-l t) min (delete (node-r t) min))
                ]
            )
        ]
    )
)

; Testy
(displayln "Drzewo: ")
(displayln t)

(define t2 (delete t 4))
(displayln "Drzewo po usunięciu nieisteniejacego elementu: ")
(displayln t2)

(define t3 (delete t 5))
(displayln "Drzewo po usunięciu elementu 5: ")
(displayln t3)