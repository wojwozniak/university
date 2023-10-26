package figury;

public class Odcinek {
    private Punkt punktA;
    private Punkt punktB;

    public Odcinek(Punkt punktA, Punkt punktB) {
        // Jedyny przypadek, w którym nie można utworzyć odcinka to gdy punkty A i B są
        // takie same
        if (punktA.equals(punktB)) {
            throw new IllegalArgumentException("Punkty A i B są takie same, nie można utworzyć odcinka.");
        }
        this.punktA = punktA;
        this.punktB = punktB;
    }

    public void przesuń(Wektor v) {
        punktA = new Punkt(punktA.x + v.x, punktA.y + v.y);
        punktB = new Punkt(punktB.x + v.x, punktB.y + v.y);
    }

    public void obróć(Punkt p, double kąt) {
        punktA = obróćPunkt(punktA, p, kąt);
        punktB = obróćPunkt(punktB, p, kąt);
    }

    private Punkt obróćPunkt(Punkt p, Punkt obrót, double kąt) {
        // Ze wzorów na obrót punktu wokół innego punktu o zadany kąt
        // (https://pl.wikipedia.org/wiki/Obr%C3%B3t)
        double staryX = p.x;
        double staryY = p.y;
        double nowyX = obrót.x + (staryX - obrót.x) * Math.cos(kąt) - (staryY - obrót.y) * Math.sin(kąt);
        double nowyY = obrót.y + (staryX - obrót.x) * Math.sin(kąt) + (staryY - obrót.y) * Math.cos(kąt);
        return new Punkt(nowyX, nowyY);
    }

    public void odbij(Prosta p) {
        punktA = odbijPunkt(punktA, p);
        punktB = odbijPunkt(punktB, p);
    }

    private Punkt odbijPunkt(Punkt punkt, Prosta prosta) {
        // Ze wzoru na odbicie punktu (x, y) wzgledem prostej w postaci ogólnej ax + by
        // + c = 0
        double a = prosta.a;
        double b = prosta.b;
        double c = prosta.c;
        double x = punkt.x;
        double y = punkt.y;

        double d = (a * a + b * b);
        double nowyX = (b * (b * x - a * y) - a * c) / d;
        double nowyY = (a * (-b * x + a * y) - b * c) / d;

        return new Punkt(nowyX, nowyY);
    }
}