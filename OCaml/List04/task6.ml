(* Zadanie 6 / Lista 4 *)
(*
  Kopce lewicowe (znane też jako drzewa lewicowe) to prosta i efektywna struktura danych implementująca kolejkę priorytetową (którą na wykładzie zaimplementowaliśmy używając nieefektywnej struktury listy posortowanej). Podobnie jak w przypadku posortowanej listy, chcemy móc znaleźć najmniejszy
  element w stałym czasie, jednak chcemy żeby pozostałe operacje (wstawianie,
  usuwanie minimum i scalanie dwóch kolejek) działały szybko – czyli w czasie
  logarytmicznym. W tym celu, zamiast listy budujemy drzewo binarne, w którym
  wierzchołki zawierają elementy kopca wraz z wagami. Dodatkowym niezmiennikiem struktury danych, który umożliwi efektywną implementację jest to, że
  każdemu kopcowi przypisujemy rangę, którą jest długość „prawego kręgosłupa”
  (czyli ranga prawego poddrzewa zwiększona o 1 – lub zero w przypadku pustego
  kopca), i że w każdym poprawnie sformowanym kopcu ranga lewego poddrzewa
  jest nie mniejsza niż ranga prawego poddrzewa.
  Pozwala to nam zdefiniować następującą implementację:

    module LeftistHeap = struct
      type ('a , 'b ) heap =
      | HLeaf
      | HNode of int * ('a , 'b ) heap * 'a * 'b * ('a , 'b ) heap
      let rank = function HLeaf -> 0 | HNode (n , _ , _ , _ , _ ) -> n
      let heap_ordered p = function
      | HLeaf -> true
      | HNode (_ , _ , p', _ , _ ) -> p <= p'
      let rec is_valid = function
      | HLeaf -> true
      | HNode (n , l , p , v , r ) ->
      rank r <= rank l
      && rank r + 1 = n
      && heap_ordered p l
      && heap_ordered p r
      && is_valid l
      && is_valid r
      let make_node p v l r = ...
    end
  Wierzchołki reprezentujemy przy użyciu konstruktora HNode, którego polami są,
  kolejno: ranga wierzchołka, lewe poddrzewo, priorytet elementu, element, prawe
  poddrzewo. Funkcja is_valid sprawdza czy zachowany jest porządek kopca
  (używając heap_ordered) i czy własność rangi opisana powyżej jest spełniona.
  Zaimplementuj funkcję („inteligentny konstruktor”) make_node. Zwróć uwagę,
  że make_node nie przyjmuje rangi tworzonego kopca, ale musi ją wyliczyć. Oznacza też, że musimy stwierdzić w funkcji konstruktora który z kopców powinien
  zostać prawym, a który lewym poddrzewem (możemy natomiast założyć że
  porządek kopca zostanie zachowany).
  Zaimplementuj następnie funkcję heap_merge złączającą dwa kopce. Idea
  scalania kopców jest następująca: jeśli jeden z kopców jest pusty, scalanie jest
  trywialne (bierzemy drugi kopiec). Jeśli oba są niepuste, możemy znaleźć najmniejszy priorytet elemenu każdego z nich. Mniejszy z tych dwóch priorytetów
  i skojarzony z nim element powinny znaleźć się w korzeniu wynikowego kopca łatwo go znaleźć. Mamy zatem cztery obiekty:
  - element o najniższym priorytecie (nazwiemy go e),
  - jego priorytet (nazwiemy go p),
  lewe poddrzewo kopca z którego korzenia pochodzi e — hl
  - prawe poddrzewo kopca z którego korzenia pochodzi e — hr
  - drugi kopiec, h, którego korzeń miał priorytet większy niż e.
  Aby stworzyć wynikowy kopiec wystarczy teraz scalić hr i h (rekurencyjnie),
  a następnie stworzyć wynikowy kopiec z kopca otrzymanego przez rekurencyjne scalanie, kopca hl elementu e i priorytetu p. Implementując heap_merge,
  wykorzystaj funkcję make_node.
*)

module LeftistHeap = struct
  type ('a , 'b ) heap =
  | HLeaf
  | HNode of int * ('a , 'b ) heap * 'a * 'b * ('a , 'b ) heap
  let rank = function HLeaf -> 0 | HNode (n , _ , _ , _ , _ ) -> n
  let heap_ordered p = function
  | HLeaf -> true
  | HNode (_ , _ , p', _ , _ ) -> p <= p'
  let rec is_valid = function
  | HLeaf -> true
  | HNode (n , l , p , v , r ) ->
      rank r <= rank l
      && rank r + 1 = n
      && heap_ordered p l
      && heap_ordered p r
      && is_valid l
      && is_valid r
  let make_node p v l r = ...
end