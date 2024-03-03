# Zadanie 1 / Lista 1

Napisz rekurencyjne funkcje, które dla danego drzewa binarnego T obliczają:
• liczbę wierzchołków w T,
• maksymalną odległość między wierzchołkami w T.


Nie podaję tutaj funkcji pomocnicznych - albo były na kursie C, albo są trywialne.
W razie czego można znaleźć je w kodzie.

### a) Liczba wierzchołków

```c
int count(node *root)
{
    if (root == NULL)
    {
        return 0;
    }
    return 1 + count(root->l) + count(root->r);
}
```

### b) Maksymalna odległość między wierzchołkami

```c
int max_distance(node *root)
{
    if (root == NULL)
    {
        return 0;
    }

    /*
        I tu lekko bardziej rozpiszę, bo tu jest mała pułapka.
        Drzewo może być niesymetryczne - wtedy nie możemy po prostu zsumować
        głębokości lewego i prawego poddrzewa.

        Oprócz tego musimy liczyć maksymalną odległość między wierzchołkami w
        poddrzewach, i sprawdzić czy tam coś większego się nie znajdzie.
    */

    // Wyliczamy potrzebne nam wartości
    int max_depth_left = max_depth(root->l);
    int max_depth_right = max_depth(root->r);
    int max_distance_left = max_distance(root->l);
    int max_distance_right = max_distance(root->r);

    // Tu mamy sumę głębokości lewego i prawego poddrzewa
    int sum_of_depths = max_depth_left + max_depth_right;

    // A tu jeszcze max wartości rekurencyjnie dla dzieci
    int max_distance_children = max(max_distance_left, max_distance_right);

    // Zwracamy większą z dwóch wartości
    return max(sum_of_depths, max_distance_children);
}
```

