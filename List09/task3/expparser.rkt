#lang racket
(require "parsing.rkt")
(require "syntax.rkt")

(define op-parser
  `((+ ,op-add)
    (- ,op-sub)
    (* ,op-mul)
    (/ ,op-div))
)

(define exp-parser
    `(
        (NUMBER ,exp-number)
        (
            (SYMBOL ANY ANY) 
            ,(lambda 
                (op e1 e2)
                (exp-op 
                    (parse-op op)
                    (parse-exp e1)
                    (parse-exp e2)
                )
            )
        )
    )
)

(define (parse-op s) (run-parser op-parser s))

(define (parse-exp s) (run-parser exp-parser s))


; === TEST ===

(parse-exp '(+ 1 2))

; Output: (exp-op (op-add) (exp-number 1) (exp-number 2))
; (więc chyba git)