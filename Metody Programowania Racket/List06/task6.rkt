#lang plait

; Base code

( define-type ( Formula 'v )
( var [ var : 'v ])
( neg [ f : ( Formula 'v ) ])
( conj [ l : ( Formula 'v ) ] [ r : ( Formula 'v ) ])
( disj [ l : ( Formula 'v ) ] [ r : ( Formula 'v ) ]) )

( define-type ( NNF 'v )
( nnf-lit [ polarity : Boolean ] [ var : 'v ])
( nnf-conj [ l : ( NNF 'v ) ] [ r : ( NNF 'v ) ])
( nnf-disj [ l : ( NNF 'v ) ] [ r : ( NNF 'v ) ]) )

; End of base code


; Definicja funkcji to-nnf
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