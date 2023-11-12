package obliczenia;
import struktury.*;


public class Zmienna extends Operand {
    private static final ZbiorTablicowy zbiorZmiennych = new ZbiorTablicowy(10);
    private final String identyfikator;

    public Zmienna(String identyfikator) {
        super(odczytajZmienna(identyfikator));
        this.identyfikator = identyfikator;
    }

    public static void zapiszZmienna(String identyfikator, double wartosc) {
        Para existingPara = zbiorZmiennych.szukaj(identyfikator);
        if (existingPara != null) {
            existingPara.setWartość(wartosc);
        } else {
            Para newPara = new Para(identyfikator, wartosc);
            zbiorZmiennych.wstaw(newPara);
        }
    }

    public static double odczytajZmienna(String identyfikator) {
        Para para = zbiorZmiennych.szukaj(identyfikator);
        if (para != null) {
            return para.getWartość();
        } else {
            throw new IllegalArgumentException("Zmienna '" + identyfikator + "' nie istnieje");
        }
    }

    @Override
    public double oblicz() {
        return odczytajZmienna(identyfikator);
    }

    @Override
    public String toString() {
        return identyfikator + " = " + oblicz();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Zmienna zmienna = (Zmienna) obj;
        return identyfikator.equals(zmienna.identyfikator);
    }
}