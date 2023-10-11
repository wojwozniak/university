#lang racket

; 1) Procedura negatives
; Zamiast 0,1,2...n-1 chcemy zwracać -1,-2,....-n
; Zwracamy więc -x-1
(define (negatives n)
    (
        build-list 
        n 
        (lambda (x) (- (- x) 1))
    )
)

; Testowe wywołanie
(negatives 4)


; 2) Procedura reciprocals
; Dodajemy do każdego n jeden, później dzielimy 1 przez wynik
(define (reciprocals n)
    (
        build-list 
        n 
        (lambda (x) (/ 1 (+ x 1)))
    )
)

; Testowe wywołanie
(reciprocals 4)


; 3) Procedura evens
; Mnożymy każdy n *2
(define (evens n)
    (
        build-list 
        n 
        (lambda (x) (* x 2))
    )
)

; Testowe wywołanie
(evens 4)

; 4) Procedura identityM
; Tworzymy listę list - w wewnętrznej sprawdzamy czy jesteśmy na przekątnej (n. wiersza == n. kolumny)
(define (identityM n)
    (
        build-list 
        n
        (lambda (i) 
            (
                build-list 
                n
                (lambda (j) (if (= i j) 1 0))
            )
        )
    )
)

; Testowe wywołanie
(identityM 4)