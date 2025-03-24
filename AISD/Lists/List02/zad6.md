# Zadanie 6 / Lista 2

Ułóż algorytm, który dla danego n-wierzchołkowego drzewa i liczby k, pokoloruje jak najwięcej wierzchołków tak, by na każdej ścieżce prostej było nie więcej niż k pokolorowanych wierzchołków.

## Idea

Lecimy od zewnątrz. Definiujemy "warstwy". Warstwa 1 to liście, warstwa 2 to liście powstałe po usunięciu warstwy 1, w.3 -> liśćie po usunięciu 1 i 2...

Malujemy wszystkie wierzchołki w warstwach `od 1 do k / 2`.

Drzewo więc ofc są liście, nie ma edge case'ów tego typu.

Zachłanny -> wierzchołki które leżą na najmniejszej ilości ścieżek są malowane jako pierwsze.

### Idea - dlaczego miałoby to działać?

Chcemy by na każdej ścieżce prostej było co najwyżej k pomalowanych wierzchołków i pomalować ich jak najwięcej. 

"Lubimy" więc, gdy malujemy wierzchołki znajdujące się na jak najmniejszej liczbie ścieżek -> są liśćmi lub ich przedłużeniami

```
    O

O   O    O

    O
```

Przykładowo w takiej sytuacji dla `k=2`, malując liście mamy 4 pomalowane wierzchołki, a jeśli pomalujemy środkowy to pomalujemy co najwyżej 2.

## Bardzo pseudokod

```
layer = 1
dopóki w grafie są wierzchołki && layer <= k/2
    pomaluj liście
    usuń liście z grafu pomocniczego
    layer++

jeśli k mod 2 == 1 pomaluj losowy niepomalowany
```


## Idea - dlaczego nie przekraczamy k?

Rozważamy najdłuższe możliwe ścieżki. Końcami każdymi ścieżkami będą wierzchołki z warstwy 1, dalej z warstwy 2, 3, 4...

W jaki sposób mogło by być więcej niż `k` pomalowanych wierzchołków na takiej ścieżce?

### W ścieżce graniczą ze sobą wierzchołki z tej samej warstwy, nie należąc do maksymalnej warstwy na tej ścieżce
Algorytm nie może pomalować w tej samej iteracji graniczących ze sobą wierzchołków nie należącej do maksymalnej warstwy. Maluje tylko liście -> jedyny edgecase gdzie pomaluje graniczące to gdy w grafie zostały dokładnie 2 wierzchołki (ale wtedy domyślnie są maksymalne)
### W ścieżce znajdują się dwa wierzchołki z tej samej warstwy oddzielone wierzchołkiem z niższej warstwy
Wierzchołek z niższej warstwy nie mógł być pomalowany w swojej iteracji mając dwóch jeszcze niepomalowanych sąsiadów, bo nie był liściem

W takim razie algorytm nie pomaluje za dużo.

Dla opcji nieparzystej domalowujemy 1 wierzchołek -> poprzedni krok da co najwyżej k-1 więc nie przekroczymy k.

## A czy nie za mało?

Weźmy OPT różny od naszego algorytmu.

Ponumerujmy wierzchołki w kolejności w jakiej je maluje algorytm.

Możemy przesunąć "pomalowanie" wierzchołka na niepomalowany z niższej warstwy (tylko jeszcze trzeba dopracować dlaczego tak jest)

## Pseudokod

```py
G # graf
nb_count = []<int> = {0} # tablica pomocnicza ile sąsiadów ma dany wierzchołek
colours = []<bool> # tablica czy_pomalowany?
leaves = nb_count.where(v => v == 1) # lista indeksów liści
layer = 1
while leaves and layer <= k / 2:
    for l in leaves:
        colours[l] = true
        for k in G[l]:
            nb_count[k] -= 1
        nb_count[l] -= 1
        drop l from leaves
    
    leaves = nb_count.where(v => v == 1)

if k % 2 == 1:
    for i in colours:
        if colours[i] == false:
            colours[i] = true
            break

return colours
```