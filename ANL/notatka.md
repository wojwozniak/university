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
        - [Zadanie L2.8 - jak naprawić utratę cyfr znaczących?](#zadanie-l28---jak-naprawić-utratę-cyfr-znaczących)
        - [Zadanie L3.1 - jak naprawić utratę cyfr znaczących?](#zadanie-l31---jak-naprawić-utratę-cyfr-znaczących)
          - [a) $f(x) = \\frac{1}{x^3 + \\sqrt{x^6+2023^2}}$](#a-fx--frac1x3--sqrtx620232)
          - [b) $f(x) = log\_2(x) - 2$](#b-fx--log_2x---2)
          - [c) $f(x) = x^{-3}(\\Pi / 2 - x - arctg(x))$](#c-fx--x-3pi--2---x---arctgx)
  - [Uwarunkowanie zadania i numeryczna poprawność](#uwarunkowanie-zadania-i-numeryczna-poprawność)
    - [Wzór na uwarunkowanie zadania](#wzór-na-uwarunkowanie-zadania)
    - [Algorytm numerycznie poprawny](#algorytm-numerycznie-poprawny)
    - [Zadania z uwarunkowaniem (L14.3-L14.7):](#zadania-z-uwarunkowaniem-l143-l147)
        - [Zadanie L14.4 - Sprawdź, czy zadanie jest dobrze uwarunkowane:](#zadanie-l144---sprawdź-czy-zadanie-jest-dobrze-uwarunkowane)
        - [Zadanie L14.5 Podaj definicję zadania źle uwarunkowanego, a następne zbadaj uwarunkowanie zadania obliczania wartości funkcji $f(x) = cos(x)$ dla $x \\in \\mathbb{R}$](#zadanie-l145-podaj-definicję-zadania-źle-uwarunkowanego-a-następne-zbadaj-uwarunkowanie-zadania-obliczania-wartości-funkcji-fx--cosx-dla-x-in-mathbbr)
        - [Zadanie L14.6 - Załóżmy że x0, x1, ..., xn są tego samego znaku. Uzasadnij, że zadanie obliczenia ich sumy jest zadaniem dobrze uwarunkowanym. Jakie znaczenie ma w kontekście obliczeń numerycznych?](#zadanie-l146---załóżmy-że-x0-x1--xn-są-tego-samego-znaku-uzasadnij-że-zadanie-obliczenia-ich-sumy-jest-zadaniem-dobrze-uwarunkowanym-jakie-znaczenie-ma-w-kontekście-obliczeń-numerycznych)
        - [Zadanie L14.7 - Wyprowadź wzór na wskaźnik uwarunkowania zadania obliczania wartości funkcji $f$ w punkcie x. Wartość funkcji $f(x) = e^{5x}$ obliczamy w punkcie x ~= 0.8. Jak dużej utraty dwójkowych cyfr znaczących należy się spodziewać, jeżeli x odbiega od 0.8 o jedną dwójkową cyfrę znaczącą?](#zadanie-l147---wyprowadź-wzór-na-wskaźnik-uwarunkowania-zadania-obliczania-wartości-funkcji-f-w-punkcie-x-wartość-funkcji-fx--e5x-obliczamy-w-punkcie-x--08-jak-dużej-utraty-dwójkowych-cyfr-znaczących-należy-się-spodziewać-jeżeli-x-odbiega-od-08-o-jedną-dwójkową-cyfrę-znaczącą)
        - [#TODO - Zadanie L14.9: $x^{-5}(sin(3x) - 3x + 9x^3 / 2)$ - obliczanie dla x ~= 0 może wiązać się z utratą cyfr znaczących wyniku. Zakładając że |x| \<= 1/10, zaproponuj sposób obliczenia wyniku z błędem mniejszym niż $10^{-7}$](#todo---zadanie-l149-x-5sin3x---3x--9x3--2---obliczanie-dla-x--0-może-wiązać-się-z-utratą-cyfr-znaczących-wyniku-zakładając-że-x--110-zaproponuj-sposób-obliczenia-wyniku-z-błędem-mniejszym-niż-10-7)
        - [Zadanie L14.10 - Podaj w miarę bezpieczny numerycznie algorytm obliczania zer równania kwadratowego $ax^2 + bx + c = 0$ dla $a \\neq 0$. Zastosowaną strategię uzasadnij odwołując się do omówionych na wykładzie problemów wynikających z przyjętego modelu arytmetyki zmiennoprzecinkowej.](#zadanie-l1410---podaj-w-miarę-bezpieczny-numerycznie-algorytm-obliczania-zer-równania-kwadratowego-ax2--bx--c--0-dla-a-neq-0-zastosowaną-strategię-uzasadnij-odwołując-się-do-omówionych-na-wykładzie-problemów-wynikających-z-przyjętego-modelu-arytmetyki-zmiennoprzecinkowej)
        - [Zadanie L14.11: Do rozwiązania zadania obliczeniowego $A$ użyto komputera i algorytmu numerycznie poprawnego. Czy można mieć pewność, że otrzymany w ten sposób wynik jest bliski dokładnemu wynikowi zadania $A$? Odpowiedź uzasadnij.](#zadanie-l1411-do-rozwiązania-zadania-obliczeniowego-a-użyto-komputera-i-algorytmu-numerycznie-poprawnego-czy-można-mieć-pewność-że-otrzymany-w-ten-sposób-wynik-jest-bliski-dokładnemu-wynikowi-zadania-a-odpowiedź-uzasadnij)
        - [Zadanie L14.12, L14.13: Sprawdź, czy algorytm jest algorytmem numerycznie poprawnym:](#zadanie-l1412-l1413-sprawdź-czy-algorytm-jest-algorytmem-numerycznie-poprawnym)
  - [Rozwiązywanie równań nieliniowych](#rozwiązywanie-równań-nieliniowych)
    - [Metoda bisekcji](#metoda-bisekcji)
      - [Własności metody (zadanie L14.15):](#własności-metody-zadanie-l1415)
    - [Metoda Newtona (stycznych)](#metoda-newtona-stycznych)
      - [Własności metody](#własności-metody)
        - [Zadanie L14.17 - Niech $\\alpha$ będzie zerowym miejscem funkcji f (f($\\alpha$) = 0, f'($\\alpha$) $\\not=$ 0). Udowodnij że wówczas rząd zbieżności metody Newtona wynosi 2.](#zadanie-l1417---niech-alpha-będzie-zerowym-miejscem-funkcji-f-falpha--0-falpha-not-0-udowodnij-że-wówczas-rząd-zbieżności-metody-newtona-wynosi-2)
        - [Zadanie L14.18: zaproponuj efektywny algorytm obliczania z dużą dokładnością wartości $\\sqrt{a}$ wykorzystując jedynie operacje arytmetyczne (+, -, \*, /)](#zadanie-l1418-zaproponuj-efektywny-algorytm-obliczania-z-dużą-dokładnością-wartości-sqrta-wykorzystując-jedynie-operacje-arytmetyczne-----)
    - [Metoda siecznych](#metoda-siecznych)
      - [Własności metody](#własności-metody-1)
    - [Wykładnik zbieżności ciągu (rząd metody)](#wykładnik-zbieżności-ciągu-rząd-metody)
        - [Zadanie L14.20: Podaj efektywny algorytm wyznaczania liczby naturalnej a, której cyframi dziesiętnymi (od najbardziej do najmniej znaczącej) są a\_n, a\_n-1, ..., a\_0, gdzie a\_n != 0](#zadanie-l1420-podaj-efektywny-algorytm-wyznaczania-liczby-naturalnej-a-której-cyframi-dziesiętnymi-od-najbardziej-do-najmniej-znaczącej-są-a_n-a_n-1--a_0-gdzie-a_n--0)
  - [Interpolacja wielomianowa](#interpolacja-wielomianowa)
    - [Postaci wielomianów](#postaci-wielomianów)
      - [Postać naturalna potęgowa](#postać-naturalna-potęgowa)
      - [Postać Newtona](#postać-newtona)
    - [Postać Czebyszewa](#postać-czebyszewa)
  - [Schemat Hornera](#schemat-hornera)
  - [Uogólniony schemat Hornera](#uogólniony-schemat-hornera)
  - [Algorytm Clenshawa - #TODO](#algorytm-clenshawa---todo)
  - [Interpolacja wielomianowa Lagrange'a](#interpolacja-wielomianowa-lagrangea)
  - [Doliczanie kolejnego punktu](#doliczanie-kolejnego-punktu)
  - [Ilorazy różnicowe](#ilorazy-różnicowe)
  - [Błąd interpolacji Lagrange'a](#błąd-interpolacji-lagrangea)
  - [Naturalna Interpolacyjna Funkcja Sklejana 3. stopnia](#naturalna-interpolacyjna-funkcja-sklejana-3-stopnia)
    - [Konstrukcja NIFS3](#konstrukcja-nifs3)
  - [Krzywe parametryczne](#krzywe-parametryczne)


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
$\frac{\sqrt{x^2 + 2} - x}{2}$

```
W liczniku mamy spokój, bo nie znajdziemy takiego x by było bliskie sqrt(x^2 + 2). W mianowniku mamy 2, więc git. Nie będziemy mieli więc żadnych dziwnych artefaktów.
```

</details>


##### Zadanie L2.8 - jak naprawić utratę cyfr znaczących?


L2.8) $f(x) = 14\frac{1-cos(17x)}{x^2}$

<details>
<summary>Rozwiązanie L2.8</summary>

```
Dla x bliskiego 0 odejmujemy dwie bardzo bliskie sobie liczby. możemy więc tracić cyfry znaczące. Aby tego uniknąć, możemy zastosować wzór Taylora dla cos(17x). Po policzeniu pierwszym wyrazem we wzorze będzie 2023 (przy dalszych wyrazach jakieś xsy). Licząc granicę głównego wyrażenia otrzymujemy 2023, więc będzie szło to w dobrym kierunku.
```
</details>


##### Zadanie L3.1 - jak naprawić utratę cyfr znaczących?

###### a) $f(x) = \frac{1}{x^3 + \sqrt{x^6+2023^2}}$ 
###### b) $f(x) = log_2(x) - 2$
###### c) $f(x) = x^{-3}(\Pi / 2 - x - arctg(x))$

<details>
<summary>Rozwiązania L3.1</summary>
<br />

```
a) podobne do L14.8 powyżej, niewymierność do licznika i obraca się znak
b) log_2(x) - 2 = log_2(x / 4) - usuwamy odejmowanie, dzielenie jest bezpieczne
c) Przerabiamy na arctg(x), potem Taylor
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


#####  #TODO - Zadanie L14.9: $x^{-5}(sin(3x) - 3x + 9x^3 / 2)$ - obliczanie dla x ~= 0 może wiązać się z utratą cyfr znaczących wyniku. Zakładając że |x| <= 1/10, zaproponuj sposób obliczenia wyniku z błędem mniejszym niż $10^{-7}$


##### Zadanie L14.10 - Podaj w miarę bezpieczny numerycznie algorytm obliczania zer równania kwadratowego $ax^2 + bx + c = 0$ dla $a \neq 0$. Zastosowaną strategię uzasadnij odwołując się do omówionych na wykładzie problemów wynikających z przyjętego modelu arytmetyki zmiennoprzecinkowej.

<details>
<summary>Rozwiązanie L14.10</summary>

<br />

```
delta = b^2 - 4ac
x1 = -b - sqrt(delta) / 2a
x2 = -b + sqrt(delta) / 2a

Problem jest przy x2, bo odejmujemy dwie bardzo bliskie sobie liczby. x1 jest bezpieczny. Możemy obliczyć x1 normalnie, a x2 obliczyć z wzoru Viete'a:

x1 * x2 = c/a

x2 = c/a / x1

```

</details>


##### Zadanie L14.11: Do rozwiązania zadania obliczeniowego $A$ użyto komputera i algorytmu numerycznie poprawnego. Czy można mieć pewność, że otrzymany w ten sposób wynik jest bliski dokładnemu wynikowi zadania $A$? Odpowiedź uzasadnij.

<details>
<summary>Rozwiązanie L14.11</summary>

<br />

```
Nie można mieć pewności. Zadanie może być źle uwarunkowane, więc nawet jeśli algorytm jest numerycznie poprawny, to wynik może być bardzo odległy od prawdziwego.
```

</details>


##### Zadanie L14.12, L14.13: Sprawdź, czy algorytm jest algorytmem numerycznie poprawnym:

```
S = x[0];

for i from 1 to 4
  do
    S = 3*S + x[i];
  od;

return S;
```

<details>
<summary>Rozwiązanie L14.12</summary>

<br />

```
Aby rozwiązać zadanie, musimy rozpisać wszystkie obliczenia wykonywane przez algorytm. Pamiętamy że każde obliczenie wprowadza błąd (1 + 2^-t)
Rozpisujemy wszystko, łączymy błędy twierdzeniem o kumulacji błędów i sprawdzamy czy wynik jest w postaci f(x) = y * (1 + alfa)
```

</details>

L14.13 analogicznie do L14.12


## Rozwiązywanie równań nieliniowych

Znajdujemy miejsce zerowe funkcji $f(x)$


### Metoda bisekcji

1) Zaczynamy z dwoma punktami $a$ i $b$ takimi, że $f(a) * f(b) < 0$ (funkcja ma różne znaki w tych punktach).
2) Wyznaczamy środek przedziału $c = (a+b)/2$
3) Jeśli $f(c) = 0$ to koniec, $c$ jest miejscem zerowym
4) w.p.p. sprawdzamy znak $f(c)$ i wybieramy przedział $[a,c]$ lub $[c,b]$.
5) Powtarzamy od 2) aż do uzyskania odpowiedniej dokładności.

#### Własności metody (zadanie L14.15):
- Zbieżność liniowa
- Znamy długość k-tego przedziału
- Możemy łatwo policzyć ilość wymaganych iteracji dla danej dokładności $\epsilon$ - wzór: roof: $\log_2(\frac{b_0-a_0}{2 \epsilon})$


### Metoda Newtona (stycznych)

1) Wybieramy $x_0$ jako przybliżenie początkowe
2) Obliczamy $x_{i+1} = x_i - \frac{f(x_i)}{f'(x_i)}$

#### Własności metody
- Szybka zbieżność przy dobrze wybranym $x_0$
- Konieczność liczenia pochodnej - dla skomplikowanych funkcji może być to problematyczne
- Może nie zbiegać lub zapętlić się dla niektórych $x_0$


##### Zadanie L14.17 - Niech $\alpha$ będzie zerowym miejscem funkcji f (f($\alpha$) = 0, f'($\alpha$) $\not=$ 0). Udowodnij że wówczas rząd zbieżności metody Newtona wynosi 2.

<details>
<summary>Rozwiązanie L14.17</summary>

<br />

```
Pokazaliśmy na ćwiczeniach, że jeśli: 
F(x) = x, 
F'(x) = F''(x) = ... = F(x)^(n-1)'(x) = 0,
F(x)^(n)' != 0, 
to rząd zbieżności metody Newtona wynosi n.
(Słownie - wszystkie pochodne do n-1-tej włącznie są równe 0, a n-ta nie jest równa 0 - wtedy rząd zbieżności wynosi n)

Na potrzeby zadania niezbędne jest pamiętanie wzoru pochodnej dla ułamka: (f/g)' = (f'g - fg') / g^2

Newton: x_{i+1} = x_i - f(x_i) / f'(x_i)
Rozpisujemy po kolei wartość i wszystkie pochodne.
Po przekształceniach uzyskamy:
F(x) = x
F'(x) = 0
F''(x) = f''(x) / f'(x)

Warunki spełnione, więc rząd zbieżności wynosi 2.

Zauważmy że F(x) != f(x) (duże F to metoda Newtona, małe f to funkcja którą chcemy wyliczyć)

```

</details>


##### Zadanie L14.18: zaproponuj efektywny algorytm obliczania z dużą dokładnością wartości $\sqrt{a}$ wykorzystując jedynie operacje arytmetyczne (+, -, *, /)

<details>
<summary>Rozwiązanie L14.18</summary>

<br />

```
Zgadujemy funkcję taką że f(x) = 0 <=> x = \sqrt{a}
f(x) = x^2 - a
f'(x) = 2x
x_n+1 = x_n - f(x_n) / f'(x_n) = x_n - (x_n^2 - a) / 2x_n = (x_n + a / x_n) / 2
```

</details>


### Metoda siecznych

Dla dwóch wybranych punktów przeprowadzamy sieczną. Punkt przecięcia siecznej z osią OX jest kolejnym przybliżeniem. (Przesuwamy punkt który ma ten sam znak co nowy, musimy mieć cały czas różne)

1) Wybieramy $x_0$ i $x_1$ jako przybliżenia początkowe
2) Obliczamy $x_{i+1} = x_i - \frac{f(x_i)(x_i - x_{i-1})}{f(x_i) - f(x_{i-1})}$

#### Własności metody
- Nie musimy liczyć pochodnej
- Wolniejsza zbieżność niż metoda Newtona
- Zgadujemy x0 i x1
- Może nie zbiegać lub zapętlić się dla niektórych $x_0$ i $x_1$

### Wykładnik zbieżności ciągu (rząd metody)

Dla ciągu $x_n$ zbieżnego do jakiejś stałej C, jeśli istnieje taka stała $p > 1$ i $n_0$ że dla każdego $n > n_0$ zachodzi:


$C = \lim_{n \to \infty} \frac{|x_{n+1} - x^*|}{|x_n - x^*|^p}$

to $p$ nazywamy wykładnikiem zbieżności ciągu, a $C$ stałą asymptotyczną. 

Dla $p = 1$ mówimy o zbieżności liniowej, dla $p = 2$ o zbieżności kwadratowej.


##### Zadanie L14.20: Podaj efektywny algorytm wyznaczania liczby naturalnej a, której cyframi dziesiętnymi (od najbardziej do najmniej znaczącej) są a_n, a_n-1, ..., a_0, gdzie a_n != 0

<details>
<summary>Rozwiązanie L14.20</summary>

<br />

```
Brakuje chyba jakiejś informacji precyzującej, bo jak dostajemy po prostu ciąg to:

int a = 0;
for(int i = n; i >= 0; i--)
  a *= 10;
  a += a_i;

i mamy
```

</details>



## Interpolacja wielomianowa


### Postaci wielomianów

#### Postać naturalna potęgowa

$w(x) = \sum_{k=0}^{n} a_k x^k$ gdzie $a_k$ to współczynniki wielomianu

#### Postać Newtona

$w(x) = \sum_{k=0}^{n} b_k p_k(x)$ gdzie $b_k$ to współczynniki wielomianu, a $p_k(x)$ to dwumiany:

$p_0(x) = 1$

$p_k(x) = \prod_{i=0}^{k-1} (x - x_i)$

(czyli dla k=1 jeden dwumian, dla k=2 dwa dwumiany...)


### Postać Czebyszewa

$T_0(x) = 1$

$T_1(x) = x$

$T_{n+1}(x) = 2xT_n(x) - T_{n-1}(x)$

- T_k ma dokładnie k pierwiastków w przedziale [-1, 1]
- dla $x \in [-1, 1]$ mamy $T_k(x) = cos(k * arccos(x))$

## Schemat Hornera

Z wielomianu 

$w(x) = a_n x^n + a_{n-1} x^{n-1} + ... + a_1 x + a_0$ 

tworzymy:

$w(x) = a_0 + x(a_1 + x(a_2 + ... + x(a_{n-1} + x a_n)...))$

<br />

I dzięki temu definiujemy algorytm:

$w_n = a_n$

$w_k = w_{k+1} * x + a_k$ dla $k = n-1, n-2, ..., 0$

Działa on w O(n), jest numerycznie poprawny.

## Uogólniony schemat Hornera

Dla wielomianu 

$w(x) = b_n p_n(x) + b_{n-1} p_{n-1}(x) + ... + b_1 p_1(x) + b_0 p_0(x)$, 

gdzie $b_k$ i $p_k$ były zdefiniowane wcześniej, tworzymy:

$w(x) = (...((b_n(x - x_{n-1}) + b_{n-1})(x - x_{n-2}) + b_{n-2})(x-x_{n-3}).... + b_1)(x-x_0) + b_0$

<br />

I dzięki temu definiujemy algorytm:

$w_n = b_n$

$w_k = w_{k+1} * (x - x_k) + b_k$ dla $k = n-1, n-2, ..., 0$

Działa on w O(n), jest numerycznie poprawny.

## Algorytm Clenshawa - #TODO

## Interpolacja wielomianowa Lagrange'a

$L_n(x) = \sum_{k=0}^{n} y_k l_k(x)$, gdzie $l_k(x) = \prod_{i=0, i \neq k}^{n} \frac{x - x_i}{x_k - x_i}$

Zadanie interpolacji Lagrange'a ma zawsze jednoznaczne rozwiązanie. Z jednoznaczności wynika, że jeśli mamy $n+1$ punktów, to wielomian interpolacyjny ma stopień co najwyżej $n$. Zdarzały się zadania gdzie mieliśmy podać wielomian interpolacyjny dla $n+1$ punktów - mówimy wówczas że z jednoznaczności $f(x) = L_n(x)$.

## Doliczanie kolejnego punktu

Aby nie lecieć wzorem od początku $O(n^2)$, możemy doliczać kolejny punkt w $O(n)$ zapisując wielomian w postaci Newtona:

$L_{n+1} = L_n + y_{n+1} p_{n+1}$

## Ilorazy różnicowe

$f[x_k] = f(x_k)$

$f[x_k, x_{k+1}] = \frac{f[x_{k+1}] - f[x_k]}{x_{k+1} - x_k}$

$f[x_k, x_{k+1}, ..., x_{k+m}] = \frac{f[x_{k+1}, x_{k+2}, ..., x_{k+m}] - f[x_k, x_{k+1}, ..., x_{k+m-1}]}{x_{k+m} - x_k}$

## Błąd interpolacji Lagrange'a

Wzór:

$f(x) = L_n(x) + \frac{f^{(n+1)}(\xi)}{(n+1)!} \prod_{i=0}^{n} (x - x_i)$

gdzie $\xi$ jest dowolnym punktem z przedziału $[x_0, x_n]$

Aby zminimalizować błąd interpolacji, należy odpowiednio wybrać węzły. Najlepiej wybrać węzły Czebyszewa, czyli:

$x_k = cos(\frac{2k+1}{2n+2} \pi)$

dzięki temu mamy więcej węzłów przy końcach minimalizując efekt Rungego.

## Naturalna Interpolacyjna Funkcja Sklejana 3. stopnia

Zamiast robić jeden wzór, robimy kilka na mniejszych przedziałach. Dla każdego przedziału mamy wielomian 3. stopnia. Można stworzyć taki wielomian na dwa sposoby, ale wersja ze wzorem jawnym jest na egzaminie nielegalna - pokażę więc tylko najprostszą konstrukcję.

### Konstrukcja NIFS3

Tworzymy układy równań, które dla każdego węzła spełniają:
- jest wielomianem 3. stopnia
- ciągłość w, w' i w''
- w''(x0) = w''(xn) = 0 (naturalność)

NIFS3 zawsze istnieje i jest jednoznaczna.

## Krzywe parametryczne

Krzywa parametryczna to funkcja $f: [a,b] \to \mathbb{R}^2$.