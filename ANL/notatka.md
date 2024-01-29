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
        - [Zadanie L14.16 : Przybliżone obliczanie wartości $^5\\sqrt{a}$ metodą newtona, $dobranie x\_0 i warunek stopu$](#zadanie-l1416--przybliżone-obliczanie-wartości-5sqrta-metodą-newtona-dobranie-x_0-i-warunek-stopu)
        - [Zadanie L14.17 - Niech $\\alpha$ będzie zerowym miejscem funkcji f (f($\\alpha$) = 0, f'($\\alpha$) $\\not=$ 0). Udowodnij że wówczas rząd zbieżności metody Newtona wynosi 2.](#zadanie-l1417---niech-alpha-będzie-zerowym-miejscem-funkcji-f-falpha--0-falpha-not-0-udowodnij-że-wówczas-rząd-zbieżności-metody-newtona-wynosi-2)
        - [Zadanie L14.18: zaproponuj efektywny algorytm obliczania z dużą dokładnością wartości $\\sqrt{a}$ wykorzystując jedynie operacje arytmetyczne (+, -, \*, /)](#zadanie-l1418-zaproponuj-efektywny-algorytm-obliczania-z-dużą-dokładnością-wartości-sqrta-wykorzystując-jedynie-operacje-arytmetyczne-----)
    - [Metoda siecznych](#metoda-siecznych)
      - [Własności metody](#własności-metody-1)
    - [Wykładnik zbieżności ciągu (rząd metody)](#wykładnik-zbieżności-ciągu-rząd-metody)
        - [Zadanie L14.20: Podaj efektywny algorytm wyznaczania liczby naturalnej a, której cyframi dziesiętnymi (od najbardziej do najmniej znaczącej) są a\_n, a\_n-1, ..., a\_0, gdzie a\_n != 0](#zadanie-l1420-podaj-efektywny-algorytm-wyznaczania-liczby-naturalnej-a-której-cyframi-dziesiętnymi-od-najbardziej-do-najmniej-znaczącej-są-a_n-a_n-1--a_0-gdzie-a_n--0)
        - [Zadanie L14.21. - Sformułuj i uzasadnij uogólniony schemat Hornera obliczania wartości wielomianu podanego w postaci Newtona](#zadanie-l1421---sformułuj-i-uzasadnij-uogólniony-schemat-hornera-obliczania-wartości-wielomianu-podanego-w-postaci-newtona)
        - [Zadanie L14.23. - Mamy wielomian postaci $W\_n(x) = z\_0(x-z\_1)(x-z\_2)...(x-z\_n), gdzie z\_i są dane. Opracuj i uzasadnij oszczędny algorytm znajdowania postaci potęgowej wielomianu w\_n. Określ złożoność algorytmu. Gdszie, w kontekście metod omówionych w ramach wykładu, algorytm może mieć zastosowanie?](#zadanie-l1423---mamy-wielomian-postaci-w_nx--z_0x-z_1x-z_2x-z_n-gdzie-z_i-są-dane-opracuj-i-uzasadnij-oszczędny-algorytm-znajdowania-postaci-potęgowej-wielomianu-w_n-określ-złożoność-algorytmu-gdszie-w-kontekście-metod-omówionych-w-ramach-wykładu-algorytm-może-mieć-zastosowanie)
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
        - [Zadanie L14.24: Znajdź postać Newtona wielomianu interpolacyjnego Lagrange'a 4 stopnia dla punktów $(-2; 1), (-1;2), (1;10), (2;29), (3;106)$](#zadanie-l1424-znajdź-postać-newtona-wielomianu-interpolacyjnego-lagrangea-4-stopnia-dla-punktów--2-1--12-110-229-3106)
        - [Zadanie L14.25 - Znajdź wielomian interpolacyjny Lagrange'a dla punktów a) $(-2; 2), (-1;0), (0;-2), (1;-4)$ i b) $(1;-4), (2;-30), (-1;0), (-2;2), (0,2)$ w postaci Newtona](#zadanie-l1425---znajdź-wielomian-interpolacyjny-lagrangea-dla-punktów-a--2-2--10-0-2-1-4-i-b-1-4-2-30--10--22-02-w-postaci-newtona)
        - [Zadanie L14.26 - Funkcję $f(x) = cos(x/2)$ interpolujemy Lagrangem w węzłach Czebyszewa. Jak należy dobrać n, aby błąd interpolacji był mniejszy niż $10^{-8}$ dla $x \\in \[-1, 1\]$?](#zadanie-l1426---funkcję-fx--cosx2-interpolujemy-lagrangem-w-węzłach-czebyszewa-jak-należy-dobrać-n-aby-błąd-interpolacji-był-mniejszy-niż-10-8-dla-x-in--1-1)
  - [Ilorazy różnicowe](#ilorazy-różnicowe)
  - [Błąd interpolacji Lagrange'a](#błąd-interpolacji-lagrangea)
        - [Zadanie L14.28. : Dostajemy liczby $a\_0, a\_1, ..., a\_{n-1}$. Zaproponuj algorytm znajdowania takich $c\_0, c\_1, ... c\_n$ że dla każdego $x \\in \\mathbb{R}$ zachodzi $x^n = c\_0 + c\_1(x - a\_0) + c\_2(x - a\_0)(x - a\_1) + ... + c\_n(x - a\_0)(x - a\_1)...(x - a\_{n-1})$ Podaj jego złożoność.](#zadanie-l1428--dostajemy-liczby-a_0-a_1--a_n-1-zaproponuj-algorytm-znajdowania-takich-c_0-c_1--c_n-że-dla-każdego-x-in-mathbbr-zachodzi-xn--c_0--c_1x---a_0--c_2x---a_0x---a_1----c_nx---a_0x---a_1x---a_n-1-podaj-jego-złożoność)
  - [Naturalna Interpolacyjna Funkcja Sklejana 3. stopnia](#naturalna-interpolacyjna-funkcja-sklejana-3-stopnia)
    - [Konstrukcja NIFS3](#konstrukcja-nifs3)
        - [Zadanie L14.29 - Podaj definicję NIFS3 i znajdź NIFS3 dla $(-1;-1), (0;2), (1;-3)$](#zadanie-l1429---podaj-definicję-nifs3-i-znajdź-nifs3-dla--1-1-02-1-3)
        - [Zadanie L14.30 : Znajdź NIFS3 dla (-2022;8043), (-4;1989), (-2; 1983), (0; 1977), (1; 1974), (3; 1968), (2022, -4089)](#zadanie-l1430--znajdź-nifs3-dla--20228043--41989--2-1983-0-1977-1-1974-3-1968-2022--4089)
  - [Krzywe parametryczne](#krzywe-parametryczne)
        - [Zadanie L14.37 : Aproksymacja - wyznacz prawdopodobne A. Wzór: $C(t) = 2^{(At^2+2018)^{-1}}$](#zadanie-l1437--aproksymacja---wyznacz-prawdopodobne-a-wzór-ct--2at22018-1)
        - [Zadanie L14.40 : Rozważmy zadanie wielomianowej aproksymacji średniokwadratowej na zbiorze dyskretnym dla węzłów postaci x\_k = -a + (2ak) / N. Udowodniej, że jeśli aproksymowana funkcja jest parzysta, to n-ty wielomian optymalny (n \< N) też jest funkcją parzystą.](#zadanie-l1440--rozważmy-zadanie-wielomianowej-aproksymacji-średniokwadratowej-na-zbiorze-dyskretnym-dla-węzłów-postaci-x_k---a--2ak--n-udowodniej-że-jeśli-aproksymowana-funkcja-jest-parzysta-to-n-ty-wielomian-optymalny-n--n-też-jest-funkcją-parzystą)
  - [Kwadratury](#kwadratury)
    - [Funkcja podcałkowa, funkcja pierwotna](#funkcja-podcałkowa-funkcja-pierwotna)
    - [Metody całkowania](#metody-całkowania)
      - [Całkowanie przez części](#całkowanie-przez-części)
      - [Całkowanie przez podstawienie](#całkowanie-przez-podstawienie)
  - [Wszystko o kwadraturach poniżej #TODO](#wszystko-o-kwadraturach-poniżej-todo)
    - [Kwadratura liniowa](#kwadratura-liniowa)
    - [Kwadratura interpolacyjna](#kwadratura-interpolacyjna)
    - [Kwadratura Newtona-Cotesa](#kwadratura-newtona-cotesa)
    - [Wzór trapezów, złożony wzór trapezów](#wzór-trapezów-złożony-wzór-trapezów)
    - [Wzór Simpsona, złożony wzór Simpsona](#wzór-simpsona-złożony-wzór-simpsona)
    - [Metoda Romberga](#metoda-romberga)
    - [Kwadratura Gausa](#kwadratura-gausa)
  - [Macierze](#macierze)
    - [Rozkład LU](#rozkład-lu)
    - [Metoda faktoryzacji](#metoda-faktoryzacji)
    - [Wyznacznik macierzy:](#wyznacznik-macierzy)
        - [Zadanie L14.50. - Rozkład LU macierzy i obliczenie Ax = b metodą faktoryzacji - rozwiązane na papierze (proste tylko dużo pisania)](#zadanie-l1450---rozkład-lu-macierzy-i-obliczenie-ax--b-metodą-faktoryzacji---rozwiązane-na-papierze-proste-tylko-dużo-pisania)
        - [Zadanie L14.51. - Algorytm numerycznego wyznaczania rzędu macierzy](#zadanie-l1451---algorytm-numerycznego-wyznaczania-rzędu-macierzy)
        - [Zadanie L14.52. - Algorytm wyznaczania macierzy odwrotnej $A^{-1}$](#zadanie-l1452---algorytm-wyznaczania-macierzy-odwrotnej-a-1)
        - [Zadanie L14.53. : Algorytm wyznaczania macierzy X spełniającej równanie $AX = B$, gdzie A, B są macierzami kwadratowymi (X też jest). Podaj złożoność algorytmu. #TODO](#zadanie-l1453--algorytm-wyznaczania-macierzy-x-spełniającej-równanie-ax--b-gdzie-a-b-są-macierzami-kwadratowymi-x-też-jest-podaj-złożoność-algorytmu-todo)
        - [Zadanie L14.54. : Opracuj metodę rozkładu LU macierzy postaci (liczby na przekątnej, ostatnim wierszu, ostatniej kolumnie). Podaj jej złożoność.](#zadanie-l1454--opracuj-metodę-rozkładu-lu-macierzy-postaci-liczby-na-przekątnej-ostatnim-wierszu-ostatniej-kolumnie-podaj-jej-złożoność)
        - [Zadanie L14.55. Algorytm LU dla macierzy trójprzekątniowej (z założeniem że istnieje)](#zadanie-l1455-algorytm-lu-dla-macierzy-trójprzekątniowej-z-założeniem-że-istnieje)


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
  L14.1 Udowodnij, że dodatnia liczba rzeczywista ma skończone rozwinięcie dwójkowe wtedy i tylko wtedy gdy jest postaci m / 2^n
</summary>

<br/>

```
Musimy pokazać implikację w obydwie strony.

L => P

c_n, c_n-1, ..., c_0, c_-1, c_-2, ..., c_-k - rozwinięcie dwójkowe liczby x

x = c_n * 2^n + c_n-1 * 2^n-1 + ... + c_0 * 2^0 + c_-1 * 2^-1 + c_-2 * 2^-2 + ... + c_-k * 2^-k =

c_n * 2^(n+k) + ... + c_-k    <-- liczba całkowita
-------------------------
2^k

mamy więc szukaną postać

P => L

x = m / 2^n, m całkowite 
m = cl * 2^l + cl-1 * 2^l-1 + ... + c_0 * 2^0

x = 

cl * 2^l + cl-1 * 2^l-1 + ... + c_0 * 2^0
-----------------------------------------
2^n

przesuwamy kropkę dziesiętną o l miejsc w lewo, nie zmieni to "skończenia" liczby, zmienia się tylko "wartość" bitów.

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

<summary>Rozwiązanie L14.7</summary>

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
cond(~0.8) ~= 4

Błąd argumentu: ~2^-t
Błąd wyniku: 4 * 2^-t
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

L14.13 analogicznie do L14.12 - rozpisujemy w każdej iteracji 4 błędy i zwijamy je w a^n z daszkiem (gdzie każdy z nich ma błąd 4 * 2^-t) Stosujemy taki jakby schemat Hornera, a on jest numerycznie poprawny.


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

##### Zadanie L14.16 : Przybliżone obliczanie wartości $^5\sqrt{a}$ metodą newtona, $dobranie x_0 i warunek stopu$

<details>
<summary>Rozwiązanie L14.16</summary>

<br />


Zgadujemy funkcję taką że $f(x) = 0 <=> x = ^5\sqrt{a}$

$f(x) = x^5 - a$

$f'(x) = 5x^4$

$x_{i+1} = x_i - \frac{x_i^5 - a}{5x_i^4} = \frac{4x_i^5 + a}{5x_i^4}$ = $\frac{4}{5}x_i + \frac{a}{5x_i^4}$ - wzór kolejnych przybliżeń

Dobieranie przykładowego przybliżenia - w podobnym zadaniu na liście sprawdzaliśmy to eksperymentalnie - wówczas najlepiej działało dla bardzo małych wartości - tu też tak bym zrobił.

Warunek stopu w metodzie Newtona składa się z kilku części:

- Osiągnięcie odpowiedniej dokładności

oraz
- Górny limit iteracji, w razie jakby się popsuło nie chcemy lecieć w nieskończość

lub

- Odpowiednio mała zmiana między kolejnymi przybliżeniami - jeśli przybliżenia są bardzo blisko siebie, to znaczy że metoda się zapętliła i nie ma sensu dalej liczyć



</details>


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


##### Zadanie L14.21. - Sformułuj i uzasadnij uogólniony schemat Hornera obliczania wartości wielomianu podanego w postaci Newtona

<details>
<summary>Rozwiązanie L14.21</summary>

<br />

Wielomian w postaci Newtona:

$w(x) = a_0 + a_1(x-x_0) + a_2(x-x_0)(x-x_1) + ... + a_n(x-x_0)(x-x_1)...(x-x_{n-1})$

Możemy go zapisać jako:

$w(x) = a_0 + (x-x_0)(a_1 + (x-x_1)(a_2 + ... + (x-x_{n-1})(a_n))...)$

wtedy:

$w_n = a_n$

$w_k = (x-x_k)w_{k+1} + a_k$ dla $k = n-1, n-2, ..., 0$

<br />

</details>

##### Zadanie L14.23. - Mamy wielomian postaci $W_n(x) = z_0(x-z_1)(x-z_2)...(x-z_n), gdzie z_i są dane. Opracuj i uzasadnij oszczędny algorytm znajdowania postaci potęgowej wielomianu w_n. Określ złożoność algorytmu. Gdszie, w kontekście metod omówionych w ramach wykładu, algorytm może mieć zastosowanie?

<details>
<summary>Rozwiązanie L14.23</summary>

<br />

```
Wielomian przekształcamy podobnie jak L14.21.
Dotrzemy do postaci, która pozwoli nam zauważyć że będziemy mogli liczyć to w czasie liniowym.
Do policzenia i zapamiętania będzie
Suma z_n
Robimy akumulator.
W akumulatorze dajemy minus iloczyn z_n
Obliczamy sumę z_n * x i pamiętamy ją
Doliczamy zapamiętaną sumę do akumulatora
I w pętli dla kolejnych i
  Wymnażamy zapamiętaną sumę przez x
  Doliczamy do akumulatora

Złożoność liniowa, bo mamy jedną pętlę 1-n, w której wykonujemy stałą liczbę operacji (no i też suma liniowo będzie policzona)

Jakie to ma zastosowanie?

Jest to "doliczenie kolejnej obserwacji" w interpolacji Lagrange'a do wielomianu w postaci Newtona. Chcemy to tak doliczać bo mozemy dodawać kolejne punkty w czasie liniowym, a nie kwadratowym.

Potrzebujemy jednak przerobić postać Newtona na postać potęgową, jeśli chcemy policzyć całkę - nasz algorytm pozwala to zrobić również w czasie liniowym.

Szybkie liczenie całki przydaje się przy kwadraturach.
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


##### Zadanie L14.24: Znajdź postać Newtona wielomianu interpolacyjnego Lagrange'a 4 stopnia dla punktów $(-2; 1), (-1;2), (1;10), (2;29), (3;106)$

<details>
<summary>Rozwiązanie L14.24</summary>

<br />
Wielomian interpolacyjny Lagrange'a 4 stopnia ma postać:


$L(x) = a_0 + a_1(x-x_0) + a_2(x-x_0)(x-x_1) + a_3(x-x_0)(x-x_1)(x-x_2) + a_4(x-x_0)(x-x_1)(x-x_2)(x-x_3)$

lub ogólniej:
$L(x) = y_0 l_0(x) + y_1 l_1(x) + y_2 l_2(x) + y_3 l_3(x) + y_4 l_4(x)$

gdzie:

$y_0 = 1$
$y_1 = 2$
$y_2 = 10$
$y_3 = 29$
$y_4 = 106$

$l_0(x) = \frac{(x-x_1)(x-x_2)(x-x_3)(x-x_4)}{(x_0-x_1)(x_0-x_2)(x_0-x_3)(x_0-x_4)} = \frac{(x+1)(x-1)(x-2)(x-3)}{(-2+1)(-2-1)(-2-2)(-2-3)} = \frac{(x+1)(x-1)(x-2)(x-3)}{120}$

$l_1(x) = \frac{(x-x_0)(x-x_2)(x-x_3)(x-x_4)}{(x_1-x_0)(x_1-x_2)(x_1-x_3)(x_1-x_4)} = \frac{(x+2)(x-1)(x-2)(x-3)}{(1+2)(1-1)(1-2)(1-3)} = \frac{(x+2)(x-1)(x-2)(x-3)}{-12}$

$l_2(x) = \frac{(x-x_0)(x-x_1)(x-x_3)(x-x_4)}{(x_2-x_0)(x_2-x_1)(x_2-x_3)(x_2-x_4)} = \frac{(x+2)(x+1)(x-2)(x-3)}{(2+2)(2+1)(2-2)(2-3)} = \frac{(x+2)(x+1)(x-2)(x-3)}{24}$

$l_3(x) = \frac{(x-x_0)(x-x_1)(x-x_2)(x-x_4)}{(x_3-x_0)(x_3-x_1)(x_3-x_2)(x_3-x_4)} = \frac{(x+2)(x+1)(x-1)(x-3)}{(3+2)(3+1)(3-1)(3-3)} = \frac{(x+2)(x+1)(x-1)(x-3)}{-20}$

$l_4(x) = \frac{(x-x_0)(x-x_1)(x-x_2)(x-x_3)}{(x_4-x_0)(x_4-x_1)(x_4-x_2)(x_4-x_3)} = \frac{(x+2)(x+1)(x-1)(x-2)}{(4+2)(4+1)(4-1)(4-2)} = \frac{(x+2)(x+1)(x-1)(x-2)}{60}$

Wstawiamy do wzoru:

$L(x) = 1 * \frac{(x+1)(x-1)(x-2)(x-3)}{120} + 2 * \frac{(x+2)(x-1)(x-2)(x-3)}{-12} + 10 * \frac{(x+2)(x+1)(x-2)(x-3)}{24} + 29 * \frac{(x+2)(x+1)(x-1)(x-3)}{-20} + 106 * \frac{(x+2)(x+1)(x-1)(x-2)}{60}$

Po przekształceniach w postaci potęgowej: 

$L(x) = \frac{1}{120}x^4 - \frac{1}{6}x^3 + \frac{11}{8}x^2 - \frac{11}{6}x + 1$

Postać Newtona policzę w zadaniu poniżej (inny wzorek, wsm. chyba bardziej przydatny)

</details>

##### Zadanie L14.25 - Znajdź wielomian interpolacyjny Lagrange'a dla punktów a) $(-2; 2), (-1;0), (0;-2), (1;-4)$ i b) $(1;-4), (2;-30), (-1;0), (-2;2), (0,2)$ w postaci Newtona 

<details>
<summary>Rozwiązanie L14.25 a)</summary>

<br />

```
Liczymy ilorazy różnicowe, robimy tą taką piramidę.
Dzięki nim wyznaczamy współczynniki a_k.

a_0 = y_0 = 2
a_1 = f[x1, x0]
a_2 = f[x2, x1, x0]
...
a_n = f[xn, xn-1, ..., x0] 

gdzie ilorazy różnicowe - pamiętamy że liczy się je odejmując w liczniku najwyższą wartość od najniższej, a w mianowniku to samo z argumentami

np.

f[x1, x0] = (y1 - y0) / (x1 - x0)

a 

f[x2,x1,x0] = (f[x2,x1] - f[x1,x0]) / (x2 - x0)

Postać Newtona wielomianu to będzie:

L(x) = a_0 + a_1(x-x_0) + a_2(x-x_0)(x-x_1).... do konca
```
</details>

Podpunkt b rozwiązalibyśmy analogicznie.

##### Zadanie L14.26 - Funkcję $f(x) = cos(x/2)$ interpolujemy Lagrangem w węzłach Czebyszewa. Jak należy dobrać n, aby błąd interpolacji był mniejszy niż $10^{-8}$ dla $x \in [-1, 1]$?

<details>
<summary>Rozwiązanie L14.26 #TODO</summary>

<br />

```
Znamy wzór na błąd interpolacji Lagrange'a:
```
$f(x) - L_n(x) = \frac{f^{(n+1)}(\xi)}{(n+1)!} * max(p_{n+1}(x))$


</details>

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



##### Zadanie L14.28. : Dostajemy liczby $a_0, a_1, ..., a_{n-1}$. Zaproponuj algorytm znajdowania takich $c_0, c_1, ... c_n$ że dla każdego $x \in \mathbb{R}$ zachodzi $x^n = c_0 + c_1(x - a_0) + c_2(x - a_0)(x - a_1) + ... + c_n(x - a_0)(x - a_1)...(x - a_{n-1})$ Podaj jego złożoność.

<details>
<summary>Rozwiązanie L14.28</summary>

<br />

```
Obserwacja: to jest interpolacja Lagrange'a dla punktów:
(a_0, a_0^n), (a_1, a_1^n), ..., (a_{n-1}, a_{n-1}^n)
Dodajemy jeszcze jedną obserwację (a_n, a_n^n) żeby mieć n+1 punktów.

b_0 = a_0^n
b_1 = f[a_1, a_0]
b_2 = f[a_2, a_1, a_0]
...
Mamy złożoność jak interpolacja Lagrange'a, czyli O(n^2) i obliczeniowo i pamięciowo.
```

</details>

## Naturalna Interpolacyjna Funkcja Sklejana 3. stopnia

Zamiast robić jeden wzór, robimy kilka na mniejszych przedziałach. Dla każdego przedziału mamy wielomian 3. stopnia. Można stworzyć taki wielomian na dwa sposoby, ale wersja ze wzorem jawnym jest na egzaminie nielegalna - pokażę więc tylko najprostszą konstrukcję.

### Konstrukcja NIFS3

Tworzymy układy równań, które dla każdego węzła spełniają:
- jest wielomianem 3. stopnia
- ciągłość w, w' i w''
- w''(x0) = w''(xn) = 0 (naturalność)

NIFS3 zawsze istnieje i jest jednoznaczna.


##### Zadanie L14.29 - Podaj definicję NIFS3 i znajdź NIFS3 dla $(-1;-1), (0;2), (1;-3)$


<details>
<summary>Rozwiązanie L14.29</summary>

<br />

```
NIFS3 to funkcja będąca wielomianem trzeciego stopnia, która spełnia następujące warunki dla każdego węzła:
- jest wielomianem 3. stopnia
- ciągłość w, w' i w''
- w''(x0) = w''(xn) = 0 (naturalność)
```
Znajdźmy NIFS3 - koniecznie układem równań, wzór jawny jest zakazany na egzaminie
```

```

</details>

##### Zadanie L14.30 : Znajdź NIFS3 dla (-2022;8043), (-4;1989), (-2; 1983), (0; 1977), (1; 1974), (3; 1968), (2022, -4089)

<details>
<summary>Rozwiązanie L14.30</summary>

<br />

```
Zadanie jest podchwytliwe - możemy od razu zauważyć że będzie to prosta y = -3x + 1977. 

Ogólnie raczej jeśli będziemy mieli realnie liczyć NIFS3, to dostaniemy tak góra 3-4 węzły żeby nie było godziny liczenia.
```
</details>

## Krzywe parametryczne

Krzywa parametryczna to funkcja $f: [a,b] \to \mathbb{R}^2$.


##### Zadanie L14.37 : Aproksymacja - wyznacz prawdopodobne A. Wzór: $C(t) = 2^{(At^2+2018)^{-1}}$

<details>
<summary>Rozwiązanie L14.37</summary>

<br />

```
C(t) = 2^{(At^2+2018)^{-1}}

log_2(C(t)) = 1 / (At^2 + 2018)

1 / log_2(C(t)) - 2018 = At^2

d_k = 1 / log_2(C(t_k)) - 2018

d(t) = 1 / log_2(C(t)) - 2018

I teraz:
```
$E(a) = \sum_{k=0}^{N} (At_k^2 - d_k)^2$
szukamy minimum E(a) 

</details>



##### Zadanie L14.40 : Rozważmy zadanie wielomianowej aproksymacji średniokwadratowej na zbiorze dyskretnym dla węzłów postaci x_k = -a + (2ak) / N. Udowodniej, że jeśli aproksymowana funkcja jest parzysta, to n-ty wielomian optymalny (n < N) też jest funkcją parzystą.

<details>
<summary>Rozwiązanie L14.40</summary>

<br />

```
x = -a + (2ak) / N   x_0 = -a, krok 2a/N,  x_N = a

punkty są więc symetryczne

f_0, f_1, ..., f_N

f_0 = f_N
f_1 = f_N-1
....
```
Wielomian optymalny: 
$w^*_n(x) = \sum_{k=0}^{n} \frac{<f, p_n>}{<p, p_n>}p_n(x)$

$P_0(x) = 1$ - tylko parzyste potęgi

$<f, P_0> = \sum_{k=0}^{N} f_i * 1 = 0$

$P_1(x) = (x - \frac{<xP_0, P_0>}{<P_0, P_0>}) * P_0(x)$ = $<xP_0, P_0>$ = $\sum_{k=0}^{N} x_k = 0$ 

$P_1(x)$ - tylko nieparzyste potęgi 

#TODO dokończyć

</details>

## Kwadratury

Ideą kwadratury (całkowania numerycznego) jest zastąpienie trudnej funkcji f(x) dla $x \in [a,b]$ funkcją prostszą, np. wielomianem w(x) (które potrafimy łatwo całkować), co pozwoli nam prosto przybliżyć wartość całki.

### Funkcja podcałkowa, funkcja pierwotna

Niech f będzie dowolną funkcją podcałkową dla $x \in [a,b]$. Funkcją pierwotną f nazywamy funkcję F, której pochodną jest f, czyli $F' = f$.

Wtedy można policzyć całkę oznaczoną korzystając z własności

$\int_{a}^{b} f(x) dx = F(b) - F(a)$

### Metody całkowania

Powtórka z analizy matematycznej.

#### Całkowanie przez części

$\int{f(x)g'(x)dx} = f(x)g(x) - \int{f'(x)g(x)dx}$

#### Całkowanie przez podstawienie

$\int{f(g(x))g'(x)dx} = \int{f(u)du}$


## Wszystko o kwadraturach poniżej #TODO

### Kwadratura liniowa

Kwadratura liniowa to kwadratura, która przybliża funkcję f(x)/ Kwadratura liniowa może mieć rząd co najwyżej 2n+2 (było podane jako twierdzenie, jest to też zadanie L14.45.)

### Kwadratura interpolacyjna

Ideą tej kwadratury jest całkowanie wielomianu Ln(x) zamiast funkcji f(x). Kwadratura liniowa ma rząd większy lub równy n+1 <=> jest ona kwadraturą interpolacyjną.

### Kwadratura Newtona-Cotesa

Kwadratura Newtona-Cotesa to kwadratura interpolacyjna, w której węzły są równoodległe. k-ty węzeł to $x_k = a + k * h$, gdzie $h = \frac{b-a}{n}$

### Wzór trapezów, złożony wzór trapezów

Jest to metoda rzędu 2. Dla danej funkcji na danym przedziale szacujemy wartość całki za pomocą kwadratury $Q_1(f) = \frac{b-a}{2}(f(a) + f(b))$. (Liczymy pole trapezu)

### Wzór Simpsona, złożony wzór Simpsona

Jest to metoda rzędu 4. Dla danej funkcji na danym przedziale szacujemy wartość całki za pomocą kwadratury 

$Q_2(f) = \frac{b-a}{w}(\frac{1}{3}f(a) + \frac{4}{3}f(\frac{a+b}{2}) + \frac{1}{3}f(b))$. 

### Metoda Romberga

Liczymy elementy T(0,i), wypełniamy tablicę Romberga (macierz dolnotrójkątną)

### Kwadratura Gausa


## Macierze

### Rozkład LU

$A = LU$

gdzie L to macierz trójkątna dolna, a U to macierz trójkątna górna.

Bierzemy macierz A i szukamy macierzy trójkątnej górnej jak robiliśmy to na algebrze, poprzez odejmowanie i dodawanie wierszy. 

Zapisujemy wszystkie operacje które zrobiliśmy.

Otrzymana macierz jest macierzą U.

Macierz L generujemy z zapisanych operacji które wykonaliśmy na A. 

Np mieliśmy w zadaniu z listy takie operacje:

- $r_2 = r_2 + 3 r_1$
- $r_3 = r_3 - 5 r_1$
- $r_4 = r_4 + 9 r_1$
- $r_3 = r_3 + 7 r_2$
- $r_4 = r_4 - 11 r_2$
- $r_4 = r_4 - 19 r_3$

Druga kolumna mówi nam w którym rzędzie będzie wartość,
r w trzeciej w której kolumnie a wartość będzie argumentem przy r z odwrotnym znakiem.

Np. dla $r_2 = r_2 + 3 r_1$ mamy -3 w drugim rzędzie, pierwszej kolumnie

Cała macierz którą uzyskamy:

$\begin{bmatrix}
1 & 0 & 0 & 0 \\
-3 & 1 & 0 & 0 \\
5 & -7 & 1 & 0 \\
-9 & 11 & 19 & 1 \\
\end{bmatrix}$

### Metoda faktoryzacji

- $Ax = b$
- $LUx = b$
- $L(Ux) = b$
- $Ly = b$

Stąd wyznaczamy y i rozwiązujemy $Ux = y$ uzysukjąc rozwiązanie x.

W skrócie:

$Ax = b$

zamienia się w:

$Ly = b$, gdzie znamy L oraz b

$Ux = y$, gdzie znamy U oraz y z poprzedniego równania

Rozwiążemy takie zadanie w czasie $O(n^2)$ - nie zawsze jednak rozwiazanie istnieje.

### Wyznacznik macierzy:

$det(A) = det(L) * det(U)$, 

gdzie w naszym przypadku przekątna L to same jedynki, więc 

$det(A) = det(U) = u_{11} * u_{22} * ... * u_{nn}$

##### Zadanie L14.50. - Rozkład LU macierzy i obliczenie Ax = b metodą faktoryzacji - rozwiązane na papierze (proste tylko dużo pisania)

##### Zadanie L14.51. - Algorytm numerycznego wyznaczania rzędu macierzy 

<details>
<summary>Rozwiązanie L14.51</summary>

<br />

```
Wyznaczamy macierz U, a potem liczymy ile jest niezerowych wierszy - mamy wynik

```
</details>

##### Zadanie L14.52. - Algorytm wyznaczania macierzy odwrotnej $A^{-1}$

<details>
<summary>Rozwiązanie L14.52</summary>

<br />

```
Robimy rozkład LU, a potem korzystamy ze wzoru:
A^-1 = U^-1 * L^-1
```
</details>

##### Zadanie L14.53. : Algorytm wyznaczania macierzy X spełniającej równanie $AX = B$, gdzie A, B są macierzami kwadratowymi (X też jest). Podaj złożoność algorytmu. #TODO

<details>
<summary>Rozwiązanie L14.53</summary>

<br />

```
```
</details>

##### Zadanie L14.54. : Opracuj metodę rozkładu LU macierzy postaci (liczby na przekątnej, ostatnim wierszu, ostatniej kolumnie). Podaj jej złożoność.

<details>
<summary>Rozwiązanie L14.54</summary>

<br />

```
Złożoność: O(n)
macierz mniej wiecej wyglada tak

a1 0 0 0 0 c1
0 a2 0 0 0 c2
0 0 a3 0 0 c3
0 0 0 a4 0 c4
0 0 0 0 a5 c5
0 0 0 0 0  c6
b1 b2 b3 b4 b5 an

Liczymy najpierw U (jak na algebrze, od ost. wiersza odejmujemy b1/a1, b2/a2, b3/a3 od ostatniego wiersza)
przekątna nie zmienia się poza ostatnim el: an-c1/a1 - c2/a2 - c3/a3 - c4/a4 - c5/a5

A L będzie macierzą I z dodanymi w ostatnim wierszu b1/a1, b2/a2, b3/a3, b4/a4, b5/a5.

Obliczamy więc liniowo prawy dolny element U (resztę znamy z góry), a potem liniowo ostatni wiersz L (resztę znamy z góry).

```

</details>

##### Zadanie L14.55. Algorytm LU dla macierzy trójprzekątniowej (z założeniem że istnieje)

<details>
<summary>Rozwiązanie L14.55</summary>

<br />

```
Podobny pomysł co w L14.54 - wyznaczamy standardowo U, a L będzie macierzą I z dodanymi w ostatnim wierszu b1/a1, b2/a2, b3/a3, b4/a4, b5/a5... (tyle ile jest elementów na przekątnej)

Złożoność czasowa: O(n)
Złożoność pamięciowa: O(n^2) (z tego że pamiętamy macierz nXn, ale można też zapisać tylko potrzebne elementy i mieć ~3 * O(n))

```

</details>