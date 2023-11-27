// Sprawdzenie izomorfizmu grafów G i H
// - n wierzchołków
// - grafy reprezentowane jako tablice list sąsiedztwa
// - Złożoność: O(m + n)

const czyRowne = (G, H) => {
    if (G.length !== H.length) return false; // Sprawdzamy czy warunek na pewno jest spełniony
    const n = G.length; // Liczba wierzchołków
    
    for(let i=0; i<n; ++i) {
        let visited = new Array(n).fill(false); // Tablica odwiedzonych wierzchołków
        let node_diff = 0; // Różnica wierzchołków
        for(vertex in G[i]) {
            visited[vertex] = true; // Oznaczamy wierzchołek jako odwiedzony
            ++node_diff; // Zwiększamy różnicę wierzchołków
        }
        for(vertex in H[i]) {
            if(visited[vertex]) --node_diff; // Jeśli wierzchołek jest odwiedzony to zmniejszamy różnicę
            else return false; // W przeciwnym wypadku zwracamy false
        }
        if(node_diff !== 0) return false; // Jeśli różnica wierzchołków jest różna od 0 to zwracamy false
    }
    return true; // Zwracamy true jeśli wszystkie warunki są spełnione
}


const G = [
    [1, 2],
    [0, 2],
    [0, 1]
];
const H = [
    [1, 2],
    [0, 2],
    [0, 1]
];
const wierzcholki = [0, 1, 2];
console.log(czyRowne(G, H, wierzcholki)); // true


const G2 = [
    [1, 2],
    [0, 2],
    [0, 1]
];
const H2 = [
    [1, 2],
    [0, 2],
    [0, 1, 2]
];
const wierzcholki2 = [0, 1, 2];

console.log(czyRowne(G2, H2, wierzcholki2)); // false