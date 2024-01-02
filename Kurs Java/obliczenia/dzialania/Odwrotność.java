package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Odwrotność extends Wyrazenie {
    private final Wyrazenie wyr;

    public Odwrotność(Wyrazenie wyr) {
        this.wyr = wyr;
    }

    @Override
    public double oblicz() {
        return 1 / wyr.oblicz();
    }

    @Override
    public String toString() {
        return "(1 / " + wyr.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Odwrotność))
            return false;
        Odwrotność other = (Odwrotność) obj;
        return wyr.equals(other.wyr);
    }

    @Override
    public Odwrotność clone() {
        Odwrotność cloned = new Odwrotność(this.wyr);
        return cloned;
    }
}