#lang plait

; 'a to typ polimorficzny
; _a monomorficzny

; Zadanie 2:
; Napisz i uzasadnij typy procedur zdefiniowanych poniżej.

; a) 
(define ( apply f x ) ( f x ))
; Przyjmujemy funkcję f i argument x, zwracamy wynik funkcji f z argumentem x
; (('a -> 'b) -> 'a -> 'b)

; b)
( define ( compose f g ) ( lambda ( x ) ( f ( g x ) ) ) )
; Przyjmujemy funkcję f i g, zwracamy funkcję, która przyjmuje 
; argument x i zwraca wynik funkcji f(g(x))
; (('a -> 'b) ('c -> 'a) -> ('c -> 'b))

; c)
(define (flip f) (lambda (x y) (f y x)))
; Przyjmujemy funkcję f, zwracamy funkcję, która przyjmuje 
; argumenty x i y i zwraca wynik funkcji f z argumentami y i x
; ((('a 'b) -> 'c) -> (('b 'a) -> 'c))

; d)
(define (curry f) (lambda (x) (lambda (y) (f x y))))
; Procedura curry służy do zamiany funkcji dwuargumentowej f 
; na funkcję jednoargumentową, 
; która zwraca inną funkcję jednoargumentową.
; (('a 'b -> 'c) -> ('a -> ('b -> 'c)))