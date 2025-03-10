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
def findSuccessor(rootNode, value):
    current = rootNode
    succesor = None

    while current is not null:
        if current.value < value:
            current = current.right
        else if current.value == value:
            successor = findMin(current.right)
        else:
            successor = findMin(current)
            break
    
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