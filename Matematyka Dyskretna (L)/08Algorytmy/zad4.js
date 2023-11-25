// Sprawdzenie izomorfizmu grafów G i H
// - n wierzchołków
// - grafy reprezentowane jako tablice list sąsiedztwa
// - Złożoność: O(m + n)

const czyRowne = (G, H) => {
    if (G.length !== H.length) return false; // Sprawdzamy czy warunek na pewno jest spełniony
    const n = G.length; // Liczba wierzchołków
    const odwiedzone = new Array(G.length).fill(false); // Tablica odwiedzonych wierzchołków
    let diff = 0; // Różnica między stopniami wierzchołków
    for (krawedz in G) {
        odwiedzone[krawedz] = true; // Oznaczamy wierzchołek jako odwiedzony
        ++diff;
    }
    for (krawedz in H) {
        if (!odwiedzone[krawedz]) return false; // Jeśli wierzchołek nie był odwiedzony, to grafy nie są izomorficzne
        --diff;
    }
    if (diff !== 0) return false; // Różna ilość krawędzi - grafy nie są izomorficzne
    return true;
}