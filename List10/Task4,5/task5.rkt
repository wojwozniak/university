; ===================================================================
; Changes marked with "CHANGE"
; ===================================================================
#lang plait

(module+ test
  (print-only-errors #t))

;; abstract syntax -------------------------------

(define-type Op
  (add)
  (sub)
  (mul)
  (div)
  (eql)
  (leq)
  ; ========================= CHANGE ==============================
  (cons)
  (car)
  (cdr)
  (null?)
  ; ======================= END CHANGE ============================
)

(define-type Exp
  (numE [n : Number])
  (opE [op : Op]
       [l : Exp]
       [r : Exp])
  (ifE [b : Exp]
       [l : Exp]
       [r : Exp])
  (condE [cs : (Listof (Exp * Exp))])
  ; ========================= CHANGE ==============================
  (consE [car : Exp]
         [cdr : Exp])
  (nullE)
  ; ======================= END CHANGE ============================
)

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `NUMBER s)
      (numE (s-exp->number s))
    ]
    [(s-exp-match? `{if ANY ANY ANY} s)
      (ifE 
        (parse (second (s-exp->list s)))
        (parse (third (s-exp->list s)))
        (parse (fourth (s-exp->list s)))
      )
    ]
    [(s-exp-match? `{cond ANY ...} s)
      (condE (parse-cond (rest (s-exp->list s))))
    ]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
      (opE 
        (parse-op (s-exp->symbol (first (s-exp->list s))))
        (parse (second (s-exp->list s)))
        (parse (third (s-exp->list s)))
      )
    ]
    ; ========================= CHANGE ==============================
    [(s-exp-match? `{cons ANY ANY} s)
      (consE
        (parse (second (s-exp->list s)))
        (parse (third (s-exp->list s)))
      )
    ]
    [(s-exp-match? `{car ANY} s)
      (car
        (parse (second (s-exp->list s)))
      )
    ]
    [(s-exp-match? `{cdr ANY} s)
      (cdr
        (parse (second (s-exp->list s)))
      )
    ]
    [(s-exp-match? `{null? ANY} s)
      (nullE)
    ]
    ; ======================= END CHANGE ============================
    [else (error 'parse "invalid input")]
  )
)

(define (parse-cond [ss : (Listof S-Exp)]) : (Listof (Exp * Exp))
  (type-case (Listof S-Exp) ss
    [empty empty]
    [(cons ss s)
     (if (s-exp-match? `{ANY ANY} s)
        (cons 
          (pair 
            (parse (first (s-exp->list s)))
            (parse (second (s-exp->list s)))
          )
          (parse-cond ss)
        )
        (error 'parse "invalid input: cond")
      )
    ]
  )
)


(define (parse-op [op : Symbol]) : Op
  (cond
    [(eq? op '+) (add)]
    [(eq? op '-) (sub)]
    [(eq? op '*) (mul)]
    [(eq? op '/) (div)]
    [(eq? op '=) (eql)]
    [(eq? op '<=) (leq)]
    [else (error 'parse "unknown operator")]
  )
)
                
  
;; eval --------------------------------------

(define-type Value
  (numV [n : Number])
  (boolV [b : Boolean]))

(define (op-num-num->proc [f : (Number Number -> Number)]) : (Value Value -> Value)
  (λ (v1 v2)
    (type-case Value v1
      [(numV n1)
       (type-case Value v2
         [(numV n2)
          (numV (f n1 n2))]
         [else
          (error 'eval "type error")])]
      [else
       (error 'eval "type error")])))

(define (op-num-bool->proc [f : (Number Number -> Boolean)]) : (Value Value -> Value)
  (λ (v1 v2)
    (type-case Value v1
      [(numV n1)
       (type-case Value v2
         [(numV n2)
          (boolV (f n1 n2))]
         [else
          (error 'eval "type error")])]
      [else
       (error 'eval "type error")])))

(define (op->proc [op : Op]) : (Value Value -> Value)
  (type-case Op op
    [(add) (op-num-num->proc +)]
    [(sub) (op-num-num->proc -)]
    [(mul) (op-num-num->proc *)]
    [(div) (op-num-num->proc /)]
    [(eql) (op-num-bool->proc =)]
    [(leq) (op-num-bool->proc <=)]
    ; ========================= CHANGE ==============================
    [(cons) (lambda (v1 v2) (cons v1 v2))]
    [(car) (lambda (v) (car v))]
    [(cdr) (lambda (v) (cdr v))]
    [(null?) (lambda (v) (null? v))]
    ; ======================= END CHANGE ============================
  )
)

(define (eval [e : Exp]) : Value
  (type-case Exp e
    [(numE n) (numV n)]
    [(opE o l r) ((op->proc o) (eval l) (eval r))]
    [(ifE b l r)
     (type-case Value (eval b)
       [(boolV v)
        (if v (eval l) (eval r))]
       [else
        (error 'eval "type error")]
      )
    ]
    [(condE cs) (eval (cond->if cs))]
    ; ========================= CHANGE ==============================
    [(consE car cdr) (cons (eval car) (eval cdr))]
    [(nullE) (null?)]
    ; ======================= END CHANGE ============================
  )
)

(define (cond->if [cs : (Listof (Exp * Exp))]) : Exp
  (type-case (Listof (Exp * Exp)) cs
    [empty (numE 42)]
    [(cons c cs)
      (ifE 
        (fst c)
        (snd c )
        (cond->if cs)
      )
    ]
  )
)

(define (run [e : S-Exp]) : Value (eval (parse e)))


(run `{if {<= 3 4} 1 2})