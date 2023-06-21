#lang racket

(define (zip lst1 lst2)
    (cond
        [(or (null? lst1) (null? lst2))
            '()
        ]
        [else
            (cons 
                (cons (car lst1) (car lst2))
                (zip  (cdr lst1) (cdr lst2))
            )
        ]
    )
)

; Lekki błąd ale lepszej na razie nie ogarnę
(define (unzip pairs)
    (cond
        [(null? pairs)
        '(() ())
        ]
        [else
            (let ([unzipped (unzip (cdr pairs))])
                (cons 
                    (cons (car (car pairs)) (car unzipped))
                    (cons (cdr (car pairs)) (cdr unzipped))
                )
            )
        ]
    )
)

; Test unzip

(unzip (zip '(1 2 3) '(4 5 6)))
