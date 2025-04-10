(* Zadanie 6 / Lista 2 *)
(*
  Zaimplementuj funkcję suffixes xs zwracającą wszystkie sufiksy listy xs –
  czyli takie listy, które zawierają, w kolejności i bez powtórzeń, elementy listy xs
  od zadanego elementu aż do końca listy. Listę pustą uznajemy za sufiks dowolnej
  listy.
*)

let suffixes xs =
  let rec aux xs acc =
    match xs with
      | [] -> xs::acc
      | h::ys -> aux ys (xs::acc)
  in List.rev (aux xs []);;

suffixes [1; 2; 3; 4]

(* :: działa tylko w jedną stronę -> dodaje element na początek listy, nie można wywołać na odwrót *)
(* dlatego reverse na końcu *)
(* w drugą stronę można acc @ [xs] i bez reverse, ale każde wywołanie tego to O(n) *)
(* Więc całość byłaby O(n^2) *)