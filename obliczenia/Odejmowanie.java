package obliczenia;

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
}