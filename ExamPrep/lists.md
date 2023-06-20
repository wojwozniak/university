# Lista 1

Podstawy - nic ciekawego

# Lista 2

- Wolne i związane wystąpienia zmiennych (związane - zadeklarowane w scope wyrażenia)

## Selection sort
- (cons (min l) (selection-sort (remove (min l) l)))

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