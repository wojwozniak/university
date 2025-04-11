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


module ListDict : KDICT = struct
  type key
  type 'a dict = (key * 'a) list

  let empty = []

  let insert key value dict = (key, value) :: dict

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

module MakeListDict(Key : sig type t val compare : t -> t -> int end) : KDICT with type key = Key.t = struct
  type key = Key.t
  type 'a dict = (key * 'a) list

  let empty = []

  let insert key value dict = (key, value) :: dict

  let remove key dict = List.filter (fun (k, _) -> Key.compare k key <> 0) dict

  let find_opt key dict =
    match List.find_opt (fun (k, _) -> Key.compare k key = 0) dict with
    | Some (_, v) -> Some v
    | None -> None

  let find key dict =
    match find_opt key dict with
    | Some v -> v
    | None -> raise Not_found

  let to_list dict = dict
end

module CharListDict = MakeListDict(Char)

let d = CharListDict.empty
let d' = CharListDict.insert 'a' 42 d