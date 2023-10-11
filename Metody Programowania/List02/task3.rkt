#lang racket

; Definiujemy strukture macierzy - 2x2
(define-struct matrix (a b c d))

; Funkcja pomocnicza wypisujaca elementy macierzy jako liste list
(define (matrix->list m)
    (list 
        (list (matrix-a m) (matrix-b m))
        (list (matrix-c m) (matrix-d m))
    )
)

; Tworzymy przykladowa macierz za pomoca make-matrix (punkt 7.3 dokumentacji jezyka) - korzysta ona z naszego szablonu (co mozemy sprawdzic probujac przekazac np. inna liczbe argumentow)
(define m1 (make-matrix 1 2 3 4))
(define m2 (make-matrix 5 6 7 8))

; W ten sposob mozemy wypisac wartosc jednej z liczb
;(displayln (matrix-a m))

; Funkcja matrix-mult
(define (matrix-mult m n)
    (define a1 (matrix-a m))
    (define b1 (matrix-b m))
    (define c1 (matrix-c m))
    (define d1 (matrix-d m))
    (define a2 (matrix-a n))
    (define b2 (matrix-b n))
    (define c2 (matrix-c n))
    (define d2 (matrix-d n))
    (make-matrix 
        (+ (* a1 a2) (* b1 c2))
        (+ (* a1 b2) (* b1 d2))
        (+ (* c1 a2) (* d1 c2))
        (+ (* c1 b2) (* d1 d2))
    )
)

; Wypisanie wymnożonych macierzy
(displayln (matrix->list (matrix-mult m1 m2)))

; Macierz identycznościowa
(define (matrix-id) (make-matrix 1 0 0 1))

; Wypisanie macierzy identycznosciowej
(displayln (matrix->list (matrix-id)))

; Podnoszenie macierzy do potęgi
(define (matrix-expt m k)
    (if (= k 1)
        m
        (matrix-mult m (matrix-expt m (- k 1)))
    )
)

; Wypisanie podniesionej do potęgi macierzy
(displayln (matrix->list (matrix-expt m1 2)))

; Wartości zwracane przez wszystkie funkcje się zgadzają - przetestowane


; Funkcja licząca liczby fibbonaciego
(define (fib-matrix k)
    (matrix-c 
        (matrix-expt (make-matrix 1 1 1 0) k)
    )
)


; Testy dla fib-matrix

(require rackunit)

(define (test-fib)
  (check-equal? (fib-matrix 0) 0)
  (check-equal? (fib-matrix 10) 55)
  (check-not-equal? (fib-matrix 21) 37)
)
(test-fib)