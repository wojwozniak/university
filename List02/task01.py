# Funkcja rozdzielająca mandaty metodą d'Hondta
def dHondt(lista, ilosc_mandatow):
    
    # Suma głosów
    suma = sum(lista)
    
    # Prog wyborczy
    prog_wyborczy = suma * 0.05
    
    # Odfiltrowanie partii, które nie przeszły progu wyborczego
    lista = [x for x in lista if x >= prog_wyborczy]
    
    # Lista mandatów
    mandaty = [0] * len(lista)
    
    # Rozdzielanie mandatów
    for i in range(ilosc_mandatow):
        # Wybór partii o największym ilorazie głosów do liczby mandatów
        max_iloraz = 0
        wybrana_partia = -1
        for j in range(len(lista)):
            iloraz = lista[j] / (mandaty[j] + 1)
            if iloraz > max_iloraz:
                max_iloraz = iloraz
                wybrana_partia = j
        
        # Przyznanie mandatu wybranej partii
        mandaty[wybrana_partia] += 1
        
        # Wypisanie ilości głosów, jaką partia zdobywa mandat, podzieloną przez ilość dotychczas zdobytych mandatów
        ilosc_glosow = lista[wybrana_partia] / (mandaty[wybrana_partia])
        print(f"Partia {wybrana_partia + 1} zdobywa mandat za {ilosc_glosow:.2f} głosów.")
    
    return mandaty

# Przykładowe użycie funkcji
lista_glosow = [10000, 8000, 6000, 4000]
ilosc_mandatow = 10
wynik = dHondt(lista_glosow, ilosc_mandatow)
print("Lista mandatów:", wynik)