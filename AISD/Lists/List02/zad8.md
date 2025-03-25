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


## DA SIĘ JESZCZE LEPIEJ

Robimy pointery:
- curr_ptr -> aktualna pozycja elementu który wydajemy
- curr_val -> wartość do wydania
- return_ptr -> jeśli mijamy inny dodatni po raz pierwszy to aktualizujemy - można bez niego dla czytelności
- check_ptr -> wartość którą aktualnie sprawdzamy

- przesuwamy curr_ptr od 0 w prawo do pierwszej dodatniej
- idziemy dalej w prawo szukając ujemnej, zaznaczając pierwszą dodatnią po drodze jako return_ptr
- gdy znajdziemy ujemną to swap(curr_ptr, check_ptr). 
- Jeśli wydaliśmy curr_val to:
  - curr_ptr = return_ptr (jeśli istnieje)
  - curr_val = return_ptr value
  - check_ptr bez zmian
  - lecimy dalej z wydawaniem (od return_ptr)
- Jeśli nie to:
  - curr_ptr bez zmian
  - curr_val = curr_val - check_val
  - check_ptr = check_ptr + 1
  - lecimy dalej z wydawaniem (szukając nowej ujemnej)

- NIGDY NIE COFA SIĘ POINTER
- W KAŻDYM KROKU MIN 1 POINTER IDZIE O MIN 1 W PRAWO
- OPERACJE WEWNĄTRZ PĘTLI SĄ STAŁE

## ZŁOŻONOŚĆ

- czasowo: O(n) - jedno przejście po liniowej strukturze
- pamięciowo: O(1) - stała pamięć przy założeniu że wypisujemy output od razu