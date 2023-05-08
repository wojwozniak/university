#lang racket
(require "syntax.rkt")

; Ten plik zawiera ogólne definicje funkcji parsujących, 
; które użyte są w pliku expparser.rkt
; Dodany został kontrakt eksportujący odpowiednie funkcje.

; ---- Dodany kod ----

; Kontrakt eksportujący odpowiednie funkcje parsujące.
(provide 
    (contract-out 
        [match-sexp (-> any/c any/c any/c)]
        [run-parser (-> any/c any/c any/c)]
    )
)

; ---- Koniec dodanego kodu ----
; Poniżej jedyne zmiany to formatowanie i komentarze


; Zwraca listę wartości dla wyrażenia s, 
; które pasują do wzorca pat, 
; lub #f jeśli nie udało się go dopasować.
(define (match-sexp pat s)
    (match pat
        ['ANY    (list s)]
        ['SYMBOL (and (symbol? s) (list s))]
        ['NUMBER (and (number? s) (list s))]
        ['()     (and (null? s)   null)]
        [(cons p1 p2)
            (and 
                (pair? s)
                (let ([r1 (match-sexp p1 (car s))])
                    (and 
                        r1
                        (let 
                            ([r2 (match-sexp p2 (cdr s))])
                            (and r2 (append r1 r2))
                        )
                    )
                )
            )
        ]
        [_ 
            (cond
                [(symbol? pat) (and (symbol? s) (eq? pat s) null)]
            )
        ]
    )
)

; Wywołanie parsowania
(define (run-parser p s)
    (match p
        ['() (error "Syntax error")]
        [(cons (list pat action) rest-p)
            (let ([r (match-sexp pat s)])
                (if r
                    (apply action r)
                    (run-parser rest-p s)
                )
            )
        ]
    )
)
