# Analiza Numeryczna (L) - notatka

Podsumowanie materiału z Analizy Numerycznej przed egzaminem. Skrótowe notatki z wykładu i przykładowe rozwiązania typowych zadań. 

Zobacz też notatkę od whiskeyo, tam jest dokładniej rozpisana teoria (i dosyć dużo tego co jest tutaj na niej bazuje)

## Spis treści
- [Analiza Numeryczna (L) - notatka](#analiza-numeryczna-l---notatka)
  - [Spis treści](#spis-treści)
  - [Teoria wstępna](#teoria-wstępna)
    - [Błąd bezwzględny i względny](#błąd-bezwzględny-i-względny)
    - [Reprezenacja liczb w komputerze](#reprezenacja-liczb-w-komputerze)
    - [Zaokrąglenia](#zaokrąglenia)
    - [Nadmiar i niedomiar](#nadmiar-i-niedomiar)
    - [Działania na liczbach zmiennoprzecinkowych - błąd](#działania-na-liczbach-zmiennoprzecinkowych---błąd)
    - [Twierdzenie o kumulacji błędów](#twierdzenie-o-kumulacji-błędów)
    - [Zjawisko utraty cyfr znaczących](#zjawisko-utraty-cyfr-znaczących)
  - [Uwarunkowanie zadania i numeryczna poprawność](#uwarunkowanie-zadania-i-numeryczna-poprawność)
    - [Wzór na uwarunkowanie zadania](#wzór-na-uwarunkowanie-zadania)
    - [Algorytm numerycznie poprawny](#algorytm-numerycznie-poprawny)


## Teoria wstępna

### Błąd bezwzględny i względny

Błąd bezwzględny: $|x-x_{appr}|$


Błąd względny: $\frac{|x-x_{appr}|}{|x|}$

### Reprezenacja liczb w komputerze

Całkowite: $x = \pm \sum_{i=0}^{n-1} a_i 2^i$ gdzie $a_i \in \{0,1\}$ (a więc suma odpowiednich potęg dwójki)

Rzeczywiste: $x = s * m * 2^c$ gdzie $s \in \{-1,1\}$, $m$ mantysa, $c$ wykładnik

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

Dla $x,y \in \mathbb{R}$, $x \neq y$ i $x,y$ są blisko siebie, to $x-y$ może być obarczone dużym błędem względnym.

Przykłady:

$f(x) = 14\frac{1-cos(17x)}{x^2}$
<details>
<summary>Rozwiązanie problemu</summary>

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