# Poprawność mnożenia po rosyjsku

## Co to?
Dostajemy dwie liczby, a i b.
Nasz algorytm:

- Tworzy ciąg liczb a, gdzie
  
$a_0 = a$, 

$a_{i+1} = \lfloor\frac{a_i}{2}\rfloor$ dla $i \geq 0$.

(Wykonujemy te dzielenia tak długo aż a_i nie osiągnie 1 (z 1 włącznie))

- Tworzy ciąg liczb b, gdzie

$b_0 = b$,

$b_{i+1} = 2b_i$ dla $i \geq 0$.

Czyli pierwszą liczbę dzielimy całkowicie przez 2, a drugą mnożymy przez 2.

Następnie sumujemy wszystkie liczby z ciągu b, dla których odpowiadająca im liczba z ciągu a jest nieparzysta.

Np. a = 6, b = 2

$a_0 = 6, a_1 = 3, a_2 = 1$

$b_0 = 2, b_1 = 4, b_2 = 8$

Sumujemy 4 i 8, bo 3 i 1 są nieparzyste.

4 + 8 = 6 * 2 = 12

## Dowód poprawności:

Wyobraźmy sobie jak działa nasz algorytm dla liczb w postaci binarnej.

Nasze a w każdym kroku dzielimy przez 2, czyli przesuwamy binarnie w lewo (usuwamy ostatni bit). Jeśli liczba jest nieparzysta (ostatni bit równy 1), to dodajemy liczbę b. W i-tym kroku nasze b ma postać $2^i * b$.

Można zapisać to wzorem

$\sum_{i=0}^{log_2{(a)}}a_i2^ib$

b możemy wyjąć przed sumę, bo jest stałe.

$b\sum_{i=0}^{log_2{(a)}}a_i2^i$

a ta suma to nic innego jak nasza liczba a w postaci binarnej. Tak więc nasze mnożenie przekształca się do prostego

$a*b$

A więc nasz algorytm jest poprawny.

## Złożoność czasowa i pamięciowa 

### Przy jednorodnym kryterium kosztu:

Czasowa: $O(log_2(a))$ - wykonujemy stałą liczbę operacji dla każdego bitu liczby a - czyli dokładnie $log_2(a)$ razy. 

Pamięciowa: $O(1)$ - nie przechowujemy żadnych dodatkowych danych, poza naszymi liczbami a i b.

### Przy logarytmicznym kryterium kosztu:

Czasowa: $O(log_2(a))$ z pętli i $O(log_2(ab))$ - bo to potencjalnie najdłuższa postać naszego b. Łącznie $O(log_2(a) * log_2(ab))$

Pamięciowa: $O(log_2(ab))$ - bo tyle potencjalnie może mieć bitów ostateczna suma (i też wsm b w ostatnim kroku).