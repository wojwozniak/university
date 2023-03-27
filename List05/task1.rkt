#lang plait

;('a 'b - > 'a )
;(define (function1 x y) x)
(define (function1 [x : 'a] [y : 'b])
    x
)


;(('a 'b - > 'c ) ('a - > 'b ) 'a - > 'c )
(define (function2 [f : ('a 'b -> 'c) ] [g : ('a -> 'b)] [h : 'a])
    (f h (g h))
)

;((( 'a - > 'a ) - > 'a ) - > 'a )
(define (function3 [f : (('a -> 'a) -> 'a) ])
    (f (lambda (x) x))
)


;(('a - > 'b ) ('a - > 'c ) - > ('a - > ('b * 'c ) ) )
(define (function4 [f : ('a -> 'b)] [g : ('a -> 'c)])
    (lambda (x) (pair (f x) (g x)) )
)

;(('a - > ( Optionof ('a * 'b ) ) ) 'a - > ( Listof 'b ) )
(define (function5 [f : ( 'a -> ( Optionof ('a * 'b ) )  )] [x : 'a ] )
    (list (snd (some-v (f x)) )) 
)