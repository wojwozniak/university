package obliczenia;

public class Wymierna implements Comparable<Wymierna> {
    private int licznik, mianownik;

    // Bezparametrowy konstruktor (tworzący liczbę 0/1 reprezentującą zero)
    public Wymierna() {
        this.licznik = 0;
        this.mianownik = 1;
    }

    // Konstruktor delegatowy z jednym parametrem n (tworzący liczbę całkowitą
    // postaci n/1)
    public Wymierna(int n) {
        this(n, 1);
    }

    // Konstruktor z dwiema wartościami k i m (tworzący liczbę wymierną postaci k/m)
    public Wymierna(int k, int m) {
        if (m == 0) {
            throw new IllegalArgumentException("Mianownik nie może być równy 0!");
        }

        // Przeniesienie znaku minusa do licznika dla liczb ujemnych
        if (m < 0) {
            k = -k;
            m = -m;
        }

        this.licznik = k;
        this.mianownik = m;

        // Skróć ułamek do postaci nieskracalnej
        int nwd = calculateNWD(Math.abs(this.licznik), this.mianownik);
        this.licznik /= nwd;
        this.mianownik /= nwd;
    }

    // Metoda rekurencyjna do obliczenia NWD
    private int calculateNWD(int a, int b) {
        if (b == 0) {
            return a;
        } else {
            return calculateNWD(b, a % b);
        }
    }

    // Getter licznika
    public int getLicznik() {
        return licznik;
    }

    // Getter mianownika
    public int getMianownik() {
        return mianownik;
    }

    // Nadpisanie metody toString()
    @Override
    public String toString() {
        return licznik + "/" + mianownik;
    }

    // Nadpisanie equals()
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }

        Wymierna wymierna = (Wymierna) obj;

        // Dzięki przerabianiu licznika i mianownika w konstruktorze, możemy po prostu
        // porównać licznik i mianownik
        return licznik == wymierna.licznik && mianownik == wymierna.mianownik;
    }

    // Implementacja Comparable
    @Override
    public int compareTo(Wymierna other) {
        // Wymnażamy liczniki przez mianowniki drugiej liczby, a drugiej przez pierwszą
        int prod1 = this.licznik * other.mianownik;
        int prod2 = other.licznik * this.mianownik;

        return Integer.compare(prod1, prod2);
    }

    // Implementacja publicznych statycznych metod z podstawowymi działaniami

    public static Wymierna dodaj(Wymierna a, Wymierna b) {
        int nowyLicznik = a.licznik * b.mianownik + b.licznik * a.mianownik;
        int nowyMianownik = a.mianownik * b.mianownik;

        return new Wymierna(nowyLicznik, nowyMianownik);
    }

    public static Wymierna odejmij(Wymierna a, Wymierna b) {
        int nowyLicznik = a.licznik * b.mianownik - b.licznik * a.mianownik;
        int nowyMianownik = a.mianownik * b.mianownik;

        return new Wymierna(nowyLicznik, nowyMianownik);
    }

    public static Wymierna pomnoz(Wymierna a, Wymierna b) {
        int nowyLicznik = a.licznik * b.licznik;
        int nowyMianownik = a.mianownik * b.mianownik;

        return new Wymierna(nowyLicznik, nowyMianownik);
    }

    public static Wymierna podziel(Wymierna a, Wymierna b) {
        int nowyLicznik = a.licznik * b.mianownik;
        int nowyMianownik = a.mianownik * b.licznik;

        return new Wymierna(nowyLicznik, nowyMianownik);
    }
}