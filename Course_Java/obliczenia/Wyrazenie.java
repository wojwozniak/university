package obliczenia;

public abstract class Wyrazenie implements Obliczalny, Cloneable { 
    public abstract double oblicz();

    @Override
    public Wyrazenie clone() throws CloneNotSupportedException {
        return (Wyrazenie) super.clone();
    }
}