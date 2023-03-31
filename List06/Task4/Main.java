package List06.Task4;
import java.util.Arrays;

/*
* Wojciech Woźniak
* Lista 6: Zadanie 4
* (Korzystam z kompilatora replit.com)
* Można z niego skorzystać za pomocą
* konta github.com -> new replit,
* przeklejamy kod i klikamy run
*/

// Deklaracja klasy zawierającej metodę mergeSort
public class Main {
    // Funkcja z testem działania
    public static void main(String[] args) {
        // Przykładowe ciągi do posortowania
        Integer[] array = {5, 2, 4, 6, 1, 3};
        Integer[] array2 = {-1, -6, 5, 2, 4, 6, 1, 3};
        Integer[] array3 = {0};

        // Wypiszmy ciągi przed sortowaniem
        System.out.println("Nieposortowane ciągi:");
        System.out.println(Arrays.toString(array));
        System.out.println(Arrays.toString(array2));
        System.out.println(Arrays.toString(array3));

        // Wywołujemy mergesort
        System.out.println("Wywołano funkcję mergeSort!");
        mergeSort(array);
        mergeSort(array2);
        mergeSort(array3);

        // Wypisanie ciągów po wywołaniu mergeSort
        System.out.println("Ciągi po wywołaniu mergeSort:");
        System.out.println(Arrays.toString(array));
        System.out.println(Arrays.toString(array2));
        System.out.println(Arrays.toString(array3));
    }

    // Deklaracja funkcji mergeSort - przyjmuje Comparable[]
    public static void mergeSort(Comparable[] array) {
        // Indeksy pierwszego i ostatniego elementu
        // zapisujemy w zmiennych
        int start = 0;
        int end = array.length-1;

        // Jeśli ciąg jest długości 1 nie ma nic do sortowania
        if (start >= end) {
            return;
        }

        // Indeks środkowego elementu ciągu
        int mid = (start + end) / 2;

        // Bierzemy lewą i prawą stronę, 
        // po czym wywołujemy na nich mergeSort
        // (korzystamy z final by ominąć błąd)
        final Comparable[] left = Arrays.copyOfRange(array, start, mid + 1);
        final Comparable[] right = Arrays.copyOfRange(array, mid + 1, end + 1);
        mergeSort(left);
        mergeSort(right);

        // Łączymy dwa ciągi (równocześnie je sortując)
        int i = 0, j = 0, k = start;
        while (i < left.length && j < right.length) {
            if (left[i].compareTo(right[j]) <= 0) {
                array[k] = left[i];
                i++;
            } else {
                array[k] = right[j];
                j++;
            }
            k++;
        }
        // Pętle zapisujące resztę elementów ciągu
        // (każdorazowo uruchomi się tylko jedna z nich)
        while (i < left.length) {
            array[k] = left[i];
            i++;
            k++;
        }

        while (j < right.length) {
            array[k] = right[j];
            j++;
            k++;
        }
    }
}