# Algebra - notatka

Niektóre indeksy są pominięte - numeruję dokładnie tak samo jak w skrypcie.

## 1.1. Ciała
*Ciało* to zbiór z działaniami mnożenia i dodawania - działają one tak jak intuicyjnie oczekujemy. Należą do niego dwa specjalne elementy: 0 i 1 - one również działają intuicyjnie.

Przykłady ciał:
- $\mathbb{R}$ - ciało liczb rzeczywistych
- $\mathbb{C}$ - ciało liczb zespolonych
- $\mathbb{Q}$ - ciało liczb wymiernych
- $\mathbb{Z}_p$ - ciało liczb całkowitych modulo $p$ (gdzie $p$ jest liczbą pierwszą)

## 1.2. Przestrzenie liniowe
O przestrzeni liniowej można myśleć jak o uogólnieniu $\mathbb{R}^n$ - jest to zbiór elementów (punktów, ale traktujemy jako wektory). Aby zbiór był przestrzenią liniową muszą być spełnione następujące warunki (zad2/L1):
- wektor zerowy należy do zbioru
- jest on zamknięty na dodawanie (dodając dwa wektory z tego zbioru otrzymujemy wektor należący do tego zbioru)
- -,,- na mnożenie przez skalar

<details>
<summary>Przykład z zad2/L1</summary>

```
5a+2b=0
a) a=0, b=0: 0=0 spełnione
b) 5(a1+a2) + 2(b1+b2) = 5a1+5a2+2b1+2b2 = 5a1+2b1 + 5a2+2b2 = 0+0 = 0 spełnione
c) 5(ka) + 2(kb) = k(5a+2b) = k*0 = 0 spełnione
```
</details>

Spełnione są również następujące własności:
- dla każdego elementu istnieje element przeciwny
- dodawanie jest łączne i przemienne
- mnożenie jest łączne i przemienne

Przykłady przestrzeni liniowych:
- $\mathbb{R}^n$ - przestrzeń liniowa $n$-wymiarowa
- $\mathbb{C}^n$ - przestrzeń liniowa $n$-wymiarowa
- $\mathbb{R}^{R}$ - przestrzeń liniowa funkcji rzeczywistych

## 1.3. Podprzestrzenie liniowe
*Podprzestrzenią liniową* przestrzeni $\mathbb{V}$ nazywamy podzbiór przestrzeni liniowej nad tym samym ciałem z tak samo określonymi działaniami. Możemy zapisać tę zależność jako $\mathbb{U} \subseteq \mathbb{V}$.

## 1.4. Kombinacja liniowa
*Kombinacją liniową* wektorów $v_1, v_2, ..., v_n$ nazywamy wektor $v = \sum_{i=1}^{n} \alpha_i v_i$, gdzie $\alpha_i$ są skalarami.

$\mathbb{LIN(U)}$ to zbiór wszystkich kombinacji liniowych wektorów z $\mathbb{U}$.


<details>
<summary>Ile wektorów należy do LIN((1,2,1),(2,1,1))?</summary>

```
Rozważmy przestrzeń Z_3^3 (zbiór trzyelementowych wektorów nad ciałem reszt modulo 3).


Pomocniczo:
w1:
1 * (1,2,1) = (1,2,1)
2 * (1,2,1) = (2,1,2)
3 * (1,2,1) = (0,0,0)
w2:
1 * (2,1,1) = (2,1,1)
2 * (2,1,1) = (1,2,2)
3 * (2,1,1) = (0,0,0)

Teraz wszystkie możliwe sumy w1+w2:
(1,2,1) + (2,1,1) = (0,0,2)
(1,2,1) + (1,2,2) = (2,1,0)
(1,2,1) + (0,0,0) = (1,2,1)
(2,1,2) + (2,1,1) = (1,2,0)
(2,1,2) + (1,2,2) = (0,0,1)
(2,1,2) + (0,0,0) = (2,1,2)
(0,0,0) + (2,1,1) = (2,1,1)
(0,0,0) + (1,2,2) = (1,2,2)
(0,0,0) + (0,0,0) = (0,0,0)

Odp: 9 wektorów

```
</details>


## 1.5. Niezależność liniowa
Zbiór wektorów $\mathbb{U}$ jest *liniowo niezależny* jeśli jedyną kombinacją liniową wektorów z tego zbioru, która daje wektor zerowy jest ta, w której wszystkie współczynniki są zerami.

