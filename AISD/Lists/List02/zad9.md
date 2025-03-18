# Zadanie 9 / Lista 2

Na wykładzie przedstawiono zachłanny algorytm dla problemu pokrycia zbioru, znajdujący rozwiązania, 
które są co najwyżej log n razy gorsze od rozwiązania optymalnego. 
Pokaż, że istnieją dane, dla których rozwiązania znajdowane przez ten algorytm są blisko log n razy gorsze od rozwiązań optymalnych.

### Fakt z notatki

Dla każdego i

cena(ei) <= OPT / (n - i + 1)

## Rozwiązanie

Weźmy:

U = {{1,2,3,4, ..., n}}

S = {{1,2,3,4, ..., n}, {1}, {2}, {3}, ..., {n}}

Koszty = {n + C, n/n, n/(n-1), n}, gdzie C to jakaś mała stała

Idąc algorytmem weźmiemy po kolei każdy pojedyńczy zbiór

(W pierwszym kroku koszt dużego zbioru to n+C/n > n/n, i w każdym kolejnym to będzie tak działało)

### Używamy faktu

(sumy od 1 do n)

- suma cena(ei) <= 
- suma OPT / (n - i + 1) =
- OPT suma 1 / (n - i + 1) =   # tu reordering
- OPT suma 1/i

suma 1/i to około całka 1/x na tym samym przedziale

oznacza to że OPT suma 1/i to około OPT * log(n) co mieliśmy pokazać.