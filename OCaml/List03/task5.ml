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


type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree;;

let t =
  Node (Node (Leaf, 2, Leaf),
        5,
        Node (Node (Leaf, 6, Leaf),
              8,
              Node (Leaf, 9, Leaf)));;

let rec insert_bst x t =
  match t with
  | Leaf -> Node (Leaf, x, Leaf)
  | Node (l, v, r) ->
      if x = v
      then t
      else if v < x
      then Node (l, v, insert_bst x r)
      else Node (insert_bst x l, v, r);;