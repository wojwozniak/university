# Opracowanie zagadnień z końca wykładu

Na końcu każdego wykładu są zagadnienia, podobno przydatne pod egzamin. Będę tu rozpisywał odpowiedzi na każde z pytań - powtórzenie po wykładzie. Niektóre pytania (bardziej złożone) będą podzielone na mniejsze części.

## Wykład 1
### 1.1. Co to jest protokół komunikacyjny? 

Protokół komunikacyjny to zestaw reguł i standardów określających sposób wymiany danych między urządzeniami w sieci komputerowej. Dzięki protokołom urządzenia mogą się komunikować niezależnie od swojej budowy, systemu operacyjnego czy producenta. Przykłady protokołów komunikacyjnych to HTTP, TCP/IP, DNS, FTP.

### 1.2. Dlaczego wprowadza się warstwy protokołów? 
Warstwy pozwalają podzielić ich funkcjonowanie na mniejsze, łatwiejsze do zarządzania części. Każda warstwa odpowiada za konkretne zadania, a komunikacja między nimi odbywa się według określonych zasad.

### 2. Wymień warstwy internetowego modelu warstwowego. Jakie są zadania każdej z nich?

| Warstwa             | Protokoly       | Zadania                                                                                             |
| ------------------- | --------------- | --------------------------------------------------------------------------------------------------- |
| **5. Aplikacji**    | HTTP, FTP, SMTP | Protokoły użytkowników                                                                              |
| **4. Transportowa** | TCP, UDP        | Kontrola transmisji, podział i łączenie strumienia danych na pakiety i error controlling/correction |
| **3. Sieci**        | IP              | Routing                                                                                             |
| **2. Łącza danych** | Ethernet, Wi-Fi | Transmisja ramek                                                                                    |
| **1. Fizyczna**     | Ethernet, Wi-Fi | Transmisja bitów                                                                                    |



### 3. Jakie warstwy są zaimplementowane na komputerach a jakie na routerach?

Routery mają zaimplementowane warstwy 1-3 (router przesyła sygnały przez ethernet/wifi, używa MAC do przesyłania ramek, trasuje pakiety IP między sieciami). Komputery mają zaimplementowane wszystkie warstwy (w szczególności wysyła sygnały przez kabel, kartę sieciową i używa IP więc ma 1,2,3 tak jak routery)

### 4. Czym różni się model warstwowy TCP/IP od OSI?

Jest to praktyczna, rzeczywiście używana wersja teoretycznego OSI. Ma 4 warstwy zamiast 7. 

#### OSI

| Warstwa             | Zadania                                          |
| ------------------- | ------------------------------------------------ |
| **7. Aplikacji**    | Interakcja użytkownika z siecią (HTTP, FTP, DNS) |
| **6. Prezentacji**  | Szyfrowanie, kodowanie, kompresja (TLS, ASCII)   |
| **5. Sesji**        | Zarządzanie sesjami (logowanie, SSH, RPC)        |
| **4. Transportowa** | Kontrola transmisji (TCP, UDP)                   |
| **3. Sieciowa**     | Routing i adresacja (IP, ICMP, OSPF)             |
| **2. Łącza danych** | Przesyłanie ramek (Ethernet, Wi-Fi, ARP)         |
| **1. Fizyczna**     | Przesyłanie bitów (kable, fale radiowe)          |

#### TCP/IP

| Warstwa                 | Odpowiedniki OSI                   | Zadania                               |
| ----------------------- | ---------------------------------- | ------------------------------------- |
| **4. Aplikacji**        | OSI: Aplikacji, Prezentacji, Sesji | Protokoły aplikacji (HTTP, FTP, SMTP) |
| **3. Transportowa**     | OSI: Transportowa                  | TCP/UDP – kontrola transmisji         |
| **2. Internetowa**      | OSI: Sieciowa                      | Routing, adresacja IP (IP, ICMP, ARP) |
| **1. Dostępu do sieci** | OSI: Łącza danych, Fizyczna        | Transmisja danych (Ethernet, Wi-Fi)   |

