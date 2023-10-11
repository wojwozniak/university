#lang racket

; Definiuje funkcję "suffixes" z jednym argumentem "xs".
(define/contract (suffixes-con xs)
  ; Kontrakt mówi, że "xs" jest listą, a funkcja zwraca listę list.
  (parametric->/c [a] (-> (listof a) (listof (listof a))))
  ; Konstrukcja "parametric->/c" pozwala na wprowadzenie generycznego typu "a",
  ; który może być dowolnym typem danych, ale musi być użyty zarówno jako typ wejściowy
  ; jak i wyjściowy. Kontrakt wymaga, aby "xs" była listą elementów typu "a",
  ; a funkcja zwraca listę list elementów typu "a".
  
  (if (null? xs)
    (listof xs)
    (cons xs (suffixes-con (cdr xs)))
  )
)

; Teraz suffixes bez kontraktu
(define (suffixes xs)
  (if (null? xs)
    (listof xs)
    (cons xs (suffixes (cdr xs)))
  )
)

;(suffixes '())
(time (suffixes (range 200)))
;(time (suffixes-con (range 200)))


; Druga wersja o 1 wolniejsza (ale coś się chyba buguje)