package obliczenia;

public class Pi extends Stala {
    private final double wartosc = Math.PI;
    private final String nazwa = "PI";

    public Pi() {
        super(Math.PI, "PI");
    }

    @Override
    public double oblicz() {
        return wartosc;
    }

    @Override
    public String toString() {
        return nazwa;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Stala)) {
            return false;
        }
        Stala other = (Stala) obj;
        return wartosc == other.wartosc;
    }
}
