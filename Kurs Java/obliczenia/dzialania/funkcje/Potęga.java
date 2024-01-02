package obliczenia.dzialania.funkcje;

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

    @Override
    public String toString() {
        return "(" + podstawa.toString() + " ^ " + wykładnik.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Potęga))
            return false;
        Potęga other = (Potęga) obj;
        return podstawa.equals(other.podstawa) && wykładnik.equals(other.wykładnik);
    }
    @Override
    public Potęga clone() {
        Potęga cloned = new Potęga(this.podstawa, this.wykładnik);
        return cloned;
    }
}