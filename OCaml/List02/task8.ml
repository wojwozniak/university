(* Zadanie 8 / Lista 2 *)
(*
  Na wykładzie przedstawiono implementację algorytmu sortowania przez wstawianie. 
  Zaimplementuj inny znany algorytm sortowania w czasie O(n2): 
  sortowanie przez wybór. Dokładniej, zaimplementuj następujące funkcje:
    - select xs - zwróć krotkę najmniejszy_el; reszta listy
    - select_sort - select_sort korzystający z select
*)

let rec select xs =
  match xs with
  | [] -> failwith "Empty list"
  | [x] -> (x, [])
  | x::xs' ->
      let (min, rest) = select xs' in
        if x <= min then (x, xs')
        else (min, x :: rest);;

let rec select_sort xs =
  match xs with
  | [] -> []
  | xs ->
      let (min, rest) = select xs in
        min :: select_sort rest;;