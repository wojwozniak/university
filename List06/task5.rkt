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


(define (value x)
  (if (equal? x "x")
    #t
    #f
  )
) 

; End of base code

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