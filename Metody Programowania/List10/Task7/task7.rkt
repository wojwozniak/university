#lang plait

; and definition
(define-syntax and2
  ; and with no arguments is true
  ; and with one argument is the argument
  ; for 2+ arguments, if the first is true, then the result is 'and' of the rest
  (syntax-rules ()
    [(and2) #t]
    [(and2 [a : Boolean]) a]
    [(and2 a b ...) (if a (and2 b ...) #f)] 
  )
)

; or definition
(define-syntax or2
  ; or with no arguments is true
  ; or with one argument is the argument
  ; for 2+ arguments, if the first is false, then the result is 'or' of the rest (otherwise true)
  (syntax-rules ()
    [(or2) #t]
    [(or2 [a : Boolean]) a]
    [(or2 a b ...) (if a #t (or2 b ...))]
  )
)

; let definition
(define-syntax let
  ; let with no bindings is the body
  ; let with one binding is a lambda with one argument
  ; let with 2+ bindings same as above
  (syntax-rules ()
    [(let () a) a]
    [(let ([x a]) body) ((lambda (x) body) a)]
    [(let ([x1 a1] [x2 a2] ...) body)
      ((lambda (x1 x2 ...) body) a1 a2 ...)
    ]
  )
)

; let* definition
(define-syntax let*
  ; let* with no bindings is the body
  ; let* with one binding is a lambda with one argument
  ; let* with 2+ bindings same as above
  (syntax-rules ()
    [(let* () a) a]
    [(let ([x a]) body) ((lambda (x) body) a)]
    [(let* ([x1 a1] [x2 a2] ...) body)
      ((lambda (x1) (let* ([x2 a2] ...) body)) a1)
    ]
  )
)


; tests

(let* ([a 10] [b (+ a 10)]) (+ a b))