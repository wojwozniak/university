(* Zadanie 2 / Lista 2 *)
(* 
  Przyjmijmy, że będziemy reprezentować macierze o rozmiarze 2 ×2 przy użyciu
  czteroelementowych krotek. Zdefiniuj następujące funkcje i wartości:
    - matrix_mult m n
    - matrix_id
    - matrix_expt m k
  Korzystając z tych definicji zdefiniuj fib_matrix obliczającą k-tą liczbę
  Fibbonacciego korzystając z zależności rekurencyjnej.
*)

(* Od lewego górnego do prawego dolnego rogu a b c d *)

(* Na razie nie robimy szybkiego mnożenia - mamy to do zrobienia w kolejnym zadaniu *)

let matrix_id = (1, 0, 0, 1);;

let matrix_mult m k =
  let (a, b, c, d) = m 
  and (e, f, g, h) = k in
  (a * e + b * g,
   a * f + b * h,
   c * e + d * g,
   c * f + d * h);;

let matrix_expt m k =
  let rec aux acc i =
    if k = i then acc
    else aux (matrix_mult acc m) (i+1)
  in aux m 1;;

let fib_matrix k =
  if k = 0 then 0
  else if k = 1 then 1
  else let (a, _, _, _) = matrix_expt (1,1,1,0) (k-1) in 
  a;;