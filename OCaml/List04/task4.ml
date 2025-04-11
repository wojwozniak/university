(* Zadanie 4 / Lista 4 *)
(*
  Utwórz otypowany analogicznie do funktora MakeListDict z zadania 3 funktor
  MakeMapDict, wykorzystujący wbudowane w bibliotekę standardową OCamla
  słowniki z modułu Map. Następnie, korzystając z napisanego funktora, utwórz
  moduł CharMapDict. Pamiętaj o użyciu with type.
*)

module type KDICT = sig
  type key
  type 'a dict
  val empty : 'a dict
  val insert : key -> 'a -> 'a dict -> 'a dict
  val remove : key -> 'a dict -> 'a dict
  val find_opt : key -> 'a dict -> 'a option
  val find : key -> 'a dict -> 'a
  val to_list : 'a dict -> (key * 'a) list
end

module type OrderedType = sig
  type t
  val compare : t -> t -> int
end

(* Korzystamy z wbudowanego map *)
module MakeMapDict (Ord : OrderedType) : KDICT with type key = Ord.t = struct
  module MapDict = Map.Make(Ord)

  type key = Ord.t
  type 'a dict = 'a MapDict.t

  let empty = MapDict.empty

  let insert key value dict = MapDict.add key value dict

  let remove key dict = MapDict.remove key dict

  let find_opt key dict = MapDict.find_opt key dict

  let find key dict =
    match MapDict.find_opt key dict with
    | Some v -> v
    | None -> raise Not_found

  let to_list dict = MapDict.bindings dict
end

(* I to już jak wcześniej *)
module CharOrd = struct
  type t = char
  let compare = Char.compare
end

module CharMapDict = MakeMapDict(CharOrd)

(* Test *)
let d = CharMapDict.find_opt 'a' (CharMapDict.insert 'a' 42 CharMapDict.empty);;