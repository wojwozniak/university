(* Zadanie 1, Lista 1 *)
(*
  Przeanalizuj poniższą sekwencję wyrażeń. Jaki wynik wypisze interpreter w od-
  powiedzi na każde z nich, zakładając, że będą obliczane w kolejności w której są
  podane? Sprawdź swoje przewidywania używając interpretera.
*)

10;;

2 * 3 + 4;;

2 * (3 + 4);;

let a = 3;;

let b = a + 1;;

if b > a && b < a * b then b else a;;

2 + (if b > a then b else a);;

let a = if b * b > b then b else -1 in a * b;;