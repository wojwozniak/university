(* Zadanie 6 / Lista 2 *)

(*
  Zaimplementuj funkcję suffixes xs zwracającą wszystkie sufiksy listy xs –
  czyli takie listy, które zawierają, w kolejności i bez powtórzeń, elementy listy xs
  od zadanego elementu aż do końca listy. Listę pustą uznajemy za sufiks dowolnej
  listy. Przykład:
    # suffixes [1; 2; 3; 4]
      - : int list list = [[1; 2; 3; 4]; [2; 3; 4]; [3; 4]; [4]; []]
*)

let rec suffixes xs =
  match xs with
  | [] -> [[]]
  | h :: t -> xs :: suffixes t ;;

  
suffixes [1; 2; 3; 4] ;;