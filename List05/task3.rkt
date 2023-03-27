#lang plait

; Napisz i uzasadnij typy poniższych, 
; wykorzystujących procedury z poprzedniego
; zadania, wyrażeń.

; apply: (('a -> 'b) -> 'a -> 'b)
; compose: (('a -> 'b) ('c -> 'a) -> ('c -> 'b))
; flip: ((('a 'b) -> 'c) -> (('b 'a) -> 'c))
; curry: (('a 'b -> 'c) -> ('a -> ('b -> 'c)))


; a) (curry compose)
; curry: (('a 'b -> 'c) -> ('a -> ('b -> 'c)))
; compose: (('x -> 'y) ('z -> 'x) -> ('z -> 'y))
; Podstawiamy compose jako argument curry
; 'a = ('x -> 'y)
; 'b = ('z -> 'x)
; 'c = ('z -> 'y)
;
; Mamy więc:
; curry compose: (('x -> 'y) ('z -> 'x) -> ('z -> 'y)) -> ('x -> ('z -> 'x) -> ('z -> 'y))
;
; typ zwracany to:
; (('x -> 'y) -> (('z -> 'x) -> ('z -> 'y)))
; co po postawieniu z powrotem daje nam
; ('a -> ('b -> 'c))