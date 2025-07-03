# Zadanie 8 / Lista 5

Rozważmy problem wyznaczenia za pomocą porównań elementów największego i drugiego największego z kolei w zbiorze n-elementowym. Udowodnij że n + $\lceil \log(n) \rceil$ - 2 porównań potrzeba i wystarcza do wyznaczenia tych zbiorów.

## Idea - wystarczy (więcej niż tyle nie jest potrzebne)

Wyznaczamy największy w turnieju, później drugi największy będzie wśród tych które przegrały z największym - logarytmicznie dużo. 

## Rozwiązanie - wystarczy

Najpierw znajdujemy element największy - robimy to drzewem decyzyjnym. Robimy turniej, gdzie porównujemy ze sobą pary elementów, w każdym pojedynku jeden odrzucając. Dochodzimy do korzenia robiąc łącznie $n - 1$ porównań.

Patrzymy na ścieżkę -> potencjalnym elementem drugim-największym będą wszystkie elementy które przegrały pojedynek z największym - jest ich $\lceil \log(n) \rceil$ - wysokość drzewa. Aby znaleźć największy z tych elementów wystarczy $\lceil \log(n) \rceil - 1$ porównań.

Skoro tak, to łącznie osiągamy szukaną wartość - wystarczy tyle porównań, nie trzeba więcej.

## Idea - potrzeba (nie da się mniej)

Powyższy opis nie udowadnia że nie da się mniej - zrobimy to tutaj. 

Mamy n elementów w zbiorze, weźmy jakiś algorytm wyznaczający drugi największy element w tym zbiorze. Algorytm ten musi wyznaczyć największy element (no bo inaczej nie wiedziałby który jest drugi). Wiemy że wyznaczenie największego to $n-1$ porównań. Chcemy pokazać, że wyznaczenie drugiego największego zajmie conajmniej $\lceil \log(n) \rceil$ - 1 porównań.

$n-1$ porównań wyznaczających $M_1$ pozwala nam ograniczyć zbiór potencjalnych kandydatów na $M_2$, ale nie daje nam żadnych informacji co do relacji między tymi kandydatami.

By znaleźć $M_2$ potrzebujemy rozpatrzeć liczby, które przegrały z $M_1$.

## Rozwiązanie - potrzeba

Pokażmy przez grę z adwersarzem jaka jest dolna granica na to dla dowolnych danych.

Każdej liczbie ze zbioru przypisujemy wagę 1.

Niezmiennik: wagi zbioru sumują się do n.

Kończymy działanie algorytmu gdy 1 element ma wagę n.

- Jeśli porównujemy x i y, to gdy $x <= y$ to $L(x) <= L(y)$
- Po porównaniu mamy $L(y) = L(y) + L(x)$ - bo muszą być mniejsze (pokazujemy że potrzeba, więc tutaj założenie że dokładnie się sumuje jest na naszą niekorzyść - a więc dobre)
- Z każdym porównaniem L(z) może się zwiększyć co najwyżej dwukrotnie (wynika to z myślnika 1)
- Po k porównaniach mamy $L(y) <= 2^k$ (bo na start L(*) = 1)

I stąd mamy:
- $L(y1) = n = 2^k$ (co logarytmujemy)
- $\log(n) <= k$
- $\lceil \log(n) \rceil <= k$, bo k to całkowita (możemy zrobić więc wyższą lewą stronę nic nie tracąc)