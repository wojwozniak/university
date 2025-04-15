# Zadanie 4 / Lista 3

Danych jest $n$ prostych $l_1, l_2, ..., l_n$ na płaszczyźnie (czyli $l_i = a_i x + b_i$), takich że żadne trzy proste nie przecinają się w jednym punkcie.  

Mówimy, że prosta $l_i$ jest **widoczna z punktu** $p$, jeśli istnieje punkt $q$ na prostej $l_i$, taki że odcinek $pq$ nie ma wspólnych punktów z żadną inną prostą $l_j$ (dla $j \ne i$), poza (być może) punktami $p$ i $q$.

Ułóż algorytm znajdujący wszystkie proste widoczne z punktu $(0, +∞)$.

## Idea


```py
L = # posortowana lista prostych, O(n*log(n)) na sortowanie
heap = []

for l in L:
    while stos.count > 1:
        if sprawdz_wypchniecie():
            heap.pop()
        else:
            break
    heap.add(L)

return L
```

gdzie sprawdź wypchnięcie to

```py
p12 = punkt przecięcia l1 i l2
p23 = -,,- l2, l3

x23 <= x12 -> l2 została zakryta przez l1 i l3
```

## Dowód

Musimy pokazać że sprawdzanie tylko sufiksów jest poprawne -> tzn. źle gdy jakaś po środku zostanie zakryta gdy skrajna prawa nie jest

Na to prosty rysunek