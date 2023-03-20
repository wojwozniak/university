#lang racket

; W rackecie działa to tak samo jak w innych popularnych językach - tworzone są węzły node i liście leaf
; Definiuje się je jako (node left value right), gdzie left i right to kolejne węzły, a value to wartość w węźle
; Węzły liścia z wartością leaf i bez dalszych deficji można uznać za wartość  null (pusty wskaźnik)

(define t
    (node
        (node ( leaf ) 2 ( leaf ))
        5
        (node 
            (node ( leaf ) 6 ( leaf ))
            8
            (node ( leaf ) 9 ( leaf ))
        )
    )
)

; Drzewo w pamięci reprezentowane jest tak
#|
         5
      /    \
     /      \
    2        8
   / \      / \
  /   \    /   \
 #     #  6     9
#|

; A po dodaniu do pamięci siódemki z pomocą (insert-bst x t) z wykładu
#|
         5
      /    \
     /      \
    2        8
   / \      / \
  /   \    /   \
 #     #  6     9
            \
             \
              7
#|

; Gdzie (insert-bst x t) jest zdefiniowane jako:
(define (insert-bst x t)
    (cond 
        [(leaf? t) (node (leaf) x (leaf))]
        [(node? t)
            (cond 
                [(= x (node-elem t)) t]
                [(< x (node-elem t))
                    (node (insert-bst x (node-l t))
                       (node-elem t)
                       (node-r t)
                    )
                ]
                [else
                    (node (node-l t)
                       (node-elem t)
                       (insert-bst x (node-r t))
                    )
                ]
            )
        ]
    )
)
; (Kod z wykładu)

; insert-bst przechodzi przez korzeń, wartości 8, 6, i dodaje jako liść 6 wartość 7