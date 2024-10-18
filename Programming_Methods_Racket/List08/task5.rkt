#lang plait

; Zadanie 5

; Rozszerz kalkulator z wykładu o operacje potęgowania, 
; silni i liczby przeciwnej (unarny minus). 
; W tym celu najpierw uzupełnij składnię abstrakcyjną 
; i interpreter, a następnie rozbuduj parser, 
; tak aby obsługiwał nowe konstrukcje.

; --------------------------------------------
; Funkcje 
; --------------------------------------------

; Potęgowanie
(define (pow a b)
  (if (= 0 b)
    1
    (* a (pow a (- b 1)))
  )
)

; Odwrotność
(define (opposite a)
  (* -1 a)
)

; Silnia
(define (factorial a)
  (if (= a 1)
    1
    (* a (factorial (- a 1)))
  )
)

; --------------------------------------------
; Typy operacji
; --------------------------------------------

; Definiujemy 2 typy operacji (1 - unarne, 2 - binarne)

; Operacje binarne
(define-type Op2
  (op-add) (op-mul) (op-sub) (op-div) (op-pow)
)

; Operacje unarne
(define-type Op1
  (op-factorial)
  (op-opposite)
)

; Definiujemy typ wyrażeń
(define-type Exp
  (exp-number [n : Number])
  (exp-op2 [op : Op2] [e1 : Exp] [e2 : Exp])
  (exp-op1 [op : Op1] [e1 : Exp])
)

; --------------------------------------------
; Parser
; --------------------------------------------

; Parsowanie operacji binarnych
(define (parse-Op2 s)
  (let ([sym (s-exp->symbol s)])
    (cond
      [(equal? sym '+) (op-add)]
      [(equal? sym '-) (op-sub)]
      [(equal? sym '*) (op-mul)]
      [(equal? sym '/) (op-div)]
      [(equal? sym '^) (op-pow)]
    )
  )
)

; Parsowanie operacji unarnych
(define (parse-Op1 s)
  (let ([sym (s-exp->symbol s)])
    (cond
      [(equal? sym '!) (op-factorial)]
      [(equal? sym 'opposite) (op-opposite)]
    )
  )
)

; Parsowanie wyrażeń
(define (parse-Exp s)
  (cond
    [(s-exp-number? s) (exp-number (s-exp->number s))]
    [(s-exp-list? s)
     (let ([xs (s-exp->list s)])
       (if (= (length xs) 3)
        (exp-op2 
          (parse-Op2 (first xs))
          (parse-Exp (second xs))
          (parse-Exp (third xs))
        )
        (exp-op1 
          (parse-Op1 (first xs))
          (parse-Exp (second xs))
        )
       )
      )
    ]
  )
)

; --------------------------------------------
; Ewaluacja wyrażeń
; --------------------------------------------

; Ewaluacja operacji binarnych
(define (eval-op2 op)
  (type-case Op2 op
    [(op-add) +]
    [(op-sub) -]
    [(op-mul) *]
    [(op-div) /]
    [(op-pow) pow]
  )
)

; Ewaluacja operacji unarnych
(define (eval-op1 op)
  (type-case Op1 op
    [(op-factorial) factorial]
    [(op-opposite) opposite]
  )
)

; Ogólna funkcja eval
(define (eval e)
  (type-case Exp e
    [(exp-number n) n]
    [
      (exp-op2 op e1 e2) 
      ((eval-op2 op) (eval e1) (eval e2))
    ]
    [
      (exp-op1 op e) 
      ((eval-op1 op) (eval e))
    ]
  )
)


; --------------------------------------------
; Testy
; --------------------------------------------

(define exp1 (parse-Exp `(+ 2 1)))
(eval exp1)
(define exp2 (parse-Exp `(! (+ 2 5))))
(eval exp2)