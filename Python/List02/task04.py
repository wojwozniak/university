import random


def uprosc_zdanie(tekst, dl_slowa, liczba_slow):
    # Podziel zdanie na słowa
    slowa = tekst.split()
    
    # Usuń zbyt długie słowa
    slowa = [slowo for slowo in slowa if len(slowo) <= dl_slowa]
    
    # Usuń losowo wyrazy, jeśli jest ich za dużo
    if len(slowa) > liczba_slow:
        do_usuniecia = len(slowa) - liczba_slow
        slowa = random.sample(slowa, liczba_slow)
    
    # Połącz słowa w nowe zdanie
    nowe_zdanie = ' '.join(slowa)
    
    return nowe_zdanie

# Testy
tekst = "Podział peryklinalny inicjałów wrzecionowatych \
kambium charakteryzuje się ścianą podziałową inicjowaną \
w płaszczyźnie maksymalnej."
wynik = uprosc_zdanie(tekst, 10, 5)
print(wynik)


# Tekst 2 - Pan Tadeusz
# Link: 
# https://wolnelektury.pl/katalog/lektura/pan-tadeusz.html
tekst2 = "Litwo! Ojczyzno moja! ty jesteś jak zdrowie: \
Ile cię trzeba cenić, ten tylko się dowie, \
Kto cię stracił. Dziś piękność twą w całej ozdobie \
Widzę i opisuję, bo tęsknię po tobie. \
Panno święta, co Jasnej bronisz Częstochowy \
I w Ostrej świecisz Bramie! Ty, co gród zamkowy \
Nowogródzki ochraniasz z jego wiernym ludem! \
Jak mnie dziecko do zdrowia powróciłaś cudem \
(Gdy od płaczącej matki, pod Twoją opiekę \
Ofiarowany, martwą podniosłem powiekę; \
I zaraz mogłem pieszo, do Twych świątyń progu \
Iść za wrócone życie podziękować Bogu), \
Tak nas powrócisz cudem na Ojczyzny łono. \
Tymczasem przenoś moją duszę utęsknioną \
Do tych pagórków leśnych, do tych łąk zielonych, \
Szeroko nad błękitnym Niemnem rozciągnionych; \
Do tych pól malowanych zbożem rozmaitem, \
Wyzłacanych pszenicą, posrebrzanych żytem; \
Gdzie bursztynowy świerzop, gryka jak śnieg biała, \
Gdzie panieńskim rumieńcem dzięcielina pała, \
A wszystko przepasane jakby wstęgą, miedzą \
Zieloną, na niej z rzadka ciche grusze siedzą."

wynik2 = uprosc_zdanie(tekst2, 10, 20)
print(wynik2)