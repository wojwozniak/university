# Opracowanie zagadnień z końca wykładu

Niektóre odpowiedzi bazują na https://hackmd.io/@ZdZE9rvDRBmq3azjnK2_WA/Hym36xbu3

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

## Wykład 3

### 1. Co to jest cykl w routingu? Co go powoduje?

Cykl w routingu (ang. routing loop) to sytuacja, w której pakiet danych w sieci krąży w pętli między routerami, zamiast dotrzeć do swojego celu. Oznacza to, że routery przesyłają sobie nawzajem ten sam pakiet w kółko, co prowadzi do jego niekończącego się obiegu, aż do wygaśnięcia.

### 2. Czym różni się tablica routingu od tablicy przekazywania?

| Cecha                | Tablica routingu               | Tablica przekazywania               |
| -------------------- | ------------------------------ | ----------------------------------- |
| **Funkcja**          | Decyzje o trasach              | Szybkie przekazywanie pakietów      |
| **Zawartość**        | Pełne dane (metryki, trasy)    | Uproszczone dane (next hop, port)   |
| **Poziom działania** | Control plane (logika)         | Data plane (przekazywanie)          |
| **Aktualizacja**     | Dynamiczna (protokół routingu) | Wywiedziona z tablicy routingu      |
| **Wydajność**        | Wolniejsza, bardziej złożona   | Zoptymalizowana pod kątem szybkości |

### 3. Dlaczego w algorytmach routingu dynamicznego obliczamy najkrótsze ścieżki?

| Aspekt            | Dlaczego obliczamy najkrótsze ścieżki?                   |
| ----------------- | -------------------------------------------------------- |
| **Efektywność**   | Minimalizuje opóźnienia w transmisji danych              |
| **Optymalizacja** | Zmniejsza zużycie zasobów sieci (przepustowość, energia) |
| **Adaptacja**     | Umożliwia szybkie reagowanie na zmiany w sieci           |

### 4. Co to jest metryka? Jakie metryki mają sens?

Metryka określa "koszt" danej trasy.

- Proste sieci: Liczba przeskoków (RIP) – łatwa do wdrożenia, ale mało precyzyjna.
- Sieci enterprise: Przepustowość i koszt (OSPF) – dobrze skalują się w dużych sieciach.
- Sieci krytyczne: Opóźnienie i niezawodność (EIGRP) – kluczowe dla aplikacji wrażliwych na czas.

### 5. Czym różnią się algorytmy wektora odległości od algorytmów stanów łączy?
- Algorytm wektora odległości - zna tylko odległość do celu i kolejny hop (Bellman-Ford)
- Algorytm stanów łączy - zna pełną mapę sieci (Dijsktra)

### 6. Jak router może stwierdzić, że bezpośrednio podłączona sieć jest nieosiągalna?

| Metoda wykrywania      | Jak działa?                              | Przyczyna nieosiągalności              |
| ---------------------- | ---------------------------------------- | -------------------------------------- |
| **Stan interfejsu**    | Sprawdza "up/down" interfejsu            | Odłączony kabel, awaria sprzętu        |
| **Protokół warstwy 2** | Monitoruje działanie protokołu (np. PPP) | Brak keepalives, błąd negocjacji       |
| **ARP**                | Brak odpowiedzi na zapytania ARP         | Wyłączone urządzenia, zła konfiguracja |
| **ICMP/Ping**          | Brak odpowiedzi na ping                  | Sieć lub urządzenia niedostępne        |

### 7. Co to znaczy, że stan tablic routingu jest stabilny?

Stabilny stan tablic routingu oznacza, że w sieci z routingiem dynamicznym wszystkie routery osiągnęły <b>konwergencję</b> – czyli ich tablice routingu są spójne, aktualne i nie ulegają dalszym zmianom, dopóki topologia sieci lub konfiguracja się nie zmieni.

### 8. Jak zalewać sieć informacją? Co to są komunikaty LSA?

Zalewanie sieci informacją (flooding) to technika stosowana w protokołach routingu dynamicznego, głównie w algorytmach stanów łączy. Router generuje komunikat o stanie swoich łączy i wysyła go do wszystkich swoich sąsiadów.

LSA (Link State Advertisement) to specjalne komunikaty używane w protokole OSPF (Open Shortest Path First) do przekazywania informacji o stanie łączy podczas zalewania sieci.

### 9. Co wchodzi w skład wektora odległości?

| Element                             | Opis                                     | Przykład                 |
| ----------------------------------- | ---------------------------------------- | ------------------------ |
| **Adres docelowy**                  | Sieć lub host, do którego prowadzi trasa | 10.0.0.0/8               |
| **Odległość**                       | Metryka kosztu dotarcia do celu          | 2 przeskoki              |
| **Następny skok**                   | Adres routera na trasie                  | 192.168.1.2              |
| **Interfejs (opcjonalnie)**         | Port wyjściowy                           | eth0                     |
| **Dodatkowe metryki (opcjonalnie)** | Przepustowość, opóźnienie itp.           | EIGRP: opóźnienie 100 ms |

### 10. W jaki sposób podczas działania algorytmu routingu dynamicznego może powstać cykl w routingu?

- Mamy A->B->C->target
- Awaria, C traci drogę do target
- C aktualizuje informacją od B że ma drogę długości 2 do target
- B aktualizuje że ma 3
- C że ma 4
- ....

### 11. Co to jest problem zliczania do nieskończoności? Kiedy występuje?

j.w.

### 12. Na czym polega technika zatruwania ścieżki zwrotnej (poison reverse)?

Po stracie połączenia z jakąś siecią router ogłasza że ścieżka już nie istnieje.

### 13. Po co w algorytmach wektora odległości definiuje się największą odległość w sieci (16 w protokole RIPv1)?

By unikać pętli.

### 14. Po co stosuje się przyspieszone uaktualnienia?

Przyspieszone uaktualnienia (ang. triggered updates) w algorytmach routingu dynamicznego to mechanizm, który polega na natychmiastowym wysyłaniu aktualizacji tablic routingu do sąsiadów w odpowiedzi na zmianę w sieci (np. awarię łącza, zmianę metryki), zamiast czekać na standardowy, okresowy cykl aktualizacji (np. co 30 sekund w RIP).

### 15. Co to jest system autonomiczny (AS)? Jakie znasz typy AS?

| Typ AS            | Opis                                     | Zastosowanie                     | Przykład             |
| ----------------- | ---------------------------------------- | -------------------------------- | -------------------- |
| **Stub AS**       | Połączony z jednym AS-em                 | Małe firmy, klienci końcowi      | Firma X → ISP        |
| **Transit AS**    | Przekazuje ruch między AS-ami            | Duże ISP, operatorzy szkieletowi | Level 3 (AS3356)     |
| **Multihomed AS** | Połączony z wieloma AS-ami, bez tranzytu | Redundancja, niezawodność        | Bank z dwoma ISP     |
| **IXP AS**        | Ułatwia peering w punktach wymiany       | Punkty IXP (np. DE-CIX)          | AS w punkcie wymiany |


### 16. Czym różnią się połączenia dostawca-klient pomiędzy systemami autonomicznymi od łącz partnerskich (peering)?

