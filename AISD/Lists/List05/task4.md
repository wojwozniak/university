# Zadanie 4 / Lista 5

Ułóż algorytm rozwiązujący problem 3SUM w czasie $O(n^2)$.

## Pomysł O(n^2) z liniową pamięcią

Hashmapa i sprawdzanie kombinacji -> czy przeciwieństwo sumy dwóch liczby jest w tabeli jako trzecia liczba.

## Idea ze stałą pamięcią

Robimy jedną pętlę po tabeli.

Dwa pointery lecą od i do końca, zbliżając się do środka (w zależności czy suma jest za mała czy za duża -> `i` wyznacza trzeci nieruchomy pointer).

Sprawdzamy w ten sposób wszystkie możliwe kombinacje więc ofc że znajdziemy poprawny wynik.

### Złożoność czasowa powyższego podejścia

Dostajemy $O(nlogn)$ z sortowania. Zewnętrzna pętla daje $O(n)$ plus liniowa ilość operacji w środku -> $O(n^2)$

## Algorytm

```py
A.sort()

for i = 1,...,n:
    l = i + 1
    r = n

    while l < r:
        if A[i] + A[l] + A[r] == 0:
            return True
        
        if A[i] + A[l] + A[r] < 0:
            l += 1
        else
            r -= 1

return False
```