#lang plait

; Zaimplementuj procedury o podanych poniżej typach. 
; Procedury nie powinny pętlić się ani zgłaszać błędów.


; a) ('a 'b - > 'a )
(define (first-item a b) a)
; Przyjmuje dwa argumenty i zwraca pierwszy z nich.

; b) (('a 'b - > 'c ) ('a - > 'b ) 'a - > 'c )
(define (compose f g h)
    (lambda (x)
        (f (g x) (h x))
    )
)
; f: ('a 'b - > 'c ), g: ('a - > 'b ), h: ('a - > 'c)
; Przyjmuje trzy procedury i zwraca procedurę, która dla danego
; argumentu x wywołuje f z argumentami (g x) i (h x).


; c) ((( 'a - > 'a ) - > 'a ) - > 'a )
(define Y
    (lambda (f)
        (   
            (lambda (x) (f (lambda (y) ((x x) y))))
            (lambda (x) (f (lambda (y) ((x x) y))))
        )
    )
)
; Zwraca funkcję, która trzykrotnie stosuje 'f' do samej siebie jako argumentu. 


; d) (('a - > 'b ) ('a - > 'c ) - > ('a - > ('b * 'c ) ) )
(define (product-combinator f g)
    (lambda (x)
        (* (f x) (g x))
    )
)
; Product-combinator przyjmuje dwie funkcje f i g jako argumenty. 
; Zwraca funkcję, która dla argumentu x 
; zwraca iloczyn wyników funkcji f(x) i g(x).


; e) (('a - > ( Optionof ('a * 'b ) ) ) 'a - > ( Listof 'b ))
(define (option-to-list f x)
    ; Sprawdzamy co zwróciło wywołanie f(x)
    (match (f x)
        ; Jeśli zwróciło None, to zwracamy pustą listę
        ['() empty]
        ; Jeśli zwróciło (Some (a, b)), to dodajemy b do listy
        ; i wywołujemy option-to-list na a 
        [
            (cons (cons a b) rest)
            (cons b (option-to-list f a))
        ]
    )
)
; option-to-list przyjmuje funkcję f o typie 
; ('a -> (Optionof ('a * 'b))) oraz wartość x typu 'a. 
; Zwraca listę wartości typu 'b uzyskanych przez wywołanie f 
; na kolejnych wartościach typu 'a, 
; aż do uzyskania wartości typu None. 
; Funkcja ta korzysta z rekurencji, 
; aby przejść po kolejnych wartościach typu 'a 
; i dodawać do listy wartości typu 'b otrzymanych przez wywołanie f.