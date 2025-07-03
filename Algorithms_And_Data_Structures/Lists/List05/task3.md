# Zadanie 3 / Lista 5
### #WIP

Rozważmy następujący problem:

## Problem 3SUM

**Dane:** Liczby rzeczywiste $x_1, \dots, x_n$.

**Wynik:** `'TAK'` – jeżeli $\exists\, 1 \leq i < j < k \leq n$ takie, że $x_i + x_j + x_k = 0$,  
`'NIE'` – w przeciwnym przypadku.

Udowodnij, że $\Omega(n \log n)$ jest dolną granicą na rozwiązanie tego problemu w modelu liniowych drzew decyzyjnych.

## Wstęp

Ponieważ jeden krok naszego algorytmu to przejście o jeden poziom w dół w drzewie to chcemy pokazać, że wysokość drzewa musi wynosić n log n.

Wiemy że gdy drzewo ma k wierzchołków to jego wysokosć wynosi log k.

Gdybyśmy rozważali problem sortowania to wygodnie byłoby pokazać że liści musi być n log n. Dlaczego? Bo w przypadku ciągu o długości n mamy n! możliwości.

W tym problemie mamy tylko dwie możliwości odpowiedzi -> TAK lub NIE.

Fajnie byłoby więc pokazać, że liście należące do tego samego zbioru, czyli liście z tą samą odpowiedzią muszą znajdować się w róznych liściach, czyli że droga do osiągnięcia tej odpowiedzi była inna. 

Dodatkowo należy pokazać, że tych liści będzie dostatecznie dużo.

Ponieważ w zadaniu tym najbardziej zależy nam na porównaniu przy użyciu operacji =, ale wciąż potrzebujemy dokonywać porównań przy użyciu operacji <, > to do rozwiązania tego problemu wykorzystamy drzewo trójkowe.

Chcemy utożsamić ciąg x1,..., xn z punktem w (x1, ..., xn) R^n.