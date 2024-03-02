(* Zadanie 1 / Lista 1 *)

(*
  Przeanalizuj poniższą sekwencję wyrażeń. Jaki wynik wypisze interpreter w od-
  powiedzi na każde z nich, zakładając, że będą obliczane w kolejności w której są
  podane? Sprawdź swoje przewidywania używając interpretera.   
*)

(* ppkt a - ewaluuje się do int = 10 *)
10 ;;

(* ppkt b - również do int = 10 *) 
2 * 3 + 4;;

(* ppkt c - tworzymy zmienną int a o wartości 3 *)
let a = 3;;

(* ppkt d - zmienna b o wartości 4 *)
let b = a + 1;;

(* ppkt e - int = 4 - warunek prawdziwy *)
if b > a && b < a * b then b else a;

(* ppkt f - int = 6 *)
2 + (if b > a then b else a);;

(* ppkt g - int = 16  *)
let a = if b * b > b then b else -1 in a * b;;