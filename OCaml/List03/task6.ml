(* Zadanie 6 / Lista 3 *)
(*
  Wykorzystując funkcję fold_tree z wykładu, zdefiniuj następujące funkcje:
    - tree_product t – iloczyn wszystkich wartości występujących w drzewie,
    - tree_flip t – odwrócenie kolejności: zamiana lewego i prawego pod-
  drzewa wszystkich węzłów w drzewie,
    - tree_height t – wysokosć drzewa (liczba węzłów na najdłuższej ścieżce
    od korzenia do liścia),
    - tree_span t – para złożona z wartości skrajnie prawego i skrajnie lewego
  węzła w drzewie (czyli najmniejszej i największej wartości w drzewie
  BST),
    - flatten t – lista wszystkich elementów występujących w drzewie, w ko-
  lejności infiksowej. Kolejność ta polega na tym, że elementy drzewa po-
  siadającego w korzeniu węzeł listuje się zaczynając od elementów lewego
  poddrzewa (w kolejności infiksowej), po których następuje wartość węzła,
  a następnie elementy prawego poddrzewa (w kolejności infiksowej). Ze
  względu na własność BST, lista flatten t dla drzewa BST t jest posorto-
  wana.
*)

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree;;

let rec fold_tree f a t =
  match t with
  | Leaf -> a
  | Node (l, v, r) -> f (fold_tree f a l) v (fold_tree f a r);;

let t =
  Node (Node (Leaf, 2, Leaf),
        5,
        Node (Node (Leaf, 6, Leaf),
              8,
              Node (Leaf, 9, Leaf)));;

let tree_product t = fold_tree (fun x y z -> x * y * z) 1 t ;;

let tree_flip t =
  fold_tree (fun left v right -> Node (right, v, left)) Leaf t;;

(* To bez folda bo 5 razy wygodniej *)
let rec tree_height t =
    match t with
    | Leaf -> 0
    | Node (l, _, r) -> 1 + max (tree_height l) (tree_height r);;

let tree_span t =
  fold_tree 
    (
      fun (lmin, lmax) v (rmin, rmax) 
      -> 
      (match lmin with None -> Some v | Some x -> Some (min x v)),
      (match rmax with None -> Some v | Some x -> Some (max x v))
    )
    (None, None) 
    t;;
let flatten t =
  fold_tree (fun left v right -> left @ [v] @ right) [] t;;

flatten t;;