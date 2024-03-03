(* Zadanie 1 / Lista 2 *)

(*
  Ciąg Fibonacciego definiuje się rekurencyjnie w następujący sposób:
    F0 = 0
    F1 = 1
    Fn= Fn−1 + Fn−2 gdy n > 1
  Inspirując się dwoma implementacjami silni przedstawionymi na wykładzie,
  zaimplementuj dwie funkcje obliczające wartość Fn:
    •fib – wersję rekurencyjną, obliczającą wartość zgodnie z definicją powy-
    żej,
    •fib_iter – wersję iteracyjną, wykorzystującą pomocniczą procedurę z
      dwoma dodatkowymi argumentami, reprezentującymi dwie poprzednie
      wartości ciągu Fibonacciego względem aktualnie obliczanej.

    Porównaj czas trwania obliczeń obydwu implementacji dla różnych wartości
    n. Wyjaśnij w intuicyjny sposób zaobserwowaną różnicę, odwołując się do
    podstawieniowego modelu obliczeń poznanego na wykładzie.
*)

let rec fib n =
  if n = 0 then 0
    else if n = 1 then 1
    else fib (n - 1) + fib (n - 2)


let test2 = fib 40

let fib_iter n =
  let rec it n acc =
    if n = 0 then fst acc
    else it (n - 1) (snd acc, fst acc + snd acc)
  in it n (0, 1)

let test3 = fib_iter 40

(*
  Wersja rekurencyjna jest znacznie wolniejsza od wersji iteracyjnej - wynika 
  to z modelu podstawieniowego z wykładu - wersja rekurencyjna wywołuje się 
  znacznie więcej razy (tworzy duże drzewo wywołań rekurencyjnych), co
  znacząco spowalnia jej działanie - jest to dobrze widoczne np. dla wartości 40.
*)