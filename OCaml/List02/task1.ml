(* Zadanie 1 / Lista 2 *)
(*
  Inspirując się dwoma implementacjami silni przedstawionymi na wykładzie,
  zaimplementuj dwie funkcje obliczające wartość Fn:
    - rekurencyjną fib
    - iteracyjną fib-iter
  Porównaj czas ich działania dla różnych n, wytłumacz różnicę powołując się na
  model podstawieniowy przedstawiony na wykładzie.
*)

let rec fib n =
  match n with
    | 0 -> 0
    | 1 -> 1
    | _ -> fib(n-1) + fib(n-2);;

let fib_iter n =
  if n = 0 then 0 
  else if n = 1 then 1 
  else let rec aux a b c it =
    if it = n then c
    else aux b c (b+c) (it+1)
  in aux 0 1 1 2;;