### 5. Co jest potrzebne do zbudowania dwukierunkowego niezawodnego kanału?

Potrzebne jest 7 warstw OSI (z ich wbudowanymi "bezpiecznikami" - każdy myślnik to kolejna warstwa)

- Fizyczne medium transmisyjne obsługujące przesyłanie w obu kierunkach
- Mechanizmy wykrywania i korekcji błędów (CRC, retransmisja).
- Adresacja IP i routing do przesyłania pakietów.
- Protokół transportowy z kontrolą błędów (TCP).
- Synchronizacja sesji (np. TLS, SSH).
- Bezpieczeństwo i szyfrowanie (TLS, SSL).
- Obsługa w aplikacjach sieciowych (HTTP, FTP, SMTP).

### 6. Porównaj wady i zalety przełączania obwodów i przełączania pakietów

| **Kryterium** | **Przełączanie obwodów**                     | **Przełączanie pakietów**                        |
| ------------- | -------------------------------------------- | ------------------------------------------------ |
| **Zalety**    | - Stała przepustowość i niskie opóźnienia    | - Efektywne wykorzystanie zasobów                |
|               | - Prosta obsługa po ustaleniu połączenia     | - Elastyczność w zmiennym ruchu                  |
|               |                                              | - Odporność na awarie (alternatywne trasy)       |
| **Wady**      | - Niewydajne wykorzystanie zasobów           | - Możliwe opóźnienia i jitter                    |
|               | - Długi czas nawiązywania połączenia         | - Większa złożoność (zarządzanie pakietami)      |
|               | - Brak elastyczności w krótkich transmisjach | - Ryzyko utraty pakietów w zatłoczonych sieciach |

### 7. Jakie znasz rodzaje multipleksowania? Po co i kiedy się je stosuje?

| **Rodzaj multipleksowania**     | **Zastosowanie**                                                     |
| ------------------------------- | -------------------------------------------------------------------- |
| Time Division Multiplexing      | Regularne, przewidywalne transmisje (np. telefonia)                  |
| Frequency Division Multiplexing | Równoległe sygnały w różnych częstotliwościach (np. radio)           |
| Statistical Multiplexing        | Elastyczne, efektywne wykorzystanie w sieciach danych (np. Internet) |

### 8. Porównaj ze sobą rodzaje routingu

| **Rodzaj routingu**             | **Kluczowa cecha**                                                                         |
| ------------------------------- | ------------------------------------------------------------------------------------------ |
| Routing źródłowy                | Kontrola nad trasą, ale nieefektywny. Dead tech                                            |
| Wykorzystujący tablice routingu | Elastyczny, skalowalny, dla Internetu. Aktualnie dominuje                                  |
| Wirtualne przełączanie obwodów  | Stabilny, ale wymaga konfiguracji. Możliwość rezerwacji zasobów - dobre do strumieniowania |

### 9. Co to jest komunikacja pełnodupleksowa, półdupleksowa i simpleksowa?

Określamy w ten sposób podział kanału
- Simpleksowa -> tylko w jednym kierunku, np. klawiatura -> komputer
- Półdupleksowa -> jeden kanał dzielony naprzemiennie dla dwóch kierunków, np. krótkofalówka
- Dupleksowa -> w obu kierunkach równocześnie (min. 2 kanały), np. rozmowa telefoniczna

### 10. Do czego służy polecenie traceroute? Co pokazuje?

`traceroute` (win: `tracert`) służy do śledzenia trasy pakietu od nas do wyznaczonego nadawcy.
| **Aspekt**   | **Opis**                             |
| ------------ | ------------------------------------ |
| Cel          | Śledzenie trasy pakietów w sieci     |
| Co pokazuje  | Routery, czas RTT, problemy w trasie |
| Zastosowanie | Diagnostyka i testowanie sieci       |

### 11.1. Po co stosuje się bufory w routerach? 

Bufory w routerach służą do tymczasowego przechowywania pakietów danych, gdy ich napływ przekracza zdolność routera do natychmiastowego przetworzenia lub przesłania.

