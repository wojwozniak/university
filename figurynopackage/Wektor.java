public final class Wektor {
    public final double x;
    public final double y;

    public Wektor(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public static Wektor złożWektory(Wektor v1, Wektor v2) {
        double nowyX = v1.x + v2.x;
        double nowyY = v1.y + v2.y;
        return new Wektor(nowyX, nowyY);
    }
}