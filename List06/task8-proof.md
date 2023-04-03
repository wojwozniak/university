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
        [(or (empty? xs) (empty? (rest xs))) #t]
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

## Proof

To prove what we have to prove, we basically need to show that 1) `sorted?` works correctly for any list, and that 2) `insert` works correctly (and preserves sort) for any list.

## 1) `sorted?` works correctly for any list

We will prove it using induction.

### Base cases

a) List is empty

    First cond will evaluate to #t, and the function will return #t.

b) List has one element

    First cond will evaluate to #t, and the function will return #t.

Base cases work as expected.

### Inductive step

Assume that `sorted?` works correctly for any list of length `n`. We need to prove that it works correctly for any list of length `n+1`. 

It's hard to write it formally - we can help make it more clear by defining

    P(n) ≡ `sorted?` works correctly for any list of length `n`

We already have proven that P(0) and P(1) are true. We need to prove that P(n+1) is true for any `n > 1`.

Let's assume that `sorted?` works correctly for any list of length `n`. We need to prove that it works correctly for any list of length `n+1`.

Let xs be any list of the length `n+1`. Then we can write it as `xs = (cons x ys)`, where `x` is the first element of the list, and `ys` is the rest of the list (length `n`).

If ys is sorted, then x has to be smaller than first element in ys so expression below doesn't evaluate to #t:

```scheme
[(> (first xs) (first(rest xs))) #f]
```

If ys isn't sorted, then it will evaluate to #t, and the function will return #f.

Concluding, if `sorted?` works correctly for any list of length `n`, then it works correctly for any list of length `n+1` 


## 2) `insert` works correctly (and preserves sort) for any list

### Proof would be similar to the proof of 1), so we will skip it.

## Conclusion

Having proven that 1) and 2) are true, fact that if

```
(sorted? xs) ≡ #t
```
then 

```
(sorted? (insert x xs)) ≡ #t
```
is obviously true.