| Cecha        | Dostawca-Klient                    | Peering                             |
| ------------ | ---------------------------------- | ----------------------------------- |
| **Relacja**  | Hierarchiczna, klient płaci        | Równorzędna, zwykle bez opłat       |
| **Ruch**     | Tranzyt do całego Internetu        | Tylko między AS-ami i ich klientami |
| **Koszty**   | Płatne przez klienta               | Bezpłatne (settlement-free)         |
| **Trasy**    | Dostawca: wszystkie, Klient: swoje | Oba: tylko swoje i klientów         |
| **Przykład** | Firma → ISP                        | Google ↔ Cloudflare                 |

### 17. Dlaczego w routingu pomiędzy systemami autonomicznymi nie stosuje się najkrótszych ścieżek?

Bo zamiast tego można zroutować:
- przez klienta, lub jeśli się nie da to
- przez partnera, lub jeśli nie
- to dopiero przez dostawcę

### 18. Które trasy w BGP warto rozgłaszać i komu? A które wybierać?

| Aspekt              | Które trasy rozgłaszać?        | Komu?                                     | Które wybierać?                        |
| ------------------- | ------------------------------ | ----------------------------------------- | -------------------------------------- |
| **Własne prefiksy** | Zawsze swoje sieci             | Dostawcy, klienci, peering                | -                                      |
| **Trasy klientów**  | Sieci klientów                 | Dostawcy, peering (nie dostawcy klientom) | -                                      |
| **Trasy dostawców** | Tylko klientom                 | Klienci                                   | -                                      |
| **Kryteria wyboru** | -                              | -                                         | 1. Local Pref, 2. AS_PATH, 3. MED itd. |
| **Przykład**        | 192.168.1.0/24 do ISP i peerów | ISP: wszystko, Peer: swoje                | Trasa z Local Pref 200                 |

### 19. Jak BGP może współpracować z algorytmami routingu wewnątrz AS?

| Mechanizm             | Jak BGP współpracuje z IGP?           | Przykład                            |
| --------------------- | ------------------------------------- | ----------------------------------- |
| **Redystrybucja**     | Trasy BGP → IGP i IGP → BGP           | Trasa 10.0.0.0/8 z BGP do OSPF      |
| **iBGP**              | Rozprowadzanie tras BGP wewnątrz AS   | eBGP → iBGP, OSPF tylko wewnętrznie |
| **IGP do next hop**   | IGP prowadzi do routerów BGP          | OSPF kieruje do 192.168.1.1 (BGP)   |
| **Metryki IGP w BGP** | BGP używa kosztu IGP do wyboru tras   | Trasa z niższym kosztem OSPF        |
| **Zastosowanie**      | Mały AS: redystrybucja, Duży AS: iBGP | OSPF + iBGP w dużym ISP             |

## Wykład 4

### 1. Co to są prywatne adresy IP? Jakie pule adresów są zarezerwowane na takie adresy?

Adresy prywatne to adresy przeznaczone do sieci lokalnych. Pula adresów to:
- 10.0.0.0/8 (1 adres klasy A)
- 172.16.0.0/12 (16 adresów klasy B)
- 192.168.0.0/16 (256 adresów klasy C)

### 2. Co robi funkcja bind()?

Przypisuje port do gniazda.

### 3. Czym różnią się porty o numerach mniejszych niż 1024 od innych?

Są domyślnie zarezerwowane dla usług systemowych, wymagają uprawnień administratora do użycia.

### 4. Jakie są zadania procesora routingu, portu wejściowego, portu wyjściowego i struktury przełączającej?

- Procesor routingu tworzy tablice przekazywania, wysyła je do portów wejściowych, zarządza strukturą przekazywania (do odpowiedniego portu wyjściowego)
- Port wejściowy: odbiera pakiety, sprawdza nagłówki, przekazuje do struktury przełączającej
- Port wyjściowy: odbiera pakiety ze struktury przełączającej, wysyła je do odpowiedniego portu fizycznego

### 5. Czym się różni przełączanie pakietów w routerze za pomocą RAM od przełączania za pomocą struktury przełączającej?

- RAM: Przechowuje tablice routingu, pakiety są przetwarzane przez CPU, co może prowadzić do opóźnień.
- Struktura przełączająca: Umożliwia równoległe przetwarzanie pakietów, co zwiększa wydajność i zmniejsza opóźnienia.

### 6. Jakie są pożądane cechy struktury przełączającej w routerze?

Przekazywanie pakietów w czasie bliskim rzeczywistemu (szybkości łącza).

### 7. Gdzie w routerze stosuje się buforowanie? Po co?

- W portach wejściowych: Gdy pakiety przychodzą szybciej niż mogą być przetwarzane, buforowanie zapobiega utracie danych.
- W portach wyjściowych: Gdy port wyjściowy jest zajęty, buforowanie pozwala na przechowywanie pakietów do momentu, gdy będą mogły być wysłane (Kolejka FIFO)

### 8. Po co w portach wyjściowych klasyfikuje się pakiety?

By ustawić priorytety z którymi muszą być wysłane.

### 9. Co to jest blokowanie początku kolejki? Gdzie występuje? Jak się go rozwiązuje?

Jeśli w jednej kolejce są pakiety do dwóch portów wyjściowych, gdzie port wyjściowy dla pierwszego jest zapełniony a drugi nie, to drugi czeka mimo że mógłby być wysłany.

Rozwiązujemy osobną kolejką do każdego wyjściowego.

### 10. Rozwiń skrót LPM.

Longest Prefix Match

### 11. Jakie znasz struktury danych implementujące LPM? Porównaj je.

Lista prefixów, drzewo trie, tablica haszująca. Porównanie #todo.

### 12. Co to jest pamięć TCAM? Jak można ją zastosować do implementacji LPM?

Pamięć TCAM (Ternary Content Addressable Memory) to rodzaj pamięci, która pozwala na równoległe porównywanie wielu wartości. Umożliwia szybkie wyszukiwanie prefiksów w tablicach routingu.

### 13. Na czym polega fragmentacja IP? Gdzie się ją stosuje i dlaczego? Gdzie łączy się fragmenty?

Dzielimy pakiety zbyt duże do przesłania jako jeden w którymś miejscu na trasie na mniejsze. Łączymy je na końcu trasy (komputer docelowy).

### 14. Co to jest MTU? Na czym polega technika wykrywania wartości MTU dla ścieżki?

MTU - Max Transmission Unit, maksymalny rozmiar pakietu, który można przesłać przez łącze bez fragmentacji.

