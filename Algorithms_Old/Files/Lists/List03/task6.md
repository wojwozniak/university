# Zadanie 6 / Lista 3

Dane jest drzewo binarne (możesz założyć dla prostoty, że jest to pełne drzewo binarne), którego każdy wierzchołek vi skrywa pewną liczbę rzeczywistą xi. Zakładamy, że wartości skrywane w wierzchołkach są różne. Mówimy, że wierzchołek v jest minimum lokalnym, jeśli wartość skrywana w nim jest mniejsza od wartości skrywanych w jego sąsiadach.

Ułóż algorytm znajdujący lokalne minimum, odkrywając jak najmniej skrywanych wartości.

## Wstęp
- Optymalizujemy pod minimalizowanie ilości odkrytych wartości
- Zawsze znajdziemy jakieś rozwiązanie, szukamy tylko jednego

## Idea algorytmu

```py
def fn(curr):
    c_, l, r = reveal()
    if c < l and c < r return curr
    else fn(smaller(l, r))

fn(root)
```
- Zaczynamy od góry, nie ma parenta do sprawdzania
- Nie musimy wybierać nawet najmniejszej, byle mniejsza niż current
- Ścieżka co najwyżej długość log_n + 1 -> Robimy ~3log_n checków
- Nigdy się nie cofamy - zawsze skończymy
- Jeśli nie mamy roota / jesteśmy w innym miejscu to do 8log_n checków

## A skąd wiemy że działa?

### Że rozwiązanie istnieje tam gdzie wejdziemy

- Każde drzewo i subdrzewo ma jakiś najmniejszy element -> no bo da się posortować

- Przechodzimy tylko do mniejszych, więc node którym weszliśmy nam nic nie psuje

### Że nie zwrócimy niepoprawnego przez przypadek

Załóżmy nie wprost że zwracamy niepoprawne -> istnieje sąsiad `u` o mniejszej wadze. Mamy trzy przypadki:

- Z niego weszliśmy -> niemożliwe, przechodzimy tylko do mniejszych
- Już w nim byliśmy nie wchodząc z niego -> nie jest to drzewo
- Jeszcze nas w nim nie było -> wybralibyśmy go