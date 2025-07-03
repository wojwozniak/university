# Zadanie 7 / Lista 4

Odcinek długości n chcemy przeciąć w m punktach oddalonych od początku o a₁, a₂, ..., aₘ.
Za przecięcie odcinka o długości k płacimy k jednostek.
Ułóż algorytm wyznaczający minimalny sumaryczny koszt wykonania wszystkich cięć.

## Idea

Potrzebujemy stworzyć tabelę DP, w której elementy będą reprezentować koszt dalszych przecięć odcinków wyznaczonych przez punkty (z_kolumny, z_wiersza). 

Wiersze od 0, a_1 do a_n, A kolumny od a_1 do a_n, n. -> Bo mamy też odcinki od 0 do a_1 i od a_n do n.

Zauważmy że będzie to macierz górno/dolno-trójkątna (ja wybieram opcję z górnotrójkątną) (tzn. lustrzane odbicie, nie liczymy dwa razy). 

Na przekątnej będą odcinki których nie da się już pociąć - cena 0.

Dla każdego elementu tabeli mamy koszt przecięcia tego elementu i koszty kolejnych przecięć - matchujemy by znaleźć najniższy możliwy.

### Przykład

Tabelka DP dla cięcia prostej 0 - 8 w punktach 1, 2, 3, 4.

| **\*** | **1** | **2** | **3** | **4** | **8** |
| ------ | ----- | ----- | ----- | ----- | ----- |
| **0**  | 0     | 2     | 5     | `8`   | 16    |
| **1**  |       | 0     | 2     | 5     | 12    |
| **2**  |       |       | 0     | 2     | 8     |
| **3**  |       |       |       | 0     | 5     |
| **4**  |       |       |       |       | 0     |

Oznaczyłem koszt dla `od 0 do 4`. Jest to 8:
- `4` kosztuje przecięcie odcinka długości 4
- `2+2` z najtańszego podprzecięcia - od 0 do 2, i od 2 do 4.

Uzupełniamy lecąc od głównej przekątnej przekątnymi, uzyskując wyniki dla coraz dłuższych elementów.

### Wzór ogólny i ogólna tabela:

| **\***  | **a1** | **a2** | **a3** | **...** | **n** |
| ------- | ------ | ------ | ------ | ------- | ----- |
| **0**   | 0      | a      | b      | ...     | x1    |
| **a1**  |        | 0      | c      | ...     | x2    |
| **a2**  |        |        | 0      | ...     | x3    |
| **...** |        |        |        | ...     | ..    |
| **an**  |        |        |        |         | xn    |

$T[i][j] = min(T[i][k] + T[k][j]) + Cost(j-i)$

gdzie $k \in [i, j]$

### Złożość algorytmu

$O(n^3)$ - wyprowadzone na wykładzie w przypadku mnożenia macierzy, my tu mamy podobnie -> Byłoby n^2 ale matching też jest liniowy.