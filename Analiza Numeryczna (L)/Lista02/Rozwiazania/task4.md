# Zadanie 4

Adres tekstu: https://www-users.cse.umn.edu/~arnold/disasters/patriot.html
Adres raportu: https://www-users.cse.umn.edu/~arnold/disasters/GAO-IMTEC-92-96.pdf

## Treść zadania

a)
Przeczytaj tekst dostępny pod adresem *adres* mówiący o tym, że niefrasobliwe używanie arytmetyki zmiennopozycyjnej może prowadzić do prawdziwej tragedii (szczegóły patrz raport GAO/IMTEC-92-26). Streść, własnymi słowami, opisane tam zdarzenie i przedstaw istotę opisanego problemu.

b)
Jeśli znasz inne, podobne przykłady, to przygotuj krótką, ale ciekawą notatkę na ten temat używając systemu LATEX i przekaż wykładowcy1 — być może dostaniesz dodatkowy punkt.


## Rozwiązanie
Tekst opisuje problem w oprogramowaniu systemu obrony przeciwlotniczej Patriot. System ten wykorzystuje do obliczeń czasu 24-bitowe zmienne. Regularnie obliczany była wartość 1/10, której rozwinięcie binarne to 0.0001100110011001100110011001100....
Patriot przechowywał 0.00011001100110011001100 - błąd to 0.0000000000000000000000011001100... (0.000000095 w systemie dziesiętnym)

System uruchomiony był przez 100h = 0.000000095×100×60×60×10=0.34s błędu.

Iracki pocisk podróżował z prędkością 1676m/s, więc w tym czasie przeleciał 0.34×1676=569m. System Patriot nie był w stanie strącić pocisku, który przeleciał 569m od ostatniego skanu.