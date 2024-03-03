(* Zadanie 5 / Lista 1 *)

(*
  Zauważ że w naszym modelu obliczania wartości dopuszczamy, 
  aby operatorami były wyrażenia złożone. 
  Korzystając z tej obserwacji, wyjaśnij działanie następującej funkcji:
*)

(*
  let a_plus_abs_b a b =
    (if b > 0 then (+) else (-)) a b  
*)

let a_plus_abs_b a b =
  (if b > 0 then (+) else (-)) a b  


let test = a_plus_abs_b 1 (-5) = 6 ;;


let c = (+) 4 5

(* Ważny jest tu nawias - wówczas operator jest traktowany jako funkcja 
   i można go potraktować "infiksowo" *)