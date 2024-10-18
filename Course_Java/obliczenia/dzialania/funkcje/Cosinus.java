package obliczenia.dzialania.funkcje;

import obliczenia.Wyrazenie;

public class Cosinus extends Wyrazenie {
    private final Wyrazenie wyr;

    public Cosinus(Wyrazenie wyr) {
        this.wyr = wyr;
    }

    @Override
    public double oblicz() {
        return Math.cos(wyr.oblicz());
    }

    @Override
    public String toString() {
        return "cos(" + wyr.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Cosinus))
            return false;
        Cosinus other = (Cosinus) obj;
        return wyr.equals(other.wyr);
    }
    @Override
    public Cosinus clone() {
        Cosinus cloned = new Cosinus(this.wyr);
        return cloned;
    }
}