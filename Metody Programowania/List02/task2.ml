(* Zadanie 2 / Lista 2 *)

(*
  Przyjmijmy, że będziemy reprezentować macierze o rozmiarze 2 ×2 przy użyciu
  czteroelementowych krotek. Zdefiniuj następujące funkcje i wartości:
    •matrix_mult m n – iloczyn dwóch macierzy.
    •matrix_id – macierz identycznościowa.
    •matrix_expt m k – podnosi macierz m do k-tej potęgi (naturalnej). Potę-
      gowanie można obliczać przez wielokrotne mnożenie.
  Korzystając z tych definicji, zdefiniuj procedurę fib_matrix obliczającą k-tą
  liczbę Fibonacciego Fk na podstawie zależności:
    [1 1]^k = [Fk+1 Fk]
    [1 0]     [Fk Fk−1]
*)

(* matrix_mult - tak jak pisemnie, każdy operator z kropką by mieć floaty *)
let matrix_mult (a, b, c, d) (e, f, g, h) =
  (a *. e +. b *. g, a *. f +. b *. h, c *. e +. d *. g, c *. f +. d *. h)

(* matrix_id - macierz identycznościowa *)
let matrix_id = (1., 0., 0., 1.)

(* matrix_expt - podnosi macierz m do k-tej potęgi *)
let rec matrix_expt m k =
  if k = 0 then matrix_id
  else matrix_mult m (matrix_expt m (k - 1))

(* fib_matrix - oblicza k-tą liczbę Fibonacciego - używamy powyższych metod *)
let fib_matrix k =
  let m = (1., 1., 1., 0.) in
  let (a, _, _, _) = matrix_mult (1., 1., 1., 0.) (matrix_expt m (k-2)) 
  in a
;;

fib_matrix 10

(* Podłoga tak jak w C# - nie wiem czy tu jest jakaś optymalizacja dzięki temu, 
   pewnie tak *)