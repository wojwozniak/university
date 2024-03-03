(* Zadanie 7 / Lista 2 *)

(*
  Zaimplementuj funkcję is_sorted xs sprawdzającą, czy zadana lista jest po-
  sortowana niemalejąco.
*)

(* dla 0 lub 1 element true - w.p.p. porównujemy el i zwr. odp. wartość *)
let rec is_sorted xs =
  match xs with
  | [] -> true
  | [x] -> true
  | x :: y :: ys -> if x <= y then is_sorted (y :: ys) else false