Prostszym sformułowaniem jest to, że wektory są liniowo niezależne jeśli nie da się jednego z nich przedstawić jako kombinacji liniowej pozostałych.

W zadaniach będziemy udowadniać liniową niezależność wektorów korzystając z metody eliminacji Gaussa, przekształcając macierz wektorów w macierz schodkową. Jeśli w macierzy schodkowej nie ma zerowego wiersza, to wektory są liniowo niezależne.

## 2.1. Baza
Jest to minimalny zbiór wektorów, których kombinacja liniowa daje dowolny wektor z przestrzeni. W przestrzeni $\mathbb{R}^n$ baza to zbiór $n$ wektorów, które są liniowo niezależne.

Bazę uzyskać możemy eliminacją Gaussa (pozbywamy się tylko wektorów zerowych, lub w przypadku brakujących "schodków" - dodajemy wektory, które są liniowo niezależne z pozostałymi).

## 2.3. Wymiar przestrzeni liniowej

Wymiar przestrzeni liniowej to liczba wektorów w jej bazie (moc jej bazy).

Dla przestrzeni zawierającej tylko wektor zerowy, wymiar wynosi 0.

### !!! Ważny wzór:

$$dim(\mathbb{U} \cap \mathbb{V}) = dim(\mathbb{U}) + dim(\mathbb{V}) - dim(\mathbb{U} + \mathbb{V})$$

Pozwala on nam obliczyć rozwiązania zadań w których dostajemy przestrzenie U i V, a mamy obliczyć wymiar sumy i przecięcia tych przestrzeni _(zad2,3/L3, zad10/L7 i egzaminy)_.

## 2.5. Wartstwy

Wartstwą przestrzeni liniowej $\mathbb{V}$ nazywamy zbiór wszystkich wektorów, które są kombinacją liniową wektorów z $\mathbb{V}$. Intuicyjnie - jest to przestrzeń przesunięta o wektor v.

## 3.1. Przekszałcenia liniowe (homomorfizmy)


Przekształceniem liniowym (homomorfizmem) nazywamy funkcję $f: \mathbb{V} \rightarrow \mathbb{W}$, która zachowuje działania liniowe, tzn.:
- $f(v_1 + v_2) = f(v_1) + f(v_2)$
- $f(\alpha v) = \alpha f(v)$

<details>
<summary>Czy L(x, y) = (2x-y, x+3y-1, 5x+2y) jest przekształceniem liniowym?</summary>

```

Rozwiązanie:
Sprawdzamy warunki:
- L(x + y) = L(x) + L(y)
- L(a * x) = a * L(x)
a) L(x1+x2, y1+y2) = 
(2(x1+x2)-(y1+y2), (x1+x2)+3(y1+y2)-1, 5(x1+x2)+2(y1+y2)) = 
L(x1,y1) + L(x2,y2)
b) L(a * x1, a * y1) = 
(2(a * x1)-(a * y1), (a * x1)+3(a * y1)-1, 5(a * x1)+2(a * y1)) = 
a * L(x1,y1)

Odp: TAK

Czerwoną flagą w takim zadaniu jest 
mnożenie dwóch zmiennych - 
wówczas praktycznie zawsze (zawsze?) 
nie będzie to przekształcenie liniowe.

```
</details>

## 3.2. Jądro  i obraz przekształcenia liniowego

Jądrem przekształcenia liniowego $f: \mathbb{V} \rightarrow \mathbb{W}$ nazywamy zbiór wektorów z $\mathbb{V}$, które są przekształcane przez $f$ w wektor zerowy z $\mathbb{W}$.
(Wektory które są przekształcane w zerowy wektor przez $f$)

Obrazem przekształcenia liniowego $f: \mathbb{V} \rightarrow \mathbb{W}$ nazywamy zbiór wektorów z $\mathbb{W}$, które są przekształceniem wektorów z $\mathbb{V}$ przez $f$.
(Wszystkie wektory z $\mathbb{W}$, które są przekształceniem wektorów z $\mathbb{V}$ przez $f$)

### Jest bardzo dużo zadań z jądra i obrazu!

Pamiętamy o wzorze:

$dim(\mathbb{V}) = dim(Ker(f)) + dim(Im(f))$

I że następujące warunki są równoważne:
- Przekształcenie F jest różnowartościowe
- dim(Ker(F)) = 0
- ker(F) składa się z jednego wektora
- dim(Im(F)) = dim(V)

(Co mieliśmy udowodnić w jednym z zadań)



