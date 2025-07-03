# Zadanie 1 / Lista 6

Podaj nierekurencyjną wersję procedury Quicksort, która:

- działa w miejscu, tj. poza tablicą z danymi (`int A[n]`) używa tylko stałej (niezależnej od `n`) liczby komórek typu `int` (zakładamy, że `max(n, max{A[i] | i = 1,..,n})` jest największą liczbą, jaką może pomieścić taka komórka),
- czas jej działania jest co najwyżej o stały czynnik gorszy od czasu działania wersji rekurencyjnej.

## Idea

Mamy trzy pomocnicze funkcje:
- `find_index_of_max_value()` która zwraca indeks maksymalnego elementu w tablicy na przedziale
- `partition()` to zaimplementowana w dowolny sposób partycja (zwracająca indeks pivota)
- `sort_basic()` jak sama nazwa mówi to prosty sort dla krótkiego ciągu

I potrzebujemy ogarnąć trzy kwestie:
- Sortowanie małego przedziału
- Recovery długości następnego przedziału
- Jakieś oznaczenie tej długości by dało się ją odzyskać
A wszystko to w stałej pamięci.

### Idea - partycja i oznaczanie przedziałów
- Robimy partycję
- Znajdujemy maksimum prawego przedziału i swapujemy go z pivotem - max na pierwszym miejscu
- Zajmujemy się lewym przedziałem, recovery wykorzysta ustawienie maxa by odzyskać prawy
### Idea - sortowanie i recovery przedziałów
- Każdy przedział (poza skrajnym lewym) będzie miał swoje maksimum na pierwszym miejscu
- Sortujemy skrajnie lewy przedział
- Idziemy pointerami, lewy na to maksimum
- Dotarcie prawym do większego elementu od tego maksimum oznacza wejście w kolejny przedział
- A skoro tak to cofamy się o 1 i l,p wyznacza nam długość tego przedziału

## Rozwiązanie

```py
def quicksort(A, n):
    l = 0
    p = n-1
    while True:
        if p - l < 3:
            sort_basic(A, l, p) # Basic sortowanie krótkiego przedziału
            l = p + 1
            p = p + 2

            # Poprzednie basic sortowanie było ostatnim - koniec algorytmu
            if l >= n-1:
                break

            # Recovery końca przedziału (element na lewo od większego niż nasze maksimum)
            while p <= n-1 and A[p] <= A[l]:
                p += 1
            p -= 1
        else:
            # Partycja
            s = partition(A, l, p)

            # Jeśli partycja nie podzieliła -> próbujemy na mniejszej tablicy
            if s == n-1: 
                p -= 1
                continue

            # Oznaczenie początku przedziału jego maksimum - swap z pivotem
            m = find_index_of_max_value(A,s+1,p)
            A[m], A[s] = A[s], A[m]
            p = s - 1
```