# Zadanie 1 / Lista 2

Przeprowadź dowód poprawności algorytmu Kruskala, który porównuje ciąg krawędzi drzewa wybranych przez algorytm Kruskala 
z ciągiem krawędzi minimalnego drzewa spinającego (otrzymanego przez dowolny algorytm optymalny). 
W dowodzie nie powołuj się na własności typu cut property czy cycle property.

## Minilemat do rozwiązania

`T` to drzewo rozpinające. Usunięcie krawędzi `e` między `u` i `v` i dodanie innej krawędzi
dzięki której powstanie ścieżka między `u` i `v` sprawi że `T` to nadal będzie spanning tree.

### Dowód minilematu

Obvious na rysunku. Usunięcie `e` tworzy nam dwie spójne składowe, dodanie innej
krawędzi je łączy.

## Rozwiązanie


Niech `T'` będzie MST.

Rozważmy `T` -> drzewo wyznaczane przez algorytm Kruskala.

W każdym kroku Kruskal dodaje jedną krawędź.

- Niech `e` (krawędź łącząca `u` i `v`) będzie pierwszą dodaną przez Kruskala 
do `T` w n-tym kroku - dwie opcje

- Jeśli `e` należy do `T'` to wszystko git
- Jeśli nie:

### `e` nie należy do `T'`

`u` i `v` są połączone w `T'` jakąś inną ścieżką. Ścieżka ta zawiera min. jedną
krawędź o wadze większej niż `e` (bo inaczej Kruskal by już je wybrał i nie dodawałby `e`).

Nazwijmy tę krawędź `f`.

`T*` = `T'`u`e` / `f` z lematu nadal jest spanning tree. 

Waga `e` jest mniejsza niż
waga `f`, a więc `T*` jest spanning tree o sumarycznej 
wadze mniejszej niż `T'`.

`T'` nie jest więc MST - sprzeczność z założeniem że jest MST.