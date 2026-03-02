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

- dla j suma od i=1 do n (suma od j=i do n-1 * j) = (n^2/2 - i^2/2) * n = theta (n^3)

Odp: $n^2$

#### b)
```
for i <- 1 to n do
    j <- i
    while j < n do
        sum <- P(i, j)
        j <- j + j
```

Logarytmicznie leci

suma od i do n (log(n/i)) = suma od i do n (logn - logi) = nlogn - log(n!)

Jest wzorek log(n!) ~= nlogn - n -> Theta(n)

- dla j:
i * (1 + 2 + 4 + ... + 2^k) ~= i * 2 * 2^k ~= 2n

ciąg geometryczny, wyraz rzędu n

n razy z powyżej

Theta(n^2)