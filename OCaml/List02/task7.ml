(* Zadanie 7 / Lista 2 *)
(*
  Zaimplementuj funkcję is_sorted xs sprawdzającą, 
  czy zadana lista jest posortowana niemalejąco
*)

let rec is_sorted xs =
  match xs with
    | [] -> true
    | a::[] -> true
    | a::b::ys -> if a > b then false else is_sorted (b::ys);;