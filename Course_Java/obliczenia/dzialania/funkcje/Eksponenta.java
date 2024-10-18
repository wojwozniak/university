package obliczenia.dzialania.funkcje;

import obliczenia.Wyrazenie;
import obliczenia.operandy.Liczba;

public class Eksponenta extends Potęga {
    private final double podstawa = Math.E;
    private final Wyrazenie wykładnik;

    public Eksponenta(Wyrazenie wykładnik) {
        super(new Liczba(Math.E), wykładnik);
        this.wykładnik = wykładnik;
    }

    @Override
    public double oblicz() {
        return Math.pow(podstawa, wykładnik.oblicz());
    }

    @Override
    public String toString() {
        return "( E ^ " + wykładnik.toString() + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof Eksponenta))
            return false;
        Eksponenta other = (Eksponenta) obj;
        return wykładnik.equals(other.wykładnik);
    }

    @Override
    public Eksponenta clone() {
        Eksponenta cloned = new Eksponenta(this.wykładnik);
        return cloned;
    }
}
