# Zadanie 3 / Lista 1

Porządkiem topologicznym wierzchołków acyklicznego digrafu G = (V, E) nazywamy taki liniowy porządek jego wierzchołków, w którym początek każdej krawędzi występuje przed jej
końcem. Jeśli wierzchołki z V utożsamimy z początkowymi liczbami naturalnymi to każdy ich
porządek liniowy można opisać permutacją liczb 1, 2, , ..., |V| 

W szczególności pozwala to na porównywanie leksykograficzne porządków.
Ułóż algorytm, który dla danego acyklicznego digrafu znajduje pierwszy leksykograficznie porządek topologiczny.

## Przykład sortowań
![Przykład](img3.png)

## Algorytm (był na mdlu XD)

```typescript
/**
 * Sortowanie topologiczne w złożoności czasowej O(V + E)
 * @param {[][]} graph - graf w postaci list sąsiedztwa
 * @param {[]} zerolist - lista wierzchołków o stopniu wejściowym równym 0
 * @returns {[]} - posortowana topologicznie kolejność wierzchołków
 * lub null jeśli graf zawiera cykl (ale z założenia zadania nie zawiera)
 */
const topoSort = (graph, zerolist) => {
    const R = []; // Lista wynikowa
    const Q = [...zerolist]; // Kopia kolejki

    // Dopóki kolejka nie jest pusta
    while (Q.length > 0) {
        const v = Q.shift(); // Usuń pierwszy element z kolejki i dodaj do listy wynikowej
        R.push(v);

        // Dla każdego sąsiada wierzchołka v (krawędź v -> u)
        for (const u of graph[v]) {
            // Usuń krawędź v -> u
            graph[v] = graph[v].filter(x => x !== u);

            // Jeśli u po usunięciu krawędzi v -> u nie ma już żadnych krawędzi wchodzących
            if (graph.every(x => !x.includes(u))) {
                Q.push(u); // Dodaj u do kolejki
            }
        }
    }

    if(graph.some(x => x.length > 0)) return null; // Jeśli graf zawiera cykl, zwróć null
    return R;
}
```