### 11.2. Co to jest przeciążenie?
Przeciążenie to przekroczenie przez przychodzące pakiety przepustowości routera i jego bufora. Nadmiarowe pakiety są odrzucane (`drop`).

### 12. Jakie są przyczyny opóźnień pakietów?

| **Przyczyna opóźnienia** | **Kluczowa cecha**                          |
| ------------------------ | ------------------------------------------- |
| Propagacyjne             | Zależy od odległości i medium               |
| Transmisyjne             | Zależy od przepustowości i rozmiaru pakietu |
| Przetwarzania            | Zależy od wydajności routera                |
| Kolejkowania             | Zależy od obciążenia sieci                  |
| Jitter i retransmisje    | Zależy od stabilności połączenia            |

### 13.1. Co to jest BDP?

BDP (Bandwidth-Delay Product) to iloczyn przepustowości łącza (ang. bandwidth) i opóźnienia w obie strony (RTT – Round Trip Time). Wyraża, ile danych może być „w locie” w sieci w danym momencie.

### 13.2. Co to jest czas propagacji?

Czas propagacji (ang. propagation delay) to czas, jaki sygnał potrzebuje, by fizycznie pokonać odległość od nadawcy do odbiorcy w medium transmisyjnym.

### 14.1. Co umożliwia protokół IP?

| **Funkcja protokołu IP** | **Opis**                                                                                                        |
| ------------------------ | --------------------------------------------------------------------------------------------------------------- |
| Adresowanie              | Przydziela unikalne adresy IP urządzeniom, co pozwala identyfikować nadawcę i odbiorcę (np. IPv4: 192.168.1.1). |
| Routing                  | Umożliwia przekazywanie pakietów między sieciami za pomocą routerów, niezależnie od ich fizycznej topologii.    |
| Fragmentacja i składanie | Dzieli duże pakiety na mniejsze fragmenty (jeśli to konieczne) i składa je z powrotem u odbiorcy.               |
| Bezpołączeniowość        | Przesyła pakiety niezależnie, bez ustanawiania stałego połączenia między nadawcą a odbiorcą.                    |
| Uniwersalność            | Działa na różnych technologiach sieciowych (Ethernet, Wi-Fi, itp.), tworząc podstawę Internetu.                 |

### 14.2. Co to znaczy, że protokół realizuje zasadę best effort?

Zasada „best effort” oznacza, że protokół IP stara się dostarczyć pakiety do celu, ale nie gwarantuje ich dotarcia, kolejności ani braku opóźnień.

### 15. Jakie są zalety i wady zasady end-to-end?

Zasada end-to-end (ang. end-to-end principle) mówi, że funkcje takie jak niezawodność, kontrola błędów czy szyfrowanie powinny być realizowane na końcach komunikacji (nadawca i odbiorca), a nie w pośrednich węzłach sieci (np. routerach). Sieć ma tylko przesyłać dane.

| **Aspekt** | **Opis**                                   |
| ---------- | ------------------------------------------ |
| Zalety     | Prostota sieci, elastyczność, skalowalność |
| Wady       | Złożoność końcówek, brak QoS, opóźnienia   |

### 16. Po co wprowadza się porty?

Porty w sieciach komputerowych służą do rozróżniania różnych aplikacji lub usług działających na tym samym urządzeniu. Dzięki nim komputer wie, do którego programu skierować przychodzące dane, mimo że wszystkie używają jednego adresu IP.

### 17. Wyjaśnij pojęcie enkapsulacji i dekapsulacji

Enkapsulacja to proces „pakowania” danych w sieciach komputerowych, gdy są przesyłane z wyższej warstwy modelu OSI/TCP do niższej. Dekapsulacja to odwrócenie tego procesu.

Np. w TCP/IP:
- Aplikacja tworzy dane.
- Warstwa transportowa (TCP/UDP) dodaje nagłówek z portami.
- Warstwa sieciowa (IP) dodaje adresy IP.
- Warstwa łącza danych (np. Ethernet) dodaje adresy MAC i - ramkę.