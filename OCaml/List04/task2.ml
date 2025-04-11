(* Zadanie 2 / Lista 4 *)
(*
  Wbudowany w bibliotekę standardową moduł Map udostępnia słownik zaimplementowany przy pomocy drzewa zrównoważonego. Używanym tam porządkiem
  porównań nie jest domyślny porządek określony przez operatory (<) oraz (=).
  Zamiast tego słowniki są sparametryzowane porządkiem, definiowanym następującą sygnaturą (Map.OrderedType):
    module type OrderedType = sig
      type t
      val compare : t -> t -> int
    end

  Dla dwóch zadanych elementów typu t, funkcja compare zwraca wartość ujemną,
  zero lub dodatnią wtedy i tylko wtedy gdy, odpowiednio, pierwszy element
  jest mniejszy, równy lub większy od drugiego. Biblioteka standardowa języka
  OCaml udostępnia funkcje compare dla różnych typów, włączając w to int
  (Int.compare), string (String.compare) i char (Char.compare).
  Zmodyfikuj sygnaturę DICT z zadania 1 tak, aby typ kluczy słownika nie był
  już parametrem typowym typu dict, ale ustalonym (choć nieznanym) typem.
  Zmodyfikowana sygnatura powinna zaczynać się następująco:

    module type KDICT = sig
      type key
      type 'a dict
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