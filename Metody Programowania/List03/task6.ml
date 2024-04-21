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
