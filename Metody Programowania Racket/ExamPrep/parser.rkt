#lang plait

(define-type-alias Value Number)

(define (fifth [xs : (Listof 'a)]) : 'a (list-ref xs 4))
(define (sixth [xs : (Listof 'a)]) : 'a (list-ref xs 5))

(define (<= [x : Number] [y : Number]) : Number
    (if (or (< x y) (= x y)) 0 42)
)

(define-type Exp
  (defE [args : (Listof Exp)] [e : Exp])
  (funE [name : Exp] [args : (Listof Exp)] [body : Exp])
  (numE [n : Number])
  (varE [x : Symbol])
  (ifzE [e0 : Exp] [e1 : Exp] [e2 : Exp])
  (letE [x : Exp] [e1 : Exp] [e2 : Exp])
  (appE [f : Exp] [args : (Listof Exp)])
  (opE [op : (Number Number -> Number)] [l : Exp] [r : Exp])
)

(define (parse [s : S-Exp]) : Exp
  (if (s-exp-match? `{define {ANY ...} for ANY} s)
    (defE
      (parse-list (s-exp->list (second (s-exp->list s))))
      (parse-exp (fourth (s-exp->list s)))
    )
    (parse-exp s)
  )
)

(define (parse-op [op : Symbol]) : (Number Number -> Number)
  (cond
    [(symbol=? op '+)  +]
    [(symbol=? op '-)  -]
    [(symbol=? op '*)  *]
    [(symbol=? op '<=) <=]
    [else (error 'parse-op "Unknown operator!")]
  )
)

(define (parse-list [xs : (Listof S-Exp)]) : (Listof Exp)
  (type-case (Listof S-Exp) xs
    [empty empty]
    [(cons x xs) (cons (parse-exp x) (parse-list xs))]
  )
)

(define (parse-exp [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `{fun SYMBOL {ANY ...} = ANY} s)
      (funE 
        (parse-exp (second (s-exp->list s)))
        (parse-list (s-exp->list (third (s-exp->list s))))
        (parse-exp (fifth (s-exp->list s)))
      )
    ]
    [(s-exp-match? `{let SYMBOL be ANY in ANY} s)
      (letE 
        (parse-exp (second (s-exp->list s)))
        (parse-exp (fourth (s-exp->list s)))
        (parse-exp (sixth (s-exp->list s)))
      )
    ]
    [(s-exp-match? `{ifz ANY then ANY else ANY} s)
      (ifzE 
        (parse-exp (second (s-exp->list s)))
        (parse-exp (fourth (s-exp->list s)))
        (parse-exp (sixth (s-exp->list s)))
      )
    ]
    [(s-exp-match? `{SYMBOL {ANY ...}} s)
      (appE 
        (parse-exp (first (s-exp->list s)))
        (parse-list (s-exp->list (second (s-exp->list s))))
      )
    ]
    [(s-exp-match? `NUMBER s) (numE (s-exp->number s))]
    [(s-exp-match? `SYMBOL s) (varE (s-exp->symbol s))]
    [(s-exp-match? `{ANY SYMBOL ANY} s)
      (opE (parse-op (s-exp->symbol (second (s-exp->list s))))
        (parse-exp (first (s-exp->list s)))
        (parse-exp (third (s-exp->list s)))
      )
    ]
    [else (error 'parse-exp "Unknown type of expression!")]
  )
)

(define-type Storable (valS [v : 'a]))
(define-type Binding (bind [name : Symbol] [ref : (Boxof Storable)]))
(define-type-alias Env (Listof Binding))
(define mt-env empty)

(define (extend-env [env : Env] [x : Symbol] [v : 'a]) : Env
  (cons (bind x (box (valS v))) env)
)

(define (extend-env-list [env : Env] [vars : (Listof Exp)] [args : (Listof Value)]) : Env
  (type-case (Listof Exp) vars
    [(cons fun funs)
      (type-case Exp fun
        [(varE x)
          (if (find env x)
            (error 'extend-env-list "Argument already defined!")
            (extend-env-list (extend-env env x (first args)) funs (rest args))
          )
        ]
        [else (error 'extend-env-list "Type error!")]
      )
    ]
    [empty env]
  )
)

(define (extend-env-funcs [env : Env] [funs : (Listof Exp)]) : Env
  (type-case (Listof Exp) funs
    [(cons fun funs)
      (type-case Exp fun
        [(funE name args body)
          (type-case Exp name
            [(varE x)
              (if (find env x)
                (error 'extend-env-funcs "Name already taken!")
                (extend-env-funcs (extend-env env x fun) funs)
              )
            ]
            [else (error 'extend-env-funcs "Type error!")]
          )
        ]
       [else (error 'extend-env-funcs "Not a function!")])
    ]
    [empty env]
  )
)

(define (find-var [env : Env] [x : Symbol]) : (Boxof Storable)
  (type-case (Listof Binding) env
    [empty (error 'find-var "Variable not found!")]
    [(cons b rst-env)
      (cond
        [(eq? x (bind-name b)) (bind-ref b)]
        [else (find-var rst-env x)]
      )
    ]
  )
)

(define (lookup-env [x : Symbol] [env : Env]) : 'a
  (type-case Storable (unbox (find-var env x)) [(valS v) v])
)

(define (find [env : Env] [f : Symbol]) : Boolean
  (type-case (Listof Binding) env
    [(cons x xs)
      (if (symbol=? (bind-name x) f)
        #t
        (find xs f)
      )
    ]
    [empty #f]
  )
)

(define (eval [e : Exp] [var : Env] [fun : Env]) : Value
  (type-case Exp e
    [(defE args e) (eval e var (extend-env-funcs fun args))]
    [(numE n) n]
    [(varE x) (lookup-env x var)]
    [(ifzE e0 e1 e2)
      (if 
        (= (eval e0 var fun) 0)
        (eval e1 var fun)
        (eval e2 var fun)
      )
    ]
    [(letE x e1 e2)
      (type-case Exp x
        [(varE x)
          (let ([v1 (eval e1 var fun)])
            (eval e2 (extend-env var x v1) fun)
          )
        ]
        [else (error 'eval "Wrong type of variable name!")]
      )
    ]
    [(opE op l r) (op (eval l var fun) (eval r var fun))]
    [(appE f args)
      (type-case Exp f
        [(varE x) (apply x args var fun)]
        [else (error 'eval "Wrong type of function name!")]
      )
    ]
    [(funE name args body)
      (type-case Exp name
        [(varE x)
          (error 'eval "Function can't be evaluated!")]
        [else (error 'eval "Wrong function name!")]
      )
    ]
  )
)

(define (apply [f : Symbol] [args : (Listof Exp)] [var : Env] [fun : Env]) : Value
  (type-case Exp (lookup-env f fun)
    [(funE name var-list body)
      (if (= (length var-list) (length args))
        (eval body (extend-env-list mt-env var-list (eval-list args var fun)) fun)
        (error 'apply "Wrong number of arguments!")
      )
    ]
    [else (error 'apply "Not a function!")]
  )
)

(define (eval-list [vars : (Listof Exp)] [var : Env] [fun : Env]) : (Listof Value)
  (type-case (Listof Exp) vars
    [(cons first-var vars) (cons (eval first-var var fun) (eval-list vars var fun))]
    [empty empty]
  )
)

(define (run [program : S-Exp]) : Value (eval (parse program) mt-env mt-env))

(define (main [e : S-Exp]) : Void (display (run e)))