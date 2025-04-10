(* Zadanie 3 / Lista 2 *)
(*
  Zdefiniuj funkcje matrix_expt_fast i fib_fast analogiczne do tych z 
  poprzedniego zadania, ale stosujące algorytm szybkiego potęgowania. 
  Algorytm ten wykorzystuje poniższą zależność dla wykładników parzystych:
    M^{2k} = {M^k}^2
*)

(* Definicje z poprzedniego zadania: *)
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

(* Rozwiązanie: *)
(* fib_matrix po prostu użyje fib_expt_fast, musimy się skupić na tej jednej funkcji *)


let matrix_expt_fast m k =
  let rec aux m k acc =
    if k = 0 then acc
    else if k mod 2 = 1 then
      aux (matrix_mult m m) (k / 2) (matrix_mult acc m)
    else
      aux (matrix_mult m m) (k / 2) acc
  in aux m k (1, 0, 0, 1);;

let fib_matrix_fast k =
  if k = 0 then 0
  else if k = 1 then 1
  else let (a, _, _, _) = matrix_expt_fast (1,1,1,0) (k-1) in 
  a;;