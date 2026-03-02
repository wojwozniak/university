# Zadanie 4 / Lista 0

Napisz rekurencyjne funkcje, które dla danego drzewa binarnego T obliczają:


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
        Pułapka - niesymetryczne drzewa - oprócz sum of depths trzeba sprawdzać rekurencyjnie na dzieciach
    */

    // Wyliczamy potrzebne nam wartości
    int max_depth_left = max_depth(root->l);
    int max_depth_right = max_depth(root->r);
    int max_distance_left = max_distance(root->l);
    int max_distance_right = max_distance(root->r);

    int sum_of_depths = max_depth_left + max_depth_right;
    int max_distance_children = max(max_distance_left, max_distance_right);

    // Zwracamy większą z dwóch wartości
    return max(sum_of_depths, max_distance_children);
}
```

