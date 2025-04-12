(* Zadanie 4 / Lista 5 *)
(*
  Rozbuduj funkcję parens_ok z poprzedniego zadania tak, by sprawdzała poprawne
  nawiasowania składające się z symboli ’(’, ’)’, ’[’, ’]’, ’{’ oraz ’}’. 
  Wskazówka: W tym wypadku nawias zamykający może zamknąć tylko nawias otwierający tego samego typu. Nie wystarczy więc pamiętać, ile było
  nawiasów, ale trzeba także wiedzieć, jakiego były rodzaju. Dobrą strukturą do
  tego jest stos, na który wrzucamy nawiasy otwierające, które zdejmujemy, gdy
  zobaczymy pasujący nawias zamykający. Stos można zaimplementować przy
  użyciu listy.
*)

let list_of_string s = String . to_seq s |> List . of_seq;;

let parens_ok s =
  let rec it stack lst =
    match lst with
      | [] -> if stack = [] then true else false
      | x::ys -> 
        match x with
        | '(' | '{' | '[' -> it (x::stack) ys
        | ')' -> 
          (match stack with
            | '(' :: rest -> it rest ys
            | _ -> false)
        | '}' -> 
          (match stack with
            | '{' :: rest -> it rest ys
            | _ -> false)
        | ']' -> 
           (match stack with
            | '[' :: rest -> it rest ys
            | _ -> false)
        | _ -> false
  in it [] (list_of_string s);;

  parens_ok "[()[{}]]";;