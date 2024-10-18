# Zadanie 4 / Lista 1

Niech u i v będą dwoma wierzchołkami w grafie nieskierowanym G = (V, E; c), gdzie
c : E → R+ jest funkcją wagową. Mówimy, że droga z u = u1, u2, . . . , uk−1, uk = v z u do v jest
sensowna, jeśli dla każdego i = 2, . . . , k istnieje droga z ui do v krótsza od każdej drogi z ui−1
do v (przez długość drogi rozumiemy sumę wag jej krawędzi).

Ułóż algorytm, który dla danego G oraz wierzchołków u i v wyznaczy liczbę sensownych dróg z
u do v.

## Idea

Aby wiedzieć czy droga jest czy nie jest sensowna musimy znać koszt dojścia z każdego wierzchołka do v.

Skorzystamy najpierw z Dijkstry, by znaleźć koszty dotarcia do v z każdego wierzchołka w grafie.

Następnie DFSem wyznaczymy sensowne drogi z u do v.

## Algorytm

### Dijkstra
```python
import heapq

def dijkstra(G, u, v):
    # Inicjalizacja odległości do wszystkich wierzchołków jako nieskończoność,
    # z wyjątkiem wierzchołka początkowego, który ma odległość 0.
    distances = {vertex: float('infinity') for vertex in G}
    distances[u] = 0

    # Inicjalizacja kolejki priorytetowej
    pq = [(0, u)]

    while pq:
        # Pobranie wierzchołka z najkrótszą odległością
        current_distance, current_vertex = heapq.heappop(pq)

        # Jeśli obecny wierzchołek jest wierzchołkiem docelowym, zakończ algorytm
        if current_vertex == v:
            break

        # Sprawdź wszystkich sąsiadów obecnego wierzchołka
        for neighbor, weight in G[current_vertex].items():
            distance = current_distance + weight
            # Jeśli znaleziono krótszą ścieżkę do sąsiada, zaktualizuj odległość
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(pq, (distance, neighbor))

    # Zwróć najkrótszą odległość do wierzchołka końcowego
    return distances[v]
```

### Rozwiązanie

```python
def wyznacz_sciezki(G, u, v):
  # zaczynamy od inicjalizacji - zaden odwiedzony, sciezki do wszystkich wierzcholkow 0
  for i in range(0, ilosc_wierzcholkow-1)
    odwiedzony[i] = False
    sciezki[i] = 0
  
  # Oznaczamy wierzołek docelowy jako odwiedzony i sciezka do niego jako 1
  odwiedzony[v] = True
  sciezki[v] = 1

  # Wyliczamy odleglosci do v z kazdego wierzcholka
  odleglosci[0 ... n-1] = Dijkstra(G, i, v)

  wyznacz_aux(u)
  return sciezki

def wyznacz_aux(w):
  dla kazdego sasiada u wierzcholka w # sprawdzamy każdą krawędź
    jesli odleglosci[u] < odleglosci[w] # jeśli przejście krawędzią zmniejsza odległość
      jesli odwiedzony[u] == False # jeśli wierzchołek nie był odwiedzony
        wyznacz(u) # wyznaczamy odległości do niego
      sciezki[w] += sciezki[u] # dodajemy do scieżki do wierzchołka w, scieżkę do wierzchołka u
  odwiedzony[w] = true # oznaczamy wierzchołek jako odwiedzony
```
