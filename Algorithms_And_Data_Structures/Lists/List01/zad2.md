# Zadanie 2 / Lista 1

Napisz algorytm, który dla danych k uporządkowanych niemalejąco list \(L_1, ..., Lk) liczb całkowitych, znajduje najmniejszą liczbę r, taką że w przedziale [a, a+r] znajduje się co najmniej jedna wartość z każdej z list L_i, dla pewnej liczby a.

### Wymagania
- Algorytm **nie może modyfikować** list
- Powinien być **pamięciowo oszczędny**.
- Powinien działać **jak najszybciej**.

## Pomysł

Na start `a = najmniejszy element wszystkich list`. Sprawdzamy po kolei wszystkie kombinacje aż wyczerpiemy którąś z list.

Korzystamy z min-heap, który dla każdego elementu oprócz wartości (po których jest posortowany) ma doczepioną informację z której jest listy i który miał indeks.

Będziemy z tym heapem:
- sprawdzali aktualne minimum (O(1))
- zamieniali aktualne minimum nową wartością (aktualizujac przy tym zmienną pomocniczą o której poniżej) (O(log_2(k)))

Przechowujemy też informację o największym elemencie w heapie w osobnej zmiennej. 

### Złożoność
- k to ilość list, n to długość najdłuższej listy
- O(k) by zapełnić startową listę
- Pętla wykona się co najwyżej n*k razy
- W każdej pętli aktualizacja minimum to log_2(k)
- Ostatecznie: O(n * k * log_2(k))

### Algorytm

```py
def findMinR(k, L1, L2, ..., Lk):
    H[] # min heap, zainicjalizowany do pierwszych elementów list (co zajmie O(n))
    min_r = NUM_MAX
    M # Aktualizujemy wkładając do heap

    while True: # koniec gdy wyczerpie się jakaś lista
        m, k, i = H.min()
        r = M - m
        min_r = min(min_r, r)

        new_val = H.min_update(k, i+1) # odp. lista, indeks + 1
        if new_val is null:
            break # wyczerpaliśmy listę, koniec algorytmu
        
        M = max(M, new_val)
    
    return min_r
```

### Dlaczego przerywamy gdy wyczerpie się tylko jedna lista?

Dolna granica już się nie przesunie w górę, górna może tylko rosnąć -> nie znajdziemy mniejszej wartości.