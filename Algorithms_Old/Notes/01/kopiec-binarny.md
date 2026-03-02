# Kopiec binarny
## Po co?
- Heapsort, prawie tak szybki jak quicksort (też $O(nlogn)$, gorszy average case, lepszy worst case)
- Kolejka priorytetowa
## Definicja
- Drzewo które powstaje z drzewa 1-wierzchołkowego z krawędziami dodawanymi od lewej do prawej strony (1)
- Wartość w każdym wierzchołku większa lub równa wartości jego ojca (2)
```
        3
      /   \
     6     7
    / \   /  \
   6  16 20   8
  / \
 7  20
```
## Przechowywanie w pamięci
Można przechowywać go wygodnie w tablicy, gdzie dajemy go krok po kroku poziomami
```
Powyższe drzewo staje się tablicą
3 6 7 6 16 20 8 7 20
zauważamy że ojcem i-tego elementu jest i / 2
synowie elementu (jeśli istnieją) to 2i oraz 2i + 1
wierzchołki i-tego poziomu są od K[2^k] do K[2^k+1 - 1]
```
## Operacje
- Wstawienie do kopca
- Sprawdź minimum
- Usunięcie minimum


By móc wstawiać / usuwać elementy musimy upewnić się że zachowany jest warunek (2). By wykonywać prosto / poprawnie operacje, definiujemy procedury:

## Procedury
### Zmień element
```py
def zmień_element(K[1..n], i, u):
    x <- K[i] # Zapisujemy starą wartość
    K[i] <- u # Nadpisujemy wartość w danym miejscu
    if u < x: # Wywołujemy przesuwanie (by w razie czego naprawić porządek)
        przesuń_niżej(K, i)
    else:
        przesuń_wyżej(K, i)
```
### Przesuń niżej
```py
def przesuń_niżej(K, i, n):
    k = i
    while True:
        j = k  # Zapamiętujemy bieżący indeks
        lewy = 2 * j
        prawy = 2 * j + 1

        # Sprawdzamy, czy lewe dziecko istnieje i jest mniejsze
        if lewy <= n and K[lewy] < K[k]:
            k = lewy

        # Sprawdzamy, czy prawe dziecko istnieje i jest jeszcze mniejsze
        if prawy <= n and K[prawy] < K[k]:
            k = prawy

        # Jeśli `k` się nie zmieniło, to własność kopca jest zachowana
        if k == j:
            break

        # Zamieniamy węzeł z mniejszym dzieckiem
        K[j], K[k] = K[k], K[j]

```

### Przesuń wyżej
```py
def przesuń_wyżej(K, i):
    k = i
    while k > 1:
        rodzic = k // 2
        if K[k] < K[rodzic]:  # Dziecko jest mniejsze niż rodzic
            K[k], K[rodzic] = K[rodzic], K[k]
            k = rodzic  # Przesuwamy się w górę
        else:
            break  # Jeśli rodzic jest mniejszy, kończymy
```



### Buduj kopiec
Najprostszy pomysł to
```py
def wolna_budowa_kopca(K[1..n]):
    for i <- 2 to n przesuń_wyżej (K, i)
```
czyli budowa kopca od góry. Działa ona w czasie $O(n*log(n))$. Możemy jednak zrobić to szybciej:

```py
def buduj_kopiec(K[1..n]):
    for i <- n // 2 to 1 przesuń_niżej (K, i)
```
w ten sposób tworzymy najpierw kopce jednoelementowe, później trójelementowe, siedmioelementowe...

Procedura ta działa w czasie $O(n)$ (jedna operacja dla n/2, dwie dla n/4, ... co sumuje się do n)

## Zastosowania kopców
### Heapsort

```py
def heapsort(K):
    n = len(K) - 1 

    # Budujemy kopiec
    buduj_kopiec(K, n)

    # Sortowanie właściwe
    for i in range(n, 1, -1):
        K[1], K[i] = K[i], K[1]  # Zamieniamy korzeń (najmniejszy element) z ostatnim
        przesuń_niżej_min(K, 1, i - 1)  # Naprawiamy kopiec na zmniejszonym zakresie

    return K[1:]  # Pomijamy K[0], jeśli indeksowanie od 1
```