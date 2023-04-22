// Wojciech Woźniak - Lista 7

import java.io.*;

// Główna klasa z testami
public class Main {

    // Wywołanie testów
    public static void main(String[] args) {
        serializationTest();
        editorTest();
    }


    // Testy edycji
    public static void editorTest() {
        // Tworzymy przykładowe zmienne i wywołujemy edytor
        Ksiazka ksiazka = new Ksiazka("Ostatnie Życzenie", "Andrzej Sapkowski", 1993);
        Czasopismo czasopismo = new Czasopismo("Atlas wędkarski", "Różni autorzy", 2023, 1, 1);
        Editor editor = new Editor(ksiazka, czasopismo);
    }

    // Testy serializacji i deserializacji
    public static void serializationTest() {
        System.out.println("Wypiszemy dwa obiekty - obydwa najpierw przed serializacją, a potem po serializacji i deserializacji");

        /*
            Tworzymy obiekt klasy Ksiazka (tablica jednoelementowa
            w celu uniknięcia problemu przy wypisywaniu obiektu)
        */
        final Ksiazka[] ksiazka = {new Ksiazka("Ostatnie Życzenie", "Andrzej Sapkowski", 1993)};

        // Wypisujemy obiekt do konsoli
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
    }
 }