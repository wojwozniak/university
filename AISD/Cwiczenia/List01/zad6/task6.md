# Zadanie 6 / Lista 1

Dany jest niemalejący ciąg n liczb całkowitych dodatnich a1 ≤ a2 ≤ . . . ≤ an. Wolno nam modyfikować ten ciąg za pomocą następującej operacji: wybieramy dwa elementy ai, aj spełniające 2ai ≤ aj i wykreślamy je oba z ciągu. 

Ułóż algorytm obliczający, ile co najwyżej elementów możemy w ten sposób usunąć.

## Algorytm
```py
def eliminator(list):
    lptr = 0
    midpoint = len(list) // 2
    rptr = midpoint
    counter = 0
    while (lptr < midpoint and rptr < len(list)):
        if (2 * list[lptr] <= list[rptr]):
            counter += 2
            lptr += 1
        rptr += 1
    return counter
```
## Złożoności
Złożoność czasowa $O(n)$, pamięciowa $O(1)$

## Dowód poprawności
Czemu to działa, i nie musimy robić two-pointera po całej długości?

Załóżmy że optymalne rozwiązanie zawiera jakąś parę <a,b> spełniającą warunek której nasz algorytm nie usunął. Zdefiniujmy na potrzeby dowodu L = lewy ciąg i P = prawy ciąg i zauważmy, że ich długość różni się co najwyżej jednym elementem.

Rozpatrzmy przypadki:

   1) a i b są w L 
   2) a i b są w P
   3) a jest w L, b jest w P

<br>
  
1) Skoro b jest w L, to każda liczba w P jest >= b a więc >= 2a. Skoro tak, to a na pewno byłoby wykreślone.

2) Skoro b jest w P, to każda liczba w L mogłaby je wykreślić - zatem b na pewno byłoby wykreślone.

3) Jeśli na pewno od a w L jest więcej liczb niż na lewo od b w P, to a na pewno byłoby wykreślone. w.p.p. a lub b na pewno byłoby wykreślone.

No więc nigdy nie będzie takiej pary. Zatem nasz algorytm jest poprawny.