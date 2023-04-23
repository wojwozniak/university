#lang racket

; Zadanie 1

; Zdefiniuj procedurę cycle!, która zapętla listę mutowalną, 
; czyli przepina wskaźnik ogona ostatniego elementu na początek listy.


; Definicja prodecury cycle!
(define (cycle! lst)
    (let ((llst
            (cond
                [(null? (mcdr lst)) lst]
                [(mpair? lst) (cycle! (mcdr lst))]
                [else #f]
            )
        ))
        (set-mcdr! llst lst)
    )
)