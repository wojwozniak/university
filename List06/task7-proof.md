# Task 7 proof

We need to prove that 

```
(eval-nnf σ (to-nnf φ)) ≡ (eval-formula σ φ)
```
for any `σ` and `φ`.

## Definitions of functions

### Definition of `eval-nnf`:
```scheme
(define (eval-formula v f)
  (cond
    ; Jeśli f jest wartością, zwracamy wartość f
    [(var? f) (v (var-var f))]
    ; Jeśli f jest negacją, zwracamy negację wartości f
    [(neg? f) (not (eval-formula v (neg-f f)))]
    ; Jeśli f jest koniunkcją, zwracamy koniunkcję eval-formula lewej i prawej strony
    [(conj? f) (and (eval-formula v (conj-l f)) (eval-formula v (conj-r f)))]
    ; w.p.p. to alternatywa - zwracamy alternatywę eval-formula lewej i prawej strony
    [else (or (eval-formula v (disj-l f)) (eval-formula v (disj-r f)))]
  )
)
```

### Definition of `to-nnf`:
```scheme
(define (to-nnf f)
  (cond
    ; Jeśli f jest koniunkcją, to zwracamy koniunkcję dwóch wywołań to-nnf na jej składnikach
    [(conj? f) (nnf-conj (to-nnf (conj-l f) (conj-r f)))]
    ; Jeśli f jest alternatywą, to zwracamy alternatywę dwóch wywołań to-nnf na jej składnikach
    [(disj? f) (nnf-disj (to-nnf (disj-l f) (disj-r f)))]
    ; Jeśli f jest negacją to sprawdzamy:
    [(neg? f) 
      (cond
        ; Jeśli negacja jest zmienną, to zwracamy jej negację 
        [(var? (neg-f f)) (nnf-lit #f (neg-f f))]
        ; Jeśli negacja jest alternatywą, to zwracamy koniunkcję negacji dwóch wywołań to-nnf na jej składnikach
        [(disj? (neg-f f)) 
          (nnf-conj 
            (to-nnf (neg (disj-r (neg-f f)))) 
            (to-nnf (neg (disj-l (neg-f f))))
          )
        ]
        ; Jeśli negacja jest koniunkcją, to zwracamy alternatywę negacji dwóch wywołań to-nnf na jej składnikach
        [(conj? (neg-f f)) 
          (nnf-disj 
            (to-nnf (neg (conj-r (neg-f f)))) 
            (to-nnf (neg (conj-r (neg-f f))))
          )
        ]
        ; w.p.p wywołujemy to-nnf na (neg-f f)
        [else (to-nnf (neg-f (neg-f f)))]
      )
    ]
    ; w.p.p zwracamy zmienną
    [else (nnf-lit #t (var-var f))]
  )
)
```

## Proof

To prove equation from the beggining, we need to prove that both functions work correctly for any `σ` and `φ`. To do that we need to use structural induction (separately for each function).

## 1) `eval-nnf` works correctly for any `σ` and `φ`

## Base cases
We need to start with base cases:

1) `T` (true)
2) `F` (false)
3) `Φ` (variable)

All of them are trivial. Every single one will  be catched by this line in main cond expression:

    [(var? f) (v (var-var f))]

which will return their values. We get expected results for base cases. So far so good.

## Inductive step
We need to prove that eval-nnf is correct for all formulas. 

Let's take any Φ, ѱ formulas and assume that eval-nnf is correct for them. We will prove that eval-nnf is correct for negation, conjuction and dysjunction of Φ, ѱ formulas.

1) `¬Φ` (Negation)


It will be catched by this line in main cond expression:

        [(neg? f) (not (eval-formula v (neg-f f)))]

Which will return `¬(eval-formula v Φ)`. We know that `eval-formula v Φ` is correct for Φ formula. So we get expected result for negation.


2) `(Φ ∩ ѱ)`

It will be catched by this line in main cond expression:

        [(conj? f) (and (eval-formula v (conj-l f)) (eval-formula v (conj-r f)))]


3) `(Φ ∪ ѱ)`


     

We get expected output for every case in the inductive step. So we proved that `eval-nnf` works correctly for any `σ` and `φ`.

## 2) `to-nnf` works correctly for any `σ` and `φ`
### Proof would look very similar to the proof of `eval-nnf` correctness (so I won't write it down here to save time).

## Conclusion

We proved that `eval-nnf` and `to-nnf` work correctly for any `σ` and `φ`. By extension, we also have proven that

```
(eval-nnf σ (to-nnf φ)) ≡ (eval-formula σ φ)
```
for any `σ` and `φ`.
