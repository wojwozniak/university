package List05.Task1;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

// Deklaracja kolekcji OrderedList 
public class OrderedList<T extends Comparable<T>> {
    // Deklaracja listy,
    // która przechowuje elementy kolekcji
    private List<T> list;

    // Konstruktor kolekcji
    // Tworzy on listę po zainicjowaniu orderedList
    public OrderedList() {
        list = new ArrayList<>();
    }

    // Metoda dodająca element do kolekcji
    public void addElement(T elem) {
        list.add(elem);
        Collections.sort(list);
    }

    // Metoda zwracająca pierwszy element kolekcji
    public T getFirst() {
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    // Metoda zwracająca tekstową reprezentację 
    // obiektów tej klasy.
    // Przyda nam się do testowania kodu.
    public String toString() {
        return list.toString();
    }
}