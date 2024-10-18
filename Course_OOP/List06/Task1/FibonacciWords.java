package List06.Task1;

/*
* Wojciech Woźniak
* Lista 6: Zadanie 1
* (Korzystam z IDE IntelliJ IDEA 2023.1)
* (wersja premium, konto studenckie)
* Kompilacja: javac FibonacciWords.java
*/

// Importy potrzebnych klas
import java.io.*;
import java.util.Iterator;

// Klasa FibonacciWords implementująca interfejs Serializable
public class FibonacciWords implements Iterable<String>, Serializable {

    // Metoda main (testy)
    public static void main(String[] args) {
        FibonacciWords fibonacciWords = new FibonacciWords(5);

        // Część z zapisywaniem do pliku
        try {
            // Zapis do pliku
            FileOutputStream fileOut = new FileOutputStream("fibonacci.ser");
            ObjectOutputStream out = new ObjectOutputStream(fileOut);
            out.writeObject(fibonacciWords);
            out.close();
            fileOut.close();
            System.out.println("Zapisano dane do pliku.");

            // Odczyt z pliku
            FileInputStream fileIn = new FileInputStream("fibonacci.ser");
            ObjectInputStream in = new ObjectInputStream(fileIn);
            FibonacciWords fibonacciWords2 = (FibonacciWords) in.readObject();
            in.close();
            fileIn.close();

            // Wyświetlenie odczytanego ciągu
            System.out.println("Dane z pliku:");
            for (String s : fibonacciWords2) {
                System.out.println(s);
            }
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Kod przetłumaczony z C# - zadanie 2 z listy 4
    
    // Zmienna n
    private int n;
    
    // Konstruktor
    public FibonacciWords(int n) {
        this.n = n;
    }

    // Metoda iterator
    public Iterator<String> iterator() {
        return new FibonacciIterator();
    }

    // Klasa FibonacciIterator implementująca interfejs Iterator
    private class FibonacciIterator implements Iterator<String>, Serializable {
        // Iterator, pierwsze dwa elementy i aktualny napis
        private int i = 0;
        private String s1 = "b";
        private String s2 = "a";
        private String current = "";

    
        // Metoda hasNext
        public boolean hasNext() {
            return i < n;
        }

        // Metoda next
        public String next() {
            if (i == 0) {
                current = s1;
            } else if (i == 1) {
                current = s2;
            } else {
                current = s1 + s2;
                s1 = s2;
                s2 = current;
            }
            i++;
            return current;
        }
    }
}