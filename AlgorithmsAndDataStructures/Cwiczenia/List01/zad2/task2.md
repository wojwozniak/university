# Zadanie 2 / Lista 1

Napisz w pseudokodzie procedury:

a) przywracania porządku

b) usuwania minimum

c) usuwania maksimum

z kopca minimaksowego. Przyjmij, że elementy tego kopca pamiętane są w jednej tablicy (określ
w jakiej kolejności). Użyj pseudokodu na takim samym poziomie szczegółowości, na jakim
zostały napisane w Notatce nr 2 odpowiednie procedury dla zwykłego kopca.

## Kopiec min-maxowy

Zacznijmy od tego - czym w ogóle jest kopiec min-maxowy?

Jest to struktura łącząca zalety kopca min i kopca max. Pozwala na znalezienie największego i najmniejszego elementu w czasie $O(1)$, a także na dodawanie i usuwanie elementów w czasie $O(\log n)$. Można go zbudować w $O(n)$. 

### W naszym przypadku rozwiązanie ma wyglądać tak (z Notatki 2):
- Wykorzystujemy dwa kopce: L i H
- W kopcu H pamiętamy roof(n/2) elementów, a w kopcu L floor(n/2)
- Kopiec L uporządkowany jest malejąco, a kopiec H rosnąco
- Na uporządkowanie z poprzedniego punktu nakładamy dodatkowy warunek. Otóż w kopcach H i L w naturalny sposób zdefiniowane są ścieżki biegnące od korzenia kopca L do korzenia kopca H. Chcemy, by na każdej takiej ścieżce klucze były uporządkowane niemalejąco.