<details>
<summary>Wyznacz bazę obrazu dla 
<b>F(x,y,z) = (2x+y, 3x−z, 5x+y−z, −2x+2y−2z)</b></summary>


```

Rozwiązanie:

F(1,0,0) = (2,3,5,-2)
F(0,1,0) = (1,0,1,2)
F(0,0,1) = (0,-1,-1,-2)

Zapisujemy jako macierz:

1  0  1  2
2  3  5 -2
0 -1 -1 -2

Po eliminacji Gaussa otrzymujemy:

1  0  1  2
0  3  3  6
0  0  0  0

Odp:
bazą obrazu jest {(1,0,1,2), (2,3,5,-2)}
```
</details>


<details>
<summary>Wyznacz bazę jądra dla
<b>H(x,y,z) = (x+y, y+z)</b></summary>

```
Rozwiązanie:
Najpierw skorzystamy ze wzoru:
dim(V) = dim(Ker(f)) + dim(Im(f))
stąd wiemy że 
dim(Ker(f)) = dim(V) - dim(Im(f))
a więc
dim(Ker(f)) = 3 - 2 = 1

Teraz wyznaczamy bazę jądra:
zapiszmy najpierw macierz:
-1  1  0
 0  1 -1

x = -y
z = -y

Mnożąc macierz przez wektor (x,y,z) otrzymujemy (-y, y, -y). Wiemy że dim(Ker(f)) = 1, więc wystarczy nam jeden wektor, np. (1, -1, 1)

Odp:
bazą jądra jest {(1, -1, 1)}
```

</details>

## 4.1. Macierze

### Definicja
Macierzą rozmiaru mxn nad ciałem $\mathbb{F}$ nazywamy funkcję $A: \{1,2,...,m\} \times \{1,2,...,n\} \rightarrow \mathbb{F}$

Zwykle macierz oznaczamy jako tabelę liczb.

### Zestawienie macierzy
Dosłownie "zestawiamy" macierze, zapisujemy dwie obok siebie jak jedną (w pionie lub w poziomie)

### Wzory
- Id * A = A * Id = A
- A(B + C) = AB + AC
- a(AB) = (aA)B = A(aB)
- A[B|C] = [AB|AC] 

### Transpozycja
Obrót względem głównej przekątnej

- $(A^T)^T = A$
- $(A + B)^T = A^T + B^T$
- $(AB)^T = B^T A^T$

## 4.3. Operacje elementarne

Z definicji, operacje elementarne to:
- zamiana kolumn
- zamiana wierszy
- pomnożenie wiersza przez niezerowy skalar
- dodanie do wiersza innego wiersza pomnożonego przez skalar

Zauważamy tutaj że możemy zinterpretować cały proces eliminacji Gaussa jako kolejne działania macierzy elementarnych.

## 4.5. Rząd macierzy

Rząd macierzy to wymiar przestrzeni generowanej przez wektory będące kolumnami/wierszami macierzy.

<details>
<summary>Wyznacz rząd macierzy w zależności od parametru</summary>

```
Macierz:

5  p  5  p
1  1  1  1
p  p  2  2

Rozwiązanie:
Zauważamy że dla p = 5 
wektory 1 i 2 będą liniowo zależne,
a dla p = 2
liniowo zależne będą 2 i 3

Odp:
Dla p = 2 lub p = 5 rząd macierzy wynosi 2
w.p.p. rząd macierzy wynosi 3

```
</details>

## 4.6. Obliczanie bazy jądra przekształcenia

M * Id(n) = M

Wykonujemy eliminację Gaussa na macierzy M. Wektory w drugiej macierzy odpowiadające kolumnom z zerami w pierwszej macierzy tworzą bazę jądra.

Przykładowo:
```
1  1  0  ->   1  0  0    
0  1 -1       0  0 -1

Wykonując te same operacje na macierzy Id(3)

1  0  0      1 -1  0
0  1  0  ->  0  1  0
0  0  1      0  1  1

Jedyną kolumną z zerami w pierwszej macierzy jest druga - bazą jądra będzie więc wektor drugi z macierzy Id(3) po przekształceniu, czyli baza to {(-1,1,1)}

Możemy sprawdzić to wzorem dim(Ker(f)) = dim(V) - dim(Im(f)) === 3 - 2 = 1
```

# TODO - obliczanie bazy obrazu


## 5. #TODO - nie ogarniam ale nie było na listach, posprawdzam jeszcze egzaminy 

