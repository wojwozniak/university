#lang plait

(module+ test
  (print-only-errors #t))

;; abstract syntax -------------------------------

(define-type Op
  (add)
  (sub)
  (mul)
  (div))

(define-type Exp
  (numE [n : Number])
  (opE [op : Op]
       [l : Exp]
       [r : Exp]))

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `NUMBER s)
     (numE (s-exp->number s))]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
     (opE (parse-op (s-exp->symbol (first (s-exp->list s))))
          (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s))))]
    [else (error 'parse "invalid input")]))

(define (parse-op [op : Symbol]) : Op
  (cond
    [(eq? op '+) (add)]
    [(eq? op '-) (sub)]
    [(eq? op '*) (mul)]
    [(eq? op '/) (div)]
    [else (error 'parse "unknown operator")]))
                 
(module+ test
  (test (parse `2)
        (numE 2))
  (test (parse `{+ 2 1})
        (opE (add) (numE 2) (numE 1)))
  (test (parse `{* 3 4})
        (opE (mul) (numE 3) (numE 4)))
  (test (parse `{+ {* 3 4} 8})
        (opE (add)
             (opE (mul) (numE 3) (numE 4))
             (numE 8)))
  (test/exn (parse `{{+ 1 2}})
            "invalid input")
  (test/exn (parse `{+ 1})
            "invalid input")
  (test/exn (parse `{^ 1 2})
            "unknown operator"))
  
;; eval --------------------------------------

(define-type-alias Value Number)

(define (op->proc [op : Op]) : (Value Value -> Value)
  (type-case Op op
    [(add) +]
    [(sub) -]
    [(mul) *]
    [(div) /]))

(define (eval [e : Exp]) : Value
  (type-case Exp e
    [(numE n) n]
    [(opE o l r) ((op->proc o) (eval l) (eval r))]))

; ....
; (trace eval)

(define (run [e : S-Exp]) : Value
  (eval (parse e)))

(module+ test
  (test (run `2)
        2)
  (test (run `{+ 2 1})
        3)
  (test (run `{* 2 1})
        2)
  (test (run `{+ {* 2 3} {+ 5 8}})
        19))

;; printer ———————————————————————————————————-

(define (print-value [v : Value]) : Void
  (display v))

(define (main [e : S-Exp]) : Void
  (print-value (eval (parse e))))

;; abstract machine ---------------------------

(define-type Stack
  (emptyS)
  (rightS [op : Op] [exp : Exp] [s : Stack])
  (leftS [op : Op] [val : Value] [s : Stack]))

(define (evalAM [e : Exp] [s : Stack]) : Value
  (type-case Exp e
    [(numE n)
     (continueAM s n)]
    [(opE op e1 e2)
     (evalAM e1 (rightS op e2 s))]))

(define (continueAM [s : Stack] [v : Value]) : Value
  (type-case Stack s
    [(emptyS)
     v]
    [(rightS op e s)
     (evalAM e (leftS op v s))]
    [(leftS op u s)
     (continueAM s ((op->proc op) v u))]))
  
(define (runAM [e : S-Exp]) : Value
  (evalAM (parse e) (emptyS)))

(module+ test
  (test (run `2)
        (runAM `2))
  (test (run `{+ 2 1})
        (runAM `{+ 2 1}))
  (test (run `{* 2 1})
        (runAM `{* 2 1}))
  (test (run `{+ {* 2 3} {+ 5 8}})
        (runAM `{+ {* 2 3} {+ 5 8}})))

;; virtual machine and compiler ----------------

;; byte code

(define-type Instr
  (pushI [n : Value])
  (opI [op : Op]))
 
(define-type-alias Code (Listof Instr))

;; stack

(define-type-alias StackVM (Listof Value))
(define mtS : StackVM empty)
(define (pushS [v : Value] [s : StackVM]) : StackVM
  (cons v s))
(define (popS [s : StackVM]) : (Value * StackVM)
  (type-case StackVM s
    [empty
     (error 'popS "empty stack")]
    [(cons v s)
     (pair v s)]))

(define (evalVM [c : Code] [s : StackVM]) : Value
  (type-case Code c
    [empty
     (fst (popS s))]
    [(cons i c)
     (type-case Instr i
       [(pushI n)
        (evalVM c (pushS n s))]
       [(opI op)
        (let* ([n2-s2 (popS s)]
               [n2 (fst n2-s2)]
               [s2 (snd n2-s2)]
               [n1-s1 (popS s2)]
               [n1 (fst n1-s1)]
               [s1 (snd n1-s1)]
               [s0 (pushS ((op->proc op) n1 n2) s1)])
          (evalVM c s0))])]))

(module+ test
  (test/exn (evalVM (list (opI (add))) mtS)
            "empty stack"))

;; compiler

(define (compile [e : Exp]) : Code
  (type-case Exp e
    [(numE n)
     (list (pushI n))]
    [(opE op e1 e2)
     (append (compile e1)
             (append (compile e2)
                     (list (opI op))))]))

(module+ test
  (test (compile (parse `2))
        (list (pushI 2)))
  (test (compile (parse `{+ {* 2 3} {+ 5 8}}))
        (list (pushI 2) (pushI 3) (opI (mul)) (pushI 5) (pushI 8) (opI (add)) (opI (add)))))

(define (runVM [e : S-Exp]) : Value
  (evalVM (compile (parse e)) mtS))

(module+ test
  (test (run `2)
        (runVM `2))
  (test (run `{+ 2 1})
        (runVM `{+ 2 1}))
  (test (run `{* 2 1})
        (runVM `{* 2 1}))
  (test (run `{- {* 2 3} {+ 5 8}})
        (runVM `{- {* 2 3} {+ 5 8}})))