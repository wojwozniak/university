package obliczenia;

public abstract class Operand extends Wyrazenie {
    private final double value;

    public Operand(double value) {
        this.value = value;
    }

    @Override
    public double oblicz() {
        return value;
    }
}
