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

## Wykład 2

### 1.1. Z czego wynika hierarchia adresów IP? 

Hierarchia adresów IP wynika z ich struktury, która dzieli adres na części: sieciową i hosta. Adres IP (np. IPv4: 192.168.1.10) składa się z dwóch elementów:
- Część sieciowa: Określa sieć, do której należy urządzenie (np. `192.168.1.0`).
- Część hosta: Identyfikuje konkretne urządzenie w tej sieci (np. `.10`).
- Maska podsieci (np. `/24` lub `255.255.255.0`) definiuje, ile bitów przypada na sieć, a ile na hosta.

### 1.2. Jaki ^ ma wpływ na konstrukcję tablic routingu?

Hierarchiczne adresy pozwalają na dopasowanie wzorców (np. „jeśli adres zaczyna się od 10.0.0.0/8, wyślij do X”), co przyspiesza decyzje routingu. Bez hierarchii tablice musiałyby zawierać miliony indywidualnych wpisów dla każdego hosta – hierarchia redukuje to do tysięcy bloków sieciowych.

### 2. Notacja CIDR

CIDR (Classless Inter-Domain Routing) to sposób zapisu adresów IP i masek podsieci, który zastąpił stare klasy adresów (A, B, C). Używa się go do elastycznego określania granic sieci i hostów.

<b>Format:</b> Adres IP + ukośnik + liczba bitów sieciowych, np. `192.168.1.0/24`

/24 znaczy, że 24 bity to sieć, a 8 bitów (32 – 24) to hosty.

`Liczba hostów = 2^(bity hosta) – 2 (na adres sieci i broadcast)`. Np. dla /24: 2^8 – 2 = 254 hosty.

<b>Przykłady:</b>
- 10.0.0.0/8:
  - Sieć: 10.0.0.0 – 10.255.255.255
  - Maska: 255.0.0.0
  - Hosty: 2^24 – 2 = ~16,7 miliona
- 192.168.1.0/24:
  - Sieć: 192.168.1.0 – 192.168.1.255
  - Maska: 255.255.255.0
  - Hosty: 254

### 3. Co to jest adres rozgłoszeniowy?

Adres rozgłoszeniowy (ang. broadcast address) to specjalny adres IP w sieci, który służy do wysyłania danych do wszystkich urządzeń w tej samej podsieci jednocześnie.

<b>Struktura:</b> Jest to najwyższy adres w zakresie podsieci, gdzie wszystkie bity części hosta są ustawione na 1.

Przykład:

Dla sieci 192.168.1.0/24 (maska: 255.255.255.0):
- Adres sieci: 192.168.1.0 (bity hosta = 0)
- Adres rozgłoszeniowy: 192.168.1.255 (bity hosta = 1)

### 4. Co to jest maska podsieci?

Maska podsieci (ang. subnet mask) to liczba w formacie binarnym lub dziesiętnym, która określa, która część adresu IP należy do sieci, a która do hosta w tej sieci. Używa się jej razem z adresem IP, by podzielić sieć na mniejsze podsieci.

Np. `255.255.255.0` (binarnie: `11111111.11111111.11111111.00000000`) = 24 bity sieciowe, 8 bitów na hosty.

<b>Przykład:</b>
- Adres IP: 192.168.1.10.
- Maska: 255.255.255.0 (/24).
- Część sieciowa: 192.168.1.0 (pierwsze 24 bity).
- Część hosta: .10 (ostatnie 8 bitów).

### 5. Opisz sieci IP klasy A, B i C.

W oryginalnym systemie adresowania IPv4 (przed CIDR) adresy były dzielone na klasy na podstawie pierwszych bitów adresu. Klasy A, B i C różnią się rozmiarem części sieciowej i hosta, co określa ich zastosowanie.

| **Klasa** | **Kluczowa cecha**             |
| --------- | ------------------------------ |
| A         | Duże sieci, ~16M hostów, /8    |
| B         | Średnie sieci, 65K hostów, /16 |
| C         | Małe sieci, 254 hosty, /24     |

### 6. Co to jest pętla lokalna (loopback)?

Pętla lokalna (ang. loopback) to specjalny adres IP używany do testowania komunikacji sieciowej na tym samym urządzeniu, bez wysyłania danych poza nie. Adres `127.0.0.1`. (Zarezerwowany jest cały blok `127.n.n.n`)

### 7.1. Do czego służy pole TTL w pakiecie IP? 

TTL (Time To Live) to pole w nagłówku pakietu IP, które określa, jak długo pakiet może „żyć” w sieci, zanim zostanie odrzucony.

<b>Do czego służy?</b>
- Zapobiega zapętlaniu: Chroni przed nieskończonym krążeniem pakietów w sieci z powodu błędów routingu (np. pętli).
- Licznik hopów: Każdy router zmniejsza TTL o 1. Gdy TTL osiągnie 0, pakiet jest odrzucany, a nadawca może dostać komunikat ICMP (np. „Time Exceeded”).

### 7.2. Do czego służy pole protokół?

Pole protokół (Protocol) w nagłówku IP wskazuje, jaki protokół warstwy wyższej jest używany w danych pakietu.

<b>Wartość:</b> 8-bitowa liczba, np.:
- 1 = ICMP (np. ping).
- 6 = TCP.
- 17 = UDP.

