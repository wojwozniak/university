import random
import math

def przyblizPi(maksRoznica):
    # Liczba trafień wewnątrz okręgu
    ltwo = 0

    # Całkowita liczba trafień w tarczę
    cltwt = 0

    # Liczba rzutów
    liczbaRzutow = 1000000

    # Główna pętla symulacji
    for i in range(liczbaRzutow):
        # Losowanie współrzędnych punktu na tarczy (x, y) w zakresie od -1 do 1
        x = random.uniform(-1, 1)
        y = random.uniform(-1, 1)

        # Obliczenie odległości od środka tarczy
        odleglosc = math.sqrt(x ** 2 + y ** 2)

        # Jeśli odległość jest mniejsza lub równa 1, punkt trafił wewnątrz tarczy
        if odleglosc <= 1:
            ltwo += 1

        # Zwiększenie całkowitej liczby trafień
        cltwt += 1

        # Obliczenie przybliżenia liczby π i wypisanie go po każdym rzucie
        przyblizeniePi = (4 * ltwo) / cltwt
        print(f"Przybliżenie π po rzucie {i + 1}: {przyblizeniePi}")

        # Sprawdzenie warunku zakończenia programu
        if abs(przyblizeniePi - math.pi) < maksRoznica:
            print("Program zakończony.")
            break


przyblizPi(0.0001)