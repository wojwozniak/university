Szybkie i proste podsumowanie list 1-6 przed sprawdzianem

Spis treści
=================
- [Spis treści](#spis-treści)
  - [Lista 1](#lista-1)
    - [Zadania typu "czy wynik jest wiarygodny?"](#zadania-typu-czy-wynik-jest-wiarygodny)
    - [Wyznacz dla ilu wyrazów suma ciągu naprzemiennego jest wiarygodna](#wyznacz-dla-ilu-wyrazów-suma-ciągu-naprzemiennego-jest-wiarygodna)
    - [Funkcja dokładna tylko w zadanych przedziale](#funkcja-dokładna-tylko-w-zadanych-przedziale)
  - [Lista 2](#lista-2)
    - [Jednoznaczność przedstawienia liczby w systemie dwójkowym](#jednoznaczność-przedstawienia-liczby-w-systemie-dwójkowym)
    - [Szacowanie błędów](#szacowanie-błędów)
    - [Dokładniejsze liczenie niewiarygodnych wyników](#dokładniejsze-liczenie-niewiarygodnych-wyników)
  - [Lista 3](#lista-3)
    - [Uwarunkowanie zadania](#uwarunkowanie-zadania)
    - [Błędy, tw. o kumulacji błedów](#błędy-tw-o-kumulacji-błedów)
  - [Lista 4](#lista-4)
    - [Metoda bisekcji](#metoda-bisekcji)
    - [Metoda Newtona](#metoda-newtona)
  - [Lista 5](#lista-5)
    - [Metoda siecznych](#metoda-siecznych)
    - [Regula falsi](#regula-falsi)
    - [Zbieżność ciągów](#zbieżność-ciągów)
    - [Liczenie wykładnika zbieżności](#liczenie-wykładnika-zbieżności)
  - [Lista 6](#lista-6)
    - [Algorytm Clenshawa](#algorytm-clenshawa)
    - [Wielomiany Czebyszewa](#wielomiany-czebyszewa)
    - [Interpolacja Lagrange'a](#interpolacja-lagrangea)



## [Lista 1](AllTasklists/an-lista-01.pdf)

### Zadania typu "czy wynik jest wiarygodny?"

Najczęstszym problemem jest odejmowanie dwóch prawie równych liczb. Zwykle możemy przekształcić funkcję tak, by uniknąć takich operacji.

### Wyznacz dla ilu wyrazów suma ciągu naprzemiennego jest wiarygodna

Wyliczamy wyraz mniejszy niż zadana dokładność (np. 1e-6). Musimy zsumować jedynie wszystkie wcześniejsze wyrazy.

### Funkcja dokładna tylko w zadanych przedziale

Raczej funkcja trygonometryczna - wzorami redukcyjnymi przesuwamy argument do przedziału, w którym funkcja jest dokładna.

## [Lista 2](AllTasklists/an-lista-02.pdf)

### Jednoznaczność przedstawienia liczby w systemie dwójkowym

Najprościej nie wprost - zakładamy że istnieją dwie i rozważamy ich różnicę na przypadki.

### Szacowanie błędów

Bierzemy max błąd i rozpisujemy. Pamiętamy o opcji wyjęcia 2^x przed nawias i wyliczenia reszty ze wzoru na sumę ciągu geometrycznego.

### Dokładniejsze liczenie niewiarygodnych wyników

Przekształcenia algebraiczne, ew. szereg Taylora.

![Wzór na szereg Taylora](https://latex.codecogs.com/svg.latex?%5Csum_%7Bn%3D0%7D%5E%7B%5Cinfty%7D%20%5Cfrac%7Bf%5E%7B%28n%29%7D%28a%29%7D%7Bn%21%7D%28x-a%29%5En)

## [Lista 3](AllTasklists/an-lista-03.pdf)

### Uwarunkowanie zadania

Wzór to:
```
cond(x) = ( względna zmiana wyniku / względna zmiana danych )
```
im mniej tym lepiej - można przekształcić do bardziej użytecznego

```
cond(x) = (x * f'(x)) / f(x)
```

Liczymy granicę cond(x) w ciekawych miejscach, szukamy gdzie idzie w nieskończoność.


### Błędy, tw. o kumulacji błedów

Każdy błąd (mnożenia, dodawania, liczenia jakiejś funkcji, wprowadzenia)<= 2^(-t). Błędy się kumulują - pamiętamy jednak że przy skumulowaniu błąd jest mniejszy lub prawie równy, nie mniejszy lub równy.

Dosyć częstym wynikiem jest algorytm numerycznie poprawny dla lekko zaburzonych danych.


## [Lista 4](AllTasklists/an-lista-04.pdf)

### Metoda bisekcji
Metoda szacowania wartości funkcji. Wybieramy przedział, liczymy wartość po środku, bierzemy jego połowę. Rozmiar przedziału w n-tym kroku to 
```
(b0-a0) / 2^n
```
Błąd jest mniejszy niż połowa rozmiaru przedziału. Wartość z zadanym błędem obliczymy w 
```
n = ceil(log2((b0-a0)/2eps))
```
krokach. Błąd może raz na jakiś czas wzrosnąć (ale mieścić się będzie w przedziale).

### Metoda Newtona

```
x_n+1 = x_n - f(x_n) / f'(x_n)
```

Wzór można przekształcać w zależności od potrzeb i reprezentacji liczby (np. dla zapisu z cechą i mantysą, lub do liczenia n-krotnych zer)

## [Lista 5](AllTasklists/an-lista-05.pdf)

### Metoda siecznych

```
x_n+1 = x_n - f(x_n) * (x_n - x_n-1) / (f(x_n) - f(x_n-1))
```

### Regula falsi

Zakładamy że im bliżej zera, tym bardziej funkcja przypomina prostą. Prowadzimy prostą z a,f(a) do b,f(b)   i szukamy jej przecięcia z osią OX. Przesuwamy a lub b w zależności od znaku f(x) w punkcie przecięcia.

### Zbieżność ciągów

Granica w nieskończoności równa 0 - ciąg zbieżny. Jak zbieżny? - wzór:
```
lim n->inf x_n+1 / (x_n)^p = X
```
Gdzie X > 0, a p to wykładnik zbieżności (np. p=2 zbieżny kwadratowo)

### Liczenie wykładnika zbieżności

```
lim n->inf p = log(abs(eps_n+1 / eps_n)) / log(abs(eps_n / eps_n-1))
```

## [Lista 6](AllTasklists/an-lista-06.pdf)

### Algorytm Clenshawa

redukuje się do 1/2(b0-b2)

### Wielomiany Czebyszewa

```
T0 = 1
T1 = x
Tn+1 = 2xTn - Tn-1

Tn(x) = cos(n * arccos(x)) ; x należy do < -1,1 >

Tkl(x) = Tk(Tl(x))
```

### Interpolacja Lagrange'a

Zawsze istnieje jednoznaczna interpolacja wielomianowa stopnia n dla n+1 punktów.

```
L(x) = sum i=0..n (yi * li(x))
li(x) = sum j=0..n (j!=i) (x-xj) / (xi-xj)
```