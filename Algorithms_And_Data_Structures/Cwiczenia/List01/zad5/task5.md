# Zadanie 5 / Lista 1

Ułóż algorytm, który dla zadanego acyklicznego grafu skierowanego G znajduje długość najdłuższej drogi w G. Następnie zmodyfikuj swój algorytm tak, by wypisywał drogę o największej długości (jeśli jest kilka takich dróg, to Twój algorytm powinien wypisać dowolną z nich).

## Część 1 - szukamy długości najdłuższej drogi

### Idea

Mamy zaimplementowanego topoSorta w trzecim więc sb skorzystamy.

Napierw sortujemy, dzięki czemu się to nie popsuje - mamy ogarniętych przodków 
przed sprawdzeniem dzieci.

W każdym sprawdzeniu porównujemy maxa - bo ofc może być kilka ścieżek 
prowadzących do tego samego wierzchołka.

```python
def max_path_length(G):
    sorted = topoSort(G)
    distances = [0] * len(G) # tablica najdluzej drogi do danego wierzcholka - init 0
    for u in sorted: # Dla każdego wierzchołka u w porządku topologicznym
        for v in G[u]: # Dla każdej krawędzi u -> v
            distances[v] = max(distances[v], distances[u] + G[u][v]) # Zaktualizuj odległość do v - max z obecnej i nowej
    return max(distances) # Zwróć najdłuższą odległość
```

### Złożoność
$O(V + E)$ - i czasowo i pamięciowo

## Część 2 - wypisanie drogi

### Idea

Nie trzymamy tylko wartości, ale parę <wartość, rodzic>. Gdy dotrzemy do końca wywołamy rekurencyjną funkcję która zacznie wypisywać ścieżkę gdy dotrze do wartości bez rodzica.

Mozliwe ze jakieś błędy w kodzie, ale powiedzmy ze to pseudokod i widac idee XD

```python
def max_path_length(G):
    sorted = topoSort(G)
    distances = [0, null] * len(G)
    for u in sorted:
        for v in G[u]:
            if(distances[v][0] < distances[u][0] + G[u][v]):
                distances[v][0] = [distances[u][0] + G[u][v], u]
                distances[v][1] = u
            
    return distances

def print_rec(distances, u):
    if(distances[u][1] == null):
        print(u)
    else:
        print_rec(distances)
        print(" -> ")
        print(u)

def solve(G):
    distances = max_path_length(G)
    max = max(distances)
    max_parent = distances.index(max)
    print_rec(distances, max_parent)
```