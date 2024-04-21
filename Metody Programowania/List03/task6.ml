(* Zadanie 6 / Lista 3 *)
(* 
  Wykorzystując funkcję fold_tree z wykładu, zdefiniuj następujące funkcje:
    •tree_product t – iloczyn wszystkich wartości występujących w drzewie,
    •tree_flip t – odwrócenie kolejności: zamiana lewego i prawego pod-
      drzewa wszystkich węzłów w drzewie,
    •tree_height t – wysokosć drzewa (liczba węzłów na najdłuższej ścieżce
      od korzenia do liścia),
    •tree_span t – para złożona z wartości skrajnie prawego i skrajnie lewego
      węzła w drzewie (czyli najmniejszej i największej wartości w drzewie
      BST),
    •preorder t – lista wszystkich elementów występujących w drzewie, w
      kolejności preorder. Kolejność ta polega na tym, że elementy drzewa
      posiadającego w korzeniu węzeł listuje się zaczynając od wartości w węźle,
      po której występują elementy lewego poddrzewa a następnie prawego,
      również w kolejności preorder. Inaczej można powiedzieć, że kolejność
      preorder to kolejność odwiedzania węzłów przez przeszukiwanie w głąb
      (DFS) drzewa.
*)

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

let rec fold_tree f a t =
  match t with
  | Leaf -> a
  | Node (l, v, r) -> f (fold_tree f a l) v (fold_tree f a r)


let tree_product t =
  fold_tree (fun l v r -> l * v * r) 1 t

let tree_flip t =
  fold_tree (fun l v r -> Node (r, v, l)) Leaf t

let tree_height t =
  fold_tree (fun l _ r -> 1 + max l r) 0 t

let tree_span t =
  fold_tree (fun l v r -> (min l v, max v r)) (max_int, min_int) t
  
let preorder t =
  let rec preorder' t acc =
    match t with
    | Leaf -> acc
    | Node (l, v, r) -> v :: (preorder' l (preorder' r acc))
  in preorder' t []
