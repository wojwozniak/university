(* Zadanie 3 / Lista 3 *)
(*
  Zaimplementuj funkcję build_list n f, która konstruuje n-elementową listę,
  aplikując f do wartości od 0 do n −1. Dokładniej:
  build_list n f = [f 0; f 1; ...; f (n - 1)]
  Wykorzystaj funkcję build_list oraz funkcje anonimowe (fun), aby napisać na-
  stępujące funkcje:
    - negatives n, zwracającą listę liczb ujemnych od −1 do −n,
    - reciprocals n, zwracającą listę odwrotności liczb od 1 do n (czyli 1, . . . , 1
      n ),
    - evens n, zwracajacą listę pierwszych n liczb parzystych,
    - identityM n, zwracającą macierz identycznościową o wymiarach n ×n w
  postaci listy list:
*)

(* Build list *)
let build_list n f =
  let rec it i acc =
    if i = n 
    then List.rev(acc)
    else it (i+1) ((f i)::acc)
  in it 0 [];;

let negatives n = build_list n (fun x -> -x-1);;

let reciprocals n = build_list n (fun x -> 1.0 /. (float_of_int(x) +. 1.0));;
let evens n = build_list n (fun x -> x * 2);;

let identityM n =
  build_list n (fun i ->
    build_list n (fun j ->
      if i = j then 1 else 0
    )
  );;