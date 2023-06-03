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

## 3.1. Przekszałcenia liniowe