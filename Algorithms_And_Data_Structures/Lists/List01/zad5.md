# Zadanie 5 / Lista 1

Ułóż algorytm, który dla zadanego acyklicznego grafu
skierowanego G znajduje długość najdłuższej drogi w G. 
Następnie zmodyfikuj swój algorytm tak, by wypisywał drogę 
o największej długości (jeśli jest kilka takich dróg, to 
Twój algorytm powinien wypisać dowolną z nich).

## Algorytm bez odtwarzania ścieżki
Wejście: Graf G = (V, E)

Wyjście: Długość najdłuższej drogi w G

1. Wykonaj sortowanie topologiczne wierzchołków grafu G, uzyskując uporządkowaną listę L.
2. Dla każdego wierzchołka v w V zainicjuj:
    - dp[v] = 0 (długość najdłuższej drogi kończącej się w v)
3. Dla każdego wierzchołka v w kolejności z listy L (od początku):
    - Dla każdej krawędzi (v, u) wychodzącej z v:
        - Zaktualizuj dp[u] = max(dp[u], dp[v] + 1)
4. Zwróć max(dp[v]) dla wszystkich v w V jako długość najdłuższej drogi.

## Algorytm

Wejście: Graf G = (V, E)

Wyjście: Długość najdłuższej drogi w G, ścieżka

1. Wykonaj sortowanie topologiczne wierzchołków grafu G, uzyskując uporządkowaną listę L.
2. Dla każdego wierzchołka v w V zainicjuj:
    - dp[v] = 0 (długość najdłuższej drogi kończącej się w v)
    - <b>prev[v] = None (poprzednik)</b>
3. Dla każdego wierzchołka v w kolejności z listy L (od początku):
    - Dla każdej krawędzi (v, u) wychodzącej z v:
        - Zaktualizuj dp[u] = max(dp[u], dp[v] + 1)
        - <b>Zaaktulizuj odpowiednio poprzednika</b>
4. Znajdź max(dp[v]) dla wszystkich v w V jako długość najdłuższej drogi.
5. <b>Odtwórz ścieżkę:
    - Ścieżka = pustą lista
    - current = end
    - Dopóki current != None:
        - Dodaj current na początek ścieżki
        - current = prev[current]
6. Zwróć dp[end] (długość) oraz Ścieżkę.</b>