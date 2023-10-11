#lang racket

; Wzorując się na procedurze z wykładu sumującej liczby przy użyciu foldl, zdefiniuj procedurę product, obliczającą iloczyn elementów listy. Jaką wartość powinien zwracać product dla listy pustej?
; Dla pustej listy będę zwracał jeden (dowolna liczba n^0 = 1)

; Procedura my-product
(define (my-product xs)
    ; Wewnętrzna funkcja rekurencyjna - przyjmuje listę i akumulator z aktualną wartością
    (define (rec xs acc)
        ; Jeśli lista jest pusta zwróć aktualną zawartość akumulatora - w przeciwnym wypadku wymnóż element na pierszym miejscu listy i wywołaj funkcję dla kolejnego.
        (if (null? xs)
            acc
            (rec (cdr xs) (* (car xs) acc))
        )
    )
    ; Akumulator inicjujemy do 1, wywołujemy funkcję
    (rec xs 1)
)


; Testy dla my-products

(require rackunit)

(define (test-my-product)
    (check-equal? (my-product '()) 1)
    (check-equal? (my-product '(1 2 3)) 6)
    (check-equal? (my-product '(4)) 4)
    (check-not-equal? (my-product '(21)) 37)
)
(test-my-product)