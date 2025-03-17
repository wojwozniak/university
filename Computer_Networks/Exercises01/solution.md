# Ćwiczenia 1

## Zadanie 1
Dla każdego z podanych poniżej adresów IP w notacji CIDR określ, czy jest to adres sieci, adres rozgłoszeniowy czy też adres komputera. W każdym przypadku wyznacz odpowiadający mu adres sieci, rozgłoszeniowy i jakiś adres IP innego komputera w tej samej sieci.
- 10.1.2.3/8
- 156.17.0.0/16
- 99.99.99.99/27
- 156.17.64.4/30
- 123.123.123.123/32

### a) 10.1.2.3
- Adres komputera
- Adres sieci to 10.0.0.0
- Adres rozgłoszeniowy to 10.255.255.255
- Inny adres koputera w tej samej sieci: 10.1.2.4

### b) 156.17.0.0
- Jest to adres sieci
- Adres rozgłoszeniowy 156.17.255.255
- Przykładowy komputer: 156.17.0.1

### c) 99.99.99.99/27

- /27, więc maska to 255.255.255.244 (244 = 11100000)
- Adres sieci:  99.99.99.96
    - 99.99.99.99 & 255.255.255.224
    - 01100011 && 11100000 = 01100000 = 96
- 27 bitów sieci, 32-27=5 bitów hosta => 2^5 = 32 adresy w podsieci
- Adres rozgłoszeniowy = 99.99.99.127
- Jest to więc adres komputera

### d) 156.17.64.4/30
- /30, maska to 255.255.255.252, 2^2 = 4 adresy w podsieci
- Adres sieci 156.17.64.4 & 255.255.255.252 = 156.17.64.4 (4 = 00000100, 252 = 11111100, więc 4 & 252 = 4)
- Rozgłoszeniowy - sieci + 4 - 1 = 156.17.64.7
- Jest to adres sieci
- Przykładowy adres komputera = 156.17.64.5

### e) 123.123.123.123/32
- /32, czyli to jedyny adres w podsieci
- Jest to równocześnie adres sieci, komputera i rozgłoszeniowy
- Brak innych komputerów

## Zadanie 2

Podziel sieć 10.10.0.0/16 na 5 rozłącznych podsieci, tak aby każdy z adresów IP z sieci 10.10.0.0/16 był w jednej z tych 5 podsieci. Jak zmieniła się liczba adresów IP możliwych do użycia przy adresowaniu komputerów? Jaki jest minimalny rozmiar podsieci, który możesz uzyskać w ten sposób?


### Wstęp
- Dostajemy sieć 10.10.0.0/16
- Ostatni adres w sieci to 10.10.255.255
- Maska /16 -> 2^16 - 2 = 65536 - 2 = 65534 hosty
- Nie podzielimy na równe sieci, bo inaczej nie pokryjemy całego zakresu
- Możemy po kolei brać kolejne bity z maski
- Podsieci będą miały maski /17 /18 /19 /20 /20
#### Maska /17
- 255.255.128.0
- Sieć od 10.10.0.0 - 10.10.127.255
- Pozostaje od 10.10.128.0 do 10.10.255.255

#### Maska /18
- 255.255.192.0
- Sieć od 10.10.128.0 - 10.10.191.255
- Pozostaje od 10.10.192.0 do 10.10.255.255

#### Maska /19
- 255.255.224.0
- Sieć od 10.10.192.0 - 10.10.223.255
- Pozostaje od 10.10.224.0 do 10.10.255.255

#### Maska /20
- 255.255.240.0
- Sieć od 10.10.224.0 - 10.10.239.255
- Pozostaje od 10.10.240.0 do 10.10.255.255

#### Maska /20
- 255.255.240.0
- Sieć od 10.10.240.0 - 10.10.255.255
- Pozostaje brak (cały zakres pokryty)

### Łącznie
- 10.10.0.0 / 17
- 10.10.128.0 / 18
- 10.10.192.0 / 19
- 10.10.224.0 / 20
- 10.10.240.0 / 20


