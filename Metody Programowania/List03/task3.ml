(* Zadanie 3 / Lista 3 *)
(*
  Zaimplementuj funkcję build_list n f, która konstruuje n-elementową listę,
  aplikując f do wartości od 0 do n − 1. Dokładniej:
  build_list n f = [ f 0; f 1; ...; f ( n - 1) ]
  Wykorzystaj funkcję build_list oraz funkcje anonimowe (fun), 
  aby napisać następujące funkcje:
    • negatives n, zwracającą listę liczb ujemnych od −1 do −n,
    • reciprocals n, zwracającą listę odwrotności liczb od 1 do n 
      (czyli 1, . . . ,1/n)   
  evens n, zwracajacą listę pierwszych n liczb parzystych,
    • identityM n, zwracającą macierz identycznościową o wymiarach n × n w
      postaci listy list:
        # identityM 3
  - : int list list = [[1; 0; 0]; [0; 1; 0]; [0; 0; 1]]
*)

let build_list n f =
  let rec build_list' n f acc =
    if n = 0 then acc
    else build_list' (n-1) f ((f (n-1))::acc)
     (* zmniejszamy iterator o 1, przekazujemy tę samą funkcję, 
        a jako akumulator listę z dołączonym f(n-1) jako head *)
  in build_list' n f []


(* Test *)

let test_build_list = build_list 5 (fun x -> x + 1);;

(* negatives *)

let negatives n = build_list n (fun x -> -x - 1);;

(* Test *)

let test_negatives = negatives 5;;

(* reciprocals *)

let reciprocals n = build_list n (fun x -> 1. /. (float_of_int (x + 1)));;

(* Test *)

let test_reciprocals = reciprocals 5;;

(* evens *)

let evens n = build_list n (fun x -> 2 * x);;

(* Test *)

let test_evens = evens 5;;

(* identityM *)

let identityM n = build_list n (fun x -> build_list n (fun y -> if x = y then 1 else 0));;

(* Test *)

let test_identityM = identityM 3;;