(* Zadanie 9 / Lista 2 *)
(*
  Zaimplementuj algorytm sortowania przez złączanie. Dokładniej, zaimplementuj
  następujące funkcje:
  - split xs – zwraca parę dwóch list różniących się długością o co najwyżej
    1, oraz zawierających wszystkie elementy listy xs. Kolejność elementów
    nie musi być zachowana
  - merge xs ys – dla argumentów będących posortowanymi listami zwraca
    posortowaną listę wszystkich elementów xs i ys.
  - merge_sort xs – sortuje listę algorytmem sortowania przez złączanie. Dla
    list długości większej niż 1, funkcja ta dzieli listę wejściową na dwie prawie
    równe części, sortuje je rekurencyjnie, a następnie złącza posortowane
    wyniki.
  Czy funkcja merge_sort jest strukturalnie rekurencyjna?
*)

(* Nie jest strukturalnie rekurencyjna *)

let rec split xs =
  match xs with
  | [] -> ([], [])
  | [x] -> ([x], [])
  | x::y::zs ->
      let (left, right) = split zs in
      (x::left, y::right);;

let rec merge xs ys =
  match (xs, ys) with
  | ([], ys) -> ys
  | (xs, []) -> xs
  | (x::xs', y::ys') -> 
    if x <= y 
      then x::(merge xs' ys) 
      else y::(merge xs ys');;

let rec merge_sort xs =
  match xs with
    | [] -> []
    | [x] -> [x]
    | _ ->
      let (left, right) = split xs in
        merge (merge_sort left) (merge_sort right);;