(* Zadanie 4 / Lista 3 *)
(*
  Zareprezentuj zbiory przy użyciu predykatów charakterystycznych – tzn. funkcji
  o typie 'a -> bool, zwracających true wtedy i tylko wtedy, gdy argument należy
  do zbioru. 
  Zdefiniuj:
    •empty_set – reprezentacja zbioru pustego,
    •singleton a – zwraca zbiór zawierający wyłącznie element a,
    •in_set a s – zwraca true gdy a należy do zbioru s, w przeciwnym wy-
      padku wynikiem jest false,
    •union s t – zwraca sumę zbiorów s i t,
    •intersect s t – zwraca przecięcie zbiorów s i t
*)

let empty_set = fun x -> false;;
let singleton a = fun x -> x = a;;
let in_set a s = s a;; (* Wywołujemy s z argumentem a *)
let union s t = fun x -> s x || t x;;
let intersect s t = fun x -> s x && t x;;

(* Testy *)

let s = singleton 1;;

assert (in_set 1 s);;

assert (not (in_set 2 s));;

let t = singleton 2;;

let u = union s t;;

assert (in_set 1 u);;

assert (in_set 2 u);;

assert (not (in_set 3 u));;