package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Dodawanie extends Wyrazenie {
    private final Wyrazenie left;
    private final Wyrazenie right;

    public Dodawanie(Wyrazenie left, Wyrazenie right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public double oblicz() {
        return left.oblicz() + right.oblicz();
    }

    @Override
    public String toString() {
        return "(" + left.toString() + " + " + right.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Dodawanie))
            return false;
        Dodawanie other = (Dodawanie) obj;
        return left.equals(other.left) && right.equals(other.right);
    }

    @Override
    public Dodawanie clone() {
        Dodawanie cloned = new Dodawanie(this.left, this.right);
        return cloned;
    }
}