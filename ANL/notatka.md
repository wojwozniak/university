# Analiza Numeryczna (L) - notatka

Podsumowanie materiału z Analizy Numerycznej przed egzaminem. Skrótowe notatki z wykładu i przykładowe rozwiązania typowych zadań. 

Zobacz też notatkę od whiskeyo, tam jest dokładniej rozpisana teoria (i dosyć dużo tego co jest tutaj na niej bazuje)

## Spis treści
- [Analiza Numeryczna (L) - notatka](#analiza-numeryczna-l---notatka)
  - [Spis treści](#spis-treści)
  - [Teoria wstępna](#teoria-wstępna)
    - [Błąd bezwzględny i względny](#błąd-bezwzględny-i-względny)
    - [Reprezenacja liczb w komputerze](#reprezenacja-liczb-w-komputerze)
      - [Zadania L14.1-L14.2 (reprezentacja i przesuwanie arg.)](#zadania-l141-l142-reprezentacja-i-przesuwanie-arg)
    - [Zaokrąglenia](#zaokrąglenia)
    - [Nadmiar i niedomiar](#nadmiar-i-niedomiar)
    - [Działania na liczbach zmiennoprzecinkowych - błąd](#działania-na-liczbach-zmiennoprzecinkowych---błąd)
    - [Twierdzenie o kumulacji błędów](#twierdzenie-o-kumulacji-błędów)
    - [Zjawisko utraty cyfr znaczących](#zjawisko-utraty-cyfr-znaczących)
        - [Zadanie L14.8 Wytłumacz kiedy występuje i na czym polega zjawisko utraty cyfr znaczących wyniku. Dla jakich wartości x obliczanie wartości wyrażenia $(sqrt(x^2+2) + x)^{-1}$ może wiązać się z utratą cyfr znaczących wyniku? Zaproponuj sposób obliczenia wynioku dokładniejszego.](#zadanie-l148-wytłumacz-kiedy-występuje-i-na-czym-polega-zjawisko-utraty-cyfr-znaczących-wyniku-dla-jakich-wartości-x-obliczanie-wartości-wyrażenia-sqrtx22--x-1-może-wiązać-się-z-utratą-cyfr-znaczących-wyniku-zaproponuj-sposób-obliczenia-wynioku-dokładniejszego)
      - [Zadanie z listy - jak naprawić utratę cyfr znaczących?](#zadanie-z-listy---jak-naprawić-utratę-cyfr-znaczących)
  - [Uwarunkowanie zadania i numeryczna poprawność](#uwarunkowanie-zadania-i-numeryczna-poprawność)
    - [Wzór na uwarunkowanie zadania](#wzór-na-uwarunkowanie-zadania)
    - [Algorytm numerycznie poprawny](#algorytm-numerycznie-poprawny)
    - [Zadania z uwarunkowaniem (L14.3-L14.7):](#zadania-z-uwarunkowaniem-l143-l147)
        - [Zadanie L14.4 - Sprawdź, czy zadanie jest dobrze uwarunkowane:](#zadanie-l144---sprawdź-czy-zadanie-jest-dobrze-uwarunkowane)
        - [Zadanie L14.5 Podaj definicję zadania źle uwarunkowanego, a następne zbadaj uwarunkowanie zadania obliczania wartości funkcji $f(x) = cos(x)$ dla $x \\in \\mathbb{R}$](#zadanie-l145-podaj-definicję-zadania-źle-uwarunkowanego-a-następne-zbadaj-uwarunkowanie-zadania-obliczania-wartości-funkcji-fx--cosx-dla-x-in-mathbbr)
        - [Zadanie L14.6 - Załóżmy że x0, x1, ..., xn są tego samego znaku. Uzasadnij, że zadanie obliczenia ich sumy jest zadaniem dobrze uwarunkowanym. Jakie znaczenie ma w kontekście obliczeń numerycznych?](#zadanie-l146---załóżmy-że-x0-x1--xn-są-tego-samego-znaku-uzasadnij-że-zadanie-obliczenia-ich-sumy-jest-zadaniem-dobrze-uwarunkowanym-jakie-znaczenie-ma-w-kontekście-obliczeń-numerycznych)
        - [Zadanie L14.7 - Wyprowadź wzór na wskaźnik uwarunkowania zadania obliczania wartości funkcji $f$ w punkcie x. Wartość funkcji $f(x) = e^{5x}$ obliczamy w punkcie x ~= 0.8. Jak dużej utraty dwójkowych cyfr znaczących należy się spodziewać, jeżeli x odbiega od 0.8 o jedną dwójkową cyfrę znaczącą?](#zadanie-l147---wyprowadź-wzór-na-wskaźnik-uwarunkowania-zadania-obliczania-wartości-funkcji-f-w-punkcie-x-wartość-funkcji-fx--e5x-obliczamy-w-punkcie-x--08-jak-dużej-utraty-dwójkowych-cyfr-znaczących-należy-się-spodziewać-jeżeli-x-odbiega-od-08-o-jedną-dwójkową-cyfrę-znaczącą)


## Teoria wstępna

### Błąd bezwzględny i względny

Błąd bezwzględny: $|x-x_{appr}|$


Błąd względny: $\frac{|x-x_{appr}|}{|x|}$

### Reprezenacja liczb w komputerze

Całkowite: $x = \pm \sum_{i=0}^{n-1} a_i 2^i$ gdzie $a_i \in \{0,1\}$ (a więc suma odpowiednich potęg dwójki)

Rzeczywiste: $x = s * m * 2^c$ gdzie $s \in \{-1,1\}$, $m \in [1/2, 1)$, $c$ całkowity wykładnik

#### Zadania L14.1-L14.2 (reprezentacja i przesuwanie arg.)

<details>
<summary>
  L14.1 #TODO Udowodnij, że dodatnia liczba rzeczywista ma skończone rozwinięcie dwójkowe wtedy i tylko wtedy gdy jest postaci m / 2^n
</summary>

<br/>

$x = s * m * 2^c$ gdzie $s \in \{-1,1\}$, $m \in [1/2, 1)$, $c$ całkowity wykładnik

Dodatnia liczba, więc wyrzucamy $s$.

```
Dokończyć
```
</details>

<details>

<summary>
  L14.2 PWO++ - cos(x) liczy dokładnie dla x = [0, Pi/2]. Podaj algorytm liczący dokładnie dla [-2Pi, 2Pi].
</summary>

<br/>

```
Zaczynamy zadanie od narysowania wykresu. Zauważymy wtedy gdzie fragmenty funkcji się powtarzają.

W naszym przypadku:
- x = [-2Pi, 0]: przesuwamy o 2Pi w prawo, mamy już tylko [0, 2Pi]
- x = [Pi, 2Pi]: zmieniamy argument na 2Pi - x, mamy [0, Pi]
- x = [Pi/2, Pi]: obliczamy dla x - Pi/2 i mnożymy przez -1, mamy [0, Pi/2] - gotowe

Algorytm liczy więc dla [0, Pi/2] i w zależności od wyniku stosuje odpowiednie przekształcenia:
```

</details>


### Zaokrąglenia

Obcięcie: $chop(x) = \sum_{i=0}^{n-1} a_i 2^i$ (odrzucamy resztę bitów)

Zaokrąglenie: $rd(x) = \sum_{i=0}^{n-1} a_i 2^i + \frac{1}{2} 2^n$ (dodajemy $\frac{1}{2}$ do ostatniego bitu)

### Nadmiar i niedomiar

Dla D = 2^cmax, cmax to maksymalny wykładnik:

Nadmiar (overflow): $x \in (-inf, -D]  \cup [D, inf)$

Niedomiar (underflow): $x \in (- 1/2D, 1/2D)  /{0}$

### Działania na liczbach zmiennoprzecinkowych - błąd

Dla każdego działania arytmetycznego na liczbach zmiennoprzecinkowych błąd wynosi co najwyżej $2^{-t}$ gdzie $t$ to liczba bitów mantysy

### Twierdzenie o kumulacji błędów

Dla $n$ operacji arytmetycznych na liczbach zmiennoprzecinkowych błąd wynosi co najwyżej $n2^{-t}$ . Ważne - mniejszy lub prawie równy, nie mniejszy lub równy.


### Zjawisko utraty cyfr znaczących

Dla $x,y \in \mathbb{R}$, $x \neq y$ i $x,y$ są blisko siebie, to $x-y$ może być obarczone dużym błędem.

Zjawisko to bierze się z reprezentacji liczb w komputerze. By wytłumaczyć skąd się bierze zauważmy trzy fakty: 

1) Odejmując bardzo bliskie sobie liczby, otrzymujemy bardzo malutki ułamek. 
2) Liczby przechowujemy w określonej dokładności - cyfry mantysy bardzo daleko po przecinku nie są przechowywane.
3) Mantysa ma mieć wartość w przedziale $[1/2, 1)$.

Łącząc te fakty - po odjęciu tych liczb dostaniemy malutki ułamek który musimy "przesunąć" w zakres mantysy. Po przesunięciu nie wiemy jakie były bardziej oddalone cyfry, więc nie wiemy jaką wartość przyjąć. W efekcie otrzymujemy błąd.

##### Zadanie L14.8 Wytłumacz kiedy występuje i na czym polega zjawisko utraty cyfr znaczących wyniku. Dla jakich wartości x obliczanie wartości wyrażenia $(sqrt(x^2+2) + x)^{-1}$ może wiązać się z utratą cyfr znaczących wyniku? Zaproponuj sposób obliczenia wynioku dokładniejszego.

<details>

<summary>Rozwiązanie L14.8</summary>

<br />

```
Wytłumaczenie powyżej.

W naszym przypadku problem będzie dla ujemnych x - konkretniej takich dla których sqrt(x^2 + 2) jest bliskie x.

Zaproponowany sposób obliczenia dokładniejszego:

Przekształcamy wyrażenie, przenosząc niewymierne wyrażenie do licznika. 
Otrzymujemy wtedy:
```
$\frac{\sqrt(x^2 + 2) - x}{2}$

```
W liczniku mamy spokój, bo nie znajdziemy takiego x by było bliskie sqrt(x^2 + 2). W mianowniku mamy 2, więc git. Nie będziemy mieli więc żadnych dziwnych artefaktów.
```

</details>


#### Zadanie z listy - jak naprawić utratę cyfr znaczących?


L2) $f(x) = 14\frac{1-cos(17x)}{x^2}$

<details>
<summary>Rozwiązanie L2</summary>

```
Dla x bliskiego 0 odejmujemy dwie bardzo bliskie sobie liczby. możemy więc tracić cyfry znaczące. Aby tego uniknąć, możemy zastosować wzór Taylora dla cos(17x). Po policzeniu pierwszym wyrazem we wzorze będzie 2023 (przy dalszych wyrazach jakieś xsy). Licząc granicę głównego wyrażenia otrzymujemy 2023, więc będzie szło to w dobrym kierunku.
```
</details>


## Uwarunkowanie zadania i numeryczna poprawność

Zadanie jest źle uwarunkowane, jeśli mała zmiana danych powoduje dużą zmianę wyniku. 

### Wzór na uwarunkowanie zadania

Wskaźnik uwarunkowania określamy wzorem $cond(x) = \frac{\Delta f}{\Delta x}$. Jeśli $cond(x)$ jest bliskie 1, to zadanie jest dobrze uwarunkowane, w przeciwnym wypadku źle uwarunkowane.

Można wyprowadzić dokładniejszy wzór:
$cond(x) = \frac{x * f'(x)}{f(x)}$


### Algorytm numerycznie poprawny

Algorytm jest numerycznie poprawny, jeśli wynik jego działania może być zinterpretowany jako mało zaburzony dokładny wynik dla mało zaburzonych danych.
$fl(A(a)) = A(a * (1 + \beta)) * (1 + \alpha)$

gdzie $\beta$ to zaburzenie danych, a $\alpha$ to zaburzenie wyniku.


### Zadania z uwarunkowaniem (L14.3-L14.7):

<details>
<summary>
  L14.3 Jakie znaczenie z punktu widzenia analizy numerycznej ma pojęcia uwarunkowania zadania?
</summary>

<br/>

```
Ma bardzo duże znaczenie. Jeśli zadanie jest źle uwarunkowane, to nawet jeśli algorytm jest numerycznie poprawny, to wynik może być bardzo odległy od prawdziwego.
```

</details>

##### Zadanie L14.4 - Sprawdź, czy zadanie jest dobrze uwarunkowane:

a) $f(x) = ln(x)$

<details>
<summary>Rozwiązanie a)</summary>

```
f(x) = ln(x)
f'(x) = 1/x
cond(x) = x * 1/x / ln(x) = 1 / ln(x)

Zadanie jest źle uwarunkowane dla x bliskiego 0

```
</details>
<br/><br/>

b) $f(x) = (x-1)^{10}$

<details>
<summary>Rozwiązanie b)</summary>

```
f(x) = (x-1)^10
f'(x) = 10(x-1)^9
cond(x) = x * 10(x-1)^9 / (x-1)^10 = 10x / (x-1) = 10 + 10 / (x-1)

Zadanie jest źle uwarunkowane dla x bliskiego 1
```
</details>

##### Zadanie L14.5 Podaj definicję zadania źle uwarunkowanego, a następne zbadaj uwarunkowanie zadania obliczania wartości funkcji $f(x) = cos(x)$ dla $x \in \mathbb{R}$

<details>
<summary>Rozwiązanie L14.5</summary>

<br />

```
Zadanie źle uwarunkowane to takie, które ma duży wskaźnik uwarunkowania - można to sprawdzić licząc cond(x) dla danego zadania.
cond(x) = x * f'(x) / f(x)

W naszym przypadku:
f(x) = cos(x)
f'(x) = -sin(x)
cond(x) = x * -sin(x) / cos(x) = -x * tan(x)

Zadanie jest źle uwarunkowane dla x bliskiego Pi/2 + kPi, gdzie k jest liczbą całkowitą - wtedy tan(x) jest bardzo duże.

```

</details>

##### Zadanie L14.6 - Załóżmy że x0, x1, ..., xn są tego samego znaku. Uzasadnij, że zadanie obliczenia ich sumy jest zadaniem dobrze uwarunkowanym. Jakie znaczenie ma w kontekście obliczeń numerycznych?

<details>
<summary>Rozwiązanie L14.6</summary>

<br />

```
Zadanie jest dobrze uwarunkowane, bo cond(x) = 1. Wystarczy policzyć cond(x) dla sumy x0 + x1 + ... + xn:

cond(x) = (x0 + x1 + ... + xn) * 1 / (x0 + x1 + ... + xn) = 1
```

</details>

##### Zadanie L14.7 - Wyprowadź wzór na wskaźnik uwarunkowania zadania obliczania wartości funkcji $f$ w punkcie x. Wartość funkcji $f(x) = e^{5x}$ obliczamy w punkcie x ~= 0.8. Jak dużej utraty dwójkowych cyfr znaczących należy się spodziewać, jeżeli x odbiega od 0.8 o jedną dwójkową cyfrę znaczącą?


<details>

<summary>Rozwiązanie L14.7 #TODO dokończyć</summary>

<br />

```
Wskaźnik uwarunkowania to stosunek względnej zmiany wyniku do względnej zmiany danych:
Względna zmiana danych: (x + d) - x / x = d / x
Względna zmiana wyniku: (f(x+d) - f(x)) / f(x) 

cond(x) = (f(x+d) - f(x)) / f(x) * (x/d) =  
(f(x+d) - f(x))/d * d/f(x) * x/d = 
(f'(x) * x)/f(x)
Wzór wyprowadzony. 
Pamiętajmy że: f(x + d) - f(x) / d = f'(x)
```

```
Nasz przykład:
f(x) = e^(5x)
f'(x) = 5e^(5x)
cond(x) = (5e^(5x) * x) / e^(5x) = 5x
Zadanie jest dobrze uwarunkowane dla naszego x.
Jak dużej utraty dwójkowych cyfr znaczących należy się spodziewać, jeżeli x odbiega od 0.8 o jedną dwójkową cyfrę znaczącą? #TODO

```

</details>