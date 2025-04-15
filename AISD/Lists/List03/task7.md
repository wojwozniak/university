# Zadanie 7 / Lista 3

Dane jest nieukorzenione drzewo z naturalnymi wagami na krawędziach oraz liczba naturalna C.

(a) (2pkt) Ułóż algorytm obliczający, ile jest par wierzchołków odległych od siebie o C.

(b) (2,5pkt) Jak w punkcie (a), ale algorytm ma działać w czasie O(n log n).

## Naiwne rozwiązanie

1) Numerujemy wierzchołki kolejnymi liczbami naturalnymi
2) Dla każdego wierzchołka robimy DFS-a którym obliczamy odległość od naszego wierzchołka do każdego innego -> jeśli $from_id < to_id$ i odp. odległość to aktualizujemy licznik.

```py
# Na wejściu
G[V][E] = dany_graf
c = dana_odleglosc

# Pomocnicze zmienne globalne
i = 0; output = 0; nr = [0]*v

def enumerate(G, v):
    nr[v] = i
    mark v as visited
    i += 1
    for nb in G[v]:
        if nb is unvisited:
            enumerate(G, nb)

def fn(G, start, curr, c, given_dst):
    mark curr as visited

    for nb in G[curr]:
        new_dst = given_dst + weight(curr, nb)
        if new_dst == c and nr[curr] < nr[s]:
            output += 1
        else if new_dst < c
            fn(G, start, nb, c, new_dst)

def main():
    for v in G:
        visited = []
        fn(G, v, v, c, 0)
    
    return output
```

### Złożoność rozwiązania
- $O(V(V+E))$ czasowo -> robimy V DFSów
- $O(V)$ pamięci na struktury pomocnicze -> 2 listy długości n

## Mniej naiwne rozwiązanie - D&C

Trzeba skorzystać z centroid. 

### Divide

1) Wyznaczamy centroidę
2) Tniemy
3) Rekurencyjnie wywołujemy dla drzew

### Merge

Musimy rozważyć dwa przypadki par wierzchołków:

1) Para w całości w jakimś podrzewie
2) Para z dwóch poddrzew

## Czemu jest to wydajniejsze?

- Centroidę wyznaczamy liniowo
- Każdy z powstałych przypadków $<=n / 2$
- Wyznaczamy odległości w podzbiorach i odległości od centroidy
- Robimy dfsy na małych zbiorach, i porównujemy tylko odległości od centroidy więc mniej sprawdzeń