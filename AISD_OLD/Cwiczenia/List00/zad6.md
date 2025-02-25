Algorytm w pseudokodzie (python to wsm taki pseudojezyk)
```py3
def szybkie_potegowanie(x, n):
  wynik = 1
  while n > 0:
    if n % 2 == 1:
      wynik *= x
    x *= x
    n //= 2
  zwróć wynik
```
Mnożymy kolejne niezerowe bity liczby n przez odpowiednie potęgi x.

### Oszacuj d(n) (ilość mnnożeń w algorytmie) w zależności od n
d(n) = 2ceil(log(n))

### Pokaż, że dla każdego k in N istnieje n takie, że wartości x^n mogą być obliczone przy pomocy co najwyżej d(n)-k mnożeń

worst case scernario: lb = 2^k - 1

binarnie: 11...1

Ile mnożeń wykonamy dla takiej liczby?

mamy wtedy maksymalną ilość mnożeń czyli 2ceil(log_2(2^k - 1)) - k = ~2k - k = k

dla d(k) - k mielibysmy dokladnie 0 - czyli dziala