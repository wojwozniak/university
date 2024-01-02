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

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Mnożenie))
            return false;
        Mnożenie other = (Mnożenie) obj;
        return left.equals(other.left) && right.equals(other.right);
    }

    @Override
    public Mnożenie clone() {
        Mnożenie cloned = new Mnożenie(this.left, this.right);
        return cloned;
    }
}