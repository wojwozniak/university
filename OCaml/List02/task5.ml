(* Zadanie 5 / Lista 2 *)
(*
  Zaimplementuj funkcję maximum xs znajdującą największy element na liście
  liczb typu float. Jeśli lista xs jest pusta, zwracana jest wartość neg_infinity
  (minus nieskończoność).
*)

let maximum xs =
  let rec aux x xs =
    match xs with
      | [] -> x
      | h::ys -> if x > h then aux x ys else aux h ys
  in aux neg_infinity xs;;