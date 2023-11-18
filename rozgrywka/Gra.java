package rozgrywka;
import obliczenia.Wymierna;

public class Gra {
    // Podane w treści pola oraz bool aktywna
    private int zakres;
    private Wymierna liczba;
    private int maksIloscProb;
    private int licznikProb;
    private boolean aktywna;

    // Konstruktor - domyślnie gra nie jest aktywna
    public Gra() {
        aktywna = false;
    }

    // Metoda start
    public void start(int z) {
        if (z < 5 || z > 20)
            throw new IllegalArgumentException("Zakres: 5-20.");
        zakres = z;

        // Deklarację int wyjąłem przed pętlę bo inaczej nie działało
        int licz, mian;

        do {
            licz = (int) (Math.random() * zakres) + 1;
            mian = (int) (Math.random() * zakres) + 1;
        } while (licz >= mian);
        liczba = new Wymierna(licz, mian);
        // Inicjalizacja
        maksIloscProb = 3;
        licznikProb = 0;
        aktywna = true;

        assert liczba.getLicznik() < liczba.getMianownik() : "Błąd losowania w metodzie start().";
    }

    // Metoda odgadnij - zwraca "zwycięstwo", "porażka" lub "kontynuacja"
    public String odgadnij(Wymierna propozycja) {
        if (!aktywna) {
            throw new IllegalStateException("Gra nie jest aktywna.");
        }
        licznikProb++;

        if (propozycja.equals(liczba)) {
            aktywna = false;
            return "zwycięstwo";
        }

        if (licznikProb == maksIloscProb) {
            aktywna = false;
            return "porażka";
        }

        return "kontynuacja";
    }

    // Metoda do rezygnacji z rozgrywki
    public String rezygnuj() {
        if (!aktywna)
            throw new IllegalStateException("Gra nie jest aktywna.");
        aktywna = false;
        return "rezygnacja";
    }

    // Metoda do sprawdzenia, czy gra jest aktywna
    public boolean czyAktywna() {
        return aktywna;
    }
}