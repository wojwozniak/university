# Zadanie 5 / Lista 6

Udowodnij, że każde drzewo BST można przekształcić operacjami rotacji w dowolne inne drzewo BST.

(Dla tych samych wartości w drzewie)

## Idea

Przypominamy sobie / zauważamy dwa fakty:
- rotacja zachowuje porządek infiksowy w BST
- skoro tak to jeśli x to korzeń w obu drzewach, to w lewym poddrzewie będą te drzewa mieć wszystkie elementy < x, a w prawym > x.

## Rozwiązanie

Czyli:
- Mamy drzewo nasze `T1` i docelowe `T2`
- Możemy zrobić rotację w naszym `T1` by ustawić na root taki sam `x`
- Rotacja nie psuje ustawienia, to nadal BST
- Mamy więc drzewa z takim samym rootem i z takimi samymi zawartościami dwóch poddrzew
- Możemy robić tak rekurencyjne dla każdego z poddrzew