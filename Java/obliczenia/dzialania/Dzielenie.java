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

    @Override
    public String toString() {
        return "(" + left.toString() + " / " + right.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Dzielenie))
            return false;
        Dzielenie other = (Dzielenie) obj;
        return left.equals(other.left) && right.equals(other.right);
    }

    @Override
    public Dzielenie clone() {
        Dzielenie cloned = new Dzielenie(this.left, this.right);
        return cloned;
    }
}
