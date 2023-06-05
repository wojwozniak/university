# Algebra

Prosta notatka na bazie skryptu i list

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

```
Przykład z zad2/L1 (pokażę też przemienność i łączność):
5a+2b=0
a) a=0, b=0: 0=0 spełnione
b) 5(a1+a2) + 2(b1+b2) = 5a1+5a2+2b1+2b2 = 5a1+2b1 + 5a2+2b2 = 0+0 = 0 spełnione
c) 5(ka) + 2(kb) = k(5a+2b) = k*0 = 0 spełnione
```

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


```
Przykładowe zadanie (z9a/L1):
Rozważmy przestrzeń Z_3^3 (zbiór trzyelementowych wektorów nad ciałem reszt modulo 3).
Ile wektorów należy do LIN((1,2,1),(2,1,1))?

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

```
Inny przykład - w z8a/L1 proszą nas 
o przedstawienie wektora jako kombinacji liniowej innych wektorów. 
Nie jest to nic skomplikowanego - 
musimy jedynie rozwiązać układ równań liniowych (jak w liceum)
```

## 1.5. Niezależność liniowa
Zbiór wektorów $\mathbb{U}$ jest *liniowo niezależny* jeśli jedyną kombinacją liniową wektorów z tego zbioru, która daje wektor zerowy jest ta, w której wszystkie współczynniki są zerami.

Prostszym sformułowaniem jest to, że wektory są liniowo niezależne jeśli nie da się jednego z nich przedstawić jako kombinacji liniowej pozostałych.

W zadaniach będziemy udowadniać liniową niezależność wektorów korzystając z metody eliminacji Gaussa, przekształcając macierz wektorów w macierz schodkową. Jeśli w macierzy schodkowej nie ma zerowego wiersza, to wektory są liniowo niezależne.

1.6. Metoda eliminacji Gaussa - pomijam - w razie czego polecam YT

## 2.1. Baza
Jest to minimalny zbiór wektorów, których kombinacja liniowa daje dowolny wektor z przestrzeni. W przestrzeni $\mathbb{R}^n$ baza to zbiór $n$ wektorów, które są liniowo niezależne.

Bazę uzyskać możemy eliminacją Gaussa (pozbywamy się tylko wektorów zerowych, lub w przypadku brakujących "schodków" - dodajemy wektory, które są liniowo niezależne z pozostałymi).

2.2. - wyrażenie wektora w bazie - tak samo jak wyrażenie innymi wektorami

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

```
Przykład zadania:
z8a/L3
Czy L(x, y) = (2x-y, x+3y-1, 5x+2y) jest przekształceniem liniowym?
```
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

```
zad1a/L4

Wyznacz bazę obrazu dla 
F(x,y,z) = (2x+y, 3x−z, 5x+y−z, −2x+2y−2z)
```
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

```
zad2a/L4
Wyznacz bazę jądra dla
H(x,y,z) = (x+y, y+z)
```
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
 -1 1  0
  0 1 -1

x = -y
z = -y

Mnożąc macierz przez wektor (x,y,z) otrzymujemy (-y, y, -y). Wiemy że dim(Ker(f)) = 1, więc wystarczy nam jeden wektor, np. (1, -1, 1)

Odp:
bazą jądra jest {(1, -1, 1)}
```
