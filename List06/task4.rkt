#lang plait

; Base code

( define-type ( NNF 'v )
( nnf-lit [ polarity : Boolean ] [ var : 'v ])
( nnf-conj [ l : ( NNF 'v ) ] [ r : ( NNF 'v ) ])
( nnf-disj [ l : ( NNF 'v ) ] [ r : ( NNF 'v ) ]) )

(define prop1
  (nnf-lit #t "x"))

(define prop2
  (nnf-lit #f "y"))

(define prop3
  (nnf-conj prop1 prop2))

(define prop4 (nnf-disj prop3 prop1))

; End of base code

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