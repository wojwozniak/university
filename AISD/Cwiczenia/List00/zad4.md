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
Czyli $O(n * log_2(n))$.

I to chyba tyle?