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
        return "-(" + wyr.toString() + ")";
    }
}