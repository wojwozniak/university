#lang plait

(define-type-alias Value Number)

(define-type-alias S-Exp (U Number (Listof S-Exp)))

; parse
(define (parse [s : String]) : S-Exp
  (error 'parse "not implemented")
)

(define (run [s : S-Exp]) : Value
  (error 'run "not implemented")
)