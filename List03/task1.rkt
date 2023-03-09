#lang racket

; Prawdopodobnie jest źle - nie do końca rozumiem o co w tym chodzi

; 1) '((car (a . b)) (* 2))
'(
    ,(list + 1 2 3)
    ,(list 'cons)
    ,(list 'cons 'a 'b)
)

; 2) 
'(
    ,(car (quote (a . b)))
    ,(* 2)
)


; 3) '((+ 1 2 3) (cons) (cons a b))
'(
    ,(car '(a . b))
    ,(* 2)
)
