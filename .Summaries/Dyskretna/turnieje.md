# Grafy turniejowe

## Czym jest turniej?

Graf skierowany, gdzie każdy wierzchołek ma dokładnie jedną krawędź z każdym innym wierzchołkiem.

## Czym jest król?

Wierzchołek z którego można dotrzeć do każdej krawędzi w maksymalnie dwóch krokach.

## Czym jest turniej dwudzielny?

Mamy dwa zbiory wierzchołków, A i B. Istnieją krawędzie skierowane między każdym elementem z A z każdym z B. (I zero krawędzi wewnątrz zbiorów).

# Dowody

## 1. Każdy turniej ma króla

### Jeśli w turnieju jest nadajnik (tylko krawędzie wychodzące)

Oczywiście nadajnik jest królem, dochodzi do każdego wierzchołka w trzech krokach.

### W przeciwnym wypadku (brak nadajnika)

Weźmy wierzchołek z największą ilością krawędzi wychodzących. Oznaczmy go jako $v$. Zbiór wierzchołków z krawędziami wchodzącymi z $v$ oznaczmy jako $V'$

Nie wprost: Załóżmy że istnieje wierzchołek $v2$, do którego nie da się dojść w góra dwóch krokach z $v$. Wierzchołek $v2$ spełnia:
- Nie należy do $V'$
- Ma krawędź wychodzącą do $v$ (by nie dało się dojść $v$->$v2$ w jednym kroku)
- Ma krawędzie wychodzące do każdego elementu z $V'$ (bo inaczej dla jakiegoś $v'$ istniałaby ścieżka $v$->$v'$->$v2$)

Z powyższych warunków widzimy że $v2$ ma conajmniej $|V'|+1$ krawędzi. Sprzeczność z założeniem.

## 2. Jeśli wierzchołek $v$ ma krawędź wchodzącą, to ma krawędź wchodzącą od jakiegoś króla

Dwa przypadki:
### $v$ ma dokładnie jedną krawędź wchodzącą
Trywialne, wynika wprost z dowodu 1
### $v$ ma więcej niż jedną krawędź wchodzącą
Narysujmy najpierw subturniej $T'$, zawierający wierzchołek $v$ i wszystkie wierzchołki z krawędziami wchodzącymi do $v$. (subturniej -> turniej ale nie rysujemy części wierzchołków i krawędzi do nich incydentnych)

Z dowodu 1 wiemy, że któryś z wierzchołków z krawędziami wchodzącymi do $v$ musi być królem subturnieju. Nazwijmy go $v_k$.

Narysujmy teraz cały turniej $T$. $v_k$ nadal jest królem dla wierzchołków które były w subturnieju. Dodatkowo jest też królem dla pozostałych wierzchołków, bo do każdego może dojść ścieżką $v_k$ -> $v$ -> $v_x$.

## 3. Turniej bez nadajników ma conajmniej 3 króle

Z dowodu 1. wiemy że mamy conajmniej jednego króla. Dowód 2 uniemożliwia istnienie dokładnie dwóch.

## 4. W turnieju dwudzielnym istnieje wierzchołek z którego da się dojść do każdego innego w czterech krokach

Weźmy wierzchołek z największą ilością krawędzi wychodzących z A. Nazwijmy go $v$. Jeśli jest nadajnikiem -> trywialne zadanie w dwóch krokach. W przeciwnym wypadku:

Zbiór wierzchołków z $B$ z krawędziami wchodzącymi z $v$ nazywamy $B_{\alpha}$. Z wychodzącymi do $v$ $B_{\beta}$.

Zbiór wierzchołków z $A$ do których da się dojść w dwóch krokach (za pośrednictwem $B_{\alpha}$ nazwijmy $A_{\alpha}$). Takich do których się nie da - $A_{\beta}$.

Zastanówmy się, jak będą wyglądać krawędzie wierzchołków z $A_{\beta}$.:

- Muszą mieć one krawędzie wychodzące do każdego elementu $B_{\alpha}$ (by nie dało się dojść w dwóch krokach). 
- Mamy więc conajmniej $|B_{\alpha}|$ krawędzi wychodzących dla każdego z tych elementu.
- $v$ z założenia ma najwięcej krawędzi wychodzących, więc elementy z $A_{\beta}$ nie mogą mieć już żadnych innych krawędzi wychodzących.

Oznacza to, że każdy element z $A_{\beta}$ musi mieć dokładnie taką samą strukturę krawędzi jak $v$ -> wychodzące i wchodzące do dokładnie tych samych wierzchołków.

Weźmy teraz dowolny element z $B_{\beta}$. (Z założenia że $v$ nie jest nadajnikiem, na pewno jakiś istnieje). Nazwijmy go $v'$.

- $v'$ dochodzi do $v$ oraz do każdego elementu z $A_{\beta}$ w dokładnie jednym kroku.
- Te elementy $B_{\alpha}$ dochodzą do całego zbioru $A_{\alpha}$ w dwóch krokach (Łącznie 3 kroki). Dotarliśmy do każdego elementu z $A$.
- Z każdego elementu z $A$ dochodzimy do każdego z $B$ w jednym kroku (Łącznie 4 kroki).


## 5. W każdym turnieju istnieje ścieżka Hamiltona

Prosta indukcja po ilości wierzchołków.
- n = 1; działa
- Załóżmy że dla n wierzchołków twierdzenie jest prawdziwe.
- Udowodnijmy dla n+1:

Istnieje ścieżka n-wierzchołkowa dla wierzchołków $v_{1}$...$v_{n+1}$. Pokażmy, że da się dołożyć do tej ścieżki $v_{0}$:
- Idziemy wzdłuż ścieżki. Szukamy pierwszego miejsca takiego że $v_{i}$ ma krawędź wchodzącą do $v_{0}$, a ten wychodzącą do $v_{i+1}$. Jeśli znajdziemy taką krawędź wkładamy $v_{0}$ między te dwa wierzchołki, wydłużając ścieżkę o 1.

Edge case'y:
- Pierwsza krawędź jest wchodząca -> $v_{0}$ ląduje na początku
- Nie znaleźliśmy takiej krawędzi -> ostatnia jest wychodząca do $v_{0}$ -> $v_{0}$ ląduje na końcu 
