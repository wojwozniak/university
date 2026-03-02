# Zadanie 4 / Lista 1

Nadsłowem zbioru słów (w_1, w_2, ..., w_k) nazywamy dowolne słowo W, takie że  
forall i=1,...,k w_i jest podsłowem słowa W.

Należy ułożyć algorytm, który dla zbioru słów dwuliterowych (tj. takich, że forall i=1,...,k |w_i| = 2) znajduje (jakieś) najkrótsze jego nadsłowo.

## Algorytm
1. Tworzymy graf (słowo ab tworzy krawędź A->B)
2. Dla każdej spójnej składowej wyznaczamy ścieżkę Eulera:
    - Jeśli ilość wierzchołków ze stopniem nieparzystym jest > 2 lub 1, dodajemy do nich krawędzie powrotne
    - -,,- =2, zaczynamy od dowolnego z wyjściowym >0
    - dla =0 wyznaczamy cykl Eulera
3. Sklejamy wyniki dla spójnych składowych