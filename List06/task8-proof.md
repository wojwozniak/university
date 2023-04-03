# Task 8

Proof that if
```
(sorted? xs) ≡ #t
```
then 

```
(sorted? (insert x xs)) ≡ #t
```

## Definitions of functions

Defininition of `sorted?`:

```scheme
(define (sorted? xs)
    (cond 
        [(empty? (rest xs)) #t]
        [(> (first xs) (first(rest xs))) #f]
        [else (sorted? (rest xs))]
    )
)
```

Definition of `insert`:

```scheme
(define (insert x xs)
    (cond 
        [(empty? xs) (cons x (list))]
        [(> (first xs) x) (cons x xs)]
        [else (cons (first xs) (insert x (rest xs)))]
    )
)
```