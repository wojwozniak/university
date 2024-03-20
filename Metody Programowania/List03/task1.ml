(* Zadanie 1 / Lista 3 *)

(* 
  Wzorując się na funkcji z wykładu sumującej liczby przy użyciu fold_left, 
  zdefiniuj funkcję product, obliczającą iloczyn elementów listy. 
  Jaką wartość powinien zwracać product dla listy pustej?
*)

(* fold_left z wykładu *)
let fold_left f a xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | x :: xs' -> it xs' (f acc x)
  in it xs a
;;


(* product *)
(*
  Pusta lista zwróci 1.
  Przyjmujemy listę
  Definiujemy rekurencyjnie funkcję it,
  która przyjmuje listę i akumulator.
  Wewnątrz funkcji mamy matcha, który sprawdza czy lista jest pusta.
  w.p.p. wywołujemy rekurencyjnie it z ogonem listy i wynikiem mnożenia 
  akumulatora przez głowę listy.   
*)
let product xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | x :: xs' -> it xs' (acc * x)
  in it xs 1


(* test *)
let test1 = product [1; 2; 3; 4; 5] = 120;;

let test2 = product [1; 2; 3; 4; 5; 6] = 720;;

let test3 = product [] = 1;;