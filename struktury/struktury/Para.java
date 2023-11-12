package struktury;

public class Para implements Cloneable, Comparable<Para> {
    // Klucz niemodyfikowalny
    public final String klucz;
    private double wartość;

    // Para napis klucz, liczba wartość
    public Para(String klucz, double wartość) {
        // Upewniamy się że klucz jest poprawny (niepusty)
        if (klucz != null && !klucz.isEmpty() && klucz.matches("[a-z]+")) {
            this.klucz = klucz;
            this.wartość = wartość;
        } else {
            throw new IllegalArgumentException("Nieprawidłowy klucz");
        }
    }

    // Zdefiniowany setter i getter
    public double getWartość() {
        return wartość;
    }

    public void setWartość(double newValue) {
        this.wartość = newValue;
    }

    // Nadpisana metoda toString()
    @Override
    public String toString() {
        return "Para{klucz='" + klucz + "', wartość=" + wartość + "}";
    }

    // Nadpisana metoda equals() - porównujemy klucze
    @Override
    public boolean equals(Object obj) {
        // Jeśli obiekt jest ten sam to zwracamy true
        if (this == obj)
            return true;
        // Jeśli obiekt jest nullem lub nie jest instancją klasy Para to zwracamy false
        if (obj == null || getClass() != obj.getClass())
            return false;
        // w.p.p. porównujemy klucze
        Para para = (Para) obj;
        return klucz.equals(para.klucz);
    }

    // Nadpisana metoda clone()
    public Para clone() {
        return new Para(this.klucz, this.wartość);
    }

    // Nadpisana metoda compareTo() - porównujemy klucze
    @Override
    public int compareTo(Para p) {
        return this.klucz.compareTo(p.klucz);
    }
}