(* Zadanie 4 / Lista 3 *)
(*
  Zareprezentuj zbiory przy użyciu predykatów charakterystycznych – tzn. funkcji
  o typie 'a -> bool, zwracających true wtedy i tylko wtedy, gdy argument należy
  do zbioru. Zdefiniuj:
    - empty_set – reprezentacja zbioru pustego,
    - singleton a – zwraca zbiór zawierający wyłącznie element a,
    - in_set a s – zwraca true gdy a należy do zbioru s, w przeciwnym wy-
      padku wynikiem jest false,
    - union s t – zwraca sumę zbiorów s i t,
    - intersect s t – zwraca przecięcie zbiorów s i t.
*)

let empty_set _ = false;;

let singleton a x = x = a;;

let in_set a s = s a;;

let union s t x = s x || t x;;

let intersect s t x = s x && t x;;

let s1 = singleton 1;;

let s2 = singleton 2;;

let u = union s1 s2;;

let i = intersect s1 s2;;

in_set 1 s1;;
in_set 2 s1;;
in_set 1 u;;
in_set 2 u;;
in_set 3 u;;
in_set 1 i;;
in_set 1 empty_set;;