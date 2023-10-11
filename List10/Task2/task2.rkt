#lang plait

; =======================================================================
; Solution at ~160 line
; =======================================================================

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

(define (update-stack stack exp)
  (cons exp (rest (rest stack))))

; =======================================================================
; ============================ TASK 2 ===================================
; =======================================================================

; Decompile helper function
(define (decompile-helper stack ins)
  (if (empty? ins)
    ; If instruction list is empty, return stack
    stack
    (type-case Instr (first ins)
      ; If instruction is pushI, push the value onto the stack and continue
      [(pushI n) (decompile-helper (cons (numE n) stack) (rest ins))]
      ; If instruction is opI, pop the top two values off the stack, apply the operator to them, and push the result onto the stack
      [(opI o) (decompile-helper (update-stack stack (opE o (second stack) (first stack))) (rest ins))]
    )
  )
)

; Decompile function (calling decompile-helper)
(define (decompile ins) (first (decompile-helper '() ins)))



; Testing
(compile (parse `{+ {* 2 3} {+ 5 8}}))
(decompile (compile (parse `{+ {* 2 3} {+ 5 8}})))

; =======================================================================

(define (runVM [e : S-Exp]) : Value
  (evalVM (compile (parse e)) mtS))


