package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Dzielenie extends Wyrazenie {
    private final Wyrazenie left;
    private final Wyrazenie right;

    public Dzielenie(Wyrazenie left, Wyrazenie right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public double oblicz() {
        return left.oblicz() / right.oblicz();
    }
}
