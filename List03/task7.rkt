#lang racket

(define (foldr-reverse xs)
    (foldr 
        (lambda (y ys) (append ys (list y))) 
        null 
        xs 
    ) 
)
; Tworzy n-1 consów o łącznej długości (n^2/2)
; W podanym przykładzie 9999 consów o długości ~5000000 (długości list 1,2,3...,9999 => ((a1+an)/2)*n)

