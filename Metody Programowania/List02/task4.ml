(* Zadanie 4 / Lista 2 *)

(*
  Zaimplementuj funkcję mem x xs sprawdzającą, czy element x znajduje się na
  liście xs. Przykład:
  # mem 2 [1; 2; 3]
    - : bool = true
  # mem 4 [1; 2; 3]
    - : bool = false
*)

let rec mem x xs = (* rekurencyjna funkcja mem przyjmuje element x oraz listę xs *)
  match xs with (* dopasowuje listę xs *)
  | [] -> false (* jeśli lista jest pusta, to zwraca false *)
  | h :: t -> if h = x then true else mem x t ;;
(* jeśli głowa listy jest równa x, to zwraca true, 
   w przeciwnym wypadku wywołuje rekurencyjnie funkcję mem dla ogona listy *)



mem 2 [1; 2; 3] ;;
mem 4 [1; 2; 3] ;;