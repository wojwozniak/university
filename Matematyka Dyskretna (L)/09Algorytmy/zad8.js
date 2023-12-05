/**
 * Funkcja initializeArrays inicjalizuje tablice odwiedzonych wierzchołków oraz kolorów wierzchołków
 * @param {number} n - Liczba wierzchołków grafu 
 * @returns {Array[]} - Zwraca tablice odwiedzonych wierzchołków oraz tablice kolorów wierzchołków
 */
const initializeArrays = (n) => {
    const visited = new Array(n).fill(false);
    const color = new Array(n).fill(0);
    return [visited, color];
}

/**
 * Funkcja isBipartite sprawdza czy graf jest dwudzielny
 * @param {Array[]} graph - Graf w postaci tablicy list sąsiedztwa 
 * @param {number} v - Wierzchołek startowy - może być dowolny
 * @param {boolean[]} visited - Tablica odwiedzonych wierzchołków
 * @param {number[]} color - Tablica kolorów wierzchołków
 * @returns {boolean} - Zwraca true jeśli graf jest dwudzielny, false w przeciwnym wypadku
 */
const isBipartite = (graph, v, visited, color) => {
    visited[v] = true; // Oznaczamy wierzchołek jako odwiedzony
    // Przeglądamy wszystkie wierzchołki sąsiadujące z wierzchołkiem v
    for (const u of graph[v]) {
        // Jeśli wierzchołek nie był odwiedzony to go odwiedzamy i nadajemy mu przeciwny kolor
        // po czym wywołujemy rekurencyjnie funkcję isBipartite dla wierzchołka u (DFS)
        if (!visited[u]) {
            color[u] = !color[v];
            if (!isBipartite(graph, u, visited, color)) {
                return false;
            }
        // Jeśli wierzchołek był odwiedzony to sprawdzamy czy ma przeciwny kolor
        // Jeśli nie ma to zwracamy false
        } else if (color[u] === color[v]) {
            return false;
        }
    }
    return true;
}

// Test 1
const graph1 = [[1, 2], [0, 2], [0, 1]];
const n1 = graph1.length;
const [visited1, color1] = initializeArrays(n1);
console.log(isBipartite(graph1, 0, visited1, color1));

// Test 2
const graph2 = [[1, 3], [0, 2], [1, 3], [0, 2]];
const n2 = graph2.length;
const [visited2, color2] = initializeArrays(n2);
console.log(isBipartite(graph2, 0, visited2, color2));

