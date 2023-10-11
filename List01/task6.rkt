#lang racket

(define (myif ifCond ifTrue ifFalse)
    (or (and ifCond ifTrue) (and (not ifCond) ifFalse)))



(require rackunit)

(check-equal? (myif #t 1 2) 1)
(check-equal? (myif #f 1 2) 2)