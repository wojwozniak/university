(* Zadanie 4 / Lista 1 *)
(*
  Zdefniuj funkcję o trzech argumentach będących liczbami całkowitymi, której
  wynikiem jest suma kwadratów dwóch większych jej argumentów.
*)

let f x y z =
  if x < y && x < z
  then y * y + z * z
  else if y < z && y < x
  then x * x + z * z
  else
  x * x + y * y;;