#lang plait

; Zadanie 4

; Zmodyfikuj parser wyrażeń arytmetycznych z wykładu tak, 
; by nie konstruował abstrakcyjnego drzewa rozbioru (drzewa typu Exp), 
; ale od razu obliczał podane wyrażenie do liczby.

; ----------------------------------------------
; Kod z wykładu
; ----------------------------------------------

(define-type Op
    (op-add) (op-mul) (op-sub) (op-div)
)

(define-type Exp
    (exp-number [n : Number])
    (exp-op [op : Op] [e1 : Exp] [e2 : Exp])
)

(define (parse-Op s)
    (let ([sym (s-exp->symbol s)])
        (cond
            [(equal? sym '+) (op-add)]
            [(equal? sym '-) (op-sub)]
            [(equal? sym '*) (op-mul)]
            [(equal? sym '/) (op-div)]
        )
    )
)

(define (parse-Exp s)
    (cond
        [(s-exp-number? s) (exp-number (s-exp->number s))]
        [(s-exp-list? s)
            (let 
                ([xs (s-exp->list s)])
                (exp-op 
                  (parse-Op  (first  xs))
                  (parse-Exp (second xs))
                  (parse-Exp (third  xs))
                )
            )
        ]
    )
)

; ==============================================

(define (eval-op op)
    (type-case Op op
        [(op-add) +]
        [(op-sub) -]
        [(op-mul) *]
        [(op-div) /]
    )
)

(define (eval e)
    (type-case Exp e
        [(exp-number n)    n]
        [(exp-op op e1 e2)
            ((eval-op op) (eval e1) (eval e2))
        ]
    )
)

; ----------------------------------------------
; Rozwiązanie
; ----------------------------------------------


(define (parse-Exp-new s)
  (cond
    [(s-exp-number? s) (s-exp->number s)]
    [(s-exp-list? s)  
      (let 
        ([xs (s-exp->list s)])
        (
          ; Jednyna różnica to wstawienie tutaj eval op na 
          ; początku zamiast wywołania exp-op na wszystkich 
          ; trzech argumentach
          (eval-op (parse-Op (first xs))) 
          (parse-Exp-new (second xs)) 
          (parse-Exp-new (third xs))
        )
      )
    ]
  )
)

; ----------------------------------------------
; Testy
; ----------------------------------------------

(parse-Exp-new `(+ (+ 1 2) 3))