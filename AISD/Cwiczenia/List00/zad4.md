# Oszasuj big O dla poniższego algorytmu
```
res ← 0
for i ← 1 to n do
j ← i
while (j jest parzyste) j ←j/2
res ← res + j
```

### Rozwiązanie

Liniowa ilość od pętli.
W pętli w najgorszym przypadku wykonamy logarytmiczną_2 ilość operacji.

$Omega(n * log_2(n))$.


Ale to nie do konca prawda


Mamy n/2 + 2 * n/2 + 3 * n/4 + 4 * n/8 + ... + n * 1/n i mamy liniową ilość operacji.