#lang racket

; Funkcja maximum - przyjmuje listę jako argument
(define (maximum xs)
    ; Jeśli lista jest pusta zwraca -inf.0 - w przeciwnym przypadku zaczyna wywoływać funkcję rekurencyjną (parametry to lista oraz maksimum zainicjalizowane do -inf.0)
    (if (null? xs)
        -inf.0
        (let rec ((xs xs) (max -inf.0))
            ; Jeśli nie ma więcej elementów na liście zwracamy zero - w przeciwnym przypadku porównujemy aktualne maksimum z pierwszym elementem pary, a następnie wywołujemy rekurencję z odpowiednimi argumentami
            (if (null? xs)
                max
                (let ((x (car xs)))
                    (if (> x max)
                        (rec (cdr xs) x)
                        (rec (cdr xs) max)
                    )
                )
            )
        )
    )
) 

; Testy dla tej funkcji
(require rackunit)

(define (test-maximum)
    (check-equal? (maximum '(1 5 0 7 1 4 1 0)) 7)
    (check-equal? (maximum '()) -inf.0)
    (check-equal? (maximum '(1)) 1)
    (check-equal? (maximum '(1 1 1 1 1)) 1)
    (check-equal? (maximum '(10 5 3)) 10)
)
(test-maximum)