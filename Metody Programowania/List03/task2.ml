(* Zadanie 2 / Lista 3 *)

(*
  Złożenie funkcji f i g definiujemy (jak pamiętamy z przedmiotu „Logika dla
  informatyków”) jako funkcję x → f(g(x)). Zdefiniuj dwuargumentową funkcję
  compose, której wynikiem jest złożenie (jednoargumentowych) funkcji 
  przekazanych jej jako argumenty. Używając modelu podstawieniowego, prześledź
  wykonanie wyrażeń:
    compose square inc 5
    compose inc square 5
  Zakładamy, że funkcja square oblicza kwadrat swojego argumentu, natomiast
  inc – wartość argumentu powiększoną o 1.   
*)

(* Define the compose function *)
let compose f g x = f (g x)

(* Define the square function *)
let square x = x * x

(* Define the inc function *)
let inc x = x + 1

(* Test expressions *)
let result1 = compose square inc 5
let result2 = compose inc square 5


(* 
  w jednym najpierw incr. w drugim popiero po wymnożeniu
  result1 = 36
  result2 = 26
*)
