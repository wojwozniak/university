## Zadanie 2, Lista 0

### Określ z dokładnością do Theta złożoność (przy kryterium jednorodnym poniższych fragmentów programów):

#### a)
```
for i <- 1 to n do
    j <- i
    while j < n do
        sum <- P(i, j)
        j <- j + 1
```

- Zewnętrzna pętla wykonuje się n razy
- Wewnętrzna pętla wykonuje się n-1; n-2; n-3... 0 razy

- Całkowita liczba iteracji: (n-1)+(n-2)+(n-3)+...+1+0

- Jest to suma ciągu arytmetycznego

- ((n-1) + 0) / 2 * n = n^2 - n / 2

Odp: $n^2$

#### b)
```
for i <- 1 to n do
    j <- i
    while j < n do
        sum <- P(i, j)
        j <- j + j
```

Algorytm podobny do pierwszego, przy czym tutaj j *= 2 co rundę