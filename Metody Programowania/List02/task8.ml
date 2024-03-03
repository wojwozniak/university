(* Zadanie 8 / Lista 2 *)

(*
  Na wykładzie przedstawiono implementację algorytmu sortowania przez wsta-
  wianie. Zaimplementuj inny znany algorytm sortowania w czasie O(n2): sorto-
  wanie przez wybór. Dokładniej, zaimplementuj następujące funkcje:
    •select xs – zwraca parę składającą się z najmniejszego elementu listy
    xs oraz listy wszystkich elementów xs oprócz najmniejszego. Można też
    myśleć o tej procedurze, że zwraca ona taką permutację listy xs, w której
    najmniejszy element jest na pierwszej pozycji, a kolejność pozostałych
    elementów pozostała niezmieniona. Przykład:
      # select [4; 3; 1; 2; 5]
        - : int * int list = (1, [4; 3; 2; 5])
    •select_sort xs – sortuje listę algorytmem sortowania przez wybór. Dla
    list niepustych, procedura ta znajduje najmniejszy element używając pro-
    cedury select. Znaleziony element staje się pierwszym elementem listy
    wynikowej. Pozostałe elementy sortowane są tą samą metodą. Przykład:
      # select_sort [1; 5; 0; 7; 1; 4; 1; 0]
        - : int list = [0; 0; 1; 1; 1; 4; 5; 7]
*)

(* Pomocnicze dla select-sorta: *)
let rec find_min xs =
  match xs with
  | [] -> failwith "Pusta lista"
  | [x] -> x
  | x :: xs -> min x (find_min xs)

let rec remove_given x xs =
  match xs with
  | [] -> failwith "Nie ma takiego elementu w liscie"
  | y :: ys -> if x = y then ys else y :: remove_given x ys

let select xs =
  let min = find_min xs in
  (min, remove_given min xs) ;;



select [4; 3; 1; 2; 5] ;; (* dziala poprawnie *)



let rec select_sort xs =
  match xs with
  | [] -> []
  | _ -> let (min, rest) = select xs in
         min :: select_sort rest ;;


select_sort [1; 5; 0; 7; 1; 4; 1; 0] ;; (* dziala poprawnie *)