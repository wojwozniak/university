## (a) Dlaczego po stronie serwera hasła użytkownika nie można przechować w postaci jawnej?

Mniejszy problem przy wycieku danych (np. przy ataku). Wielu ludzi korzysta z tych samych haseł w wielu miejscach, więc wyciek spowodowałby duże straty. Poza tym (również z powodu tych samych haseł w wielu miejscach) byłoby też ryzyko nielegalnego ich użycia przez pracownika (osoby obsługującej bazę danych)

## (b) Dlaczego niektóre funkcje skrótu (które?) są niewskazane w praktyce?

MD-5 i SHA-1 są podatne na brute-force i ataki słownikowe

## (c) Do czego potrzebna jest dodatkowa wartość (salt) przy wyliczaniu skrótu?

Bez niej dwóch użytkowników z takim samym hasłem będzie miało taki sam hash (co znów ułatwia ataki)

## (d) Dlaczego hasła przechowuje się w osobnej tabeli i nie wystarczy do tego kolumna (kolumny) w tej samej tabeli, w której przechowuje się listę użytkowników?

Głównie dla wygody programisty - chroni przed głupimi błędami związanymi z prywatnością i ułatwia pracę

## (e) Jakie mechanizmy ochrony przed atakami typu brute-force można zastosować w typowej aplikacji internetowej?

Captcha, rate limiting, wymuszenie mocniejszych haseł

## (f) Jak obsłużyć scenariusz, w którym użytkownik zapomniał hasła i chce je w jakiś sposób odzyskać?

- Użytkownik podaje maila (który był wcześniej podpięty i zwerifikowany)
- Wysyłamy email z linkiem do resetowania hasła (Wygaszający się po x minutach)
- Użytkownik ustawia nowe hasło
- Wysłanie dodatkowych powiadomień o zmianie hasła (z możliwością zablokowania konta)