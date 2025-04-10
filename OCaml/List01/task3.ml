(* Zadanie 3 / Lista 1 *)

(* a) Po prostu niezwiązany x *)
x;;

(* b) x związany przez let x = 3, unbound y *)
let x = 3 in x + y;;

(* c) Przez użycie and x i y nie widzą swoich deklaracji, zamiana and na in let by naprawiła *)
(* x + y - zmienne związane przez odpowiednie wyrażenia powyżej *)
let x = 1
and y = x + 2
in x + y;;

(* d) Tu poprawna wersja tego powyżej *)
let x = 1 in
let y = x + 2 in
x + y;;

(* e) x y triv, z niezwiązane*)
let f x y = x * y * z;;

(* f) f x definuje funkcję z jednym parametrem, x w x * y * z jest do niego zbindowane *)
(* Druga linijka jest definicją funkcji pomocniczej g -> y i z związane z deklaracją let g y z *)
(* W trzeciej linii wywołujemy tę funkcję, ale h i z są niezwiązane (są x z x, g z g) *)
let f x =
  let g y z = x * y * z in
g (h x) z;;