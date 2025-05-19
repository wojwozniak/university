# Zadanie 8 / Lista 5

Rozważmy problem wyznaczenia za pomocą porównań elementów największego i drugiego największego z kolei w zbiorze n-elementowym. Udowodnij że n + $\lceil \log(n) \rceil$ - 2 porównań potrzeba i wystarcza do wyznaczenia tych zbiorów.

## Idea - wystarczy

Wyznaczamy największy w turnieju, później drugi największy będzie wśród tych które przegrały z największym - logarytmicznie dużo. 

## Rozwiązanie - wystarczy

Najpierw znajdujemy element największy - robimy to drzewem decyzyjnym. Robimy turniej, gdzie porównujemy ze sobą pary elementów, w każdym pojedynku jeden odrzucając. Dochodzimy do korzenia robiąc łącznie $n - 1$ porównań.

Patrzymy na ścieżkę -> potencjalnym elementem drugim-największym będą wszystkie elementy które przegrały pojedynek z największym - jest ich $\lceil \log(n) \rceil$ - wysokość drzewa. Aby znaleźć największy z tych elementów wystarczy $\lceil \log(n) \rceil - 1$ porównań.


## Idea - potrzeba (nie da się mniej)

Powyższy opis nie udowadnia (chyba) że nie da się mniej - zrobimy to tutaj. Powyższy algorytm daje nam element największy, drugi największy i n-2 elementów mniejszych. 

Rozważmy problem znalezienia $n-2$ elementów mniejszych od y2. Oczywiście będzie n-2 porównań - chcemy pokazać więc że porównań do znalezienia y1 będzie $\log(n)$

## Rozwiązanie - potrzeba

Wprowadzamy oznaczenie - $L(x)$ oznacza licznośc zbioru składającego się z elementów mniejszych lub równych x. 

- Jeśli porównujemy x i y, to gdy $x <= y$ to $L(x) <= L(y)$
- Po porównaniu mamy $L(y) = L(y) + L(x)$ - bo muszą być mniejsze (pokazujemy że potrzeba, więc tutaj założenie że dokładnie się sumuje jest na naszą niekorzyść - a więc dobre)
- Z każdym porównaniem L(z) może się zwiększyć co najwyżej dwukrotnie (wynika to z myślnika 1)
- Po k porównaniach mamy $L(y) <= 2^k$ (bo na start L(*) = 1)

I stąd mamy:
- $L(y1) = n = 2^k$ (co logarytmujemy)
- $\log(n) <= k$
- $\lceil \log(n) \rceil <= k$, bo k to całkowita (możemy zrobić więc wyższą lewą stronę nic nie tracąc)

Potrzeba więc n + $\lceil \log(n) \rceil$ - 2 porównań by wykonać to zadanie.