import timeit

# Funkcja sprawdzająca czy liczba jest pierwsza
def czy_pierwsza(num):
    if num < 2:
        return False
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            return False
    return True

# Wersja imperatywna
def pierwsze_imperatywna(n):
    pierwsze = []
    for liczba in range(2, n + 1):
        if czy_pierwsza(liczba):
            pierwsze.append(liczba)
    return pierwsze

# Wersja z listą składaną
def pierwsze_skladana(n):
    return [liczba for liczba in range(2, n + 1) if czy_pierwsza(liczba)]


# Wersja funkcyjna
def pierwsze_funkcyjna(n):
    return list(filter(czy_pierwsza, range(2, n + 1)))


# Funkcja do przeprowadzania testów
def test():
    ns = [10, 20, 300, 1000, 2000, 3500]

    print("n  skladana  imperatywna  funkcyjna")
    for n in ns:
        skladana_time = timeit.timeit(
            lambda: pierwsze_skladana(n), number=1000)
        imperatywna_time = timeit.timeit(
            lambda: pierwsze_imperatywna(n), number=1000)
        funkcyjna_time = timeit.timeit(
            lambda: pierwsze_funkcyjna(n), number=1000)
        print(f"{n}: {skladana_time:.3f} {imperatywna_time:.3f} {funkcyjna_time:.3f}")

test()