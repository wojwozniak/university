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

## Obserwacje

Zauważmy, że optymalne swapy to swapy takie, że:
- obydwa elementy lądują na docelowych miejscach
- jeden element ląduje na swoim miejscu, a drugi przesuwa w odpowiednią stronę (nie za daleko)
- W obydwu przypadkach kosztem |i-j| zmiejszamy sumaryczną odległość elementów od swoich miejsc o 2|i-j|.
- Lepiej się nie da, nie generuje to dodatkowych potrzebnych operacji, nie ma "mniejszej" operacji która by coś lepiej zrobiła.

## Lematy
### SUMA DODATNICH PRZESUNIĘĆ JEST RÓWNA SUMIE UJEMNYCH PRZESUNIĘĆ
Robią się pętle (permutacje rozłączne?)

### FLIPY ZNAKÓW
Mogą się wydarzyć, lekko upierdliwe bo przez to nie liniowo tylko O(n log n)

## Pomysł

1. Robimy dwie kolejki, jedną dla elementów chcących pójść w lewo, drugą w prawo
2. W kolejkach są pary (indeks, przesunięcie)
3. Posortowane są indeksami!!!
4. Robimy swapa pierwszych elementów - JEST ON OPTYMALNY - LEMAT
5. Usuwamy osiągnięte 0, w.p.p. aktualizujemy wartość (nie będzie przerzucania między kolejkami)
6. Robimy dopóki nie osiągniemy permutacji docelowej - kolejki się nie skończą bo robimy optymalne swapy


Algorytm jest optymalny -> korzysta tylko z operacji o najniższym możliwym koszcie


## Przykład
Rozważmy na przykładzie powyżej:

```
1   2   3   4   5   6   7   8   9
+3  0  -2  -1   0   0  +2  -1  -1 
``` 

Pierwszy swap to swap(1,3). Otrzymujemy:
```
1   2   3    4   5   6   7   8   9
0   0   +1  -1   0   0  +2  -1  -1
```

