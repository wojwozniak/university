# Algebra - notatka

Spis treści:
- [Algebra - notatka](#algebra---notatka)
- [1. Wstęp](#1-wstęp)
  - [1.1. Ciała](#11-ciała)
  - [1.2. Przestrzenie liniowe](#12-przestrzenie-liniowe)
  - [1.3. Podprzestrzenie liniowe](#13-podprzestrzenie-liniowe)
  - [1.4. Kombinacja liniowa](#14-kombinacja-liniowa)
  - [1.5. Niezależność liniowa](#15-niezależność-liniowa)
  - [1.6. Metoda eliminacji Gaussa](#16-metoda-eliminacji-gaussa)
- [2. Baza, wymiar, warstwy](#2-baza-wymiar-warstwy)
  - [2.1. i 2.2. Baza i wyrażenie wektora w bazie](#21-i-22-baza-i-wyrażenie-wektora-w-bazie)
  - [2.3. i 2.4. Wymiar przestrzeni liniowej](#23-i-24-wymiar-przestrzeni-liniowej)
    - [!!! Ważny wzór:](#-ważny-wzór)
  - [2.5. Wartstwy](#25-wartstwy)
- [3. Przekształcenia liniowe](#3-przekształcenia-liniowe)
  - [3.1. Przekszałcenia liniowe (homomorfizmy)](#31-przekszałcenia-liniowe-homomorfizmy)
  - [3.2. Jądro  i obraz przekształcenia liniowego](#32-jądro--i-obraz-przekształcenia-liniowego)
    - [Jest bardzo dużo zadań z jądra i obrazu!](#jest-bardzo-dużo-zadań-z-jądra-i-obrazu)
- [4. Macierze](#4-macierze)
  - [4.1. Macierze (skip 4.2.)](#41-macierze-skip-42)
    - [Definicja](#definicja)
    - [Zestawienie macierzy](#zestawienie-macierzy)
    - [Wzory](#wzory)
    - [Transpozycja](#transpozycja)
  - [4.3. Operacje elementarne](#43-operacje-elementarne)
  - [4.4. Przekształcenia liniowe dla macierzy](#44-przekształcenia-liniowe-dla-macierzy)
  - [4.5. Rząd macierzy](#45-rząd-macierzy)
  - [4.6. Obliczanie bazy jądra przekształcenia](#46-obliczanie-bazy-jądra-przekształcenia)
    - [#TODO - obliczanie bazy obrazu](#todo---obliczanie-bazy-obrazu)
  - [4.7. 4.8. Macierz odwrotna](#47-48-macierz-odwrotna)
  - [4.9. Obliczanie macierzy odwrotnej (algorytm)](#49-obliczanie-macierzy-odwrotnej-algorytm)
- [5. Przekształcenia liniowe i macierze](#5-przekształcenia-liniowe-i-macierze)
- [6. Wyznacznik](#6-wyznacznik)
  - [6.1. Wyznacznik](#61-wyznacznik)
  - [6.2. 6.3. 6.4. Metody obliczania wyznacznika i ważne wzory](#62-63-64-metody-obliczania-wyznacznika-i-ważne-wzory)
    - [Rozwinięcie Laplace'a](#rozwinięcie-laplacea)
    - [Obliczanie małych wyznaczników - legalne dla macierzy 2x2 i 3x3 (dla większych najpierw Laplace)](#obliczanie-małych-wyznaczników---legalne-dla-macierzy-2x2-i-3x3-dla-większych-najpierw-laplace)
    - [Wzory dot. wyznaczników](#wzory-dot-wyznaczników)
- [7. Rozwiązywanie układów równań liniowych](#7-rozwiązywanie-układów-równań-liniowych)
  - [7.1. 7.2. Układy równań liniowych](#71-72-układy-równań-liniowych)
  - [7.3. n zmiennych, n równań, macierz odwracalna](#73-n-zmiennych-n-równań-macierz-odwracalna)
  - [7.4. 7.5. Ogólne układy (Gauss)](#74-75-ogólne-układy-gauss)
    - [Układ jednorodny](#układ-jednorodny)
    - [Układ niejednorodny](#układ-niejednorodny)
    - [#TODO - przykład](#todo---przykład)
- [8. Wartości i wektory własne](#8-wartości-i-wektory-własne)
  - [8.1. Wartość własna, wektor własny](#81-wartość-własna-wektor-własny)
  - [8.2. Macierze podobne](#82-macierze-podobne)
    - [#TODO - przykład zadania?](#todo---przykład-zadania)
  - [8.3. Wielomian charakterystyczny](#83-wielomian-charakterystyczny)
  - [8.4. Krotności algebraiczna i geometryczna](#84-krotności-algebraiczna-i-geometryczna)
  - [8.5. Diagonalizowalność macierzy](#85-diagonalizowalność-macierzy)
    - [Poniższe twierdzenia są równoważne](#poniższe-twierdzenia-są-równoważne)
  - [8.6. Macierze Jordana](#86-macierze-jordana)
  - [8.7. Macierze symetryczne](#87-macierze-symetryczne)
- [9. Macierze i grafy](#9-macierze-i-grafy)
  - [9.1. Macierze sąsiedstwa](#91-macierze-sąsiedstwa)
    - [Znormalizowana macierz sąsiedztwa](#znormalizowana-macierz-sąsiedztwa)
  - [9.2. PageRank](#92-pagerank)
  - [9.3. Obliczanie PageRanku](#93-obliczanie-pageranku)
    - [#TODO - zadanie z listy ogarnąć i wrzucić tutaj](#todo---zadanie-z-listy-ogarnąć-i-wrzucić-tutaj)
- [10. Iloczyn skalarny](#10-iloczyn-skalarny)
  - [10.1. Standardowy iloczyn skalarny](#101-standardowy-iloczyn-skalarny)
  - [10.2. Dopełnie ortogonalne](#102-dopełnie-ortogonalne)
    - [#TODO - ogarnąć co było na listach i tu wrzucić](#todo---ogarnąć-co-było-na-listach-i-tu-wrzucić)
- [11. Baza ortonormalna, rzuty, ortonormalizacja](#11-baza-ortonormalna-rzuty-ortonormalizacja)
  - [11.1. Baza ortonormalna](#111-baza-ortonormalna)
  - [11.2. Dopełnienie ortogonalne](#112-dopełnienie-ortogonalne)
    - [#TODO - def i zadanie 3/L11](#todo---def-i-zadanie-3l11)
  - [11.3. Rzuty i rzuty prostopadłe](#113-rzuty-i-rzuty-prostopadłe)
- [12. Izometrie i macierze ortogonalne](#12-izometrie-i-macierze-ortogonalne)
  - [12.1. Izometrie](#121-izometrie)
  - [12.2. Macierze ortogonalne](#122-macierze-ortogonalne)
  - [13. Macierze dodatnio określone](#13-macierze-dodatnio-określone)
- [Część II - Algebra abstrakcyjna](#część-ii---algebra-abstrakcyjna)
- [14. Grupy](#14-grupy)
  - [14.1. Automorfizmy](#141-automorfizmy)
  - [14.2. Grupa](#142-grupa)
  - [14.3. Tabelka działań](#143-tabelka-działań)
  - [14.4. Homomorfizm i izomorfizm](#144-homomorfizm-i-izomorfizm)
    - [Przykłady](#przykłady)
  - [14.5. Rząd elementu (potęga elementu)](#145-rząd-elementu-potęga-elementu)
  - [14.6. Podgrupa](#146-podgrupa)
  - [14.7. Grupa cykliczna](#147-grupa-cykliczna)
- [15. Grupy permutacji](#15-grupy-permutacji)
  - [15.1. Rozkład permutacji na cykle](#151-rozkład-permutacji-na-cykle)
  - [15.2. Parzystość / nieparzystość permutacji](#152-parzystość--nieparzystość-permutacji)
    - [Wzorki związane z parzystością](#wzorki-związane-z-parzystością)
    - [Określenie parzystości](#określenie-parzystości)
- [16. Działania grupy na zbiorze](#16-działania-grupy-na-zbiorze)
  - [16.1. Mnożenie podzbiorów grupy](#161-mnożenie-podzbiorów-grupy)
- [17. Warstwy](#17-warstwy)
- [19. Pierścienie. Arytmetyka modularna](#19-pierścienie-arytmetyka-modularna)
  - [19.1. Pierścienie](#191-pierścienie)
  - [19.2. Arytmetyka modularna](#192-arytmetyka-modularna)
    - [Przystawanie](#przystawanie)
  - [19.3. Algorytm Euklidesa](#193-algorytm-euklidesa)
  - [19.4. Elementy odwracalne](#194-elementy-odwracalne)
  - [19.5. Chińskie twierdzenie o resztach](#195-chińskie-twierdzenie-o-resztach)
    - [Równania, układy równań modulo](#równania-układy-równań-modulo)
    - [Elementy odwrotne modulo](#elementy-odwrotne-modulo)
- [20. Wielomiany](#20-wielomiany)
  - [20.1. Pierścień wielomianów](#201-pierścień-wielomianów)
  - [20.3. Dzielenie i NWD wielomianów](#203-dzielenie-i-nwd-wielomianów)



# 1. Wstęp

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

## 1.6. Metoda eliminacji Gaussa

Metoda eliminacji Gaussa pozwala na rozwiązanie układu równań liniowych. W zadaniach będziemy jej używać do sprawdzania liniowej niezależności wektorów.

Wpływ eliminacji na wyznacznik macierzy:
- mnożenie wiersza przez skalar $k$ powoduje pomnożenie wyznacznika przez $k$
- dodanie do wiersza innego wiersza pomnożonego przez skalar $k$ nie zmienia wyznacznika
- zamiana miejscami dwóch wierszy powoduje zmianę znaku wyznacznika

Najlepiej więc korzystać jedynie z pierwszej operacji - szczególnie że jest braindead algorytm wykorzystujący tylko tę operację.


# 2. Baza, wymiar, warstwy

## 2.1. i 2.2. Baza i wyrażenie wektora w bazie
Jest to minimalny zbiór wektorów, których kombinacja liniowa daje dowolny wektor z przestrzeni. W przestrzeni $\mathbb{R}^n$ baza to zbiór $n$ wektorów, które są liniowo niezależne.

Bazę uzyskać możemy eliminacją Gaussa (pozbywamy się tylko wektorów zerowych, lub w przypadku brakujących "schodków" - dodajemy wektory, które są liniowo niezależne z pozostałymi).

## 2.3. i 2.4. Wymiar przestrzeni liniowej

Wymiar przestrzeni liniowej to liczba wektorów w jej bazie (moc jej bazy).

Dla przestrzeni zawierającej tylko wektor zerowy, wymiar wynosi 0.

### !!! Ważny wzór:

$$dim(\mathbb{U} \cap \mathbb{V}) = dim(\mathbb{U}) + dim(\mathbb{V}) - dim(\mathbb{U} + \mathbb{V})$$

Pozwala on nam obliczyć rozwiązania zadań w których dostajemy przestrzenie U i V, a mamy obliczyć wymiar sumy i przecięcia tych przestrzeni _(zad2,3/L3, zad10/L7 i egzaminy)_.

## 2.5. Wartstwy

Wartstwą przestrzeni liniowej $\mathbb{V}$ nazywamy zbiór wszystkich wektorów, które są kombinacją liniową wektorów z $\mathbb{V}$. Intuicyjnie - jest to przestrzeń przesunięta o wektor v.

# 3. Przekształcenia liniowe

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
 1  1  0
 0  1  1

x = -y
z = -y

Mnożąc macierz przez wektor (x,y,z) otrzymujemy (-y, y, -y). Wiemy że dim(Ker(f)) = 1, więc wystarczy nam jeden wektor, np. (1, -1, 1)

Odp:
bazą jądra jest {(1, -1, 1)}
```

</details>

<br><br>

# 4. Macierze

## 4.1. Macierze (skip 4.2.)

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

## 4.4. Przekształcenia liniowe dla macierzy

Przekształcenie liniowe można zapisać w postaci macierzy.

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

### #TODO - obliczanie bazy obrazu

## 4.7. 4.8. Macierz odwrotna

Macierz kwadratowa A jest macierzą odwracalną, gdy istnieje takie B, że AB = BA = Id(n). Wtedy B nazywamy macierzą odwrotną do macierzy A. Macierz odwrotna jest jednoznacznie określona.

Macierz odwrotna istnieje wtedy i tylko wtedy, gdy:
- rząd macierzy A jest równy n
- wyznacznik macierzy A jest różny od 0

## 4.9. Obliczanie macierzy odwrotnej (algorytm)

Składamy macierz A z macierzą Id. Następnie poprzez działania na wierszach macierzy A doprowadzamy ją do macierzy Id. Dokładnie te same działania wykonujemy na macierzy Id - po zakończeniu macierz Id stanie się macierzą odwrotną do macierzy A.



# 5. Przekształcenia liniowe i macierze

Wszystko co było na listach / egzaminach jest powyżej lub poniżej.

# 6. Wyznacznik

## 6.1. Wyznacznik

Funkcja na macierzach kwadratowych, która spełnia następujące warunki:
- det(Id(n)) = 1
- det(A) = 0 <=> A jest liniowo zależna
- zamiana kolumny zmienia znak wyznacznika
- dodanie do kolumny innej kolumny pomnożonej przez skalar nie zmienia wyznacznika

## 6.2. 6.3. 6.4. Metody obliczania wyznacznika i ważne wzory

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

# 7. Rozwiązywanie układów równań liniowych

## 7.1. 7.2. Układy równań liniowych

Układ równań liniowych możemy zapisywać w postaci macierzowej:

$Ax = b$

gdzie A to macierz współczynników, x to wektor niewiadomych, b to wektor wyrazów wolnych.

## 7.3. n zmiennych, n równań, macierz odwracalna

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

## 7.4. 7.5. Ogólne układy (Gauss)

### Układ jednorodny

Układem jednorodnym nazywamy układ równań postaci Ax = 0. Zawsze ma rozwiązanie x = 0.

### Układ niejednorodny

Układem niejednorodnym nazywamy układ równań postaci Ax = b. Rozwiązujemy Gaussem. To czy ile ma rozwiązań wnioskujemy z ilości niewiadomych i równań.

### #TODO - przykład

# 8. Wartości i wektory własne

## 8.1. Wartość własna, wektor własny

Wartością własną macierzy A nazywamy liczbę $\lambda$ taką, że istnieje wektor $v \neq 0$ taki, że $Av = \lambda v$

## 8.2. Macierze podobne

Macierze A i B są podobne, jeśli istnieje macierz odwracalna P taka, że $B = P^{-1}AP$

### #TODO - przykład zadania?

## 8.3. Wielomian charakterystyczny

Wielomian charakterystyczny macierzy A to wielomian $p_A(\lambda) = det(A - \lambda I)$

W skrócie - w całej głównej przekątnej odejmujemy $\lambda$ i obliczamy wyznacznik. Otrzymujemy równanie, którego rozwiązaniami są wartości własne danej macierzy.

## 8.4. Krotności algebraiczna i geometryczna

Krotność algebraiczna to krotność $\lambda$ jako pierwiastka wielomianu charakterystycznego. (czyli ile razy $\lambda$ występuje w wielomianie)

Krotność geometryczna to liczba liniowo niezależnych wektorów własnych odpowiadających danej wartości własnej. Podstawiamy do macierz M-lambdaI wartość własną i wyznaczamy bazę jądra. Ilość wektorów w tej bazie to krotność geometryczna. Zawsze będzie ona większa lub równa 1 i mniejsza lub równa krotności algebraicznej.

## 8.5. Diagonalizowalność macierzy

Macierz M jest diagonalizowalna $\iff$ jest podobna do macierzy diagonalnej.

Przekształcenie liniowe jest diagonalne, jeśli jego macierz (w jakiejś bazie) jest diagonalizowalna.

### Poniższe twierdzenia są równoważne
- M jest diagonalizowalna
- M ma n liniowo niezależnych wektorów własnych
- Suma wymiarów przestrzeni wektorów własnych jest równa n

## 8.6. Macierze Jordana

Klatką Jordana nazywamy macierz postaci:

$$
\begin{bmatrix}
\lambda & 1 & 0 & 0 & \dots & 0 & 0 \\
0 & \lambda & 1 & 0 & \dots & 0 & 0 \\
0 & 0 & \lambda & 1 & \dots & 0 & 0 \\
\vdots & \vdots & \vdots & \vdots & \ddots & \vdots & \vdots \\
0 & 0 & 0 & 0 & \dots & \lambda & 1 \\
0 & 0 & 0 & 0 & \dots & 0 & \lambda \\
\end{bmatrix}
$$

Macierz Jordana to macierz postaci:

$$
\begin{bmatrix}
J_1 & 0 & 0 & 0 & \dots & 0 & 0 \\
0 & J_2 & 0 & 0 & \dots & 0 & 0 \\
0 & 0 & J_3 & 0 & \dots & 0 & 0 \\
\vdots & \vdots & \vdots & \vdots & \ddots & \vdots & \vdots \\
0 & 0 & 0 & 0 & \dots & J_{k-1} & 0 \\
0 & 0 & 0 & 0 & \dots & 0 & J_k \\
\end{bmatrix}
$$

gdzie $J_i$ to klatka Jordana.

Klatka Jordana J rozmiaru kxk ma jedną wartość własną $\lambda$ o krotności algebraicznej i geometrycznej równej k.

## 8.7. Macierze symetryczne

Macierz M jest symetryczna $\iff$ $M^T = M$

Zawsze ma ona n niezależnych wektorów własnych.

# 9. Macierze i grafy

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

# 10. Iloczyn skalarny

## 10.1. Standardowy iloczyn skalarny

Mnożymy liczby na tych samych pozycjach i sumujemy.

## 10.2. Dopełnie ortogonalne

### #TODO - ogarnąć co było na listach i tu wrzucić

# 11. Baza ortonormalna, rzuty, ortonormalizacja

## 11.1. Baza ortonormalna

Niech $V$ będzie skończenie wymiarową przestrzenią Euklidesową (unitarną). Wtedy $V$ ma bazę ortonormalną.


## 11.2. Dopełnienie ortogonalne

### #TODO - def i zadanie 3/L11

## 11.3. Rzuty i rzuty prostopadłe

Rzutem nazywamy przekształcenie liniowe $P: V \rightarrow V$ takie, że $P^2 = P$. O rzucie $P$ mówimy, że jest rzutem na podprzestrzeń $Im P$

# 12. Izometrie i macierze ortogonalne

## 12.1. Izometrie

Izometrią nazywamy przekształcenie liniowe $f: V \rightarrow V$ takie, że $||f(x)|| = ||x||$ dla każdego $x \in V$.

## 12.2. Macierze ortogonalne

Macierz kwadratową $M$ nazywamy ortogonalną, jeśli kolumny są parami ortogonalne oraz są długości 1.

$M$ jest ortogonalna wtedy i tylko wtedy gdy $M^T = M^{-1}$

Macierze ortogonalne są zamknięte na mnożenie, transponowanie i odwracanie.

## 13. Macierze dodatnio określone

Macierz jest dodatnio określona gdy wyznaczniki każdego z jej minorów głównych są dodatnie. (Minory główne - macierze 1x1, 2x2, 3x3...nxn idąc od lewego górnego rogu po przekątnej)

Każdą dodatnio określoną macierz można przedstawić w postaci $A = B^TB$ dla pewnej macierzy B - np. za pomocą rozkładu Cholesky'ego.

<details>
<summary>Sprawdź, czy macierz jest dodatnio określona</summary>
<br>

Macierz A: 
$$
\begin{bmatrix}
1 & 2 & 0 \\
-2 & 2 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

Wyznaczniki minorów głównych:
A1: 1
A2: 6
A3: 6

Wszystkie są dodatnie, więc macierz jest dodatnio określona.

</details>


<br><br>
# Część II - Algebra abstrakcyjna

# 14. Grupy

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

<details>
<summary>Który zbiór z działaniem jest grupą?</summary>
<br>
Sprawdzamy zgodnie z definicją grupy. Najczęstsze przypadki że nie jest:

- Musi istnieć element neutrualny - jedna kolumna i jeden odpowiadający jej wiersz musi nie zmieniać elementów. 
- W każdej kolumnie i wierszu musi być dokładnie jeden egzemplarz każdego elementu.
</details>

<details>
<summary>Tabelka działań grupy obrotów i symetrii kwadratu</summary>

<br>

Mamy 8 elementów: 4 obroty i 4 symetrie które zwrócą nam taki sam kwadrat (symetrycznie ustawiony)

- Obroty: 0, 90, 180, 270
- Symetrie: 0s, 180s, 90s, 270s

Nie zapamiętujemy tabelki - wystarczy potrafić stworzyć obroty i symetrie a następnie je złożyć (można "rysunkowo"). 

| $\circ$ | 0 | 90 | 180 | 270 | 0s | 180s | 90s | 270s |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 90 | 180 | 270 | 0s | 180s | 90s | 270s |
| 90 | 90 | 180 | 270 | 0 | 90s | 270s | 0s | 180s |
| 180 | 180 | 270 | 0 | 90 | 180s | 0s | 270s | 90s |
| 270 | 270 | 0 | 90 | 180 | 270s | 90s | 180s | 0s |
| 0s | 0s | 270s | 180s | 90s | 0 | 90 | 180 | 270 |
| 180s | 180s | 90s | 0s | 270s | 180 | 270 | 0 | 90 |
| 90s | 90s | 0s | 270s | 180s | 90 | 180 | 270 | 0 |
| 270s | 270s | 180s | 90s | 0s | 270 | 0 | 90 | 180 |

</details>

<details>
<summary>Czy X zbiór z działaniem jest grupą? </summary>
<br>

- zbiór liczb naturalnych z dodawaniem? Nie, nie ma elementu neutralnego ani odwrotnego.
- zbiór liczb całkowitych z mnożeniem? Nie, nie ma elementu odwrotnego.
- zbiór liczb postaci 1/k, k całkowite dodatnie, z mnożeniem? Nie, nie ma elementu odwrotnego.
- zbiór liczb wymiernych, z dodawaniem - tak
- zbiór liczb wymiernych bez zera, z mnożeniem, tak

</details>

<br>

## 14.4. Homomorfizm i izomorfizm

Homomorfizm to przekształcenie grup które zachowuje działanie. tj. dla każdego $a,b \in G$ zachodzi $f(a \circ b) = f(a) \circ f(b)$

o jest izomorfizmem jeśli istnieje odwzorowanie odwrotne $o^{-1}$ które jest przekształceniem odwrotnym i homomorfizmem.

### Przykłady
- macierze odwracalne rozmiaru n x n nad F

Homoformizm przekształca element neutrualny w element neutrualny

## 14.5. Rząd elementu (potęga elementu)

Rząd elementu to najmniejsza dodatnia potęga n taka że $a^n = e$ gdzie e to element neutralny.

Potęgą elementu a nazywamy dowolny element postaci $a^n$ gdzie n to liczba całkowita.

## 14.6. Podgrupa

Podgrupa to podzbiór grupy który jest grupą względem tego samego działania.

## 14.7. Grupa cykliczna

Grupa cykliczna to grupa w której istnieje element a taki że każdy inny element grupy można przedstawić jako $a^n$ dla pewnej liczby całkowitej n.

Inaczej: grupa cykliczna generowana jest przez 1 element.

# 15. Grupy permutacji

Grupa permutacji to zbiór wszystkich bijekcji ze zbioru $\{1,2,...,n\}$ w siebie. Operacją jest składanie funkcji. 

($\sigma$*$\sigma'$)($i$) = $\sigma$($\sigma'$($i$)).

Permutacje zapisujemy jako dwuwierszową tabelkę, np:

$\begin{pmatrix}1&2&3&4&5&6&7&8&9&10\\2&3&4&5&6&7&8&9&10&1\end{pmatrix}$

Gdzie w pierwszym wierszu są liczby od 1 do n, a w drugim wierszu liczby po przekształceniu. 

Złożenie - intuicyjnie.

Rząd permutacji - NWW złożenia cykli.

## 15.1. Rozkład permutacji na cykle

Permutację można rozłożyć na cykle. Cykl to permutacja, która przesuwa elementy cyklicznie. Intuicyjnie - gdy w tabelce mamy między innymi przejście 1->2->3->1, możemy zapisać to jako (1,2,3). Tabelkę można zapisać jako iloczyn cykli.

<details>
<summary>
Podaj permutację odwrotną. Rozłóż permutację na cykle. Podaj rząd permutacji.
</summary>
<br>

$\sigma$ =
$\begin{pmatrix}1&2&3&4&5&6&7&8&9&10\\7&4&1&2&9&8&3&5&10&6\end{pmatrix}$


$\sigma^{-1}$ = 
$\begin{pmatrix}7&4&1&2&9&8&3&5&10&6\\1&2&3&4&5&6&7&8&9&10\end{pmatrix}$

teraz posortujmy tabelę rosnąco

$\sigma^{-1}$ =
$\begin{pmatrix}1&2&3&4&5&6&7&8&9&10\\3&4&7&2&8&10&1&6&5&9\end{pmatrix}$

Cykle $\sigma$: (1,7,3), (2,4), (5,9,10,6,8)

Cykle $\sigma^{-1}$: (1,3,7), (2,4), (5,8,6,10,9)

Zauważamy że cykle $\sigma$ i $\sigma^{-1}$ składają się z tych samych elementów - różnią się tylko kolejnością. 

Rząd permutacji = 3 * 2 * 5 = 30

</details>

## 15.2. Parzystość / nieparzystość permutacji

Parzystość permutacji to parzystość ilości jej inwersji. Definicja trochę z dupy, wytłumaczę jak to policzyć poniżej.

### Wzorki związane z parzystością

sgn($\sigma$) = (-1)^k, gdzie k to ilość inwersji w permutacji $\sigma$.

sgn($\sigma$ * $\sigma'$) = sgn($\sigma$) * sgn($\sigma'$)

### Określenie parzystości

Przykładowo - mamy taką permutację której parzystość chcemy określić:

$\sigma$ = 
$\begin{pmatrix}1&2&3&4&5\\1&3&5&4&2\end{pmatrix}$

Pierwszy wiersz jest w dobrej kolejności, patrzymy więc na drugi. Patrzymy na to ile elementów jest jest "na lewo od mniejszego od siebie elementu". Dla tego przypadku:
1 - wszystko git
2 - {3,2} (3 jest na lewo od mniejszego od sb 2)
3 - {5,4}, {5,2} (5 jest na lewo od mniejszego od sb 4, 5 jest na lewo od mniejszego od sb 2)
4 - {4,2}

Mamy więc 4 inwersje, permutacja jest parzysta (a znak permutacji to 1 (dodatnia)).

# 16. Działania grupy na zbiorze

Definicje:

- Orbita - zbiór elementów, które można uzyskać z danego elementu grupy przez działanie grupy.

- Stabilizator - zbiór elementów grupy, które działają na danym elemencie grupy i dają ten sam element grupy. (Taka jakby funkcja identycznościowa ale chyba lepiej tak tego na egzaminie nie nazywać)  

## 16.1. Mnożenie podzbiorów grupy

W podzbiorach grupy zawsze zdefiniowane jest mnożenie. Jest ono łączne. Czasem potrzebna też będzie rozdzielność względem sumy tj. np. (A+B)*C = A*C + B*C.

# 17. Warstwy

Warstwa to podgrupa.

Gdy H <= G to warstwą lewostronną H (w G) są zbiory postaci aH = {ah : h $\in$ H}. 

Warstwą prawostronną H (w G) są zbiory postaci Ha = {ha : h $\in$ H}.

Każde dwie warstwy H w G są równoliczne. Są też rozłączne lub identyczne.


#TODO - reszta o warstwach

# 19. Pierścienie. Arytmetyka modularna

## 19.1. Pierścienie

Pierścień to zbiór R z dwoma działaniami + i * takimi, że:

- (R, +) jest grupą przemienną

- (R, *) jest półgrupą

Ponadto zachodzi rozdzielność mnożenia względem dodawania.

Pierścień jest z jednością, jeśli istnieje element neutralny względem mnożenia. (czyli intuicyjnie - 1)

Pierścień jest przemienny, jeśli mnożenie jest przemienne. (ab = ba)


Przykłady pierścieni:
- Liczby całkowite Z
- Zm: liczby modulo m z dodawaniem i mnożeniem

## 19.2. Arytmetyka modularna

### Przystawanie

a przystaje do b modulo m, jeśli m dzieli a-b.

## 19.3. Algorytm Euklidesa

Algorytm Euklidesa służy do znalezienia NWD dwóch liczb. Jest trochę definicji - ale najprościej zapamiętać jak działa najprostszy algorytm, zdarzały się zadania gdzie trzeba było go zastosować.

Rozszerzony algorytm - przykład:

NWD(13, 5):

13 = 2 * 5 + 3

5 = 1 * 3 + 2

3 = 1 * 2 + 1

2 = 2 * 1 + 0

NWD to ostatnia niezerowa reszta z dzielenia, czyli w tym przypadku 1.

NWD(13, 5) = 1

teraz wyznaczamy reszty z dzielenia w każdym równaniu (oprócz tego z resztą zero - je ignorujemy)

3 = 13 - 2 * 5

2 = 5 - 1 * 3

1 = 3 - 1 * 2

Teraz zaczynamy od końca i podstawiamy kolejne równania do poprzednich:

1 = 3 - 1 * 2 = 3 - 1 * (5 - 1 * 3) = 2 * 3 - 1 * 5 = 2 * (13 - 2 * 5) - 1 * 5 = 2 * 13 - 5 * 5

Wyznaczyliśmy równanie diofantyczne: NWD(13, 5) = 1 = 2 * 13 - 5 * 5


## 19.4. Elementy odwracalne

Element a pierścienia R nazywamy odwracalnym, jeśli istnieje element b taki, że ab = ba = 1. Element b nazywamy wtedy elementem odwrotnym do a.

## 19.5. Chińskie twierdzenie o resztach

(Inna definicja niż w skrypcie (z blackpenredpen, bardziej zrozumiała ale możliwe że zła XD))

Jeśli m1, m2 ..., mk są parami względnie pierwsze, to zbiór rozwiązań układu równań:

x1 = a1 (mod m1)
x2 = a2 (mod m2)
...
xk = ak (mod mk)

jest niepusty i składa się z jednego elementu modulo N = m1 * m2 * ... * mk.

### Równania, układy równań modulo

<details><summary>Układ równań modulo (naturalne)</summary>

```
x === 1 (mod 3)
x === 4 (mod 5)
x === 6 (mod 7)

x = 3k + 1

3k + 1 === 4 (mod 5)
3k === 3 (mod 5)     | * 2
k === 1 (mod 5)
k = 5l + 1

x = 3(5l + 1) + 1
x = 15l + 4

15l + 4 === 6 (mod 7)
15l === 2 (mod 7)
l === 2 (mod 7)
l = 7m + 2

x = 15(7m + 2) + 4
x = 105m + 34

Odpowiedź jest w postaci 105m + 34

Najmniejsza nieujemna liczba spełniająca to równanie to 34.
```

</details>

<details><summary>Drugi przykład (z listy zadań)</summary>

```
x mod 7 = 1
x mod 5 = 4

najpierw zapiszmy bardziej przejrzyście:

x === 1 (mod 7)
x === 4 (mod 5)

x = 7k + 1
7k+1 === 4 mod 5
7k === 3 mod 5
2k === 3 mod 5    | * 3
k === 4 mod 5
k = 5m + 4

x = 7(5m + 4) + 1
x = 35m + 29

Odp: 29

```

</details>

### Elementy odwrotne modulo

Element a jest odwracalny modulo m, jeśli istnieje element b taki, że ab === 1 (mod m).

Inaczej: NWD(a, m) = 1

Najtrudniejsze co się znalazło w tym roku na liście to znalezienie elementu odwrotnego modulo 15. (8^-1 (mod 15)). Na egzaminach były o wiele trudniejsze - ale listy 15 i 16 mają być pobieżnie więc modlimy się żeby tego nie było.


<details><summary>Przykład: 8^-1 (mod 15)</summary>

```
NWD(8, 15) = 1 - istnieje więc element odwrotny

Rozwiązujemy równanie:

8x === 1 (mod 15)  | * 2
x === 2 (mod 15)

Element odwrotny to 2.
```

Jako że nie mamy posranie wielkich mod to nie musimy robić rozszerzonego algorytmu Euklidesa.

</details>

# 20. Wielomiany

## 20.1. Pierścień wielomianów

Pierścień wielomianów o współczynnikach z pierścienia R oznaczamy R[x]. Elementy tego pierścienia to wielomiany o współczynnikach z R.

Działania działają intuicyjnie. deg(f) tak samo.

## 20.3. Dzielenie i NWD wielomianów

#TODO