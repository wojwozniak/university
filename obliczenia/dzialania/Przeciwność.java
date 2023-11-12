package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Przeciwność extends Wyrazenie {
    private final Wyrazenie wyr;

    public Przeciwność(Wyrazenie wyr) {
        this.wyr = wyr;
    }

    @Override
    public double oblicz() {
        return -wyr.oblicz();
    }

    @Override
    public String toString() {
        return "-" + wyr.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Przeciwność))
            return false;
        Przeciwność other = (Przeciwność) obj;
        return wyr.equals(other.wyr);
    }

    @Override
    public Przeciwność clone() {
        Przeciwność cloned = new Przeciwność(this.wyr);
        return cloned;
    }
}