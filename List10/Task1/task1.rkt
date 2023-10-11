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
  (opE [op : Op] [args : (Listof Exp)]) ; Change to (Listof Exp) for variable number of args
)

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    [ 
      (s-exp-match? `NUMBER s)
      (numE (s-exp->number s))
    ]
    [(s-exp-match? `{SYMBOL ANY ...} s)   ; Change to `{SYMBOL ANY ...} for variable number of args
      (opE
        (parse-op (s-exp->symbol (first (s-exp->list s))))
        (map parse (rest (s-exp->list s)))   ; Change to maping rest of arguments instead of fixed 2
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
    [(opE o args) (eval-op o args)] ; Change to eval-op o args for variable number of args
  )
)

(define (eval-op [o : Op] [args : (Listof Exp)]) : Value ; Add eval-op function
  (cond
    [(empty? args) 0]
    [(empty? (rest args)) (eval (first args))]
    [else ((op->proc o) (eval (first args)) (eval-op o (rest args)))]
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

;; tests --------------------------------------

(main `{+})
(display "\n")
(main `{+ 1})
(display "\n")
(main `{+ 1 2})
(display "\n")
(main `{+ 1 2 3 4})