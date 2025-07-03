# Zadanie 2 / Lista 2
Mamy n odcinków Ij = [pj, kj], leżących na osi OX, gdzie j = 1, ..., n. 
Podaj algorytm znajdujący zbiór S ⊆ {I1, ..., In} nieprzecinających się odcinków 
o największej mocy.

## Idea

Sortujemy odcinki rosnąco po kj. Dodajemy greedy gdy tylko możemy kolejne odcinki.
(A możemy gdy poprzedni się już skończył)

## Dowód że to będzie działało

Algorytm wyprodukował zbiór X. Załóżmy że istnieje lepszy zbiór Y. Weźmy pierwszą
parę odcinków która się różni między zbiorami. Istnieją 3 opcje:
- `y` kończy się przed `x` - wtedy nasz algorytm wybrałby ten odcinek - sprzeczność
- `y` kończy się w tym samym miejscu co `x` - Y jest więc tak samo dobry, sprzeczność
- `y` kończy się po `x` - wówczas Y jest co najwyżej tak samo dobre 
(wybiera resztę odcinków z tego samego lub mniejszego zbioru) - Y nie jest lepsze od X, sprzeczność

## Kod

```py

odcinki = [] # dana posortowana po kj tablica
S = []
prev_end = -inf
for odc in odcinki:
    if odc.start > prev_end:
        S += odc
        prev_end = odc.end

return S
```
