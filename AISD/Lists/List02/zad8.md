## Zadanie 8 / Lista 2

Operacja swap(i,j) na permutacji powoduje przestawienie elementów znajdujących się na pozycjach i oraz j. Koszt takiej operacji określamy na |i − j|. 

Kosztem ciągu operacji swap jest suma kosztów poszczególnych operacji.

Ułóż algorytm, który dla danych π oraz σ - permutacji liczb {1,2,...,n}, znajdzie ciąg operacji swap o najmniejszym koszcie, który przekształca permutację π w permutację σ.

## Idea

Zacznijmy od tego, jak będziemy zapisywać te permutacje. Domyślnie robilibyśmy np.

```
1 2 3 4 5 6 7 8 9
4 2 1 3 5 6 9 7 8
```
Ale jest to niewygodnie. Zamiast tego zapiszmy to o wartości przesunięć:

```
1   2   3   4   5   6   7   8   9
+3  0  -2  -1   0   0  +2  -1  -1 
``` 

Przy czym nie musimy tego "zapisywać". My o tym tak myślimy ale poprzez value - index to osiągamy bez dodatkowej struktury w pamięci.

## Obserwacje

Zauważmy, że optymalne swapy to swapy takie, że:
- obydwa elementy lądują na docelowych miejscach
- jeden element ląduje na swoim miejscu, a drugi przesuwa w odpowiednią stronę (nie za daleko)
- W obydwu przypadkach kosztem |i-j| zmiejszamy sumaryczną odległość elementów od swoich miejsc o 2|i-j|.
- Lepiej się nie da, nie generuje to dodatkowych potrzebnych operacji, nie ma "mniejszej" operacji która by coś lepiej zrobiła.

## Lematy
### SUMA DODATNICH PRZESUNIĘĆ JEST RÓWNA SUMIE UJEMNYCH PRZESUNIĘĆ
- Z permutacji domyślnej można swapami osiągnąć dowolną. 
- Swap zwiększa jednemu elementowi i zmiejsza drugiemu przesunięcie o tę samą wartość.

### FLIPY ZNAKÓW
- Unikamy ich wydając zmienną do końca.