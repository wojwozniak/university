(* Zadanie 3 / Lista 4 *)
(*
  Zamień definicję ListDict z zadania 1 na definicję funktora MakeListDict,
  sparametryzowanego modułem o sygnaturze Map.OrderedType, i zwracającego
  moduł o sygnaturze KDICT z zadania 2. Następnie, korzystając z napisanego
  funktora, utwórz moduł CharListDict.
  Zwróć uwagę, że zdefiniowany właśnie moduł nie pozwala (między innymi)
  na dodawanie nowych elementów do słownika. Dlaczego?
  Popraw definicję funktora MakeListDict przez modyfikację sygnatury zwracanego modułu. Możesz wykorzystać konstrukcję with type, umożliwiającą dodanie do sygnatury definicji typu, który był w niej abstrakcyjny (ukryty). Przykładowo, KDICT with type key = char oznacza sygnaturę słownika, w którym typ
  klucza jest typem znakowym, czyli:
  sig
    type key = char
    type 'a dict
    ...
  end
*)

module type OrderedType = sig
  type t
  val compare : t -> t -> int
end

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

(* Definiujemy typ jako OrderedType, dajemy with type i porównywanie na Ord.compare *)
module MakeListDict (Ord : OrderedType) : KDICT with type key = Ord.t = struct
  type key = Ord.t
  type 'a dict = (Ord.t * 'a) list

  let empty = []

  let insert key value dict = (key, value) :: dict

  let remove key dict = List.filter (fun (k, _) -> Ord.compare k key <> 0) dict

  let find_opt key dict =
    match List.find_opt (fun (k, _) -> Ord.compare k key = 0) dict with
    | Some (_, v) -> Some v
    | None -> None

  let find key dict =
    match find_opt key dict with
    | Some v -> v
    | None -> raise Not_found

  let to_list dict = dict
end

(* Zdefiniowanie typu i compare dla char *)
module CharOrd = struct
  type t = char
  let compare = Char.compare
end

(* Prosty konstruktor *)
module CharListDict = MakeListDict(CharOrd)

(* Test *)
let d = CharListDict.find_opt 'a' (CharListDict.insert 'a' 42 CharListDict.empty);;