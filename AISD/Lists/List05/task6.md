# Zadanie 6 / Lista 5

Rozważmy problem, polegający na sprawdzeniu, czy w zbiorze $n$ punktów leżących na płaszczyźnie znajdują się co najmniej 3 punkty współliniowe. Udowodnij, że problem ten nie jest prostszy niż problem 3SUM, a dokładniej, że istnienie algorytmu rozwiązującego ten problem w czasie $O(n^{2 - \varepsilon})$ implikuje istnienie algorytmu o złożoności $O(n^{2 - \varepsilon})$ dla problemu 3SUM.

## Idea i rozwiązanie

Robimy w liniowym czasie punkty $(x, x^3); (y, y^3); (z, z^3)...$ Sprawdzamy kolinearność tych punktów.

Fakt:

$\frac{b^3-a^3}{b-a} = \frac{b^3-c^3}{b-c}$ wtw. $a + b + c = 0$ (lub gdy $c = a$ ale załóżmy że są różne)

Czyli jeśli tak stworzone punkty są kolinearne to ich współrzedne xksowe są rozwiązaniem 3SUMa.

Jeśli istniałby taki lepszy algorytm to:
- Liniowo przetwarzamy liczby dane do 3SUMa tworząc punkty
- Odpalamy na nich algorytm 3LINEAR
- Jeśli jakieś są to zwracamy ich współrzędne xksowe jako rozwiązanie 3SUMa - uzyskane w tym lepszym czasie.