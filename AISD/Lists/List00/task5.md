# Zadanie 5 / Lista 0

Napisz rekurencyjne funkcje, które dla danego drzewa binarnego przeszukiwań T obliczają:

### Insert (BST)

```c
bool ins(node **rootptr, int val) // ** bo rootptr może być nullem
{
    node *root = *rootptr;
    if (root == NULL)
    {
        *rootptr = create(val);
        return true; // true jeśli stworzymy
    }
    if (val == root->val)
    {
        return false; // false jeśli byłby to duplikat
    }
    if (val < root->val)
    {
        return ins(&(root->l), val);
    }
    else
    {
        return ins(&(root->r), val);
    }
}
```


### Delete (BST)

```c
node *deleteNode(node *root, int val)
{
    if (root == NULL)
    {
        return NULL;
    }

    if (val < root->val)
    {
        root->l = deleteNode(root->l, val);
    }
    else if (val > root->val)
    {
        root->r = deleteNode(root->r, val);
    }
    else
    {
        // Znaleźliśmy, usuwamy
        // Jeśli jedno dziecko to prosto 
        // -> dziecko przesuwa się do góry
        // (obsługuje to automatycznie liść)
        if (root->l == NULL)
        {
            node *temp = root->r;
            free(root);
            return temp;
        }
        else if (root->r == NULL)
        {
            node *temp = root->l;
            free(root);
            return temp;
        }

        // Dla dwóch dzieci największa zabawa
        // 1) Szukamy min. prawego poddrzewa
        // 2) Zastępujemy nim wartość node'a do usunięcia
        // 3) Rekurencyjnie usuwamy to minimum
        node *temp = findMin(root->r);
        root->val = temp->val;
        root->r = deleteNode(root->r, temp->val);
    }
    return root;
}
```


### Successor (BST)

```c
int findSuccessor(node *root, int val)
{
    node *current = root;
    node *successor = NULL;

    while (current != NULL)
    {
        if (current->val > val)
        {
            // Sukcesor to min. value większe niż zadane
            successor = findMin(root->r);
        }
        else if (current->val < val)
        {
            current = current->r;
        }
        else
        {
            break;
        }
    }

    if (successor != NULL)
    {
        return successor->val;
    }

    return -1;
}
```