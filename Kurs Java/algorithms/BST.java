package algorithms;

// Klasa BST implementująca Dictionary
public class BST<T extends Comparable<T>> implements Dictionary<T> {

    // Korzeń drzewa
    public Node root;

    // Wewnętrzna klasa node reprezentująca węzeł drzewa
    class Node {
        Node left, right;
        T value;

        Node(T value) {
            this.value = value;
        }
    }

    // Wyszukiwanie elementu w drzewie - nadpisujemy klasę z interfejsu
    // Wywołujemy rekurencyjną funkcję wyszukującą
    @Override
    public boolean search(T x) {
        return searchRec(root, x);
    }

    // Standardowa rekurencyjna funkcja wyszukująca
    private boolean searchRec(Node node, T x) {
        if (node == null) {
            return false;
        }
        int cmp = x.compareTo(node.value);
        if (cmp == 0) {
            return true;
        } else if (cmp < 0) {
            return searchRec(node.left, x);
        } else {
            return searchRec(node.right, x);
        }
    }

    // Wstawianie elementu
    @Override
    public void insert(T x) {
        // Nie można wstawić null - wyrzucamy wyjątek jak w treści zadania
        if (x == null) {
            throw new IllegalArgumentException("Nie można wstawiać nulla!");
        }
        root = insertRec(root, x);
    }

    // Standardowa rekurencyjna funkcja wstawiająca
    private Node insertRec(Node node, T x) {
        if (node == null) {
            return new Node(x);
        }
        int cmp = x.compareTo(node.value);
        if (cmp < 0) {
            node.left = insertRec(node.left, x);
        } else if (cmp > 0) {
            node.right = insertRec(node.right, x);
        }
        return node;
    }

    // Usuwanie elementu
    @Override
    public void remove(T x) {
        root = removeRec(root, x);
    }

    private Node removeRec(Node node, T x) {
        if (node == null) {
            return null;
        }
        int cmp = x.compareTo(node.value);
        if (cmp < 0) {
            node.left = removeRec(node.left, x);
        } else if (cmp > 0) {
            node.right = removeRec(node.right, x);
        } else {
            // Znaleziono element do usunięcia - usuwamy
            if (node.left == null) {
                return node.right;
            } else if (node.right == null) {
                return node.left;
            }
            // Najgorszy przypadek - usuwamy węzeł z dwójką dzieci
            // Przypisujemy wartość najmniejszego elementu większego niż aktualnie usuwany
            // Usuwamy ten najmniejszy element z prawego poddrzewa
            node.value = minRec(node.right).value;
            node.right = removeRec(node.right, node.value);
        }
        return node;
    }

    // Znajdowanie minimum i maksimum
    @Override
    public T min() {
        if (root == null) {
            throw new IllegalStateException("Drzewo jest puste!");
        }
        return minRec(root).value;
    }

    private Node minRec(Node node) {
        while (node.left != null) {
            node = node.left;
        }
        return node;
    }

    @Override
    public T max() {
        if (root == null) {
            throw new IllegalStateException("Drzewo jest puste!");
        }
        return maxRec(root).value;
    }

    private Node maxRec(Node node) {
        while (node.right != null) {
            node = node.right;
        }
        return node;
    }

    // Wypisywanie drzewa - wystarczy znullować roota
    // Garbage Collector zajmie się resztą
    public void clear() {
        root = null;
    }

    // Wyznaczanie rozmiaru drzewa
    public int size() {
        return sizeRec(root);
    }

    private int sizeRec(Node node) {
        if (node == null) {
            return 0;
        }
        return 1 + sizeRec(node.left) + sizeRec(node.right);
    }
}