(* Zadanie 2 / Lista 3 *)
(*
  Złożenie funkcji f i g definiujemy (jak pamiętamy z przedmiotu „Logika dla
  informatyków”) jako funkcję x 7→f (g(x)). Zdefiniuj dwuargumentową funkcję
  compose, której wynikiem jest złożenie (jednoargumentowych) funkcji przeka-
  zanych jej jako argumenty. Używając modelu podstawieniowego, prześledź
  wykonanie wyrażeń:
    - compose square inc 5
    - compose inc square 5
  Zakładamy, że funkcja square oblicza kwadrat swojego argumentu, natomiast
  inc – wartość argumentu powiększoną o 1.
*)

let square x = x * x;;
let inc x = x + 1;;

let compose f g x =
  f (g x);;


compose square inc 5;;

compose inc square 5;;