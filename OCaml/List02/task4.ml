(* Zadanie 4 / Lista 2 *)
(*
  Zaimplementuj funkcję mem x xs sprawdzającą, czy element x znajduje się na
  liście xs. 
*)

let rec mem x xs =
  match xs with
    | [] -> false
    | h::ys -> if h = x then true else mem x ys;;