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
}