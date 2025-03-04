# Zadanie 11 / Lista 0

Niech G będzie nieskierowanym grafem ważonym, w którym waga dokładnie jednej krawędzi (oznaczmy ją przez (u,v)) jest ujemna. Wagi pozostałych krawędzi są dodatnie. Czy algorytm Dijkstry uruchomiony od wierzchołka v poprawnie wylicza długości najkrótszych ścieżek prostych (tj. takich, które nie zawierają powtarzających się wierzchołków) od v do pozostałych wierzchołków?

## Rozwiązanie

Może nawet dla kilku - warunek -> ujemne graniczą ze startem (lub ze sobą mając w ścieżce ujemnych start)