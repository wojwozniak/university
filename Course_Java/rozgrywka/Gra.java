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
    public int start(int z) {
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
        maksIloscProb = (int) Math.ceil(3 * (Math.log(zakres) / Math.log(2)));
        licznikProb = 0;
        aktywna = true;
        System.out.println(liczba.getLicznik() + " " + liczba.getMianownik());

        return  liczba.getMianownik() - liczba.getLicznik() > 0
                ? maksIloscProb 
                : -1;
    }

    // Metoda odgadnij - zwraca "zwycięstwo", "porażka" lub "kontynuacja"
    public String odgadnij(Wymierna propozycja) {
        if (!aktywna) {
            throw new IllegalStateException("Gra nie jest aktywna.");
        }
        licznikProb++;

        if (propozycja.equals(liczba)) {
            aktywna = false;
            return "ZWYCIĘSTWO";
        }

        if (licznikProb == maksIloscProb) {
            aktywna = false;
            return "PORAŻKA";
        }

        return "KONTYNUACJA";
    }

    // Metoda do rezygnacji z rozgrywki
    public String rezygnuj() {
        aktywna = false;
        return "REZYGNACJA";
    }

    // Metoda do sprawdzenia, czy gra jest aktywna
    public boolean czyAktywna() {
        return aktywna;
    }

    public int ileProbUzyto() {
        return licznikProb;
    }

    public int ileProbZostalo() {
        return maksIloscProb - licznikProb;
    }

    public int porownaj(Wymierna proba) {
        if (!aktywna) {
            throw new IllegalStateException("Gra nie jest aktywna.");
        }
        if (proba.equals(liczba)) {
            return 0;
        }
        return proba.compareTo(liczba);
    }
}