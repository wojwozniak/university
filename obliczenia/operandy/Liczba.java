package obliczenia.operandy;

import obliczenia.Operand;

public class Liczba extends Operand {
    private final double liczba;
    public Liczba(double liczba) {
        super(liczba);
        this.liczba = liczba;
    }

    @Override
    public double oblicz() {
        return liczba;
    }
}