### 8. Jakie reguły zawierają tablice routingu?
- Adres docelowy
- Adres pośredni (via)
- Interfejs sieciowy (np. enp0s3)

### 9. Na czym polega reguła najdłuższego pasującego prefiksu?

Reguła najdłuższego pasującego prefiksu (ang. Longest Prefix Match, LPM) to zasada stosowana przez routery do wyboru najbardziej odpowiedniej trasy w tablicy routingu, gdy istnieje kilka możliwych dopasowań dla adresu docelowego pakietu.

Prefiks -> maska. Wybieramy sieć z największą maską (najbardziej specific zasada)

### 10. Co to jest trasa domyślna?

Trasa którą wyślemy pakiety jeśli nie ma żadnej innej, bardziej specyficznej sieci do której możnaby wysłać pakietu. Jej adres to `0.0.0.0/0`, oznaczamy jako `default`

### 11. Do czego służy protokół ICMP? Jakie znasz typy komunikatów ICMP?

| **Typ** | **Nazwa**               | **Opis**                                                                                      |
| ------- | ----------------------- | --------------------------------------------------------------------------------------------- |
| 0       | Echo Reply              | Odpowiedź na żądanie „Echo Request” – używane w narzędziu `ping` do potwierdzenia odpowiedzi. |
| 3       | Destination Unreachable | Cel nieosiągalny – np. host, sieć lub port nie istnieje albo jest zablokowany.                |
| 5       | Redirect                | Sugestia zmiany trasy – router proponuje inną bramę dla pakietu.                              |
| 8       | Echo Request            | Żądanie echa – wysyłane przez `ping`, by sprawdzić, czy host odpowiada.                       |
| 11      | Time Exceeded           | Czas życia pakietu (TTL) osiągnął 0 – używane w `traceroute` do mapowania trasy.              |
| 12      | Parameter Problem       | Problem z nagłówkiem IP – pakiet odrzucony z powodu błędu w strukturze.                       |

### 12. Jak działa polecenie ping?

Komputer:
- Wysyła ICMP Echo Request (Typ 8) do celu.
- Czeka na ICMP Echo Reply (Typ 0) od hosta.
- Mierzy czas RTT i raportuje wynik.

### 13. Jak działa polecenie traceroute?

Komputer:
- Wysyła pakiety z rosnącym TTL (1, 2, 3...).
- Każdy router po drodze zmniejsza TTL i, gdy dojdzie do 0, odsyła ICMP Time Exceeded.
- Pokazuje adresy IP i RTT dla każdego hopu, aż dotrze do celu.

### 14. Dlaczego do tworzenia gniazd surowych wymagane są uprawnienia administratora?

Bezpieczeństwo. Ryzyko:
- spoofing
- DDoS
- podsłuchiwanie ruchu

### 15. Co to jest sieciowa kolejność bajtów?

Sieciowa kolejność bajtów zawsze używa big-endian, co zapewnia spójność w komunikacji między urządzeniami o różnych architekturach (np. Intel x86 – little-endian, vs. starsze procesory sieciowe – big-endian).
- <b>Big-endian</b>: Najbardziej znaczący bajt (MSB, most significant byte) jest zapisywany jako pierwszy (od lewej).
- <b>Little-endian</b>: Najmniej znaczący bajt (LSB, least significant byte) jest zapisywany jako pierwszy.

### 16. Co robią funkcje socket(), recvfrom() i sendto()?

- `socket()`: Tworzy gniazdo do komunikacji (np. UDP, TCP, surowe).
- `sendto()`: Wysyła dane do konkretnego adresu przez gniazdo.
- `recvfrom()`: Odbiera dane i podaje, skąd przyszły.

### 17. Jakie informacje zawiera struktura adresowa sockaddr_in?

Struktura sockaddr_in przechowuje informacje o adresie sieciowym, takie jak adres IP i numer portu, w formacie odpowiednim dla funkcji sieciowych, takich jak `sendto()`, `recvfrom()`, `bind()` czy `connect()`. Definiuje „gdzie” w sieci wysłać lub skąd odebrać dane.

### 18. Co to jest tryb blokujący i nieblokujący? Co to jest aktywne czekanie?

- Blokujący recvfrom() na gnieździe ICMP czeka na Echo Reply
- Nieblokujący pozwala sprawdzać wiele rzeczy naraz, np. odpowiedzi od różnych hostów.
- Aktywne czekanie to prymitywna metoda testowania, np. „czy brama już odpowiedziała?”.

| **Aspekt**          | **Blokujący**            | **Nieblokujący**     | **Aktywne czekanie**        |
| ------------------- | ------------------------ | -------------------- | --------------------------- |
| **Czekanie**        | Pasywne (system blokuje) | Brak (wraca od razu) | Aktywne (pętla w programie) |
| **Efektywność CPU** | Wysoka (proces śpi)      | Wysoka (nie czeka)   | Niska (zużywa CPU)          |

### 19. Jakie jest działanie funkcji select()?

`select()` pozwala programowi:

- Sprawdzić, które gniazda (lub inne deskryptory) są gotowe do:
  - Odczytu (np. dane przyszły na gniazdo).
  - Zapisu (np. można wysłać dane bez blokowania).
  - Obsługi wyjątków (np. błąd na gnieździe).
- Czekać na te zdarzenia z określonym limitem czasu, zamiast aktywnie sprawdzać w pętli.
- Obsługiwać wiele gniazd jednocześnie w jednym wątku.