package obliczenia;

public class Stala extends Wyrazenie {
    private final double wartosc;
    private final String nazwa;

    public Stala(double wartosc, String nazwa) {
        this.wartosc = wartosc;
        this.nazwa = nazwa;
    }

    @Override
    public double oblicz() {
        return wartosc;
    }

    @Override
    public String toString() {
        return nazwa;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Stala)) {
            return false;
        }
        Stala other = (Stala) obj;
        return wartosc == other.wartosc;
    }
}