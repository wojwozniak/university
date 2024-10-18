package obliczenia.dzialania.funkcje;

import obliczenia.Wyrazenie;

public class Sinus extends Wyrazenie {
    private final Wyrazenie wyr;

    public Sinus(Wyrazenie wyr) {
        this.wyr = wyr;
    }

    @Override
    public double oblicz() {
        return Math.sin(wyr.oblicz());
    }

    @Override
    public String toString() {
        return "sin(" + wyr.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Sinus))
            return false;
        Sinus other = (Sinus) obj;
        return wyr.equals(other.wyr);
    }

    @Override
    public Sinus clone() {
        Sinus cloned = new Sinus(this.wyr);
        return cloned;
    }
}