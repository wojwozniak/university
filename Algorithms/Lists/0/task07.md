# Zadanie 7, Lista 0

Napisz algorytm, który dla drzewa `T = (V, E)` oraz listy par wierzchołków `{vi, ui} (i = 1, ..., m)`, sprawdza, czy `vi` leży na ścieżce z `ui` do `korzenia`. Przyjmij, że drzewo zadane jest jako lista n - 1 krawędzi (pi, ai), takich, że pi jest ojcem ai w drzewie.

## Definicja drzewa

Drzewo – graf nieskierowany, który jest acykliczny i spójny. 

## Algorytm

Przejscie inorder pamietajace czasy wejscia i wyjscia. Jedno przejscie DFS. Ładny rysunek do dowodu


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