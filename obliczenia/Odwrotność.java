package obliczenia;

public class Odwrotność extends Wyrazenie {
    private final Wyrazenie wyr;

    public Odwrotność(Wyrazenie wyr) {
        this.wyr = wyr;
    }

    @Override
    public double oblicz() {
        return 1 / wyr.oblicz();
    }
}