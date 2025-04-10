let rec insert y xs =
  match xs with
  | [] -> [y]
  | x :: xs' -> if y < x
    then y :: xs
    else x :: insert y xs';;

let insertion_sort xs =
  let rec it xs ys =
    match xs with
    | [] -> ys
    | x :: xs' -> it xs' (insert x ys)
  in it xs [];;

let rec insert_desc y xs =
    match xs with
    | [] -> [y]
    | x :: xs' -> if y > x
      then y :: xs
      else x :: insert_desc y xs';;
  
let insertion_sort_desc xs =
    let rec it xs ys =
      match xs with
      | [] -> ys
      | x :: xs' -> it xs' (insert_desc x ys)
    in it xs [];;
  
let rec insert_generic lt y xs =
    match xs with
     | [] -> [y]
      | x :: xs' -> if lt y x
        then y :: xs
        else x :: insert_generic lt y xs';;
    
let insertion_sort_generic lt xs =
      let rec it xs ys =
        match xs with
        | [] -> ys
        | x :: xs' -> it xs' (insert_generic lt x ys)
      in it xs [];;

let insertion_sort_new xs = insertion_sort_generic (<) xs;;
let insertion_sort_desc_new xs = insertion_sort_generic (>) xs;;

let pair_lex (a1, a2) (b1, b2) =
  a1 < b1 || a1 = b1 && a2 < b2;;

let pair_lex_generic lt1 lt2 (a1, a2) (b1, b2) =
  lt1 a1 b1 || a1 = b1 && lt2 a2 b2;;

let add1 x = x + 1;;

let rec add1_to_all xs =
  match xs with
  | [] -> []
  | x::xs -> add1 x :: add1_to_all xs;;

let rec string_list_of_int_list xs =
  match xs with
  | [] -> []
  | x::xs -> string_of_int x :: string_list_of_int_list xs;;

let rec map f xs =
  match xs with
  | [] -> []
  | x::xs -> f x :: map f xs;;

let rec only_positive xs =
  match xs with
  | [] -> []
  | x::xs -> if x > 0 then x :: only_positive xs else only_positive xs;;

let rec only_nonempty xs =
  match xs with
  | [] -> []
  | x::xs -> if x <> [] then x :: only_nonempty xs else only_nonempty xs;;

let rec filter p xs =
  match xs with
  | [] -> []
  | x::xs -> if p x then x :: filter p xs else filter p xs;;
let rec append xs ys =
  match xs with
  | [] -> ys
  | x :: xs' -> x :: append xs' ys;;

let rec fold_right f xs a =
  match xs with
  | [] -> a
  | x::xs -> f x (fold_right f xs a);;

let new_append xs ys = fold_right (fun x xs -> x::xs) xs ys;;

let new_map f xs = fold_right (fun x xs -> f x :: xs) xs [];;

let new_filter p xs = fold_right (fun x xs -> if p x then x :: xs else xs) xs [];;

let length_r xs = fold_right (fun _ y -> 1 + y) xs 0;;

let length xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | _::xs -> it xs (acc + 1)
  in it xs 0;;

let sum xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | x::xs -> it xs (acc + x)
  in it xs 0;;

let reverse xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | x::xs -> it xs (x::acc)
  in it xs [];;

let fold_left f a xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | x::xs -> it xs (f acc x)
  in it xs a;;
  
let new_length xs = fold_left (fun acc _ -> acc + 1) 0 xs;;

let new_sum xs = fold_left (+) 0 xs;;

let new_reverse xs = fold_left (fun acc x -> x::acc) [] xs;;

let weird_map f xs = fold_left (fun xs x -> f x :: xs) [] xs;;

let weird_append xs ys = fold_left (fun xs x -> x::xs) ys xs;;

let new_sum_r xs = fold_right (+) xs 0;;

type int_or_string = IntVal of int | StringVal of string;;

let string_of_int_or_string x =
  match x with
  | IntVal a -> string_of_int a
  | StringVal s -> s;;

type int_tree = IntLeaf | IntNode of int_tree * int * int_tree;;

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree;;

let ex_tree = Node (Node (Leaf, 1, Leaf), 2, Node (Leaf, 3, Leaf));;

let rec map_tree f t =
  match t with
  | Leaf -> Leaf
  | Node (l, v, r) -> Node (map_tree f l, f v, map_tree f r);;

let rec sum_tree t =
  match t with
  | Leaf -> 0
  | Node (l, v, r) -> sum_tree l + v + sum_tree r;;

let rec fold_tree f a t =
  match t with
  | Leaf -> a
  | Node (l, v, r) -> f (fold_tree f a l) v (fold_tree f a r);;

let rec find_bst x t =
  match t with
  | Leaf -> false
  | Node (l, v, r) ->
      if v = x then true
      else if v < x then find_bst x r else find_bst x l;;

let rec insert_bst x t =
  match t with
  | Leaf -> Node (Leaf, x, Leaf)
  | Node (l, v, r) ->
      if x = v
      then t
      else if v < x
      then Node (l, v, insert_bst x r)
      else Node (insert_bst x l, v, r);; 