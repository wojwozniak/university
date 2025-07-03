# Zadanie 10 / Lista 0

Czy algorytm Dijkstry może być zmodyfikowany tak, by rozwiązywać problem najkrótszych dróg w grafach nieskierowanych, w których wagi przypisane są wierzchołkom, a nie krawędziom? Długością drogi w takim grafie jest suma wag wierzchołków, przez które wiedzie.

## Oryginalny Dijkstra

1. Tworzymy set wszystkich nieodwiedzonych nodeów
2. Inicjalizacja odległości do każdego wierzchołka do nieskończoności (start = 0)
3. Z nieodwiedzonych wybieramy ten z najmniejszym kosztem (start = 0) (jeśli szukamy tylko targetu, to jeśli dotrzemy do targetu to instant end)
4. Dla aktualnego node'a, sprawdź sąsiadów i zaaktualizuj ich odległości (porównaj ich aktualną wartość z wartością aktualnego + kosztem krawędzi ich łączącej)
5. Po sprawdzeniu wszystkich krawędzi, usuń z unvisited set
6. Po skończeniu pętli 3-5 mamy wynik 

## Przerobiony Dijkstra

1. Tworzymy set wszystkich nieodwiedzonych nodeów
2. Inicjalizacja odległości do każdego wierzchołka do nieskończoności
3. Mamy też tablicę wag wierzchołków
4. Bierzemy startowy (waga 0)
5. Dla aktualnego node'a, sprawdź sąsiadów i zaaktualizuj ich odległości (porównaj ich aktualną wartość distance z wartością aktualnego + kosztem wierzchołka docelowego)
6. Po sprawdzeniu wszystkich krawędzi, usuń z unvisited set
7. Po skończeniu pętli 4-6 mamy wynik 

## Rożnica:

Dla krawędzi (u, v):
- orginalny: $d(v) = min(d(v), d(u) + w(u,v))$
- przerobiony: $d(v) = min(d(v), d(u) + w(v))$
