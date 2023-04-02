# Task 4 - proof that neg-nnf is correct

Task was to prove that 

```
(neg-nnf (neg-nnf φ)) ≡ φ
```

we can prove that by proving that neg-nnf is correct for all formulas.

## My definition of neg-nnf

```scheme
; Funkcja neg-nnf negująca formułę w negacyjnej postaci normalnej
(define (neg-nnf f)
  (cond
    ; Sprawdzamy czy f jest literałem
    [(nnf-lit? f)
      ; Jeśli tak, to negujemy jego wartość logiczną
      (nnf-lit 
        (not (nnf-lit-polarity f)) 
        (nnf-lit-var f)
      )
    ]
    ; Sprawdzamy czy f jest dysjunkcją - jeśli tak to zwracamy koniunkcję wywołania neg-nnf dla obydwu stron
    [(nnf-disj? f)
      (nnf-conj 
        (neg-nnf (nnf-disj-r f)) 
        (neg-nnf (nnf-disj-l f))
      )
    ]
    ; w.p.p musi ona być koniunkcją - zwracamy dysjunkcję wywołania neg-nnf dla obydwu stron
    [else
      (nnf-disj 
        (neg-nnf (nnf-conj-r f)) 
        (neg-nnf (nnf-conj-l f))
      )
    ]
  )
)
```

## Proof

We will use structural induction.

## Base cases
We need to start with base cases:

1) T (true)

        First cond check evaluates to true - we negate the value of T (true) - we get F (false).

2) F (false)

        analogically to the previous case - we negate the value of F (false) - we get T (true).

3) Φ (variable)

        analogically to the previous cases - we negate the value of Φ (variable) - we get ¬Φ (negated variable).

We get expected results for base cases. So far so good.

## Inductive step
We need to prove that neg-nnf is correct for all formulas. 

Let's take any Φ, ѱ formulas and assume that neg-nnf is correct for them. We will prove that neg-nnf is correct for negation, conjuction and dysjunction of Φ, ѱ formulas.

1) ¬Φ (Negation)

        Analogically to the cases from base - we negate the value of ¬Φ (negated variable) - we get Φ (variable).

2) (Φ ∪ ѱ)
    
        First cond check evaluates to false - we go to the next one. Second cond check evaluates to true - we return conjunction of neg-nnf of both sides of the disjunction. We get (¬Φ ∩ ¬ѱ). Using De Morgan's law we get ¬(Φ ∪ ѱ).

3) (Φ ∩ ѱ)

        First cond check evaluates to false - we go to the next one. Second cond check evaluates to false - we return disjunction of neg-nnf of both sides of the conjunction. We get (¬Φ ∪ ¬ѱ). Using De Morgan's law we get ¬(Φ ∩ ѱ).


By structural induction we have proven that neg-nnf is correct for all formulas (and, by extension that

```
(neg-nnf (neg-nnf φ)) ≡ φ
```

is true for any φ formula).