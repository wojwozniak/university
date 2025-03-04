# Zadanie 7, Lista 0

Napisz algorytm, który dla drzewa `T = (V, E)` oraz listy par wierzchołków `{vi, ui} (i = 1, ..., m)`, sprawdza, czy `vi` leży na ścieżce z `ui` do `korzenia`. Przyjmij, że drzewo zadane jest jako lista n - 1 krawędzi (pi, ai), takich, że pi jest ojcem ai w drzewie.

## Definicja drzewa

Drzewo – graf nieskierowany, który jest acykliczny i spójny. 

## Fakty
Najpierw useful fakty:
- Szukamy `root` -> ... -> `vi` -> ... -> `ui`

- Szukamy ścieżki prostej (bez powtórzeń wierzchołków). Dlaczego?

  - Jeśli krawędzie są skierowane (na co lekko hintuje słownictwo w treści zadania) to jest to obv z acykliczności
  - dla nieskierowanych z faktu spójności algorytm to `return true`
  - poza tym mamy root z ktorego idziemy, to wykorzystujemy wszystkie krawedzie w jedna strone, pozniej dalsze w jedna -> dla naszego zadania zawsze jest jednokierunkowosc

- Skoro graf z deficji jest acykliczny, to istnieje dokładnie jedna ścieżka między każdymi dwoma wierzchołkami.
- Jeśli zakładamy że krawędzie wejściowe w reprezentacji drzewa są nieposortowane to możemy zcastować naszą reprezentację na tablice sąsiedztwa w O(n) czas i O(n) pamięć (bo n-1 krawędzi z definicji zadania więc nie V + E)

## Pomysł

Jeśli graf skierowany to po prostu DFSik do punktu docelowego zapamiętując czy mineliśmy przejściowy i chillera. w.p.p.

- Castujemy na listy sąsiedztwa (2 inserty na krawędź bo dwukierunkowe)
- DFS z rootu do punktu przejściowego (zmodyfikowany by pamiętał wierzchołek z którego weszliśmy)
- Usuwamy krawędź którą weszliśmy
- DFS z przejściowego do docelowego (acykliczność wymusza że nie będzie powtarzał się żaden wierzchołek)

## Algorytm 1

```py
Tin[] <- dana lista n-1 krawędzi (ojciec, syn)
T[] <- tablica list sasiedzwa

def dfs(int current, int target, int to_pass, bool visited):
    if current == target {
        if visited {
            return true;
        }
        return false;
    }
    if current == to_pass {
        visited = true
    }
    for edge in T[current]:
        res = dfs(edge, to_pass, visited)
        if res return true
    
    return false

dfs(root, target, to_pass, false)
```

## Algorytm 2, raczej lepszy

(Robimy słownik z entry / out)

```py
void DFS():  
    t = 0;  
    oznacz każdy jako nieodwiedzony;  
    visit(root);  

void visit(w, t):  
    oznacz jako odw;  
    entry_time = t;  
    Dla każdego v na L sąsiedztwa:  
        jeśli nie odw.  
            t++  
            visit(v, t);  
    leave_time = t;  

bool isOn():  
    if przejsciowy.entry < target.entry and przejsciowy.finish >= target.finish
        return true;  
    return false;  
```