### Kod parsera który może się pojawić

1) shorthand pod elementy listy dalsze niż czwarty <br>
listy w Rackecie są 0-indexed
```scheme
(define (fifth [xs : (Listof 'a)]) : 'a (list-ref xs 4))
(define (sixth [xs : (Listof 'a)]) : 'a (list-ref xs 5))
```

2) definicje typów wyrażeń
```scheme
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
```

3) expression matching <br>
matchujemy wyrażenia według wzoru <br>
można wszystkie w condzie (poza tym głównym define)
```scheme
(if (s-exp-match? `{define {ANY ...} for ANY} s))
```


4) type-case na przykładzie parsowania listy
```scheme
(define (parse-list [xs : (Listof S-Exp)]) : (Listof Exp)
  (type-case (Listof S-Exp) xs
    [empty empty]
    [(cons x xs) (cons (parse-exp x) (parse-list xs))]
  )
)
```

5) definicje typów przechowywania
```scheme
(define-type Storable (valS [v : 'a]))
(define-type Binding (bind [name : Symbol] [ref : (Boxof Storable)]))
(define-type-alias Env (Listof Binding))
(define mt-env empty)
```