(* Zadanie 6 / Lista 1 *)
(*
  Przeanalizuj poniższe funkcje. W jaki sposób możesz użyć ich, aby sprawdzić,
  czy interpreter wykonuje obliczenia używając gorliwej, czy leniwej kolejności
  obliczania? Uzasadnij odpowiedź pokazując, jak interpreter wyliczyłby war-
  tość w zależności od kolejności obliczania. Załóż, że reguła obliczania wartości
  wyrażenia if nie zależy od kolejności obliczania.
*)

let rec f () = f ();;
let test x y =
  if x = 0 then 0 else y;;

test 1 (f());;