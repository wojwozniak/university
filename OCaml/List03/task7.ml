(* Zadanie 7 / Lista 3 *)
(*
  Implementacja funkcji flatten z poprzedniego zadania posiada poważną wadę
  – tworzy ona duże ilości nieużytków oraz wykonuje nadmiarowe obliczenia.
  Tę wadę można szczególnie dobrze zaobserwować na przykładzie drzew, które
  „rosną tylko w lewo”:
  let left_tree_of_list xs =
  List.fold_left (fun t x -> Node (t, x, Leaf)) Leaf xs
  let test_tree = left_tree_of_list (build_list 20000 Fun.id)
  Napisz inną implementację flatten, która nie posiada tej wady. Nie używaj
  funkcji append (ani operatora @)!
  Wskazówka: zaimplementuj najpierw dwuargumentową funkcję flat_append
  t xs, której wynikiem jest lista elementów t w kolejności infiksowej scalona z
  listą xs. 
*)

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree;;

let rec fold_tree f a t =
  match t with
  | Leaf -> a
  | Node (l, v, r) -> f (fold_tree f a l) v (fold_tree f a r);;

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

(* Bardzo ciekawie działa -> z perspektywy mostlewego elementu wszystko na prawo będzie daną listą *)

let flatten t = flat_append t [];;
flat_append t [10; 11];;
flatten t;;