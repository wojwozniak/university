(* Zadanie 9 / Lista 2 *)

(*
  Zaimplementuj algorytm sortowania przez złączanie. Dokładniej, zaimplementuj
  następujące funkcje:
    •split xs – zwraca parę dwóch list różniących się długością o co najwyżej
    1, oraz zawierających wszystkie elementy listy xs. Kolejność elementów
    nie musi być zachowana. Przykład:
      # split [8; 2; 4; 7; 4; 2; 1]
        - : int list * int list = ([8; 4; 4; 1], [2; 7; 2])
        ; albo: ([8; 2; 4; 7]; [4; 2; 1])
    •merge xs ys – dla argumentów będących posortowanymi listami zwraca
    posortowaną listę wszystkich elementów xs i ys. Przykład:
    # merge [1; 4; 4; 8] [2; 2; 7]
      - : int list = [1; 2; 2; 4; 4; 7; 8]
    •merge_sort xs – sortuje listę algorytmem sortowania przez złączanie.
    Dla list długości większej niż 1, procedura ta dzieli listę wejściową na
    dwie prawie równe części, sortuje je rekurencyjnie, a następnie złącza
    posortowane wyniki.
  Czy procedura merge_sort jest strukturalnie rekurencyjna?
*)

let rec split xs =
  let rec split_aux xs acc1 acc2 =
    match xs with
    | [] -> (acc1, acc2) (* dla pustej listy zwroc pare acc1, acc2 *)
    | h::t -> split_aux t acc2 (h::acc1) (* w.p.p. dolacz el. do 1. listy i 
       wywolaj rekurencyjnie zamieniajac je miejscami *)
  in
  split_aux xs [] []

let rec merge xs ys =
  match xs, ys with
  | [], _ -> ys (* jesli 1. lista pusta, zwroc 2. liste *)
  | _, [] -> xs (* jesli 2. lista pusta, zwroc 1. liste *)
  | hx::tx, hy::ty -> (* w.p.p. polacz zachowujac kolejnosc *)
    if hx < hy then hx::(merge tx ys)
    else hy::(merge xs ty)

let rec merge_sort xs =
  match xs with
  | [] -> [] (* pusta -> pusta *)
  | [x] -> [x] (* 1el. -> 1el. *)
  | _ ->
    let (left, right) = split xs in
    merge (merge_sort left) (merge_sort right) ;;
    (* typowy merge-sorcik - dzielimy liste i laczymy rek. wywolane 
       na sublistach merge_sorty*)

(*
  Procedura merge_sort jest strukturalnie rekurencyjna, ponieważ w każdym
  kroku rekurencji wywołuje się sama siebie na dwóch podproblemach, które są
  mniejsze od problemu wejściowego.
*)


split [8; 2; 4; 7; 4; 2; 1] ;;


merge [1; 4; 4; 8] [2; 2; 7] ;;


merge_sort [8; 2; 4; 7; 4; 2; 1] ;;