package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Mnożenie extends Wyrazenie {
    private final Wyrazenie left;
    private final Wyrazenie right;

    public Mnożenie(Wyrazenie left, Wyrazenie right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public double oblicz() {
        return left.oblicz() * right.oblicz();
    }

    @Override
    public String toString() {
        return "(" + left.toString() + " * " + right.toString() + ")";
    }
}