Wykrywamy go wysyłając pakiet z flagą DF (Don't Fragment). Jeśli pakiet jest za duży, router odrzuca go i wysyła komunikat ICMP „Fragmentation Needed” z informacją o maksymalnym rozmiarze. Robimy aż dotrzemy do celu (wyznaczając MTU).

### 15. Jak działa szeregowanie pakietów w buforze wyjściowym routera?

Szeregujemy pakiety na strumienie o różnych priorytetach lub round-robin - po tyle samo z każdego strumienia.

### 16. Jakie są różnice pomiędzy nagłówkami IPv4 i IPv6?

- 20 bajtów vs 40 bajtów
- IPv4: 32 bity, IPv6: 128 bitów
- Dodatkowe pola w IPv6 - np. Flow Label, umożliwiające identyfikację strumieni danych

### 17. Zapisz adres IPv6 0321:0000:0000:0123:0000:0000:0000:0001 w najkrótszej możliwej postaci.

Pomijamy wiądące zera, zastępujemy jeden ciąg zer `::`. (Można tylko jeden).

`321:0:0:123::1`

### 18. Co to jest tunelowanie 6in4?

Gdy IPv6 nie jest dostępny w danej sieci, można go przesłać przez IPv4. Wysyłamy pakiety IPv6 w pakietach IPv4, które są przesyłane przez sieć IPv4. Na końcu tunelu pakiety IPv6 są wydobywane i przekazywane do docelowego adresu IPv6.

### 19. Na czym polega NAT i po co się go stosuje? Jakie są jego zalety i wady?

NAT to tłumaczenie adresu i portu z sieci lokalnej na adres i port routera widoczny z internetu. Rozwiązujemy problem braku adresów IP, zmieniać adresy w sieci wewnętrznej bez ogłaszania tego i zmieniać dostawcę internetu bez zmiany adresów w sieci wewnętrznej. Komputery są jednak nieosiągalne z internetu.

### 20. Jaki stan musi przechowywać router z funkcją NAT?

Tablicę przypisań $(A, P_a, C, P_c) -> P_b$
- A - adres IP
- P_a - port źródłowy
- C - adres docelowy
- P_c - port docelowy
- P_b - port docelowy w NAT

## Wykład 5

### 1. Jakie są zadania warstwy łącza danych a jakie warstwy fizycznej?

#### Warstwa łącza danych:

- Komunikacja między sąsiadującymi urządzeniami
- Wysyłanie ramek (zawodne)
- Musi sobie radzić z błędami transmisji
- Być może współdzielony kanał komunikacyjny

### 2. Czym różni się koncentrator od przełącznika sieciowego?

Koncentrator (hub) jest urządzeniem pasywnym, które przekazuje dane przychodzące na wszystkie podłączone porty, powodując kolizje i ograniczając przepustowość, podczas gdy przełącznik sieciowy (switch) jest urządzeniem aktywnym, które przesyła dane tylko do docelowego portu na podstawie adresów MAC, co zwiększa wydajność sieci i eliminuje kolizje.

### 3. Jak działa algorytm rundowy i bezrundowy ALOHA?

Komputery wysyłają ramki w rundach. Jeśli kilka komputerów wyśle na raz w jednej rundzie, to zakłócenie. Jeśli tylko 1 to sukces. (Wysyłamy wielokrotnie).

Bezrundowy nie ma globalnego zegara rund - każdy komputer ma swój własny.

### 4. Jak działa algorytm odczekiwania wykładniczego?

Wysyłaj ramki z coraz większym odstępem (za każdym razem *2 z lekką losowością). Stosowane w Wi-Fi i Ethernet.

### 5. Wyjaśnij skróty CSMA/CD i CSMA/CA.

Carrier Sense Multiple Access with Collision Detection
- m ← 1
- Poczekaj aż kanał będzie pusty i zacznij nadawać.
- Podczas nadawania, nasłuchuj. Jeśli usłyszysz kolizję:
- skończ nadawać,
- wylosuj k ze zbioru { 0, …, 2m - 1 } i odczekaj k rund,
- m ← m + 1,
- wróć do kroku 2.

Można stosować jedynie jeśli umiemy jednocześnie nadawać i odbierać tak żeby wiedzieć czy są kolizje.
Trzeba tylko dobrze dobrać długość rundy. Najlepiej ustawić R = czas wysyłania 64 bajtów.

Carrier Sense Multiple Access with Collision Avoidance
Taki sam jak ten poprzedni algorytm, tylko stosujemy potwierdzanie ramek. Ramki są zawsze nadawane do końca. Odczekujemy pewien czas, nawet jeśli kanał właśnie się zwolnił.

### 6. Opisz budowę ramki Ethernetowej.

Ramka ethernetowa zawiera:
- adres docelowy MAC
- adres źródłowy MAC
- typ - identyfikuje portokół w danych, no 0x0800 = IP
- dane
- sumę kontrolną

### 7. Co to jest adres MAC?

MAC to 6 bajtowy unikatowy ciąg teorytycznie przypisany do karty sieciowej, w praktyce
łatwo go zmienić. Pierwsze 3 bajty przyznaje IEEE producentowi kart sieciowych, 3 kolejne
nadaje producent.

### 8. Do czego służy tryb nasłuchu (promiscuous mode)?

Przekazywania do systemu wszystkich widzialnych ramek. - Karta sieciowa w trybie nasłuchu (promiscuous mode) przekazuje do systemu wszystkie widziane ramki (Wireshark)

### 9. Po co w Ethernecie definiuje się minimalną długość ramki?

Aby łatwo odróżnić ramkę od śmieci oraz czas wysyłania trwało conajmniej 2*czas propagacji, wtedy albo ramka dotrze do odbiorcy albo dowiemy sięo kolizcji podczas jej nadawania. Długość ramki powinna być proporcjonalna w jakiś sposób do odległości między urządzeniami.

### 10. Do czego służą protokoły ARP i DHCP?

ARP = Address Resolution Protocol
Służy do dowiedzenia się “kto ma dany adres IP”. Jest zawarty w ramkach wysyła na adres rozgłoszeniowy. (FF:FF:FF:FF:FF:FF), pole type w takiej ramce to 0x0806.
Jeden komputer odpowiada.
Wszyscy słyszą odpowiedź i zapisują ją w lokalnej tablicy ARP na jakiś czas.

DHCP = Dynamic Host Configuration Protocol
Przydziela automatycznie adresy IP.

### 11. Czym różni się łączenie dwóch sieci za pomocą mostu od łączenia ich za pomocą routera?

Most to przełącznik z dwoma portami, który łączy 2 sieci. Łączenie za pomocą mostu jest szybsze, bo podmiane podlega jedynie nagłówki oraz suma kontrolna, ale most nie rozumie IP, więc nie dokona fragmentacji.

### 12. Jak warstwa łącza danych realizuje rozgłaszanie?

Każdy otrzymuje informacje jeśli nadana ona jest na adres rozgłoszeniowy MAC. (FF:FF:FF:FF:FF:FF)
Czyli idea jest podobna do broadcastu IP, tylko, że rozmawiamy na poziomie innej warstwy

### 13. Na czym polega tryb uczenia się w przełączniku sieciowym?

Przełącznik uczy się które adresy MAC są podłączone do których portów. Na początku broadcastuje taki pakiecik do wszystkich urządzeń, a z czasem, liczbą zdobytej wiedzy zapisanej w tablicy przesyła je do coraz mniejszej liczby odbiorców, żeby finalnie przesyłać do tego jedynego właściwego.

### 14. Po co w przełączanym Ethernecie stosuje się algorytm drzewa spinającego?

Chcemy osiągnąć topologię bez cykli (a przy okazji mieć krótkie ścieżki)

### 15. Co to jest sieć VLAN? Po co się ją stosuje?

VLAN - wirtualna sieć lokalna. Dzielimy logicznie sieć na niezależne grupy.

### 16. Wyjaśnij zjawisko ukrytej stacji.

Zjawisko ukrytej stacji występuje w sieciach komputerowych, gdy dwa lub więcej urządzeń znajdują się w odległościach względem siebie tak, że nie mogą wzajemnie wykrywać swojego sygnału transmisyjnego. Oznacza to, że każde urządzenie może być w stanie komunikować się bezkolizyjnie z dostępnym punktem dostępu (AP) lub innymi urządzeniami, ale nie ma wiedzy o transmisjach innych urządzeń w tej samej sieci.

### 17. Na czym polega rezerwowanie łącza za pomocą RTS i CTS?

Rozwiązuje to problem ukrytej stacji. RTS (Real Time Strategy/Request to Send) - urządzenie pytana o pozowolenie na nadawanie AP i wtedy ono mu odpowiada CTS (Clear to Send) - co oznacza że nie ma konkurentów do nadawania i może lecieć.

## Wykład 6

### 1. Co może stać się z przesyłanym ciągiem pakietów IP podczas zawodnego i niezawodnego transportu?
Podczas zawodnego transportu (np. UDP), pakiety mogą zostać zgubione, zdublowane lub przyjść w złej kolejności, a aplikacja nie otrzymuje gwarancji ich dostarczenia. W niezawodnym transporcie (np. TCP), mechanizmy retransmisji, kontroli błędów i potwierdzeń zapewniają uporządkowane i niezawodne dostarczenie pakietów.

### 2. Co to jest kontrola przepływu?
Kontrola przepływu to mechanizm zapobiegający przeciążeniu odbiorcy danymi przesyłanymi przez nadawcę. Umożliwia dostosowanie tempa wysyłania do możliwości odbiorcy.

### 3. Czym różnią się protokoły UDP i TCP? Podaj zastosowania każdego z nich.
TCP to protokół połączeniowy, oferujący niezawodność, uporządkowanie i kontrolę przepływu. UDP jest bezpołączeniowy i szybki, ale zawodny. TCP stosuje się w HTTP, FTP, SMTP; UDP w transmisjach wideo, VoIP, DNS.

### 4. Co to jest segmentacja? Dlaczego segmenty mają ograniczoną wielkość? Rozwiń skrót MSS.
Segmentacja to dzielenie dużych danych na mniejsze jednostki — segmenty. Ich wielkość ogranicza MSS (Maximum Segment Size), by zapobiec fragmentacji na poziomie IP i zapewnić zgodność z MTU.

### 5. Jak nazywają się jednostki danych przesyłane w kolejnych warstwach?
Aplikacja: wiadomości;  
Transportowa: segmenty/datagramy;  
Sieciowa: pakiety;  
Łącza danych: ramki;  
Fizyczna: bity.

### 6. Jak małe pakiety zmniejszają opóźnienie przesyłania danych?
Małe pakiety szybciej się transmitują i przetwarzają, co redukuje czas oczekiwania na ich zakończenie, zmniejszając opóźnienia — zwłaszcza w interaktywnych aplikacjach.

### 7. Wytłumacz znaczenie skrótów RTT i RTO. Na jakiej podstawie ustalana jest wartość RTO?
RTT (Round Trip Time) to czas pełnej podróży pakietu i jego potwierdzenia. RTO (Retransmission Timeout) to czas oczekiwania na ACK przed retransmisją. RTO ustala się dynamicznie na podstawie średniego RTT i jego wariancji.

### 8. Jak protokoły niezawodnego transportu wykrywają duplikaty pakietów i potwierdzeń?
Wykorzystują numery sekwencyjne i potwierdzenia (ACK). Duplikaty mają identyczne numery jak już przetworzone dane i są ignorowane.

### 9. Opisz algorytm Stop-and-Wait. Jakie są jego wady i zalety?
Nadaje jeden segment, czeka na ACK, potem kolejny. Zaleta: prostota. Wada: niska wydajność przy dużym opóźnieniu (mały BDP).

### 10. Do czego służą numery sekwencyjne w niezawodnym protokole transportowym?
Służą do identyfikacji segmentów, umożliwiają wykrywanie duplikatów i składanie danych w odpowiedniej kolejności.

### 11. Opisz algorytm okna przesuwnego.
Nadawca może wysłać wiele segmentów bez czekania na każde ACK. Okno przesuwa się po otrzymaniu ACK, co zwiększa przepustowość.

### 12. Jaki jest związek między rozmiarem okna a BDP (bandwidth-delay product)?
Okno musi być co najmniej równe BDP, by maksymalnie wykorzystać przepustowość łącza bez czekania na ACK.

### 13. Opisz i porównaj następujące mechanizmy potwierdzania: Go-Back-N, potwierdzanie selektywne, potwierdzanie skumulowane.
- **Go-Back-N**: retransmituje wszystkie od zgubionego segmentu.
- **Selektywne**: retransmituje tylko brakujące.
- **Skumulowane**: ACK obejmuje wszystkie dane do określonego punktu.

### 14. Dlaczego istotne jest potwierdzanie odbioru duplikatów segmentów?
Pozwala to nadawcy wykryć utracone segmenty — np. przez trzy duplikaty ACK — i szybko je retransmitować (Fast Retransmit).

### 15. Co to jest okno oferowane? Jak pomaga w kontroli przepływu?
To rozmiar bufora odbiorcy komunikowany nadawcy. Nadawca nie przekracza tej wartości, co zapobiega przepełnieniu.

### 16. Jakie mechanizmy niezawodnego transportu i kontroli przepływu implementowane są w protokole TCP?
TCP implementuje: retransmisję, potwierdzania, numery sekwencyjne, kontrolę przeciążenia (np. slow start), kontrolę przepływu (okno oferowane).

### 17. Na czym polega opóźnione wysyłanie ACK w protokole TCP?
Odbiorca chwilę czeka przed wysłaniem ACK, by móc wysłać go razem z danymi, zmniejszając liczbę pakietów.

### 18. Na czym polega mechanizm Nagle'a? Kiedy nie należy go stosować?
Łączy małe segmenty w jeden większy przed wysłaniem. Oszczędza pakiety, ale zwiększa opóźnienia. Nie stosować w aplikacjach interaktywnych (np. SSH, gry).

### 19. Co oznaczają pola ,,numer sekwencyjny'' i ,,numer potwierdzenia'' w nagłówku TCP?
Numer sekwencyjny: bajt rozpoczynający segment. Numer potwierdzenia: bajt, którego odbiorca oczekuje jako następny — potwierdzenie wszystkich poprzednich.

### 20. Czy warstwa transportowa implementowana jest na routerach? Dlaczego?
Nie. Routery pracują na warstwach 1–3 (fizyczna–sieciowa). Warstwa transportowa działa na końcówkach komunikacji (hostach).

### 21. Sformułuj słabą i silną zasadę end-to-end.
- **Słaba**: sieć może wspomagać niezawodność, ale końcówki nadal odpowiadają za integralność danych.  
- **Silna**: cała odpowiedzialność za poprawność danych spoczywa wyłącznie na końcówkach komunikacji.


## Wykład 7

### 1. Co to jest gniazdo?
Gniazdo (socket) to punkt końcowy komunikacji w sieciach komputerowych, wykorzystywany do przesyłania danych pomiędzy procesami. Składa się z adresu IP, numeru portu oraz typu protokołu (TCP/UDP).

### 2. Czym różni się gniazdo nasłuchujące od gniazda połączonego? Czy w protokole UDP mamy gniazda połączone?
Gniazdo nasłuchujące oczekuje na nowe połączenia przychodzące (typowe dla serwerów TCP), natomiast gniazdo połączone jest przypisane do konkretnego połączenia klient-serwer. W UDP nie ma formalnych połączeń, więc nie występują gniazda połączone w tym samym sensie co w TCP.

### 3. Co robią funkcję jądra bind(), listen(), accept(), connect()?
- `bind()`: przypisuje gniazdu lokalny adres (IP i port),
- `listen()`: ustawia gniazdo w tryb nasłuchu,
- `accept()`: akceptuje przychodzące połączenie i zwraca nowe gniazdo,
- `connect()`: inicjuje połączenie z adresem zdalnym (tylko w TCP).

### 4. Czym różni się komunikacja bezpołączeniowa od połączeniowej?
W komunikacji połączeniowej (TCP) przed przesyłaniem danych nawiązywane jest połączenie. W bezpołączeniowej (UDP) dane są wysyłane bez wcześniejszego ustanowienia połączenia, co może prowadzić do ich utraty lub zmiany kolejności.

### 5. Czym różni się otwarcie bierne od otwarcia aktywnego? Czy serwer może wykonać otwarcie aktywne?
Otwarcie aktywne to rozpoczęcie połączenia przez klienta (`connect()`), otwarcie bierne to oczekiwanie na połączenie przez serwer (`listen()` + `accept()`). Serwer zwykle nie wykonuje otwarcia aktywnego.

### 6. Do czego służą flagi SYN, ACK, FIN i RST stosowane w protokole TCP?
- `SYN`: inicjalizacja połączenia,
- `ACK`: potwierdzenie otrzymanych danych,
- `FIN`: zakończenie połączenia,
- `RST`: resetowanie połączenia przy błędzie lub nieoczekiwanej sytuacji.

### 7. Opisz trójstopniowe nawiązywanie połączenia w TCP. Jakie informacje są przesyłane w trakcie takiego połączenia?
1. Klient wysyła `SYN` z numerem sekwencyjnym.
2. Serwer odpowiada `SYN-ACK` (własny numer sekwencyjny i potwierdzenie klienta).
3. Klient wysyła `ACK`, kończąc proces inicjalizacji.
Wymieniane są numery sekwencyjne, by zapewnić niezawodność transmisji.

### 8. Dlaczego przesyłanych bajtów nie numeruje się od zera?
Numeracja od zera mogłaby prowadzić do kolizji przy ponownym nawiązaniu połączenia z tym samym hostem/portem. Użycie losowego numeru startowego zwiększa bezpieczeństwo i zmniejsza ryzyko pomyłek.

### 9. Jakie segmenty są wymieniane podczas zamykania połączenia w protokole TCP?
Połączenie zamyka się przez wymianę segmentów `FIN` i `ACK`. Każda strona wysyła `FIN` i oczekuje `ACK` od drugiej strony.

### 10. Co zwraca funkcja recv() wywołana na gnieździe w blokującym i nieblokującym trybie?
- W trybie blokującym: `recv()` czeka na dane i zwraca odebrane bajty.
- W nieblokującym: `recv()` zwraca natychmiast, może zwrócić 0 bajtów lub kod błędu, jeśli dane nie są dostępne.

### 11. Po co wprowadzono stan TIME_WAIT?
Stan `TIME_WAIT` zapobiega ponownemu wykorzystaniu tych samych numerów portów zbyt szybko i umożliwia dostarczenie opóźnionych segmentów TCP, chroniąc przed kolizjami danych z poprzednich połączeń.

### 12. Na podstawie diagramu stanów TCP opisz możliwe scenariusze nawiązywania i kończenia połączenia.
Nawiązywanie: klient przechodzi przez `CLOSED → SYN_SENT → ESTABLISHED`, a serwer przez `LISTEN → SYN_RECEIVED → ESTABLISHED`.

Zamykanie: każda strona osobno przechodzi przez `ESTABLISHED → FIN_WAIT_1 → FIN_WAIT_2 → TIME_WAIT → CLOSED` (dla zamykającego) lub `ESTABLISHED → CLOSE_WAIT → LAST_ACK → CLOSED` (dla drugiej strony). Obie strony muszą potwierdzić zamknięcie.

## Wykład 8

### 1. Opisz budowę adresu URL. Opisz budowę adresu URL w przypadku schematu http.
Adres URL (Uniform Resource Locator) składa się z następujących elementów:
`schemat://użytkownik@host:port/ścieżka?parametry#fragment`

Dla HTTP typowy URL wygląda tak:
`http://www.example.com:80/index.html?search=test#top`

- **schemat** – np. http, https, ftp,
- **host** – np. www.example.com,
- **port** – domyślny dla HTTP to 80,
- **ścieżka** – zasób na serwerze, np. /index.html,
- **parametry zapytania** – po znaku `?`, np. search=test,
- **fragment** – lokalizacja wewnątrz dokumentu, np. #top.

---

### 2. W jakim celu serwer WWW ustawia typ MIME dla wysyłanej zawartości? Podaj kilka przykładów typów MIME.
Typ MIME informuje klienta (przeglądarkę), jaki jest typ danych w odpowiedzi, by mógł je odpowiednio przetworzyć. Przykłady:
- `text/html` – dokument HTML,
- `text/css` – arkusz stylów CSS,
- `application/json` – dane JSON,
- `image/png` – obraz PNG,
- `video/mp4` – plik wideo.

---

### 3. Po co w nagłówku żądania HTTP/1.1 podaje się pole Host?
Pole `Host` umożliwia obsługę wielu wirtualnych serwerów (virtual hosting) na jednym adresie IP. Dzięki niemu serwer wie, który z hostów ma obsłużyć żądanie.

---

### 4. Do czego służą pola Accept, Accept-Language, User-Agent, Server, Content-Length, Content-Type w nagłówku HTTP?
- `Accept` – informuje serwer, jakie typy MIME akceptuje klient,
- `Accept-Language` – preferencje językowe klienta,
- `User-Agent` – identyfikuje aplikację kliencką (np. przeglądarkę),
- `Server` – informuje klienta o oprogramowaniu serwera,
- `Content-Length` – długość ciała wiadomości (w bajtach),
- `Content-Type` – typ zawartości przesyłanej w żądaniu lub odpowiedzi.

---

### 5. Jak implementuje się przechowywanie stanu w komunikacji HTTP?
Ponieważ HTTP jest bezstanowy, przechowywanie stanu realizuje się przez:
- **Cookies** – dane zapisane po stronie klienta,
- **Tokeny** (np. JWT) – przekazywane w nagłówkach,
- **Sesje** – identyfikator sesji przechowywany np. w cookie, dane po stronie serwera.

---

### 6. Jak wygląda warunkowe zapytanie GET protokołu HTTP?
Warunkowe zapytanie GET używa nagłówków:
- `If-Modified-Since: <data>` – żądaj tylko jeśli plik był zmodyfikowany po tej dacie,
- `If-None-Match: <ETag>` – żądaj tylko jeśli identyfikator ETag się zmienił.

Pozwala to uniknąć pobierania niezmienionych zasobów.

---

### 7. Jakie znasz kody odpowiedzi protokołu HTTP?
- `200 OK` – sukces,
- `301 Moved Permanently` – trwałe przekierowanie,
- `302 Found` – tymczasowe przekierowanie,
- `400 Bad Request` – nieprawidłowe żądanie,
- `401 Unauthorized` – brak autoryzacji,
- `403 Forbidden` – brak dostępu,
- `404 Not Found` – nie znaleziono zasobu,
- `500 Internal Server Error` – błąd serwera.

---

### 8. Na czym polegają połączenia trwałe w HTTP/1.1? Do czego służy opcja Connection: close w nagłówku HTTP?
HTTP/1.1 domyślnie używa połączeń trwałych (keep-alive), co oznacza, że jedno połączenie TCP może obsłużyć wiele żądań. `Connection: close` wymusza zamknięcie połączenia po wykonaniu żądania.

---

### 9. Po co stosuje się metodę POST?
Metoda `POST` służy do przesyłania danych do serwera (np. z formularza), modyfikując zasoby. Umożliwia przesyłanie dużych i złożonych danych w ciele żądania.

---

### 10. Co to jest technologia REST?
REST (Representational State Transfer) to styl architektury systemów rozproszonych oparty na HTTP. REST wykorzystuje metody HTTP (GET, POST, PUT, DELETE) do operacji na zasobach z unikalnymi URL.

---

### 11. Do czego służą serwery proxy?
Serwery proxy pośredniczą w ruchu sieciowym między klientem a serwerem docelowym. Mogą:
- buforować dane,
- ukrywać tożsamość klienta,
- filtrować treść,
- rejestrować ruch.

---

### 12. Co to jest odwrotne proxy? Co to jest CDN?
- **Odwrotne proxy (reverse proxy)** – stoi przed serwerem i przekazuje ruch do serwera backendowego. Może realizować balansowanie obciążenia, SSL, cache.
- **CDN (Content Delivery Network)** – sieć rozproszonych serwerów odwrotnych proxy służących do szybszego dostarczania treści statycznych użytkownikom z różnych lokalizacji.

---

### 13. Jak skłonić klienta, żeby łączył się z serwerem proxy a nie bezpośrednio ze stroną WWW?
Można to osiągnąć przez:
- konfigurację przeglądarki/systemu (ręcznie lub przez PAC – Proxy Auto-Config),
- transparentny proxy ustawiony przez administratora sieci,
- użycie VPN przekierowującego ruch.

---

### 14. Jakie informacje dołączane są przez serwer proxy do zapytania?
Proxy może dołączyć nagłówki:
- `Via` – ślad serwerów pośredniczących,
- `X-Forwarded-For` – adres IP klienta,
- `Forwarded` – nowoczesny nagłówek ze szczegółami trasy żądania (IP, protokół, porty, itp.).

---

### 15. Co to są anonimowe serwery proxy?
To serwery, które nie przekazują adresu IP użytkownika do serwera docelowego, ukrywając jego tożsamość. Nie dodają nagłówków takich jak `X-Forwarded-For`.

---

### 16. W jakim celu powstał protokół QUIC? Jakie funkcje spełnia?
QUIC (Quick UDP Internet Connections) został zaprojektowany przez Google jako szybki, bezpieczny i niezawodny protokół transportowy oparty na UDP. Łączy funkcje TCP + TLS + HTTP/2:
- mniejsze opóźnienia przy łączeniu,
- lepsze działanie przy utracie pakietów,
- szyfrowanie end-to-end,
- multiplexing bez blokowania (head-of-line blocking).

## Wykład 9

### 1. Jaki jest cel systemu nazw DNS?

Daje on nazwy łatwiejsze do zapamiętania przez ludzi. Pozwala na zmianę adresu IP (np. zmiana ISP) bez powiadamiania klientów o zmianie.

### 2. Do czego służy plik /etc/hosts?

Zawiera on przypisania domena -> adres IP. Nie jest to rozwiązanie dobrze skalowalne, dlatego się go już zbytnio nie używa (było w początkach internetu).

### 3. Rozwiń skrót TLD (kontekst: DNS), podaj parę przykładów.

Top level domains, górny poziom hierarchii nazw domen. (gdzie hierarchia to drzewo, którego root oznaczamy kropką).

Przykłady: `pl`, `com` `uk` `pizza`.

### 4. Czym są strefy i delegacje DNS?

Strefa DNS to fragment przestrzeni nazw DNS, który jest zarządzany przez konkretny serwer DNS lub grupę serwerów. 

Delegacja DNS to mechanizm, w którym zarządzanie częścią przestrzeni nazw (np. subdomeną) jest przekazywane innemu serwerowi DNS.

### 5. Czym różni się rekurencyjne odpytywanie serwerów DNS od iteracyjnego?

#### Iteracyjne

- Pytamy serwer DNS dla `.`, on nie wie, ale mówi czyja to delegacja (DNS i adres)
- Pytamy się oddelegowanego, np. `foo.uk` o adresie `1.2.3.4`, znowu to samo
- Schodzimy w dół aż do najniższego, jak na warsztatach.

#### Rekurencyjne

Pytamy resolver DNS, on wykonuje odpytywanie za nas. (Resolver może być serwerem odpowiedzialnym za jakąś strefę)

### 6. Jak działa odwrotny DNS? Jaki typ rekordów i jaką domenę wykorzystuje?

Typ PTR: nazwa ("odwrócony" adres IP) i wartość (główna nazwa domeny)

Na przykład:
- nazwa: 11.4.17.156.in-addr.arpa
- wartość: ii.uni.wroc.pl

### 7. Jakie znasz typy rekordów DNS? Co to jest rekord CNAME?

- Typ A - wartość = adres IPv4 (216.58.209.67)
- Typ AAAA - wartość = adres IPv6 (2a00:1450:401b:801::2003)

Rekord CNAME (canonical name) przechowuje aliasy domeny:
- nazwa = alias domeny (www.ii.uni.wroc.pl)
- wartość = „główna“ nazwa domeny (ii.uni.wroc.pl) 

### 8. Do czego służy protokół SMTP a do czego IMAP?

SMTP służy do wysyłania, a IMAP do odbierania poczty.

### 9. Co to są przekaźniki SMTP (relays)?

Przekaźniki SMTP (ang. SMTP relays) to serwery lub usługi pośredniczące w przesyłaniu wiadomości e-mail. Ich zadaniem jest przekazywanie wiadomości e-mail od nadawcy do serwera odbiorcy, działając jako pośrednik w procesie wysyłania poczty.

### 10. Jaki rekord DNS jest sprawdzany przed wysłaniem poczty do danej domeny?

Przed wysłaniem poczty do danej domeny serwer SMTP sprawdza rekord MX (Mail Exchange) w systemie DNS, np.

```
przyklad.pl. 3600 IN MX 10 mail.przyklad.pl.
```

### 11. Wymień parę popularnych pól w nagłówku maila. Do czego służą pola Received i Bcc?
- From - od kogo
- To - Główny odbiorca / odbiorcy
- Cc - Carbon copy - odbiorcy otrzymujący kopię wiadomości, widoczną dla wszystkich
- Subject - temat
- Reply-To - na jaki adres mają iść odpowiedzi

- Received - pole dodawane przez serwer pośredniczący (czasami łańcuch kilku) - służy do śledzenia trasy wiadomości
- Bcc - Pole "Blind Carbon Copy" - Jak Cc, ale ukryta lista odbiorców, np. do wysyłania newslettera

### 12. Co umożliwia standard MIME?
Definiowanie / obsługa róznych typów treści - definiuje je za pomocą nagłówków Content-Type. 

### 13. Co to jest spam? Jakie znasz metody walki ze spamem?
Są to niechciane wiadomości pocztowe. Można korzystać z uczenia maszynowego, blokować zakresy IP, spowalniać połączenie.

### 14. Na czym polega mechanizm SPF?

Jest to rekord w DNSie definiujący jakie komputery są uprawnione do wysyłania poczty z danym polem From.

### 15. Jaka jest rola trackera w sieci Bittorrent?

Zna on adresy członków sieci - na prośbę udziela adresy niektórych.

### 16. Po co w plikach .torrent stosuje się funkcje skrótu?

Do weryfikacji poprawności fragmentów plików (czy nie został uszkodzony ani wysłany zawirusowany).

### 17. Jakie są różnice w postępowaniu seedera i leechera w sieci BitTorrent?

- Seeder ma 100% pliku i udostępnia ją w sieci torrent innym użytkownikom
- Leecher ma <100% pliku i pobiera i wysyła równocześnie dane

### 18. Na czym polegają połączenia odwrócone? Jak stosuje się je w protokole FTP?

Połączenia odwrócone w FTP (tryb aktywny) polegają na tym, że serwer inicjuje połączenie danych do klienta, a nie odwrotnie, co odróżnia je od standardowego kierunku połączeń. W trybie aktywnym klient wysyła polecenie PORT, określając adres i port, na który serwer ma się połączyć, co może być problematyczne w sieciach z zaporami lub NAT. Tryb pasywny, gdzie klient inicjuje oba połączenia, jest obecnie częściej stosowany ze względu na większą kompatybilność.

### 19. Opisz podobieństwa i różnice asymetrycznych (cone) NAT (pełnego i ograniczonego) i symetrycznych NAT.

Asymetryczne NAT (cone) utrzymują stałe mapowanie portów, różniąc się otwartością: pełny pozwala na połączenia od dowolnego hosta, a ograniczony tylko od wcześniej kontaktowanych adresów IP. Symetryczny NAT przydziela nowy port dla każdego połączenia zewnętrznego, co zwiększa bezpieczeństwo, ale utrudnia aplikacje peer-to-peer.

### 20. Opisz technikę wybijania dziur (hole punching) w NAT. Po co konieczny jest serwer pośredniczący?

Hole punching to technika umożliwiająca bezpośrednią komunikację peer-to-peer między urządzeniami za NAT poprzez tymczasowe otwarcie portów w zaporach sieciowych. Serwer pośredniczący (np. STUN) jest konieczny, aby umożliwić wymianę publicznych adresów IP i portów między klientami, co pozwala im nawiązać bezpośrednie połączenie. Technika ta jest kluczowa dla aplikacji takich jak VoIP czy gry online, gdzie NAT utrudnia bezpośrednią komunikację.

## Wykład 10

### 1. Jakie znasz typy kodów detekcyjnych? Do czego służą i jakie są między nimi różnice?

- Bit parzystości – dodaje jeden bit tak, by liczba jedynek była parzysta (wykrywa nieparzystą liczbę błędów).

- Sumy kontrolne – np. IP/TCP/UDP dodają sumę 16-/32-bitowych słów (nie wykrywają przestawień słów).

- CRC (Cyclic Redundancy Check) – oparty na dzieleniu wielomianów nad F₂; skuteczny i sprzętowo efektywny.

- Różnice: różnią się złożonością, skutecznością wykrywania błędów i zastosowaniem (np. warstwa łącza vs. sieciowa).

### 2. Jakie rodzaje błędów mają wykrywać kody detekcyjne? Z czego biorą się błędy przy przesyłaniu danych?

#### Rodzaje błędów:

- pojedyncze błędy bitowe,

- grupy przekłamanych bitów,

- zgubione lub dodane bity.

#### Źródła:

- zakłócenia w sygnale analogowym w warstwie fizycznej,

- błędy sprzętowe (RAM),

- błędy w oprogramowaniu

### 3. Jak działa algorytm obliczania sum kontrolnych CRC?

Wiadomość jako wielomian M(x).

Znany wielomian G(x) stopnia r.

Liczymy: xr · M(x) = Q(x) · G(x) + R(x).

S(x) = R(x) – to suma kontrolna.

Wysyłana wiadomość: m#s ↔ xr · M(x) + S(x).

### 4. W jaki sposób działa wykrywanie błędów przy sumie kontrolnej CRC?

Odbiorca otrzymuje b' = b + e.

Sprawdza, czy G(x) dzieli B'(x).

- Jeśli nie: wykryto błąd (G(x) ∤ E(x)).

- Jeśli tak: przyjmuje, że transmisja była poprawna.

### 5. Jakie znasz metody korygowania błędów w transmisji?

- (3,1)-kod – powtórzenie bitu 3x (korekcja 1 błędu).

- Kod Hamminga (np. (7,4)) – wykrywa 2 błędy, koryguje 1, dodając bity parzystości.

Ogólnie: jeśli odległość Hamminga ≥ k, można:

- wykryć do k-1 błędów,

- skorygować do (k-1)/2 błędów.

### 6. Co to jest (a,b)-kod? Podaj przykład.

Zamienia wiadomość długości b na kod długości a (a ≥ b).

Przykład: bit parzystości dla 7-bitowego ciągu → (8,7)-kod.

### 7. Co to jest odległość Hamminga? Jak wpływa na możliwość detekcji i korekcji błędów?

Liczba bitów, które trzeba zmienić, by jeden kod "przejść" w drugi.

Odległość ≥ k:

detekcja do k-1 błędów,

korekcja do (k-1)/2 błędów.

### 8. Do czego służą kody MAC? Co to jest HMAC?

MAC (Message Authentication Code): wykrywa celowe modyfikacje.

HMAC: bezpieczny MAC, h(s#h(s#m)), odporny na ataki przedłużeniowe, używany w TLS, OpenVPN.

### 9. Jakie własności powinna mieć kryptograficzna funkcja skrótu?

Szybko obliczalna.

Daje wynik stałej długości.

Trudno znaleźć:

- dwie różne wiadomości o tym samym haszu (kolizja),

- wiadomość do danego hasza (preimage),

- inną wiadomość z tym samym haszem (second preimage).

### 10. Czym różni się poufność od integralności?

- Poufność: nikt poza odbiorcą nie może odczytać wiadomości.

- Integralność: wiadomość nie została zmodyfikowana.

### 11. Co to są szyfry monoalfabetyczne? Dlaczego łatwo je złamać?

- Każdej literze przypisywana inna (np. Cezara, ROT13).

- Łatwo je złamać: zachowują statystykę języka, podatne na analizę częstotliwości.

### 12. Na czym polegają ataki z wybranym tekstem jawnym, znanym tekstem jawnym i znanym szyfrogramem?

- Wybrany tekst jawny: atakujący wybiera tekst jawny i obserwuje szyfrogram.

- Znany tekst jawny: zna pary (jawny, szyfrogram).

- Znany szyfrogram: tylko szyfrogram – stosuje analizę statystyczną.

### 13. Co to jest szyfrowanie one-time pad?

EK(m) = m XOR K, gdzie K jest tak długi jak m.

Teoretycznie idealnie bezpieczne, ale:

- klucz nie może być ponownie użyty,

- trudności z jego dystrybucją.

### 14. Na czym polega szyfrowanie blokowe? Czym różni się tryb ECB od CBC?

#### ECB (Electronic Codebook):

- każdy blok szyfrowany niezależnie.

- identyczne bloki → identyczne szyfrogramy.

#### CBC (Cipher Block Chaining):

XOR z poprzednim blokiem szyfrogramu.

- Pierwszy blok XOR z losowym IV.

- Lepsza ukrywalność wzorców niż ECB.



## Wykład 11

### 1. Czym szyfrowanie symetryczne różni się od asymetrycznego?

- **Symetryczne**: ten sam klucz do szyfrowania i deszyfrowania (np. AES).
- **Asymetryczne**: różne klucze – publiczny (do szyfrowania) i prywatny (do deszyfrowania) (np. RSA).
- W asymetrycznym każdy może zaszyfrować wiadomość, ale tylko właściciel prywatnego klucza ją odszyfruje.

---

### 2. Na czym polega bezpieczeństwo przy szyfrowaniu asymetrycznym?

- Opiera się na **jednokierunkowych operacjach matematycznych**, np. faktoryzacji liczb pierwszych.
- Znając klucz publiczny i szyfrogram, **niemożliwe jest efektywne wyliczenie klucza prywatnego ani tekstu jawnego**.

---

### 3. Opisz algorytm RSA.

1. Wybieramy dwie duże liczby pierwsze `p`, `q`.
2. Obliczamy `n = p * q` i `φ(n) = (p-1)*(q-1)`.
3. Wybieramy `e` względnie pierwsze z `φ(n)`.
4. Obliczamy `d`, takie że `d * e ≡ 1 (mod φ(n))`.
5. Klucz publiczny: `(e, n)`, prywatny: `(d, p, q)`.
6. Szyfrowanie: `c = m^e mod n`, deszyfrowanie: `m = c^d mod n`.

---

### 4. Czy różni się szyfrowanie od uwierzytelniania?

- **Szyfrowanie** zapewnia poufność: ukrycie treści wiadomości.
- **Uwierzytelnianie** potwierdza tożsamość nadawcy wiadomości.
- W asymetrycznym: szyfrowanie = kluczem publicznym, uwierzytelnianie = podpis kluczem prywatnym.

---

### 5. Co to jest atak powtórzeniowy?

- Przechwycenie podpisanego komunikatu `(m, podpis)` i ponowne jego wysłanie.
- Używany do podszywania się lub wywoływania tych samych skutków.

---

### 6. Czy w szyfrowaniu asymetrycznym szyfrujemy kluczem publicznym czy prywatnym?

- Do **szyfrowania** używamy **klucza publicznego**.
- Do **deszyfrowania** używamy **klucza prywatnego**.

---

### 7. Na czym polega podpisywanie wiadomości? Jakim kluczem to robimy?

- **Podpis** to zaszyfrowanie (najczęściej skrótu wiadomości) kluczem prywatnym.
- Każdy może go zweryfikować kluczem publicznym nadawcy.

---

### 8. Jak można wykorzystać podpisy cyfrowe do uwierzytelniania?

- Jeśli podpis może wygenerować tylko osoba posiadająca prywatny klucz, to **zweryfikowanie podpisu** oznacza, że nadawcą jest właściciel tego klucza.

---

### 9. Czy HMAC można wykorzystać do uwierzytelniania? Czy HMAC jest podpisem cyfrowym?

- **HMAC**: uwierzytelnia nadawcę, o ile klucz tajny jest znany tylko stronom.
- **Nie jest podpisem cyfrowym**, bo nie zapewnia niezaprzeczalności – każdy znający klucz może go wygenerować.

---

### 10. Dlaczego lepiej podpisywać funkcję skrótu wiadomości niż samą wiadomość? Z jakim ryzykiem się to wiąże?

- **Skróty są krótsze** → szybsze operacje.
- Chroni przed manipulacjami wiadomości.
- **Ryzyko**: słaba funkcja skrótu → możliwe kolizje → fałszywe wiadomości z tym samym haszem.

---

### 11. Co to są certyfikaty? Co to jest ścieżka certyfikacji?

- **Certyfikat** to podpisany przez CA dokument łączący tożsamość (np. domeny) z kluczem publicznym.
- **Ścieżka certyfikacji**: ciąg certyfikatów weryfikujących jeden drugi aż do zaufanego CA.

---

### 12. Co to jest urząd certyfikacji (CA)?

- **CA (Certificate Authority)** to zaufana instytucja, która:
  - weryfikuje tożsamość podmiotów,
  - wydaje certyfikaty,
  - pozwala przeglądarkom ufać stronom WWW.

---

### 13. Jak TLS zapewnia bezpieczeństwo połączenia?

- Używa **asymetrycznego szyfrowania** do ustalenia **klucza sesji**.
- Potem dane są szyfrowane szybkim **szyfrem symetrycznym** (np. AES).
- Zapewnia **poufność**, **integralność** i **uwierzytelnianie serwera**.

---

### 14. W jaki sposób w TLS następuje uwierzytelnienie serwera, z którym się łączymy?

- Przeglądarka sprawdza **certyfikat serwera**, podpisany przez zaufany CA.
- Weryfikuje, czy certyfikat pasuje do odwiedzanej domeny i czy jest ważny.

---

### 15. Co to są klucze sesji? Po co się je stosuje?

- Klucz sesji = tymczasowy klucz do szyfrowania w jednej sesji.
- Szyfrowanie **symetryczne** jest znacznie szybsze niż asymetryczne.
- Klucz sesji przesyłany bezpiecznie (np. szyfrowany kluczem publicznym serwera).

---

### 16. Co to są kolizje kryptograficznej funkcji skrótu?

- Dwie różne wiadomości `m1 ≠ m2`, dla których `h(m1) = h(m2)`.
- Kolizje **podważają bezpieczeństwo** podpisów i HMAC.

---

### 17. Na czym polega atak urodzinowy?

- Wykorzystuje **paradoks urodzin**: w zbiorze 2ⁿ⁄² elementów istnieje duża szansa na kolizję.
- Zamiast szukać konkretnego `m'` do danego `m`, szuka się **dowolnej** kolizji `h(m1) = h(m2)`.
