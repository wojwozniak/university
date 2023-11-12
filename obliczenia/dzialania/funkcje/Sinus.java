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
}