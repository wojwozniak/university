#lang racket

; Pomocnicza funkcja znajdująca najmniejszy element na liście
(define (najmniejszy-element lista)
    (cond
        [(null? lista) #f] ; Jeśli lista jest pusta, zwraca fałsz
        [(null? (cdr lista)) (car lista)] ; Jeśli lista ma tylko jeden element, zwraca ten element
        [else (min (car lista) (najmniejszy-element (cdr lista)))] ; Rekurencyjnie znajduje najmniejszy element w reszcie listy
    )
)

; Pomocnicza funkcja usuwająca z listy pierwsze wystąpienie podanej wartości
(define (usun-element lista wartosc)
    (cond
        [(null? lista) lista] ; Jeśli lista jest pusta, zwraca pustą listę
        [(equal? (car lista) wartosc) (cdr lista)] ; Jeśli pierwszy element listy ma wartość równą wartości do usunięcia, zwraca resztę listy bez pierwszego elementu
        [else (cons (car lista) (usun-element (cdr lista) wartosc))] ; W przeciwnym razie, rekurencyjnie usuwa wartość z reszty listy i zwraca wynik z dodanym pierwszym elementem
    )
)

; Funkcja select
(define (select xs)
    ; Jeśli lista jest pusta zwracamy ją - w przeciwnym wypadku korzystamy z funkcji pomocniczych
    (if (eq? (najmniejszy-element xs) #f)
        xs
        (cons (najmniejszy-element xs) (usun-element xs (najmniejszy-element xs)))
    )  
)

(define (select-sort xs)
    (if (null? xs) 
        ; Jeśli lista jest pusta, zwracamy pustą listę
        '()
        ; W przeciwnym wypadku znajdujemy najmniejszy element i wywołujemy rekurencyjnie funkcję bez tego elementu - tworzymy listę z najmniejszym na początku
        (cons (najmniejszy-element xs) (select-sort (usun-element xs (najmniejszy-element xs)))) 
    )
)

; Testy dla tej funkcji
(require rackunit)

(define (test-sorted?)
    (check-equal? (select-sort '(5 3 8 1 9 2)) '(1 2 3 5 8 9))
    (check-equal? (select-sort '(7)) '(7))
    (check-equal? (select-sort '()) '())
    (check-equal? (select-sort '(1 1 1 1 1)) '(1 1 1 1 1))
    (check-equal? (select-sort '(1 2 3 4 5)) '(1 2 3 4 5))
    (check-equal? (select-sort '(5 4 3 2 1)) '(1 2 3 4 5))
)
(test-sorted?)