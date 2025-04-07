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

## Lematy - lub obvious obserwacje
- SUMA DODATNICH PRZESUNIĘĆ JEST RÓWNA SUMIE UJEMNYCH PRZESUNIĘĆ
- Z permutacji domyślnej można swapami osiągnąć dowolną i na odwrót
- Swap zwiększa jednemu elementowi i zmiejsza drugiemu przesunięcie o tę samą wartość

## Rozwiązanie (O(n)!!! (i O(n) pamięć też))

- Zaczynamy od lewej strony. Lecimy po kolei. Pointer się nigdy nie cofa.
- Pierwszy element będzie albo na poprawnym miejscu, albo będzie chciał iść w prawo.
- Lecimy pointerem aż napotkamy pierwszy element który chce iść w lewo. 
- Na lewo od niego będzie element który będzie chciał się dostać na jego miejsce lub w prawo.

### I tu robimy swapa
- Zacznijmy od oznaczenia elementu który chce iść w lewo `b`, a element(y) w prawo `a1, a2, ..., an`
- Element chce pójść na miejsce elementu który chce pójść w prawo, i mamy tu trzy (a w algorytmie dwa) case'y:

#### Element a1 chce pójść na miejsce elementu b lub dalej w prawo
- No to chillera, robimy swapa a1 i b. Swap jest optymalny, jedną operacją conajmniej jeden element ląduje na swoim miejscu.

#### Element a1 nie chce pójść na lewo od b
- Wówczas jest inny element, a2, który chce pójść w prawo. Na razie na potrzeby prezentacji załóżmy że ten już pójdzie na prawo od b.
- Zeswapowanie a1 z b, a później a2 z b, da dobry wynik, ale żeby były optymalne to musimy swapować najpierw a2,b; a1,b
- Jak to ugogólnimy to dla więcej elementów będzie tak samo, najpierw `b` z `an`, później `b będący na miejscu an` z `an-1`.
- A jak to zaimplementujemy? Stos

## Algorytm
```
dopóki pointer != n:
    - znajdź element chcący iść w lewo, b
    - sprawdź wartość na miejscu docelowym a1, jeśli a1 >= b to swap, 
    w.p.p:
        - daj swap(indeks a1, indeks b) na stos i wykonaj porównanie dla (a2, b)...
        - w szczególności szukamy ciągu a1,a2,...,ak gdzie ak >= b. 
        - wrzucamy na stos po kolei swapy(a1, a2); (a2,a3); (a3,a4)...(ak-1, ak). Gdy dotrzemy do ak, wypisujemy swapy