# Zadanie 2 / Lista 1

Napisz algorytm, który dla danych k uporządkowanych niemalejąco list \(L_1, ..., Lk) liczb całkowitych, znajduje najmniejszą liczbę r, taką że w przedziale [a, a+r] znajduje się co najmniej jedna wartość z każdej z list L_i, dla pewnej liczby a.

### Wymagania
- Algorytm **nie może modyfikować** list
- Powinien być **pamięciowo oszczędny**.
- Powinien działać **jak najszybciej**.

## Pomysł

Na start `a = najmniejszy element wszystkich list`. Sprawdzamy wszystkie kombinacje aż wyczerpiemy którąś z list.

### Złożoność
O(n * k) -> k ilość list, n długość najdłuższej listy

```py
def findMinR(k, L1, L2, ..., Lk):
    p[1..k] = 0 # tablica wskaźników, zainicjalizowana na 0
    v[1..k] = L[1]...,L[k] # tablica wartości, v[i] = L_i[p_i]
    min_r = NUM_MAX

    while True: # wszystkie p[i] < długość L_i
        # Wyznaczamy r, jeśli możemy aktualizujemy na mniejsze
        m = min(v[1], v[2], ..., v[k])
        M = max(v[1], v[2], ..., v[k])
        r = M - m
        min_r = min(min_r, r)

        i = numery list z najmniejszym elementem
        p[i] += 1
        if Li[p[i]] exists:
            v[i] = Li[p[i]]
        else:
            # Nie przesuniemy już przedziału w górę bo dotarliśmy
            # do końca jakiejś listy
            # Nie poprawimy już więc wyniku, kóńczymy algorytm
            break
    
    return min_r
```