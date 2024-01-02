package obliczenia.operandy;

import obliczenia.Operand;

public class Stala extends Operand {
    protected final double wartosc;
    private final String nazwa;

    public Stala(double wartosc, String nazwa) {
        super(wartosc);
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

    @Override
    public Stala clone() {
        Stala cloned = new Stala(this.wartosc, this.nazwa);
        return cloned;
    }

}