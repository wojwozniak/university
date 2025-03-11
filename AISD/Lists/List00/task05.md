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

### Successor
```py
def findSuccessor(root, value):
    if root is null:
        return null

    successor = null
    curr = root

    while curr != null:
        if curr.val == value # Znaleźliśmy wartość której sukcesora szukamy
            # Jeśli wartość której sukcesora szukamy ma większe dziecko,
            # szukamy min prawego poddrzewa
            if curr.r != null:
                return findMin(curr.r)
            # Jeśli nie ma dzieci, sukcesor mógł być nodem, z którego poszliśmy w lewo
            else:
                return successor

        # Jeśli aktualna większa niż zadana to jest potencjalnym
        # sukcesorem, sprawdzamy dalej dla mniejszych dzieci
        else if curr.val > value:
            successor = curr
            curr = curr.l
        else:
            curr = curr.r # Za mała, szukamy większych

    return successor
```

### Delete
```py
def delNode(node, value):
    if node == None:
        return None
    else if value < node.value:
        node = delNode(node.left, value)
    else if value > node.value:
        node = delNode(node.right, value)   
    else:
        # Znaleziono node
        if node.left == NULL:
            temp = node.right
            free(node)
            return temp
        if node.right == NULL:
            temp = node.left
            free(node)
            return temp
        # w tym przypadku dwójka dzieci
        temp = findMin(node.right)
        node.val = temp.val
        node.right = deleteNode(root.right, temp.val)
        # gdzie ostatnia funkcja już nie wywoła na pewno rekurencji
    return node
```