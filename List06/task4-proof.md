# Proof that neg-nnf is correct

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

## Proof that neg-nnf is correct

We need to start with base cases:

1) T (true)
First cond check evaluates to true - we negate the value of T (true) - we get F (false).
2) F (false)
analogically to the previous case - we negate the value of F (false) - we get T (true).
3) 