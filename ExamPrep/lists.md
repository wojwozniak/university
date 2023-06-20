# Lista 1

- eq? sprawdza czy to ten sam obiekt
- equal? sprawdza czy to obiekty o tych samych wartościach

# Lista 2

- Wolne i związane wystąpienia zmiennych (związane - zadeklarowane w scope wyrażenia)

## Selection sort
- (cons (min l) (selection-sort (remove (min l) l)))
    - min zwraca najmniejszy element listy
    - remove usuwa element z listy
        - dla pustej zwraca pustą
        - gdy znajdziemy element cdr
        - wpp zwracamy (cons car (remove item cdr))

## Mergesort
- (merge (merge-sort (half l)) (merge-sort (other-half l)))
    - merge porównuje elementy i scala w odp. kolejności
    - split dzieli listę na dwie równe części:
        - najpierw deklarujemy wewnętrzną funkcję rekurencyjną z dwoma akumulatorami
        - robimy tam 3 checki - czy lista jest pusta, czy ma 1 element, czy ma 2 elementy
        - dla 0 zwracamy 2 akumulatory, dla 1 zwracamy (cons item acc1) acc2
        - dla 2 dodajemy po elemencie (car, cadr) i wywołujemy rek. dla cddr i akumulatorów


# Lista 3

- foldl i foldr - aplikujemy funkcję do listy (foldl od lewej, foldr od prawej) - przekazujemy funkcję, akumulator i listę

# Lista 4

- Drzewa binarne - definiujemy node i leaf (gdzie node (left value right) a leaf to "pusty" node)

# Lista 5

- Kontrakty
- Typy wyrażeń

# Lista 6

- Dowody indukcyjne

# Lista 7

- Kontrakty cd.

# Lista 8

- Wskaźniki

# Lista 9

- S-Expression

# Lista 10,11,12

- Parsery i interpretery

# Lista 13

- Strumienie