#lang racket
; Wydajność tej procedury oczywiście będzie dużo lepsza - złożoność czasowa O(log(n)) zamiast O(n)

; Najpierw kod z poprzedniego zadania potrzebny do tego
    ; Definiujemy strukture macierzy - 2x2
    (define-struct matrix (a b c d))

    ; Funkcja pomocnicza wypisujaca elementy macierzy jako liste list
    (define (matrix->list m)
        (list 
            (list (matrix-a m) (matrix-b m))
            (list (matrix-c m) (matrix-d m))
        )
    )

    ; Macierz identycznościowa
    (define (matrix-id) (make-matrix 1 0 0 1))


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
; Teraz zadanie 4

; Funkcja podnosząca do potęgi wykorzystująca szybkie mnożenie
(define (matrix-expt-fast m k)
    ; Jeśli k=0 zwracamy macierz identycznościową - w innym przypadku obliczamy
    (if (= k 0) 
        (matrix-id)
        ; Wywołujemy funkcję rekurencyjnie dla połowy wartości (wykorzystując dzielenie całkowite (quotient))
        (let ((half (matrix-expt-fast m (quotient k 2))))
            ; Zwracamy pomnożone ze sobą połówki - jeśli k jest nieparzyste to domnażamy jeszcze raz macierz
            (if (odd? k)
                (matrix-mult m (matrix-mult half half))
                (matrix-mult half half)
            )
        )
    )
)

; Testy dla przykładowej macierzy - działa
(define m1 (make-matrix 1 2 3 4))
(displayln (matrix->list (matrix-expt-fast m1 2)))
(displayln (matrix->list (matrix-expt-fast m1 3)))


; Teraz druga część zadania

; Funkcja fib-fast
(define (fib-fast k)
    ; Dla elementów < 2 fib(k) = k - w przeciwnym przypadku liczymy analogicznie do poprzedniego zadania
    (if (< k 2)
        k
        (matrix-b (matrix-expt-fast (make-matrix 1 1 1 0) k))
    )
)

; Testy dla fib-fast

(require rackunit)

(define (test-fib)
  (check-equal? (fib-fast 0) 0)
  (check-equal? (fib-fast 10) 55)
  (check-not-equal? (fib-fast 21) 37)
)
(test-fib)