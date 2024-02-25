#lang racket

; Negatywne to dane wejściowe, pozytywne to wyjściowe

; (parametric- >/c [a b] (-> a b a))
;   Kontrakt jest parametryczny, co oznacza, że działa dla dowolnych typów danych.
;   Funkcja przyjmuje trzy argumenty, dwa o typie "a" i jeden o typie "b".
;   Funkcja zwraca wartość o typie "a".
(define/contract (f1 x y)
    (parametric->/c [a b] (-> a b a))
    x
)
; N N P


; (parametric- >/c [a b c] (-> (-> a b c) (-> a b) a c))
;   Kontrakt jest parametryczny, co oznacza, że działa dla dowolnych typów danych.
;   Funkcja przyjmuje trzy argumenty, funkcję o typie (-> a b c), funkcję o typie (-> a b) i dwa argumenty o typie "a" i "c".
;   Funkcja zwraca wartość o typie "a".
(define/contract (f2 f g x)
    (parametric->/c [a b c] (-> (-> a b c) (-> a b) a c))
    (f x (g x))
)
; P P N P N N P


; (parametric- >/c [a b c] (-> (-> b c) (-> a b) (-> a c)))
;   Kontrakt jest parametryczny, co oznacza, że działa dla dowolnych typów danych.
;   Funkcja przyjmuje trzy argumenty, funkcję o typie (-> b c), funkcję o typie (-> a b) i funkcję o typie (-> a c).
(define/contract (f3 f g)
    (parametric->/c [a b c] (-> (-> b c) (-> a b) (-> a c)))
    (lambda (x)
        (f (g x))
    )
)
; P N P N N P

; (parametric- >/c [a] (-> (-> (-> a a) a) a))
;   Kontrakt jest parametryczny, co oznacza, że działa dla dowolnych typów danych.
;   Funkcja przyjmuje jeden argument, funkcję o typie (-> (-> a a) a).
;   Funkcja zwraca wartość o typie "a".
(define/contract (f4 f)
    (parametric->/c [a] (-> (-> (-> a a) a) a))
    (f f)
)
; N P N P