- Ilość hostów spadła o 8 -> 4 dodatkowe sieci i 4 adresy rozgłoszeniowe

#### Jaka jest najmniejsza sieć jaką możemy uzyskać w ten sposób

Z maską 20 -> 2^12 - 2 = 4094

Dlaczego?

3 razy zmniejszamy o pozostałą pulę połowę (najmocniej jak się da nie biorąc całości)

Dla dwóch ostatnich dzielimy dokładnie na pół

## Zadanie 3
Tablica routingu zawiera następujące wpisy (podsieć → dokąd wysłać):
- 0.0.0.0/0 → do routera A
- 10.0.0.0/23 → do routera B
- 10.0.2.0/24 → do routera B
- 10.0.3.0/24 → do routera B
- 10.0.1.0/24 → do routera C
- 10.0.0.128/25 → do routera B
- 10.0.1.8/29 → do routera B
- 10.0.1.16/29 → do routera B
- 10.0.1.24/29 → do routera B

Napisz równoważną tablicę routingu zawierającą jak najmniej wpisów.

### Rozpisane

- 0.0.0.0/0 - Od 0.0.0.0 do 255.255.255.255 → Router A  
- 10.0.0.0/23 - Od 10.0.0.0 do 10.0.1.255 → Router B  
- 10.0.2.0/24 - Od 10.0.2.0 do 10.0.2.255 → Router B (do zmergowania)
- 10.0.3.0/24 - Od 10.0.3.0 do 10.0.3.255 → Router B (do zmergowania)
- 10.0.1.0/24 - Od 10.0.1.0 do 10.0.1.255 → Router C  
- 10.0.0.128/25 - Od 10.0.0.128 do 10.0.0.255 → Router B  
- 10.0.1.8/29 - Od 10.0.1.8 do 10.0.1.15 → Router B (do zmergowania)
- 10.0.1.16/29 - Od 10.0.1.16 do 10.0.1.23 → Router B (do zmergowania)
- 10.0.1.24/29 - Od 10.0.1.24 do 10.0.1.31 → Router B  

### Zostaje po pierwszym kroku: 

- 0.0.0.0/0 - Od 0.0.0.0 do 255.255.255.255 → Router A  
- 10.0.0.0/23 - Od 10.0.0.0 do 10.0.1.255 → Router B (do zmergowania)  
- 10.0.2.0/23 - Od 10.0.2.0 do 10.0.3.255 → Router B (do zmergowania)
- 10.0.1.0/24 - Od 10.0.1.0 do 10.0.1.255 → Router C  
- 10.0.0.128/25 - Od 10.0.0.128 do 10.0.0.255 → Router B (podsieć wyższych B, nie "walczy" z innymi)
- 10.0.1.8/28 - Od 10.0.1.8 do 10.0.1.23 → Router B
- 10.0.1.24/29 - Od 10.0.1.24 do 10.0.1.31 → Router B 

### Koniec:

- 0.0.0.0/0 - Od 0.0.0.0 do 255.255.255.255 → Router A  
- 10.0.0.0/22 - Od 10.0.0.0 do 10.0.3.255 → Router B
- 10.0.1.0/24 - Od 10.0.1.0 do 10.0.1.255 → Router C
- 10.0.1.8/28 - Od 10.0.1.8 do 10.0.1.23 → Router B
- 10.0.1.24/29 - Od 10.0.1.24 do 10.0.1.31 → Router B 

## Zadanie 4

Wykonaj powyższe zadanie dla tablicy
- 0.0.0.0/0 → do routera A
- 10.0.0.0/8 → do routera B
- 10.3.0.0/24 → do routera C
- 10.3.0.32/27 → do routera B
- 10.3.0.64/27 → do routera B
- 10.3.0.96/27 → do routera B

### Przepisane

