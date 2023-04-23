#lang racket

; Zadanie 1

; Zdefiniuj procedurę cycle!, która zapętla listę mutowalną, 
; czyli przepina wskaźnik ogona ostatniego elementu na początek listy.


; Pomocnicza funkcja helper, która zwraca ostatni element listy
(define (helper lst)
    (cond
        [(null? (mcdr lst)) lst]
        [(mpair? lst) (helper (mcdr lst))]
        [else #f]
    )
)

; Definicja prodecury cycle!
(define (cycle! lst)
    (let 
        ((llst (helper lst))) 
        (set-mcdr! llst lst)
    )
)

(define lst (mcons 1 (mcons 2 (mcons 3 '()))))
(displayln lst)
(cycle! lst)
(displayln lst)