(* Zadanie 9 / Lista 3 *)
(*
  Zaimplementuj funkcję delete, zwracającą drzewo z usuniętym danym kluczem,
  dla reprezentacji drzew przeszukiwań binarnych z wykładu.   Wskazówka: Aby
  stworzyć drzewo przeszukiwań binarnych z którego usunęliśmy korzeń, najlepiej
  znaleźć (jeśli istnieje) najmniejszy element większy od tego korzenia
*)

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree;;

let t =
  Node (Node (Leaf, 2, Leaf),
        5,
        Node (Node (Leaf, 6, Leaf),
              8,
              Node (Leaf, 9, Leaf)));;


let rec find_min t =
  match t with
    | Leaf -> max_int
    | Node (l, v, r) ->
      if l = Leaf then v
      else find_min l;;

let rec find_smallest_child x t =
  match t with
    | Leaf -> max_int
    | Node (l, v, r) ->
      if v < x then find_smallest_child x r
      else if v > x then find_smallest_child x l
      else find_min r;;

find_smallest_child 5 t;;

let rec del x t =
  match t with
  | Leaf -> Leaf
  | Node (l, v, r) ->
      if v < x then Node (l, v, del x r)
      else if v > x then Node (del x l, v, r)
      else (* v = x *)
        match (l, r) with
        | (Leaf, Leaf) -> Leaf
        | (Leaf, r) -> r
        | (l, Leaf) -> l
        | (l, r) ->
            let min_right = find_min r in
            Node (l, min_right, del min_right r);;