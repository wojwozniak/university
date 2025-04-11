(* Zadanie 1 / Lista 4 *)
(*
Słownik to struktura danych przyporządkowująca kluczom pewnego typu danych 
wartości innego typu. Rozważmy następującą sygnaturę słownika:
  module type DICT = sig
  type ('a, 'b) dict
    val empty : ('a, 'b) dict
    val insert : 'a -> 'b -> ('a, 'b) dict -> ('a, 'b) dict
    val remove : 'a -> ('a, 'b) dict -> ('a, 'b) dict
    val find_opt : 'a -> ('a, 'b) dict -> 'b option
    val find : 'a -> ('a, 'b) dict -> 'b
    val to_list : ('a, 'b) dict -> ('a * 'b) list
  end
  Zaimplementuj moduł ListDict implementujący tę sygnaturę przy użyciu list
  par kluczy i wartości
*)

module type DICT = sig
  type ('a, 'b) dict
  val empty : ('a, 'b) dict
  val insert : 'a -> 'b -> ('a, 'b) dict -> ('a, 'b) dict
  val remove : 'a -> ('a, 'b) dict -> ('a, 'b) dict
  val find_opt : 'a -> ('a, 'b) dict -> 'b option
  val find : 'a -> ('a, 'b) dict -> 'b
  val to_list : ('a, 'b) dict -> ('a * 'b) list
end

module ListDict : DICT = struct
  type ('a, 'b) dict = ('a * 'b) list
  let empty = []
  let insert key value dict = (key, value)::dict

  let remove key dict = List.filter (fun (k, _) -> k <> key) dict

  let find_opt key dict =
    match List.find_opt (fun (k, _) -> k = key) dict with
    | Some (_, v) -> Some v
    | None -> None

  let find key dict =
    match find_opt key dict with
    | Some v -> v
    | None -> raise Not_found

  let to_list dict = dict
end