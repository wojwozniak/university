package obliczenia.dzialania;

import obliczenia.Wyrazenie;

public class Potęga extends Wyrazenie {
    private final Wyrazenie podstawa;
    private final Wyrazenie wykładnik;

    public Potęga(Wyrazenie podstawa, Wyrazenie wykładnik) {
        this.podstawa = podstawa;
        this.wykładnik = wykładnik;
    }

    @Override
    public double oblicz() {
        return Math.pow(podstawa.oblicz(), wykładnik.oblicz());
    }
}