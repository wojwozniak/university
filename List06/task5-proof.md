# Task 5 proof

We need to prove that 

```
(eval-nnf σ (neg-nnf φ)) ≡ (not (eval-nnf σ φ))
```

In the previous task I have proven that `neg-nnf` is correct for all formulas, so I can use it in my proof.


## My definition of eval-nnf

```scheme
; Definicja funckji eval-nnf interpretującej formułę w negacyjnej postaci normalnej przy zadanym wartościowaniu zmiennych
(define (eval-nnf v f)
  (cond
    ; Sprawdzamy czy f jest literałem
    [(nnf-lit? f)
      ; Jeśli jest to zwracamy wartościowanie zmiennej
      (if (nnf-lit-polarity f)
        (v (nnf-lit-var f))
        (not (v (nnf-lit-var f)))
      )
    ]
    ; Sprawdzamy czy f jest alternatywą
    [(nnf-disj? f)
      ; Jeśli jest to zwracamy or wartościowania podformuł lewej i prawej
      (or 
        (eval-nnf v (nnf-disj-r f)) 
        (eval-nnf v (nnf-disj-l f))
      )
    ]
    ; w.p.p. zwracamy and wartościowania podformuł lewej i prawej
    [else 
      (and 
        (eval-nnf v 
        (nnf-conj-r f)) 
        (eval-nnf v (nnf-conj-l f))
      )
    ]
  )
)
```

## Proof

To prove this statement we will need structural induction. We will prove that `eval-nnf` is correct for all formulas.
Proof would be very similar to the proof of `neg-nnf` correctness (as they are very similar functions), so I will not repeat it here with different function name.