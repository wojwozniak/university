(* Co zapamiętać z tej listy? *)

(* Pattern matching dla list *)

(* Select sort *)

let rec select xs =
  match xs with
  | [] -> failwith "Empty list"
  | [x] -> (x, [])
  | x::xs' ->
      let (min, rest) = select xs' in
        if x <= min then (x, xs')
        else (min, x :: rest)
  ;;

let rec select_sort xs =
  match xs with
  | [] -> []
  | xs ->
      let (min, rest) = select xs in
        min :: select_sort rest
  ;;


(* Merge sort *)

let rec split xs =
  match xs with
  | [] -> ([], [])
  | [x] -> ([x], [])
  | x::y::zs ->
      let (left, right) = split zs in
      (x::left, y::right)
  ;;

let rec merge xs ys =
  match (xs, ys) with
  | ([], ys) -> ys
  | (xs, []) -> xs
  | (x::xs', y::ys') -> 
    if x <= y 
      then x::(merge xs' ys) 
      else y::(merge xs ys')
  ;;

let rec merge_sort xs =
  match xs with
    | [] -> []
    | [x] -> [x]
    | _ ->
      let (left, right) = split xs in
        merge (merge_sort left) (merge_sort right)
    ;;