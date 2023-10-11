#lang racket

; 1)
(
    ( lambda ( x y ) (+ x (* x y ) ) ) 
    1 2
)

; Podstawiamy 1 za x, 2 za y i obliczamy - wynik to 3


; 2)
(
    ( lambda ( x ) x ) 
    ( lambda ( x ) x ) 
)

; ( lambda ( x ) x ) to funkcja tożsamościowa - przekazanie ( lambda ( x ) x ) spowoduje zwrócenie ( lambda ( x ) x ) 

; 3)
(
    ( lambda ( x ) ( x x ) ) 
    ( lambda ( x ) x ) 
)

; ( ( lambda ( x ) ( x x ) )  ( lambda ( x ) x ) )
; ( lambda ( x ) x ) ( lambda ( x ) x ) 
; ( lambda ( ( lambda ( x ) x ) ) x )
; ( lambda ( x ) x )
; Dostaniemy więc funkcję tożsamościową, która zwróci swój argument (x)

; 4) 
( 
    ( lambda ( x ) ( x x ) ) 
    ( lambda ( x ) ( x x ) ) 
)

; Nieskończona rekursja - po podstawieniu w lewym nawiasie mamy (( lambda ( x ) ( x x ) ) ( lambda ( x ) ( x x ) ) ) - czyli to samo co na początku 