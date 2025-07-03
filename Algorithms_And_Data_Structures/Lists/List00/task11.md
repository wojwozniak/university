# Zadanie 11 / Lista 0

Niech G będzie nieskierowanym grafem ważonym, w którym waga dokładnie jednej krawędzi (oznaczmy ją przez (u,v)) jest ujemna. Wagi pozostałych krawędzi są dodatnie. Czy algorytm Dijkstry uruchomiony od wierzchołka v poprawnie wylicza długości najkrótszych ścieżek prostych (tj. takich, które nie zawierają powtarzających się wierzchołków) od v do pozostałych wierzchołków?

## Rozwiązanie

Na pewno nie działa w każdym przypadku -> kontrprzykład:

```
SO - 1 - A - 1 - C
|      /
4   -5 
| /
B
```
Algotytm Dijkstry:
- Source: -> D(A) = 1; D(B) = 4; del source from unvisited
- A: -> D(B) = -4; D(C) = 2; del A from unvisited
- B: -> D(A) = -1;
- C: brak zmian;
- Result: D(S) = 0; D(A) = -1; D(B) = -4; D(C) = 2

Ale S -> B -> A -> C ma koszt 0, nie znaleźliśmy tej najtańszej ścieżki


### Potencjalny warunek żeby działało

Wydaje mi się że zadziała jeśli krawędź ujemna graniczy ze źródłem.

(W razie czego 2 dijskry na dwóch stronach tej krawędzi, i min start, druga - waga ale raczej nie trzeba)

### Działające dla wszystkich pozycji pojedyńczej krawędzi

- usuwamy krawędź ujemną
- 3 Dijkstry -> start i dwa końce krawędzi
- odległość dla i to: min(bcost[i], bcost[u] + ucost[i] + n_weight, bcost[v] + vcost[i] + n_weight)