# Zadanie 7 / Lista 2

Niech T = (V,E) będzie drzewem, a P(u,v) niech oznacza ścieżkę w T (rozumianą jako zbiór krawędzi) łączącą wierzchołki u i v.
Ułóż algorytm, który dla drzewa T znajduje trzy wierzchołki a, b, c, dla których zbiór
{e ∈ E : e ∈ P(a,b) ∪ P(a,c) ∪ P(b,c)} jest maksymalnie duży.


## Rozwiązanie

T = (V,E) – drzewo, P(v,u) – ścieżka w T łącząca u i v.

Cel: dla T znajdziemy a,b,c – wierzchołki dla których maksymalnie duży jest maskymalnie duży.

### Obserwacje
- a,b - końce najdłuższej ścieżki w drzewie - napiszę dowód poniżej dlaczego musi tak być
- Optymalne c - koniec najdłuższej odnogi na tej ścieżce
- Odnogi będą wyglądały tak (lub krótsze) - w przeciwnym wypadku A-B nie było by najdłuższą ścieżką:
```
    A - 0 - 0 - 0 - 0 - 0 - 0 - 0 - B 
        |   |   |   |   |   |   | 
        0   0   0   0   0   0   0 
            |   |   |   |   | 
            0   0   0   0   0
                |   |   | 
                0   0   0
                    | 
                    0
```

### Idea algorytmu

1. Wyznaczamy najdłuższą ścieżkę w drzewie.
2. Wyznaczamy maksymalną długość odnogi na tej ścieżce. Zaczynamy od środka tej odnogi. (Jeśli długość parzysta to wyznaczamy w pierwszej iteracji while)
3. Algorytm leci od środka odnogi w lewo i w prawo, zwiększając odległość od środka o 1 w każdej iteracji.
4. Jeśli w którymś momencie znajdziemy:
    - perfekcyjną długość (jak w obserwacji)
    - dotrzemy do sytuacji gdzie maksymalna długość odnogi jest mniejsza niż aktualna maksymalna
    - -> to wtedy kończymy

### Algorytm
Spamujemy DFSem ignorującym krawędzie na najdłuższej ścieżce.
```py
max_path[] # wyznaczamy dfs najdłuższą ścieżkę
n = count(max_path)
A,B = max_path[0], max_path[n-1]
if (n % 2 == 1):
    max_depth_found = # głębokość największego wierzchołka (z odnogi ceiling(n-1/2))
    C = # wierzchołek o max_depth_found w tej odnodze

if (max_depth_found == ceiling(n-1/2)): # best case scenario
    return A,B,C

while(l != 0 and r != n-1): # (bo 0 i n-1 to A i B, nie mają odnóg)
    i = 0
    l = floor(n/2) - 1 - i
    r = floor(n/2) + i
    i += 1
    l_depth = # głębokość odnogi z wierzchołka l
    vl = # ostatni wierzchołek tej odnogi
    r_depth = # głębokość -,,- r
    vr = # ostatni -,,- r
    lr_depth = # max z l_depth i r_depth
    vlr = # wierzchołek o lr_depth w odpowiedniej odnodze
    curr_max_possible = ceiling(n-1/2) - i
    if (lr_depth == curr_max_possible): # perfekcyjna długość w tym kroku
        return A,B,vlr
    else if (lr_depth > max_depth_found): # zwykłe nadpisanie
        max_depth_found = lr_depth
        C = vlr
    if (max_depth_found == curr_max_possible): # nie poprawimy już wyniku
        return A,B,vlr
return A,B,C
```

### Dlaczego a,b to końce najdłuższej ścieżki?

Założmy nie wprost że OPT nie zawiera maksymalnej ścieżki między a,b.

```
        A        A'
        |        |
        c        a
        |        |
C - d - *' - f - *
        |        |
        e        b
        |        |
        B        B'
```
- OPT: c+d+e
- Najdłuższa ścieżka: a+b   (bez utraty ogólności a>=b)


#### Krok 1 - A' zastępuje A
- f + c <= b (bo nie byłaby najdłuższą ścieżką)
- d + e + c + f + f = OPT + 2f
- d + e + f + a >= d + e + f + b
- Mamy więc: d + e + f + a >= d + e + f + b

#### Krok 2 - B' zastępuje B
- f + e <= b
- Mamy więc: 
- d + b + f + a 
- >= d + f + b + b (podstawiąjąc za a b)
- >= d + 3f + e + c (za jedno b podstawiamy e + c, za drugie f+c)
- >= d + e + c
- = OPT

A więc rozwiązanie nie gorsze od OPT zawiera najdłuższą ścieżkę. 