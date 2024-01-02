import random
import time

# Zwykły Czebyszew dla testów
def Czebyszew(n, x):
    if n == 0:
        return 1
    if n == 1:
        return x
    return 2 * x * Czebyszew(n - 1, x) - Czebyszew(n - 2, x)

# Pomocnicze funkcje
def czy_pierwsza(n):
    return n > 1 and all(n % i != 0 for i in range(2, int(n**0.5) + 1))
    
def pierwszy_dzielnik(n):
    return next((i for i in range(2, int(n**0.5) + 1) if n % i == 0), n)


# Algorytm wyznaczający n-tą potęgę Czebyszewa dla x ∈ R w czasie O(log n).
# Wykorzystujemy zależność T_kl(x) = T_k(T_l(x))
def FastCzebyszew(n, x):
    # Najpierw bazowe przypadki
    if n == 0:
        return 1
    if n == 1:
        return x
    if n == 2:
        return 2 * x * x - 1
    if n % 2 == 0:
        return FastCzebyszew(2, FastCzebyszew(n // 2, x))
    # Teraz n jest nieparzyste
    # Sprawdzamy czy n jest liczbą pierwszą - jeśli nie to musimy korzystać z normalnego algorytmu
    if czy_pierwsza(n):
        return 2 * x * Czebyszew(n - 1, x) - Czebyszew(n - 2, x)
    # Teraz n jest nieparzyste i złożone
    dzielnik1 = pierwszy_dzielnik(n)
    dzielnik2 = n / dzielnik1
    return FastCzebyszew(dzielnik1, FastCzebyszew(dzielnik2, x))

# Teraz testy

def test():
    # Generujemy 2 ciagi liczb dlugosci 100 zawierajace tylko liczby zlozone z przedzialu [1, 100]
    ciag1 = []
    ciag2 = []
    max_n = 30

    while len(ciag1) < 100:
        liczba = random.randint(1, max_n)
        if not czy_pierwsza(liczba):
            ciag1.append(liczba)

    while len(ciag2) < 100:
        liczba = random.randint(1, max_n)
        if not czy_pierwsza(liczba):
            ciag2.append(liczba)

    print("Pierwszy ciąg liczb:")
    print(ciag1)
    print("\nDrugi ciąg liczb:")
    print(ciag2)

    error = False

    for i in range(100):
        if(Czebyszew(ciag1[i], ciag2[i]) != FastCzebyszew(ciag1[i], ciag2[i])):
            print("Błąd dla n = " + str(ciag1[i]))
            error = True
            
    if(not error):
        print("Brak błędów.")
    return

def pomiarczasu():
    m = 30
    n = 30
    
    # Mierzenie czasu funkcji Czebyszew
    start_time = time.time()
    result_Czebyszew = Czebyszew(m, n)
    end_time = time.time()
    time_Czebyszew = end_time - start_time
    print("Czebyszew(30, 30) czas wykonania:", time_Czebyszew, "sekundy")
    
    # Mierzenie czasu funkcji FastCzebyszew
    start_time = time.time()
    result_FastCzebyszew = FastCzebyszew(m, n)
    end_time = time.time()
    time_FastCzebyszew = end_time - start_time
    print("FastCzebyszew(30, 30) czas wykonania:", time_FastCzebyszew, "sekundy")
    
    return

# test()
# pomiarczasu()