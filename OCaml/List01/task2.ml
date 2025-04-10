(* Zadanie 2, Lista 2 *)
(*
  Dla każdego z poniższych wyrażeń stwierdź, czy jest poprawnie otypowane,
  jeśli tak, to podaj jego typ. Uzasadnij swoją odpowiedź
*)
(* ^ - konkatenacja *)

"foo" ^ 42;; (* źle - Nie mamy autocastowania *)

"foo" ^ string_of_int 42;; (* string *)

1. = 2;; (* źle - Lewy argument ustala typ porównania *)

fun a -> a + 5;; (* int-> int = <fun> *)

fun a -> if a > 5 then a else "foo";; (* źle - funkcja może mieć jeden typ zwrotu *)

fun a b -> if a > 5 then a else b;; (* int -> int -> int = <fun> - zwracanie a:int wymusza że b też będzie intem *)

fun a b ->
  let c = a = b in
  if a > 3 && b = "foo"
  then c
  else false ;; (* źle - a = b i a > 3 wymusza że b to int, a poźniej przypisujemy string *)

fun a ->
  let f a b = a * a + b * b in
  f (f a a) a ;;
(* 
  dobrze - int -> int = <fun>, gdzie to całkiem ciekawa funkcja
  funkcja anonimowa, więc wywołamy biorąc ją w nawias (cała funkcja) arg
  deklarujemy przyjęcie parametru a
  poźniej definicja pomocniczej funkcji wewnętrznej
  i callujemy tę funkcję z wynikiem (f a a) i a
*)

let f a = a > 2 in
if 3 > 2 then true else f (f 2);;

(* źle - funkcja zwraca boola a później próbujemy wykorzystać to co zwraca jako argument (int) *)