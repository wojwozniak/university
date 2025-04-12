(* Zadanie 3 / Lista 5 *)
(*
  Zaimplementuj funkcję
    parens_ok : string -> bool
  Sprawdza ona, czy argument jest napisem zawierającym tylko symbole ’(’ oraz
  ’)’, które tworzą poprawne nawiasowanie. 
*)
let list_of_string s = String . to_seq s |> List . of_seq;;

let parens_ok s =
  let rec it count lst =
    match lst with
      | [] -> if count = 0 then true else false
      | x::ys -> 
        match x with
        | '(' -> it (count+1) ys
        | ')' -> if count >= 1 then it (count-1) ys else false
        | _ -> false
  in it 0 (list_of_string s);;