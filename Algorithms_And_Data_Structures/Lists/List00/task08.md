# Zadanie 8, Lista 0

Udowodnij twierdzenie:

<b>Procedura `buduj−kopiec` tworzy kopiec w czasie `O(n)`.</b>
```
procedure buduj-kopiec (K[1..n])
    for i ←(n div 2) downto 1 przesuń-niżej (K, i)
```
gdzie `przesuń-niżej` to:

```
procedure przesuń-niżej (K[1..n], i)
    k ← i
    repeat
        j ← k
        if 2j <= n and K[2j] > K[k] then k ←2j
        if 2j < n and K[2j + 1] > K[k] then k ←2j + 1
        K[j] ↔ K[k]
    until j = k
```

## Rozwiązanie

Mówiliśmy o tym na wykładzie - opowiedzmy o tym jeszcze raz i rozpiszmy wzór

### Opis

`buduj-kopiec` korzysta z `przesuń-niżej`. Zauważmy że:
- dla n/2 elementów przesuń-niżej wykona 0 iteracji (nie wywołujemy)
- dla n/4 elementów wykona 1 iterację
- dla n/8 elementów wykona 2 iteracje
- ...
- dla 1 elementu wykona $log_2(n)$ iteracji

gdzie każda iteracja przesuń-niżej wykonuje się w O(1)

### Wzór

1/2 * suma od 1 do $log_2(n)$ z $n/2^n$

suma od 1 do nieskonczonosci

$n/2^n =$

$1/2^1 + 2/2^2 + 2/2^3 + ...=$

$1/2^1 + 1/2^2 + 1/2^2 + 1/2^3 + 2/2^3 + 1/2^4 + 3/2^4 + ...=$

$(1/2^1 + 1/2^2 + 1/2^3 + ...) + 1/2(1/2^1 + 2/2^2 + 3/2^3 + ...)=$

$(1/2)/(1-1/2) + 1/2S = S$

$1 = 1/2S$

$S = 2$

$* 1/2 = 1$