(* Zadanie 8 / Lista 3 *)
(*
  Zmodyfikuj funkcję insert_bst z zadania 5 (wstawiającą element do drzewa BST)
  tak, aby możliwe było tworzenie drzew BST z duplikatami. Możesz założyć,
  że elementy równe elementowi w korzeniu drzewa będą trafiać do prawego
  poddrzewa.
  Zaimplementuj funkcję tree_sort xs, implementującą algorytm sortowania
  przy użyciu drzew BST:
*)
type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree;;

let t =
  Node (Node (Leaf, 2, Leaf),
        5,
        Node (Node (Leaf, 6, Leaf),
              8,
              Node (Leaf, 9, Leaf)));;

let rec flat_append t xs =
  match t with
  | Leaf -> xs
  | Node (l, v, r) -> flat_append l (v :: flat_append r xs);;

let flatten t = flat_append t [];;
              
(* Rozwiązanie pierwszej części *)
let rec insert_bst x t =
  match t with
  | Leaf -> Node (Leaf, x, Leaf)
  | Node (l, v, r) ->
      if x = v then Node (l, v, insert_bst x r)
      else if x < v then Node (insert_bst x l, v, r)
      else Node (l, v, insert_bst x r);;

insert_bst 6 (insert_bst 5 Leaf);;

(* Test 1 części *)
flatten (insert_bst 5 (insert_bst 5 t));;

let rec list_to_tree xs t =
  match xs with
  | [] -> t
  | x::ys -> list_to_tree ys (insert_bst x t);;

let rec tree_sort xs = flatten (list_to_tree xs Leaf);;

tree_sort [5;3;4;5;21;2];;