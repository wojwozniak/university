(* Co zapamiętać z tej listy? *)

(* List.filter *)
(*
  List.filter (fun element -> predicate) given_list
*)

(* List.find_opt *)
(* Tu dla słownika - znajduje wartość w strukturze lub zwraca none *)
(* zamiast none można dać failwith lub raise Not_found *)
(*
  match List.find_opt (fun (k, _) -> k = key) dict with
    | Some (_, v) -> Some v
    | None -> None
*)