#lang racket

; Pierwszy argument powinien być procedurą przyjmującą dwa argumenty, oznaczające (w kolejności) bieżący element listy oraz bieżący akumulator, zaś zwracającą parę złożoną z nowego elementu listy oraz nowej wartości akumulatora.
; Pozostałe dwa argumenty powinny zawierać startową wartość akumulatora oraz listę elementów do przetworzenia. Procedura foldl-map zwraca parę złożoną z listy wynikowej i końcowej wartości akumulatora.
(define/contract (foldl-map f a xs)
    ; Typy parametryczne
    (parametric->/c 
        [a acc c] 
        (-> 
            (-> a acc (cons/c c acc)) 
            acc 
            (listof a)
            (cons/c (listof c) acc)
        )
    )
    ; foldl-map z treści zadania
    (define (it a xs ys)
        (if (null? xs)
            (cons (reverse  ys) a)
            (let [(p (f (car xs) a))]
                (it (cdr p)
                    (cdr xs)
                    (cons (car p) ys)
                )
            )
        )
    )
    (it a xs null)
)

; Przykładowe wywołanie
(foldl-map (lambda (x a) (cons a (+ a x))) 0 '(1 2 3))