package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Odejmowanie extends Wyrazenie {
    private final Wyrazenie left;
    private final Wyrazenie right;

    public Odejmowanie(Wyrazenie left, Wyrazenie right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public double oblicz() {
        return left.oblicz() - right.oblicz();
    }

    @Override
    public String toString() {
        return "(" + left.toString() + " - " + right.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Odejmowanie))
            return false;
        Odejmowanie other = (Odejmowanie) obj;
        return left.equals(other.left) && right.equals(other.right);
    }

    @Override
    public Odejmowanie clone() {
        Odejmowanie cloned = new Odejmowanie(this.left, this.right);
        return cloned;
    }
}