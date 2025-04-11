(* Zadanie 1 / Lista 3 *)
(*
  Wzorując się na funkcji z wykładu sumującej liczby przy użyciu fold_left, zdefi-
  niuj funkcję product, obliczającą iloczyn elementów listy. Jaką wartość powinien
  zwracać product dla listy pustej?
*)

(* Foldl z wykładu *)
let fold_left f a xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | x::xs -> it xs (f acc x)
  in it xs a;;

(* Suma z wykładu *)
let new_sum xs = fold_left (+) 0 xs;;

new_sum [5;4;2;3;1;4;4]

(* Rozwiązanie *)
(* Bardzo proste - tylko akumulator na 1 bo to element neutrualny względem mnożenia *)
let new_mult xs = fold_left ( * ) 1 xs;;

new_mult [5;4;2;3;1;4;4]