- 0.0.0.0/0 - Od 0.0.0.0 do 255.255.255.255 → do routera A  
- 10.0.0.0/8 - Od 10.0.0.0 do 10.255.255.255 → do routera B  
- 10.3.0.0/24 - Od 10.3.0.0 do 10.3.0.255 → do routera C  
- 10.3.0.32/27 - Od 10.3.0.32 do 10.3.0.63 → do routera B  
- 10.3.0.64/27 - Od 10.3.0.64 do 10.3.0.95 → do routera B (do zmergowania)
- 10.3.0.96/27 - Od 10.3.0.96 do 10.3.0.127 → do routera B (do zmergowania)

### Rozwiązanie

- 0.0.0.0/0 - do routera A  
- 10.0.0.0/8 - do routera B  
- 10.0.3.0/27 - do C
- 10.0.3.128/25 - do C

## Zadanie 5

Jak uporządkować wpisy w tablicy routingu, żeby zasada najlepszego dopasowania odpowiadała wyborowi „pierwszy pasujący” (tj. przeglądaniu tablicy od początku do końca aż do momentu napotkania
dowolnej pasującej reguły)? Odpowiedź uzasadnij formalnie.

### Rozwiązanie

Od najbardziej specyficznych do najmniej specificznych. (Najdłuższa maska -> najkrótsza maska)

#### Dowód

Typowy nie wprost. Wybraliśmy adres. Załóżmy że istnieje bardziej specyficzna zasada która pasowała -> musieliśmy ją sprawdzić wcześniej -> sprzeczność


## Zadanie 6

W podanej niżej sieci tablice routingu budowane są za pomocą algorytmu wektora odległości. Pokaż
(krok po kroku), jak będzie się to odbywać. W ilu krokach zostanie osiągnięty stan stabilny?

### Rozwiązanie

#### Krok 0

| Router/Sieć | Su  | Sw  | Sx  | Sy  | Sz  |
| ----------- | --- | --- | --- | --- | --- |
| A           | x   | x   | x   | x   | x   |
| B           | x   | x   | x   | x   | x   |
| C           | x   | x   | x   | x   | x   |
| D           | x   | x   | x   | x   | x   |
| E           | x   | x   | x   | x   | x   |

#### Krok 1

| Router/Sieć | Su    | Sw    | Sx    | Sy    | Sz    |
| ----------- | ----- | ----- | ----- | ----- | ----- |
| A           | ``1`` | x     | x     | x     | x     |
| B           | 1     | ``1`` | ``1`` | x     | x     |
| C           | x     | x     | 1     | x     | ``1`` |
| D           | x     | 1     | x     | ``1`` | 1     |
| E           | x     | x     | x     | 1     | x     |

#### Krok 2

| Router/Sieć | Su       | Sw       | Sx       | Sy       | Sz       |
| ----------- | -------- | -------- | -------- | -------- | -------- |
| A           | 1        | ``2(B)`` | ``2(B)`` | x        | x        |
| B           | 1        | 1        | 1        | ``2(D)`` | ``2(C)`` |
| C           | ``2(B)`` | 2(B)     | 1        | 2(D)     | 1        |
| D           | 2(B)     | 1        | ``2(B)`` | 1        | 1        |
| E           | x        | ``2(D)`` | x        | 1        | 2(D)     |

#### Krok 3 - koniec

| Router/Sieć | Su       | Sw   | Sx       | Sy       | Sz       |
| ----------- | -------- | ---- | -------- | -------- | -------- |
| A           | 1        | 2(B) | 2(B)     | ``3(B)`` | ``3(B)`` |
| B           | 1        | 1    | 1        | 2(D)     | 2(C)     |
| C           | 2(B)     | 2(B) | 1        | 2(D)     | 1        |
| D           | 2(B)     | 1    | 2(B)     | 1        | 1        |
| E           | ``3(D)`` | 2(D) | ``3(D)`` | 1        | 2(D)     |


## Zadanie 7

Załóżmy, że w powyższej sieci tablice routingu zostały już zbudowane. Co będzie się działo (krok po
kroku), jeśli zostanie dodana sieć SQ łącząca routery A i E?

### Rozwiązanie

#### Krok 0

