#lang plait

; Definicja drzewa 2-3 
(define-type (2-3Tree 'a)
  ; Może mieć dwa rodzaje child nodeów
  (leaf)
  (single-node [elem : 'a] [l : (2-3Tree 'a)] [r : (2-3Tree 'a)])
  (double-node [elem1 : 'a] [elem2 : 'a] [l : (2-3Tree 'a)] [m : (2-3Tree 'a)] [r : (2-3Tree 'a)])
)

; Funkcja pomocnicza sprawdzająca max długość od korzenia do liścia
; Użyjemy jej w equal_length?
(define (height [tree : (2-3Tree 'a)])
  (type-case (2-3Tree 'a) tree
    [(leaf) 1]
    [(single-node elem left right) (+ (max (height left) (height right)) 1)]
    [(double-node elem1 elem2 left middle right) (+ (max (height left) (max (height middle) (height right))) 1)]
  )
)


; Sprawdza czy długość od korzenia do każdego liścia jest taka sama
(define (equal_length? [tree : (2-3Tree 'a)])
  (type-case (2-3Tree 'a) tree
    [(leaf) #t]
    [(single-node elem left right) (= (height left) (height right))]
    [
        (double-node elem1 elem2 left middle right) 
        (and 
          (= (height left) (height right))
          (= (height left) (height middle))
        )
    ]
  )
)


; Pomocnicza funkcja którą wykorzystanie w 23-tree?
; min to minimalna wartość w węźle, max to maksymalna
; Wywołamy funkcję z -inf.0, +inf.0
(define (pom tree min max)
  (type-case (2-3Tree 'a) tree
    ; Leaf zawsze spełnia warunek
    [(leaf) #t]
    [(single-node elem left right)
      ; Sprawdzamy czy min < double-node-elem1 tree < max dla elem
      (and (and (< min elem) (< elem max))
      ; Wywołujemy rekurencyjne dla child nodeów  
        (pom left min elem)
        (pom right elem max)
      )
    ]
    [(double-node elem1 elem2 left middle right)
      (and (< elem1 elem2)
      ; Sprawdzamy czy min < double-node-elem1 tree < max dla elem1
      (and (< min elem1) (< elem1 max))
      ; Sprawdzamy czy min < double-node-elem1 tree < max dla elem2
      (and (< min elem2) (< elem2 max))
      ; Wywołujemy rekurencyjne dla child nodeów
      (pom left min elem1)
      (pom right elem2 max)
      (pom middle elem1 elem2)
      )
    ]
  )
)

; Definicja drzewa 2-3 (musi spełniać też predykaty z def. na początku)
(define (23-tree? tree)
  (and (pom tree -inf.0 +inf.0) (equal_length? tree))
)

; Przykładowe drzewa 2-3
(define tree1 (single-node 1 (leaf) (leaf)))
(define tree2 (single-node 1 (leaf) (single-node 1 (leaf) (leaf))))

; Sprawdzenie poprawności na przykładowych drzewach
(23-tree? tree1)
(23-tree? tree2)