(* Zadanie 5 / Lista 3 *)
(*
  Rozważ drzewa binarne z wykładu. Narysuj, jak w pamięci reprezentowane jest
  drzewo t zdefiniowane poniżej:
    let t =
      Node (Node (Leaf , 2, Leaf),
        5,
        (Node (Node (Leaf , 6, Leaf)),
          8,
          (Node (Leaf , 9, Leaf))))
  Zaimplementuj funkcję insert_bst wstawiającą element do drzewa BST, zacho-
  wując własność BST. Pokaż, jak będzie wyglądał stan pamięci po wykonaniu
  wstawienia BST wartości 7. Które fragmenty drzewa t są współdzielone między
  drzewem t i insert_bst 7 t?
*)

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

let t =
  Node (Node (Leaf , 2, Leaf),
    5,
    (Node (Node (Leaf , 6, Leaf),
      8,
      (Node (Leaf , 9, Leaf)))));;

let rec insert_bst x = function 
  | Leaf -> Node (Leaf, x, Leaf)
  | Node (l, y, r) as t -> 
    if x < y then Node (insert_bst x l, y, r)
    else if x > y then Node (l, y, insert_bst x r)
    else t;;

let t' = insert_bst 7 t;;

(*
  Stan pamięci po wykonaniu wstawienia BST wartości 7:
    t' = Node (Node (Leaf , 2, Leaf),
      5,
      (Node (Node (Leaf , 6, Leaf),
        8,
        (Node (Leaf , 9, Leaf),
          7,
          Leaf)))
  Fragmenty drzewa t współdzielone między drzewem t i insert_bst 7 t:
    - Node (Leaf , 6, Leaf)
    - Node (Leaf , 9, Leaf)
    - Node (Leaf , 2, Leaf)
    - Node (Leaf , 8, Node (Leaf , 9, Leaf))
    - Node (Leaf , 5, Node (Node (Leaf , 6, Leaf), 8, Node (Leaf , 9, Leaf)))
*)