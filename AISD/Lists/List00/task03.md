## Zadanie 3
### Algorytm szybkiego potęgowania ze stałą liczbą komórek, złożoność (kryterium jednorodne i logarytmiczne)
```py3
def szybkie_potegowanie(n, x):
    wynik = 1
    while n > 0:
        if n % 2 == 1:
            wynik *= x
        x *= x
        n //= 2
    zwróć wynik
```

Mnożymy kolejne niezerowe bity liczby n przez odpowiednie potęgi x

#### W kryterium jednorodnym
Mamy log_2(n) iteracji pętli, każda z co najwyżej jednym mnożeniem. Mamy $O(log_2(n))$
#### W kryterium logarytmicznym
Mnożone operandy są długości $log_2(n)$, dostajemy $O(log_2^2(n))$