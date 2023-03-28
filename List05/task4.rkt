#lang racket

; To w rackecie :(

; Zaimplementuj procedurę perms, 
; obliczającą wszystkie permutacje zadanej listy
; (w dowolnej kolejności). Na przykład:
; > ( perms '(1 2 3) )
; '((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1) )

; Definiujemy funkcje pomocnicze (z racketa których nie ma w plait)

; append-map - funkcja mapująca, 
; która zwraca listę sklejoną z wyników funkcji f 
; dla każdego elementu listy lst
(define (append-map f lst)
    (foldr (lambda (x acc) (append (f x) acc)) '() lst)
)

; Remove - usuwa z listy lst wszystkie elementy spełniające warunek p
(define (remove p lst)
    (filter (lambda (x) (not (p x))) lst)
)

; Definicja funkcji perms
(define (perms lst)
    (cond 
        ; Jeśli lista jest pusta zwracamy pustą listę
        [(empty? lst) '(())]
        ; w przeciwnym wypadku:
        [else
            ; Dla każdego elementu x z listy lst
            ; tworzymy listę permutacji listy lst bez x
            ; i dodajemy x na początku każdej permutacji
            (append-map
                (lambda (x)
                    (map 
                        (lambda (p) (cons x p))
                        (perms (remove x lst))
                    )
                )            
            lst)
        ]
    )
)

