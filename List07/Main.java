import java.io.*;
import javax.swing.*;

// Główna klasa z testami
public class Main {
    public static void main(String[] args) {
        System.out.println("Wypiszemy dwa obiekty - obydwa najpierw przed serializacją, a potem po serializacji i deserializacji");

        // Stwórz obiekt książka
        final Ksiazka[] ksiazka = {new Ksiazka("Ostatnie Życzenie", "Andrzej Sapkowski", 1993)};

        // Wypisz obiekt do konsoli
        System.out.println(ksiazka[0]);

        // Serializacja
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("ksiazka.ser"))) {
            oos.writeObject(ksiazka[0]);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Deserializacja i wypisanie zdeserializowanego obiektu
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("ksiazka.ser"))) {
            Ksiazka ksiazka2 = (Ksiazka) ois.readObject();
            System.out.println(ksiazka2);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Analogiczny test dla czasopisma
        Czasopismo czasopismo = new Czasopismo("Atlas wędkarski", "Różni autorzy", 2023, 1, 1);
        System.out.println(czasopismo);
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("czasopismo.ser"))) {
            oos.writeObject(czasopismo);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("czasopismo.ser"))) {
            Czasopismo czasopismo2 = (Czasopismo) ois.readObject();
            System.out.println(czasopismo2);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        /*
            Test edytora klasy książka
            Tworzymy okno edycji obiektu klasy
            Książka i wywołujemy je.
            Po zamknięciu okna w konsoli pojawi się kod
            po zmianach.
        */
        System.out.println("Teraz test edytora. Edytuj i kliknij zapisz.");
        System.out.println("Przed zmianą:");
        System.out.println(ksiazka[0]);
        System.out.println("Po zmianie:");
        KsiazkaEditor editor = new KsiazkaEditor(ksiazka[0]);
        KsiazkaEditor.callEditor(ksiazka[0]);

    }
}