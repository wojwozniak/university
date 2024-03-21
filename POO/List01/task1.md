# Zadanie 1 / Lista 1
Odnaleźć w sieci dowolny prawdziwy dokument typu SIWZ (Specyfikacja Istotnych
Warunków Zamówienia) / OPZ (Opis Przedmiotu Zamówienia) dla jakiegoś systemu in-
formatycznego i wypisać zawarte w nim wymagania poszczególnych kategorii FURPS (nie
więcej niż 3 dla każdej kategorii, ale w sumie co najmniej 8).
Można posiłkować się kwestionariuszem:

https://web.archive.org/web/20201031045959/http://www.ibm.com/developerworks/rational/library/4710.html

Każde wymaganie ocenić przez pryzmat warunków S.M.A.R.T i sformułować jedno hipote-
tyczne ”pytanie do Zamawiającego”, na które odpowiedź (gdyby Zamawiający jej udzielił)
mogłaby urealnić nieprecyzyjne wymaganie.

Przykład z wykładu:
- wymaganie: oferowany system musi zapewnić dostęp do niego poprzez Internet z do-
wolnego komputera za pośrednictwem przeglądarki internetowej,
- hipotetyczne pytanie do Zamawiającego: jaki system operacyjny/jaka przeglądarka, w
jakiej minimalnej wersji

## Rozwiązanie

### F (Functional):
#### Wymaganie

- Dostęp do systemu powinien odbywać się przez przeglądarkę internetową: Chrome, Opera, Edge, Firefox;

#### SMART
- S - Nieprecyzyjne, nie wiadomo jakie wersje przeglądarki mają być obsługiwane (a jest dużo super starych)

- Pozostałe litery - spełnione

#### Pytanie do Zamawiającego

- Jaka jest minimalna wersja przeglądarki, która ma być obsługiwana?

### F (Functional) (2):

#### Wymaganie

- System posadowiony powinien być na relacyjnej bazie danych z możliwością uruchomienia warstwy
serwerowej w środowisku Linux i Windows

#### SMART
- S - Nieprecyzyjne, nie wiadomo jakiej konkretnej bazy danych użyć

#### Pytanie do Zamawiającego

- Jaka jest minimalna wersja bazy danych, która ma być obsługiwana?

### F (Functional) (3):

#### Wymaganie
- System winien być wykonany w technologii WWW klient-serwer

#### SMART
- S - Nieprecyzyjne, nie wiadomo jakiej konkretnej technologii użyć

#### Pytanie do Zamawiającego

- W jakiej konkretnej technologii ma być wykonany system? W jakiej minimalnej wersji tej technologii?

### U (Usability):

#### Wymaganie
- System powinien posiadać przejrzysty i intuicyjny w obsłudze panel administrowania uprawnieniami
użytkowników 

#### SMART
- S - Nieprecyzyjne, nie wiadomo co oznacza przejrzysty i intuicyjny
- M - Jak zmierzyć przejrzystość i intuicyjność?
- A - Brak
- R - Brak
- T - Brak

#### Pytanie do Zamawiającego

- Jakie są kryteria przejrzystości i intuicyjności?

### U (Usability) (2):

#### Wymaganie

- System powinien posiadać przejrzysty i intuicyjny w obsłudze panel administrowania uprawnieniami
użytkowników

#### SMART

- S - Nieprecyzyjne, nie wiadomo co oznacza przejrzysty i intuicyjny
- M - Jak zmierzyć przejrzystość i intuicyjność?

#### Pytanie do Zamawiającego

- Jakie są kryteria przejrzystości i intuicyjności?

### P (Performance):

#### Wymaganie

- Rejestr informacji o wprowadzanych nowych danych (data, czas i login użytkownika)

#### SMART

- S - Nieprecyzyjne, nie wiadomo ile danych ma być rejestrowanych, kto ma mieć do nich dostęp, jak długo mają być przechowywane

#### Pytanie do Zamawiającego

- Jakie są kryteria rejestracji danych?
- Kto ma mieć do nich dostęp?
- Jak długo mają być przechowywane?

### S (Supportability):

#### Wymaganie

- System powinien posiadać szeroki zakres możliwości konfiguracyjnych oraz ustawień pozwalających
na zindywidualizowaną parametryzację 

#### SMART

- S - Nieprecyzyjne, nie wiadomo co oznacza szeroki zakres możliwości konfiguracyjnych oraz ustawień pozwalających na zindywidualizowaną parametryzację
- M - też nie do końca wiadomo jak to zmierzyć

#### Pytanie do Zamawiającego

- Jakie są kryteria szerokiego zakresu możliwości konfiguracyjnych oraz ustawień pozwalających na zindywidualizowaną parametryzację?

### S (Supportability) (2):

#### Wymaganie

- Dostosowanie przestrzeni roboczej na ekranie do indywidualnych preferencji operatora
oraz przyznanych uprawnień

#### SMART

- S - Jak konkretnie ma wyglądać to dostosowanie?
- M - Jak zmierzyć wystarczającą ilość dostosowania?

#### Pytanie do Zamawiającego

- Jakie są wymagania dotyczące możliwości dostosowania?

### S (Supportability) (3):

#### Wymaganie

- Użytkownik powinien mieć możliwość wyciągnięcia na głównym pulpicie przestrzeni roboczej skrótów
do najczęściej wykorzystywanych funkcji i ekranów

#### SMART

- S - Ile konkretnie ma być wyciągalne? Jak ma to wyglądać?

#### Pytanie do Zamawiającego

- Jak ma wyglądać proces stworzenia skrótów, i ile ich ma być?

