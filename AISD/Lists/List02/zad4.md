# Zadanie 4 / Lista 2

Ułóż algorytm, który dla danego n-wierzchołkowego drzewa i liczby k, pokoloruje jak najwięcej wierzchołków tak, by na każdej ścieżce prostej było nie więcej niż k pokolorowanych wierzchołków.

## Idea

Lecimy od zewnątrz. Definiujemy "warstwy". Warstwa 1 to liście, warstwa 2 to liście powstałe po usunięciu warstwy 1, w.3 -> liśćie po usunięciu 1 i 2...

Malujemy wszystkie wierzchołki w warstwach `od 1 do k / 2`.

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