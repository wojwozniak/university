#lang plait

; Napisz i uzasadnij typy poniższych, 
; wykorzystujących procedury z poprzedniego
; zadania, wyrażeń:
;
; ( curry compose )
; (( curry compose ) ( curry compose ) )
; (( curry compose ) ( curry apply ) )
; (( curry apply ) ( curry compose ) )
; ( compose curry flip )


; Typy z poprzedniego zadania:
;
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


; b) ((curry compose) (curry compose))
; Wiemy już, że curry compose ma typ:
; (('_a -> '_b) -> (('_c -> '_a) -> ('_c -> '_b)))
; Aby uniknąć pomyłki, pod drugie curry compose 
; podstawiamy inne nazwy zmiennych (jak w a)), 
; otrzymując:
; (('_x -> '_y) -> (('_z -> '_x) -> ('_z -> '_y)))
;
; Argument curry compose ma typ ('_a -> '_b),
; do podstawienia mamy: 
; (('_x -> '_y) -> (('_z -> '_x) -> ('_z -> '_y))),
; otrzymujemy więc:
; '_a = ('_x -> '_y)
; '_b = (('_z -> '_x) -> ('_z -> '_y))
; patrzymy na typ zwracany (('_c -> '_a) -> ('_c -> '_b)), 
; podstawiamy zmienne:
; (('_c -> ('_x -> '_y)) -> ('_c -> (('_z -> '_x) -> ('_z -> '_y))))
; wszystko się zgadza


; c) (( curry compose ) ( curry apply ))
; Wiemy już, że curry compose ma typ:
; (('_a -> '_b) -> (('_c -> '_a) -> ('_c -> '_b)))
; Musimy się zająć curry apply.
;
; curry: (('a 'b -> 'c) -> ('a -> ('b -> 'c)))
; apply: (('a -> 'b) -> 'a -> 'b)
; Podstawiając apply pod curry dostaniemy funkcję
; identycznościową
; (('_a -> '_b) -> ('_a -> '_b))
; które musimy podstawić do curry compose
; otrzymujemy
; (('_a -> ('_b -> '_c)) -> ('_a -> ('_b -> '_c)))


; Reszta podpunktów analogicznie