#lang plait


;; abstract syntax -------------------------------

(define-type Op
  (add)
  (sub)
  (mul)
  (div)
)

(define-type Exp
  (numE [n : Number])
  (opE [op : Op] [l : Exp] [r : Exp])
)

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    [ 
      (s-exp-match? `NUMBER s)
      (numE (s-exp->number s))
    ]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
      (opE 
        (parse-op (s-exp->symbol (first (s-exp->list s))))
        (parse (second (s-exp->list s)))
        (parse (third (s-exp->list s)))
      )
    ]
    [else (error 'parse "invalid input")]
  )
)

(define (parse-op [op : Symbol]) : Op
  (cond
    [(eq? op '+) (add)]
    [(eq? op '-) (sub)]
    [(eq? op '*) (mul)]
    [(eq? op '/) (div)]
    [else (error 'parse "unknown operator")]
  )
)


;; eval --------------------------------------

(define-type-alias Value Number)

(define (op->proc [op : Op]) : (Value Value -> Value)
  (type-case Op op
    [(add) +]
    [(sub) -]
    [(mul) *]
    [(div) /]
  )
)

(define (eval [e : Exp]) : Value
  (type-case Exp e
    [(numE n) n]
    [(opE o l r) ((op->proc o) (eval l) (eval r))]
  )
)

(define 
  (run [e : S-Exp]) : Value
  (eval (parse e))
)


;; printer ———————————————————————————————————-

(define (print-value [v : Value]) : Void
  (display v)
)

(define (main [e : S-Exp]) : Void
  (print-value (eval (parse e)))
)