(* Zadanie 5 / Lista 2 *)

(*
  Zaimplementuj funkcję maximum xs znajdującą największy element na liście
  liczb typu float. Jeśli lista xs jest pusta, zwracana jest wartość neg_infinity
  (minus nieskończoność). Przykład:
  # maximum [1.; 5.; 0.; 7.; 1.; 4.; 1.; 0.]
    - : float = 7.
  # maximum []
    - : float = neg_infinity
*)

let rec maximum xs =
  match xs with
  | [] -> neg_infinity
  | h :: t -> if t = [] then h else max h (maximum t)