<br><br><br><br>

## 6.1. Wyznacznik

Funkcja na macierzach kwadratowych, która spełnia następujące warunki:
- det(Id(n)) = 1
- det(A) = 0 <=> A jest liniowo zależna
- zamiana kolumny zmienia znak wyznacznika
- dodanie do kolumny innej kolumny pomnożonej przez skalar nie zmienia wyznacznika

## 6.2. Metody obliczania wyznacznika i ważne wzory

### Rozwinięcie Laplace'a
Wzór:

 $det(A) = \sum_{i=1}^{n} (-1)^{i+j} a_{ij} det(A_{ij})$

Ważne - pamiętamy o tym -1 w wyznaczniku!

### Obliczanie małych wyznaczników - legalne dla macierzy 2x2 i 3x3 (dla większych najpierw Laplace)

Na macierz 2x2 wzór = ad - bc

Dla 3x3 metoda Sarrusa - rozwijamy kolumny poza macierz.


### Wzory dot. wyznaczników

- $det(AB) = det(A)det(B)$
- $det(A^T) = det(A)$
- $det(A^{-1}) = \frac{1}{det(A)}$
- $det(A^k) = det(A)^k$

## 7.1. Układy równań liniowych

Układ równań liniowych możemy zapisywać w postaci macierzowej:

$Ax = b$

gdzie A to macierz współczynników, x to wektor niewiadomych, b to wektor wyrazów wolnych.

### 7.3. n zmiennych, n równań, macierz odwracalna

Jest to bazowy przypadek - możemy skorzystać ze wzorów Cramera - więcej w przykładzie poniżej

<details>
<summary>Rozwiąż układ za pomocą wzorów Cramera</summary>

```
2  -1  *  x1   =   1
1  16     x2      17


x = det(An)/det(A)

Gdzie A to macierz bez zmian a An to macierz z n kolumną zastąpioną wektorem wyrazów wolnych

det(A) = 2*16 + 1*1 = 33
(det A1) = 1*16 + 1*17 = 33
(det A2) = 2*17 - 1*1 = 33

x1 = 33 / 33 = 1
x2 = 33 / 33 = 1

```
</details>

## 7.4. Ogólne układy

### Układ jednorodny

Układem jednorodnym nazywamy układ równań postaci Ax = 0. Zawsze ma rozwiązanie x = 0.

### Układ niejednorodny

Układem niejednorodnym nazywamy układ równań postaci Ax = b. Rozwiązujemy Gaussem. To czy ile ma rozwiązań wnioskujemy z ilości niewiadomych i równań.

## 8.1. Wartość własna, wektor własny

Wartością własną macierzy A nazywamy liczbę $\lambda$ taką, że istnieje wektor $v \neq 0$ taki, że $Av = \lambda v$


## 8.3. Wielomian charakterystyczny

Wielomian charakterystyczny macierzy A to wielomian $p_A(\lambda) = det(A - \lambda I)$

W skrócie - w całej głównej przekątnej odejmujemy $\lambda$ i obliczamy wyznacznik. Otrzymujemy równanie, którego rozwiązaniami są wartości własne danej macierzy.

## 8.4. Krotności algebraiczna i geometryczna

Krotność geometryczna to wymiar przestrzeni wektorów własnych dla $\lambda$. Dla M jest to $dim(Ker(M - \lambda Id))$

Krotność algebraiczna to krotność $\lambda$ jako pierwiastka wielomianu charakterystycznego.

### #TODO - przykład z zadania 3/L9 i ew. 11/L8

## 8.5. Diagonalizowalność macierzy

Macierz M jest diagonalizowalna $\iff$ jest podobna do macierzy diagonalnej.

Przekształcenie liniowe jest diagonalne, jeśli jego macierz (w jakiejś bazie) jest diagonalizowalna.

### Poniższe twierdzenia są równoważne
- M jest diagonalizowalna
- M ma n liniowo niezależnych wektorów własnych
- Suma wymiarów przestrzeni wektorów własnych jest równa n

## 8.6. Macierze Jordana

### #TODO na razie nie ogarniam co tu się dzieje, później do tego wrócę

## 8.7. Macierze symetryczne

Macierz M jest symetryczna $\iff$ $M^T = M$

Zawsze ma ona n niezależnych wektorów własnych.

## 9.1. Macierze sąsiedstwa

Internet modelujemy jako graf - wierzchołki to strony, krawędzie to linki między stronami (bez pętli n->n). Naszym celem jest znalezienie najważniejszych stron korzystając z ilości linków do danej strony.