| Router/Sieć | Su   | Sw   | Sx   | Sy   | Sz   | Sq  |
| ----------- | ---- | ---- | ---- | ---- | ---- | --- |
| A           | 1    | 2(B) | 2(B) | 3(B) | 3(B) | x   |
| B           | 1    | 1    | 1    | 2(D) | 2(C) | x   |
| C           | 2(B) | 2(B) | 1    | 2(D) | 1    | x   |
| D           | 2(B) | 1    | 2(B) | 1    | 1    | x   |
| E           | 3(D) | 2(D) | 3(D) | 1    | 2(D) | x   |

#### Krok 1

| Router/Sieć | Su   | Sw   | Sx   | Sy   | Sz   | Sq    |
| ----------- | ---- | ---- | ---- | ---- | ---- | ----- |
| A           | 1    | 2(B) | 2(B) | 3(B) | 3(B) | ``1`` |
| B           | 1    | 1    | 1    | 2(D) | 2(C) | x     |
| C           | 2(B) | 2(B) | 1    | 2(D) | 1    | x     |
| D           | 2(B) | 1    | 2(B) | 1    | 1    | x     |
| E           | 3(D) | 2(D) | 3(D) | 1    | 2(D) | ``1`` |

#### Krok 2

| Router/Sieć | Su   | Sw   | Sx   | Sy   | Sz   | Sq       |
| ----------- | ---- | ---- | ---- | ---- | ---- | -------- |
| A           | 1    | 2(B) | 2(B) | 2(E) | 3(B) | 1        |
| B           | 1    | 1    | 1    | 2(D) | 2(C) | ``2(A)`` |
| C           | 2(B) | 2(B) | 1    | 2(D) | 1    | x        |
| D           | 2(B) | 1    | 2(B) | 1    | 1    | ``2(E)`` |
| E           | 3(D) | 2(D) | 3(D) | 1    | 2(D) | 1        |

#### Krok 3

| Router/Sieć | Su   | Sw   | Sx   | Sy   | Sz   | Sq       |
| ----------- | ---- | ---- | ---- | ---- | ---- | -------- |
| A           | 1    | 2(B) | 2(B) | 2(E) | 3(B) | 1        |
| B           | 1    | 1    | 1    | 2(D) | 2(C) | ``2(A)`` |
| C           | 2(B) | 2(B) | 1    | 2(D) | 1    | ``3(B)`` |
| D           | 2(B) | 1    | 2(B) | 1    | 1    | ``2(E)`` |
| E           | 3(D) | 2(D) | 3(D) | 1    | 2(D) | 1        |

## Zadanie 8
W przedstawionej poniżej sieci uszkodzeniu ulega połączenie między routerami D i E. Załóżmy, że w sieci działa algorytm wektora odległości wykorzystujący technikę zatruwania ścieżki zwrotnej (poison reverse). Pokaż — opisując krok po kroku jakie komunikaty są przesyłane między routerami — że może powstać cykl w routingu

### Rozwiązanie

#### Setup startowy

| Router \ Router | A        | B        | C        | D        | E        |
| --------------- | -------- | -------- | -------- | -------- | -------- |
| A               | 0        | 1        | 1        | 2(via B) | 3(via B) |
| B               | 1        | 0        | 2(via A) | 1        | 2(via D) |
| C               | 1        | 2(via A) | 0        | 1        | 2(via D) |
| D               | 2(via B) | 1        | 1        | 0        | 1        |
| E               | 3(via D) | 2(via D) | 2(via D) | 1        | 0        |

#### Teraz wysiada sieć Sx

- E wie że routuje wszystko przez D, więc traci wszystko, nie ma komu tego ogłosić więc tylko aktualizuje u siebie
- D traci dostęp do E, ogłasza swoim sąsiadom że E = x

| Router \ Router | A        | B        | C        | D        | E        |
| --------------- | -------- | -------- | -------- | -------- | -------- |
| A               | 0        | 1        | 1        | 2(via B) | 3(via B) |
| B               | 1        | 0        | 2(via A) | 1        | 2(via D) |
| C               | 1        | 2(via A) | 0        | 1        | 2(via D) |
| D               | 2(via B) | 1        | 1        | 0        | `x`      |
| E               | `x`      | `x`      | `x`      | `x`      | 0        |

