(* Zadanie 3 / Lista 2 *)

(*
  Zdefiniuj procedury matrix_expt_fast i fib_fast analogiczne do tych z po-
  przedniego zadania, ale stosujące algorytm szybkiego potęgowania. Algorytm
  ten wykorzystuje poniższą zależność dla wykładników parzystych:
    M 2k= (M k)2
  Porównaj wydajność procedury fib_fast z procedurą fib_matrix lub fib_iter
  (z poprzednich zadań)
*)

(* matrix_mult - z poprzedniego zadania *)
let matrix_mult (a, b, c, d) (e, f, g, h) =
  (a *. e +. b *. g, a *. f +. b *. h, c *. e +. d *. g, c *. f +. d *. h)

(* matrix_expt_fast - najprostsze szybkie potęgowanie *)
let rec matrix_expt_fast m n =
  if n = 1 then m
  else if n mod 2 = 0 then
    let m' = matrix_expt_fast m (n / 2) in
    matrix_mult m' m'
  else
    let m' = matrix_expt_fast m (n / 2) in
    matrix_mult m (matrix_mult m' m')

(* fib_fast - szybki fibbonaci *)
let fib_fast k =
  let m = (1., 1., 1., 0.) in
  let (a, _, _, _) = matrix_mult (1., 1., 1., 0.) (matrix_expt_fast m (k-2)) 
  in a
;;


fib_fast 40
(* Dla dużych wartości widać poprawę - zauważalnie mniej mnożeń 
   więc lecimy szybciej *)