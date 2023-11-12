package obliczenia;

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
}