- D sends to B that E via D = inf
- D sends to C that E via D = inf

#### Krok 2

- Aktualizujemy, ale C dostaje informację że A nadal ma drogę (bo B nie zdążyło spropagować informacji do A)
- B wysyła do A że już nie ma drogi do E

| Router \ Router | A        | B        | C        | D        | E           |
| --------------- | -------- | -------- | -------- | -------- | ----------- |
| A               | 0        | 1        | 1        | 2(via B) | 3(via B)    |
| B               | 1        | 0        | 2(via A) | 1        | `x`         |
| C               | 1        | 2(via A) | 0        | 1        | `4 (via A)` |
| D               | 2(via B) | 1        | 1        | 0        | x           |
| E               | x        | x        | x        | x        | 0           |

#### Krok 3

| Router \ Router | A        | B        | C        | D        | E          |
| --------------- | -------- | -------- | -------- | -------- | ---------- |
| A               | 0        | 1        | 1        | 2(via B) | `x`        |
| B               | 1        | 0        | 2(via A) | 1        | x          |
| C               | 1        | 2(via A) | 0        | 1        | 3 (via A)  |
| D               | 2(via B) | 1        | 1        | 0        | `5(via C)` |
| E               | x        | x        | x        | x        | 0          |

#### Krok 4

I tu już widzimy że informacja o tym że sieć była przerwana będzie "uciekać". 
- C dowie się że że A już nie ma drogi i ustawi na x
- Ale D już miało i przekazało informację do B, które teraz ustawia drogę do E na 6(via D)

#### Krok 5
- D dowie się że C nie ma drogi i ustawia na x
- B mówi A o drodze do E, A ustawia 7 (via B)

...

## Zadanie 9

Pokaż, że przy wykorzystaniu algorytmu stanu łączy też może powstać cykl w routingu. W tym celu skonstruuj sieć z dwoma wyróżnionymi, sąsiadującymi ze sobą routerami A i B. Załóż, że wszystkie routery znają graf całej sieci. W pewnym momencie łącze między A i B ulega awarii, o czym A i B od razu się dowiadują. Zalewają one sieć odpowiednią aktualizacją. Pokaż, że w okresie propagowania tej aktualizacji (kiedy dotarła ona już do części routerów a do części nie) może powstać cykl w routingu.

### Rozwiązanie

```
   A ----- B
   |       |
   |       C
   |       |
   |       x
   |       |
   E ----- D

gdzie x to bardzo ciężka krawędź której algorytm chce uniknąć
```

- Router wysiada, rozsyłana jest informacja.
- A, B wiedzą od razu, przekazują to do B i E -> D jeszcze nie wie
- Chcemy wysłać pakiet E->B
- E wysyła pakiet do D bo wie że to jedyna ścieżka
- D wysyła do E bo to najkrótsza (według niego)
- Wysyłają sobie w kółko dopóki D się nie dowie że nie A-B nie istnieje


## Zadanie 10

Załóżmy, że sieć składa się z łączy jednokierunkowych (tj. łącza w sieci tworzą graf skierowany) i nie zawiera cykli. Rozważmy niekontrolowany algorytm „zalewający” sieć jakimś komunikatem: komunikat zostaje wysłany początkowo przez pewien router; każdy router, który dostanie dany komunikat przesyła go dalej wszystkimi wychodzącymi z niego krawędziami. Pokaż, że istnieją takie sieci z n routerami, w których przesyłanie informacji zakończy się po czasie 2^Ω(n). Zakładamy, że przez jedno łącze można przesłać tylko jeden komunikat naraz, a przesłanie go trwa jednostkę czasu.

### Rozwiązanie

Robimy romby
```
   |
   o1
 /  \
o    o
\   /
  o
  |
  o2
/  \
o  o
\  /
 o3
 |
...
```

Pierwszy odbiera/wysyła 1 komunikat, drugi 2, trzeci 4...

Łącznie 2^(1/4 n)