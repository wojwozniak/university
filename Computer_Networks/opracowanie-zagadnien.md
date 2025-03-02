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
