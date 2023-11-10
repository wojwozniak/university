package obliczenia;

public abstract class Wyrazenie implements Obliczalny {

    // ... (inne pola i metody)

    /** Metoda sumująca wyrażenia */
    public static int suma(Wyrazenie... wyr) {
        int wynik = 0;
        for (Wyrazenie wyrazenie : wyr) {
            wynik += wyrazenie.oblicz();
        }
        return wynik;
    }

    /** Metoda mnożąca wyrażenia */
    public static int iloczyn(Wyrazenie... wyr) {
        int wynik = 1;
        for (Wyrazenie wyrazenie : wyr) {
            wynik *= wyrazenie.oblicz();
        }
        return wynik;
    }

    // Metoda abstrakcyjna do implementacji w klasach dziedziczących
    public abstract double oblicz();
}