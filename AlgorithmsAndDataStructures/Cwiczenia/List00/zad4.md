# Oszasuj sigme dla poniższego algorytmu
```
res ← 0
for i ← 1 to n do
j ← i
while (j jest parzyste) j ←j/2
res ← res + j
```

### Rozwiązanie

Liniowa ilość od pętli.

n + n/2 + n/4 + n/8 + .... 

2n-1

Nieparzyste i naprzyste raz

Ponadto n/4 z podzielnych przez 4
n/8 z tych przez 8
...