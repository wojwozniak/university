import java.io.*;


// Główna klasa z testami
public class Main {
    public static void main(String[] args) {
        System.out.println("Wypiszemy dwa obiekty - obydwa najpierw przed serializacją, a potem po serializacji i deserializacji");


        // Stwórz obiekt książka
        Ksiazka ksiazka = new Ksiazka("Ostatnie Życzenie", "Andrzej Sapkowski", 1993);

        // Wypisz obiekt do konsoli
        System.out.println(ksiazka);

        // Serializacja
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("ksiazka.ser"))) {
            oos.writeObject(ksiazka);
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
        Czasopismo czasopismo = new Czasopismo("National Geographic", "Various", 2022, 4, 4);
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