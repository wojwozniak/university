#lang plait

; ======================================================================
; Task 1 - my changes marked with #NEW
; Changes at:
; ~80 line
; ~150 line
; ======================================================================


;; abstract syntax -------------------------------

(define-type Op
  (add) (sub) (mul) (div) (eql) (leq))

(define-type Exp
  (numE [n : Number])
  (opE [op : Op] [l : Exp] [r : Exp])
  (ifE [b : Exp] [l : Exp] [r : Exp])
  (varE [x : Symbol])
  (letE [x : Symbol] [e1 : Exp] [e2 : Exp])
  (lamE [x : Symbol] [e : Exp])
  (appE [e1 : Exp] [e2 : Exp]))

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `NUMBER s)
     (numE (s-exp->number s))]
    [(s-exp-match? `{lambda {SYMBOL} ANY} s)
     (lamE (s-exp->symbol
            (first (s-exp->list 
                    (second (s-exp->list s)))))
           (parse (third (s-exp->list s))))]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
     (opE (parse-op (s-exp->symbol (first (s-exp->list s))))
          (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s))))]
    [(s-exp-match? `{if ANY ANY ANY} s)
     (ifE (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s)))
          (parse (fourth (s-exp->list s))))]
    [(s-exp-match? `SYMBOL s)
     (varE (s-exp->symbol s))]
    [(s-exp-match? `{let SYMBOL ANY ANY} s)
     (letE (s-exp->symbol (second (s-exp->list s)))
           (parse (third (s-exp->list s)))
           (parse (fourth (s-exp->list s))))]
    [(s-exp-match? `{ANY ANY} s)
     (appE (parse (first (s-exp->list s)))
           (parse (second (s-exp->list s))))]
    [else (error 'parse "invalid input")]))

(define (parse-op [op : Symbol]) : Op
  (cond
    [(eq? op '+) (add)]
    [(eq? op '-) (sub)]
    [(eq? op '*) (mul)]
    [(eq? op '/) (div)]
    [(eq? op '=) (eql)]
    [(eq? op '<=) (leq)]
    [else (error 'parse "unknown operator")]))


;; eval --------------------------------------

;; values

(define-type Value
  (numV [n : Number])
  (boolV [b : Boolean])
  (funV [x : Symbol] [e : Exp] [env : Env]))

(define-type Binding
  (bind [name : Symbol]
        [val : (-> Value)]))

;; environments

(define-type-alias Env (Listof Binding))
(define mt-env empty)

; ======================================================================
; # NEW
; ======================================================================


; v now is a function, which returns a value.
(define 
  (extend-env [env : Env] [x : Symbol] [v : (-> Value)]) : Env
  (cons (bind x v) env)
)


; ((bind-val b)) instead of (bind-val b) - we want to evaluate the value of b on demand
; instead of evaluating it right away.
(define (lookup-env [n : Symbol] [env : Env]) : Value
  (type-case (Listof Binding) env
    [empty (error 'lookup "unbound variable")]
    [(cons b rst-env) 
      (cond
        [
          (eq? n (bind-name b))
          ((bind-val b))
        ]
        [else (lookup-env n rst-env)]
      )
    ]
  )
)

; ======================================================================
; # end of first part of changes, more below
; ======================================================================

;; primitive operations

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
    [(leq) (op-num-bool->proc <=)]))

;; evaluation function (eval/apply)

; ======================================================================
; # NEW
; ======================================================================

(define (eval [e : Exp] [env : Env]) : Value
  (begin (display env)
    (type-case Exp e
      [(numE n) (numV n)]
      [(opE o l r) ((op->proc o) (eval l env) (eval r env))]
      [(ifE b l r)
      (type-case Value (eval b env)
        [(boolV v)
          (if v (eval l env) (eval r env))]
        [else
          (error 'eval "type error")])]
      [(varE x)
      (lookup-env x env)]
      [(letE x e1 e2)
      (let ([v1 (lambda() (eval e1 env))])
        (eval e2 (extend-env env x v1)))]
      [(lamE x b)
      (funV x b env)]
      ; #NEW change here - changed (apply (eval e1 env) (eval e2 env)) to (apply (eval e1 env) e2)
      ; so that we don't evaluate the second argument right away, but instead pass it as a function
      ; which returns a value.
      [(appE e1 e2)
        (apply (eval e1 env) e2)
      ]
      ; end of change
    )
  )
)

; Changed [v2: Value] to [v2: Exp] - we want to evaluate the second argument on demand.
(define (apply [v1 : Value] [v2 : Exp]) : Value
  (type-case Value v1
    [(funV x b env)
      ; #NEW change here - changed (eval b (extend-env env x v2)) to (eval b (extend-env env x (lambda() (eval v2 env))))
      ; evaluate the second argument on demand.
      (eval b (extend-env env x (lambda() (eval v2 env))))
    ]
    [else (error 'apply "not a function")]
  )
)

; ======================================================================
; # end of task
; ======================================================================

(define (run [e : S-Exp]) : Value
  (eval (parse e) mt-env))



;; printer ———————————————————————————————————-

(define (value->string [v : Value]) : String
  (type-case Value v
    [(numV n) (to-string n)]
    [(boolV b) (if b "true" "false")]
    [(funV x e env) "#<procedure>"]))

(define (print-value [v : Value]) : Void
  (display (value->string v)))

(define (main [e : S-Exp]) : Void
  (print-value (eval (parse e) mt-env)))
