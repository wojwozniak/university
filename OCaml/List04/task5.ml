(* Zadanie 5 / Lista 4 *)
(*
  Używając sygnatury słownika KDICT, zaimplementuj funkcję freq w funktorze
  Freq uzupełniając kod poniżej:
    module Freq ( D : KDICT ) = struct
      let freq ( xs : D . key list ) : ( D . key * int ) list = ...
    end
  Wartością zwracaną powinna być lista par, których pierwszym elementem są
  elementy listy wejściowej xs, a drugim – liczba wystąpień tego elementu w tej
  liście.
  Wykorzystując funktor Freq, napisz funkcję char_freq, obliczającą liczbę
  wystąpień znaków w ciągu typu string. Aby zamienić wartość string na listę
  znaków, możesz wykorzystać funkcję:
    let list_of_string s = String . to_seq s | > List . of_seq
  Wykorzystaj dowolny z modułów CharMapDict lub CharListDict.
*)

(* Z poprzednich zadań *)
module type OrderedType = sig
  type t
  val compare : t -> t -> int
end

module CharOrd = struct
  type t = char
  let compare = Char.compare
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

module CharListDict : KDICT with type key = char = struct
  type key = char
  type 'a dict = (char * 'a) list

  let empty = []

  let insert key value dict = (key, value) :: dict

  let remove key dict = List.filter (fun (k, _) -> Char.compare k key <> 0) dict

  let find_opt key dict =
    match List.find_opt (fun (k, _) -> Char.compare k key = 0) dict with
    | Some (_, v) -> Some v
    | None -> None

  let find key dict =
    match find_opt key dict with
    | Some v -> v
    | None -> raise Not_found

  let to_list dict = dict
end

(* Implementacja modułu *)
module Freq (D : KDICT) = struct

  let freq (xs : D.key list) : (D.key * int) list =
    let count dict key =
      let count = match D.find_opt key dict with
        | Some n -> n + 1
        | None -> 1
      in D.insert key count dict
    in 
  let final_dict = List.fold_left count D.empty xs 
  in D.to_list final_dict
end

module CharFreq = Freq(CharListDict)

let list_of_string s = String.to_seq s |> List.of_seq (* Z treści *)

let char_freq (s : string) : (char * int) list =
  CharFreq.freq (list_of_string s)


(* Test *)
let s = "hello"
let chars = list_of_string s
let result = char_freq s