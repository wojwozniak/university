#lang racket

(define (foldr-reverse xs)
    (foldr 
        (lambda (y ys) (append ys (list y))) 
        null 
        xs 
    ) 
)
; Tworzy n-1 consów o łącznej długości 49995000 (długości 1,2,3...,9999 => ((a1+an)/2)*n)

