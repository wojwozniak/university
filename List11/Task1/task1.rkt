#lang plait

; ======================================================================
; ====================== Changes tagged with #NEW ======================
; ======================================================================

;; abstract syntax -------------------------------

(define-type Op
  (add) (sub) (mul) (div) (eql) (leq) (errOp))

(define-type Exp
  (numE [n : Number])
  (opE [op : Op] [l : Exp] [r : Exp])
  (ifE [b : Exp] [l : Exp] [r : Exp])
  (condE [cs : (Listof (Exp * Exp))])
  (errorE [loc : Symbol] [msg : String])
  (tryE [e1 : Exp] [e2 : Exp])) ;#NEW

;; parse ----------------------------------------

(define (parse-exp [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `NUMBER s)
     (numE (s-exp->number s))]
    [(s-exp-match? `{if ANY ANY ANY} s)
     (ifE (parse-exp (second (s-exp->list s)))
          (parse-exp (third (s-exp->list s)))
          (parse-exp (fourth (s-exp->list s))))]
    [(s-exp-match? `{cond ANY ...} s)
     (condE (parse-cond (rest (s-exp->list s))))]
    [(s-exp-match? `{error SYMBOL STRING} s)
     (errorE (s-exp->symbol (second (s-exp->list s)))
             (s-exp->string (third (s-exp->list s))))]
    [(s-exp-match? `{try ANY ANY} s) ;#new
     (tryE (parse-exp (second (s-exp->list s)))
           (parse-exp (third (s-exp->list s))))]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
     (opE (parse-op (s-exp->symbol (first (s-exp->list s))))
          (parse-exp (second (s-exp->list s)))
          (parse-exp (third (s-exp->list s))))]
    [else (errorE 'parse-exp "parse-exp error")]))

(define (parse-cond [ss : (Listof S-Exp)]) : (Listof (Exp * Exp))
  (type-case (Listof S-Exp) ss
    [empty
     empty]
    [(cons s ss)
     (if (s-exp-match? `{ANY ANY} s)
         (cons (pair (parse-exp (first (s-exp->list s)))
                     (parse-exp (second (s-exp->list s))))
               (parse-cond ss))
         (list (pair (errorE 'parse-exp "cond error") (errorE 'parse-exp "cond error"))))])) ;NOWE

(define (parse-op [op : Symbol]) : Op
  (cond
    [(eq? op '+) (add)]
    [(eq? op '-) (sub)]
    [(eq? op '*) (mul)]
    [(eq? op '/) (div)]
    [(eq? op '=) (eql)]
    [(eq? op '<=) (leq)]
    [else (errOp)])) ;#NEW
  
;; eval --------------------------------------

(define-type Value
  (numV [n : Number])
  (boolV [b : Boolean]))

(define-type Answer
  (valueA [v : Value])
  (errorA [loc : Symbol] [msg : String]))

;; error monad

(define (err [l : Symbol] [m : String]) : Answer
  (errorA l m))

(define (return [v : Value]) : Answer
  (valueA v))

(define (bind [a : Answer] [f : (Value -> Answer)]) : Answer
  (type-case Answer a
    [(valueA v)
     (f v)]
    [(errorA l m)
     (errorA l m)]))

(define-syntax do
  (syntax-rules ()
    [(do () a)
     a]
    [(do ([x1 a1] [x2 a2] ...) a)
     (bind a1 (λ (x1) (do ([x2 a2] ...) a)))])) 

;; primitive operations

(define (op-num-num->proc [f : (Number Number -> Number)]) : (Value Value -> Answer) ;NOWE
  (λ (v1 v2)
    (type-case Value v1
      [(numV n1)
       (type-case Value v2
         [(numV n2)
          (return (numV (f n1 n2)))]
         [else
          (err 'eval "type error")])]
      [else
       (err 'eval "type error")])))

(define (op-num-bool->proc [f : (Number Number -> Boolean)]) : (Value Value -> Answer) ;NOWE
  (λ (v1 v2)
    (type-case Value v1
      [(numV n1)
       (type-case Value v2
         [(numV n2)
          (return (boolV (f n1 n2)))]
         [else
          (err 'eval "type error")])]
      [else
       (err 'eval "type error")])))

(define (op->proc [op : Op]) : (Value Value -> Answer)
  (type-case Op op
    [(add) (op-num-num->proc +)]
    [(sub) (op-num-num->proc -)]
    [(mul) (op-num-num->proc *)]
    [(div) (op-num-num->proc /)]
    [(eql) (op-num-bool->proc =)]
    [(leq) (op-num-bool->proc <=)]
    [(errOp) op-err-handler])) ;#NEW

(define op-err-handler ;#NEW
  (lambda (x y) (err 'op "operator error")))

;; evaluation function

(define (eval [e : Exp]) : Answer
  (type-case Exp e
    [(numE n)
     (return (numV n))]
    [(opE o l r)
     (do ([v-l (eval l)]
          [v-r (eval r)])
       ((op->proc o) v-l v-r))]
    [(ifE b l r)
     (do ([v (eval b)])
       (type-case Value v
         [(boolV u)
          (if u (eval l) (eval r))]
         [else
          (err 'eval "type error")]))]
    [(condE cs)
     (eval (cond->if cs))]
    [(errorE l m)
     (err l m)]
    [(tryE e1 e2) ;NEW
     (let ([result (eval e1)])
       (type-case Answer result
         [(errorA s msg) (eval e2)]
         [(valueA v) result]))]))

(define (cond->if [cs : (Listof (Exp * Exp))]) : Exp
  (type-case (Listof (Exp * Exp)) cs
    [empty
     (errorE 'cond "no matching clause")]
    [(cons c cs)
     (ifE (fst c)
          (snd c )
          (cond->if cs))]))

(define (run [e : S-Exp]) : Answer
  (eval (parse-exp e)))

;; Exercise: get rid of Plait's error procedure from the evaluator altogether


;; printer ———————————————————————————————————-

(define (value->string [v : Value]) : String
  (type-case Value v
    [(numV n) (to-string n)]
    [(boolV b) (if b "true" "false")]))

(define (print-value [v : Value]) : Void
  (display (value->string v)))

(define (print-answer [a : Answer]) : Void
  (type-case Answer a
    [(valueA v)
     (print-value v)]
    [(errorA l m)
     (begin
       (display l)
       (display ": ")
       (display m))]))

(define (main [e : S-Exp]) : Void
  (print-answer (eval (parse-exp e))))

;; read-eval-print-loop -----------------------

(define input-prompt "MP22> ")
(define newline (λ () (display "\n")))
(define (driver-loop)
  (begin 
    (display input-prompt)
    (let ([input (read)])
      (if (s-exp-match? input `exit)
          (newline)
          (let ([output (run input)])
            (begin
              (print-answer output)
              (newline)
              (driver-loop)))))))


; ======================================================================
; ========================== Tests =====================================
; ======================================================================
(eval (parse-exp `{try {cond {{= 1 1} 2}} 3}))

(eval (parse-exp `{try {cond {{= 1 2} 3}} 4}))

(eval (parse-exp `{try {+ 1 2} 3}))

(eval (parse-exp `{try {+ 1 2 3} 4}))






 