### Znormalizowana macierz sąsiedztwa

Kolumny sumują się do 1 jeśli istnieje w niej jakikolwiek element. Wszystkie liczby nieujemne.

Inna nazwa to macierz (wektor) <b>stochastyczna</b>.


## 9.2. PageRank

Dla znormalizowanej macierzy sąsiedstwa M definiujemy:

$M' = (1-m)M + m * \frac{1}{n}J$
gdzie J to macierz elementów 1/n.

## 9.3. Obliczanie PageRanku

### #TODO - zadanie z listy ogarnąć i wrzucić tutaj

### #TODO - reszta tematów 9.x


### #TODO 10.2. i 10.3. - do sprawdzenia na listach i starych egzaminach

## 11.1. Baza ortonormalna

Niech $V$ będzie skończenie wymiarową przestrzenią Euklidesową (unitarną). Wtedy $V$ ma bazę ortonormalną.


## 11.2. Dopełnienie ortogonalne

### #TODO - def i zadania 5/L10 i 3/L11

## 11.3. Rzuty i rzuty prostopadłe

Rzutem nazywamy przekształcenie liniowe $P: V \rightarrow V$ takie, że $P^2 = P$. O rzucie $P$ mówimy, że jest rzutem na podprzestrzeń $Im P$


## 12.1. Izometrie

Izometrią nazywamy przekształcenie liniowe $f: V \rightarrow V$ takie, że $||f(x)|| = ||x||$ dla każdego $x \in V$.

## 12.2. Macierze ortogonalne

Macierz kwadratową $M$ nazywamy ortogonalną, jeśli kolumny są parami ortogonalne oraz są długości 1.

$M$ jest ortogonalna wtedy i tylko wtedy gdy $M^T = M^{-1}$

Macierze ortogonalne są zamknięte na mnożenie, transponowanie i odwracanie.

## 13. Macierze dodatnio określone

Definicja intuicyjna.

### #TODO - zadania 2,4/L12

# Część II - Algebra abstrakcyjna

## Grupy

## 14.1. Automorfizmy

Dla danego obiektu kombinatorycznego $S$ jego grupa przekształceń $G=Aut(S)$ powinna spełniać następujące warunki:
- przekształcenie identycznościowe należy do $G$
- jeśli $f,g \in G$ to te przekształcenia można składać i $f \circ g \in G$
- dla każdego $f \in G$ istnieje $f^{-1}$ takie że $f \circ f^{-1} = f^{-1} \circ f = id$

Przykłady:
- kwadrat i jego symetrie
- dwudziestościan foremny i jego obroty
- macierz nxn i mnożenie przez macierze odwracalne

## 14.2. Grupa

Definicja grupy:

Zbiór G z działaniem $\circ$ jest grupą jeśli:
- $\circ$ jest łączne
- istnieje element neutralny
- każdy element ma element odwrotny

## 14.3. Tabelka działań

Tabela działań dla grupy G podaje wszystkie możliwe wyniki działania $\circ$ na elementach G.


### #TODO 8,9,10,11 / L12

### #TODO - reszta tematów z grup

## 15. Grupy permutacji

Grupa permutacji to zbiór wszystkich bijekcji ze zbioru $\{1,2,...,n\}$ w siebie. Operacją jest składanie funkcji. 

($\sigma$*$\sigma'$)($i$) = $\sigma$($\sigma'$($i$)).

Permutacje zapisujemy jako dwuwierszową tabelkę, np:

$\begin{pmatrix}1&2&3&4&5&6&7&8&9&10\\2&3&4&5&6&7&8&9&10&1\end{pmatrix}$

Gdzie w pierwszym wierszu są liczby od 1 do n, a w drugim wierszu liczby po przekształceniu. 

Złożenie - intuicyjnie.

## 15.1. Rozkład permutacji na cykle

Permutację można rozłożyć na cykle. Cykl to permutacja, która przesuwa elementy cyklicznie. Intuicyjnie - gdy w tabelce mamy między innymi przejście 1->2->3->1, możemy zapisać to jako (1,2,3). Tabelkę można zapisać jako iloczyn cykli.

### #TODO - 10,11 / L13

## 15.2. Parzystość permutacji

### #TODO - temat + 1/L14


<br><br><br><br>
# Dalej jeszcze nie dotarliśmy na zajęciach - start od str. 113 skryptu i listy 14