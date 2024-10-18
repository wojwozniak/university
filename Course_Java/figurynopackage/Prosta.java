public final class Prosta {
    public final double a;
    public final double b;
    public final double c;

    public Prosta(double a, double b, double c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public static Prosta przesuńProsta(Prosta p, Wektor v) {
        // Zmieniamy współczynnik c w równaniu prostej ax + by + c = 0
        double noweA = p.a;
        double noweB = p.b;
        double noweC = p.c + p.a * v.x + p.b * v.y;
        return new Prosta(noweA, noweB, noweC);
    }

    // Wzory z tablic maturalnych
    
    public static boolean czyRównoległe(Prosta p1, Prosta p2) {
        double a1 = p1.a;
        double b1 = p1.b;
        double a2 = p2.a;
        double b2 = p2.b;
        return a1 * b2 == a2 * b1;
    }

    public static boolean czyProstopadłe(Prosta p1, Prosta p2) {
        double a1 = p1.a;
        double b1 = p1.b;
        double a2 = p2.a;
        double b2 = p2.b;
        return a1 * a2 == -b1 * b2;
    }

    public static Punkt punktPrzecięcia(Prosta p1, Prosta p2) {
        double a1 = p1.a;
        double b1 = p1.b;
        double c1 = p1.c;
        double a2 = p2.a;
        double b2 = p2.b;
        double c2 = p2.c;

        double w = a1 * b2 - a2 * b1;
        double wx = -c1 * b2 + c2 * b1;
        double wy = -a1 * c2 + a2 * c1;

        return new Punkt(wx / w, wy / w);
    }
}