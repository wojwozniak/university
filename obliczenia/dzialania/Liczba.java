package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Liczba extends Wyrazenie {
    private double wartosc;

    public Liczba(double wartosc) {
        this.wartosc = wartosc;
    }

    @Override
    public double oblicz() {
        return wartosc;
    }

    @Override
    public String toString() {
        return Double.toString(wartosc);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Liczba)) {
            return false;
        }
        Liczba other = (Liczba) obj;
        return wartosc == other.wartosc;
    }
}