#lang plait

(define (sorted? xs)
    (cond 
        [(empty? xs) #t]
        [((first xs) > (second xs)) #f]
        [else (sorted? (rest xs))]
    )
)