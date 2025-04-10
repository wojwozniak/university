(* Zadanie 5 / Lista 1 *)
(*
  Zauważ że w naszym modelu obliczania wartości dopuszczamy, aby operato-
  rami były wyrażenia złożone. Korzystając z tej obserwacji, wyjaśnij działanie
  następującej funkcji:
*)
let a_plus_abs_b a b =
  (if b > 0 then (+) else (-)) a b

(* Jest to a + moduł z b *)
(* Musimy dać operatory w nawias by je zwrócić zamiast użyć ich w miejscu *)