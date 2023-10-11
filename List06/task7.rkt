#lang plait

; Base code

( define-type ( Formula 'v )
( var [ var : 'v ])
( neg [ f : ( Formula 'v ) ])
( conj [ l : ( Formula 'v ) ] [ r : ( Formula 'v ) ])
( disj [ l : ( Formula 'v ) ] [ r : ( Formula 'v ) ]) )

; End of base code

; Definicja eval-formula
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