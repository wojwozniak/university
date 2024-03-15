import java.util.List;

// Tu nie jestem pewien

// Zasada:
// Klient nie powinien być zmuszany do zależności od metod których nie używa

// Problem:
// Klasa potrzebuje tylko części funkcjonalności, a musi implementować cały interfejs
// Zmiana innej części interfejsu wymusza zmianę klasy i wszystkich jej klientów

// Zadanie:
// Znajdź przykład złamania zasady ISP w Javie

// Rozwiązanie:
// Domyślny list łamie zasadę ISP????

public class Task5 {

  public static void main(String[] args) {
    System.out.println(new Object());

    // Możnaby chcieć listę, która pozwala tylko na dodawanie i pobieranie elementów
    // w javie domyślnie List ma też usuwanie elementów
    interface AddAndGetOnlyList<E> extends List<E> {
      @Override
      boolean add(E e);

      @Override
      E get(int index);
    }
  }
  // Może być zastosowanie gdzie chcemy zakazać usuwania elementów
}
