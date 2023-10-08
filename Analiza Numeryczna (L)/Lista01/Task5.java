import java.util.ArrayList;
import java.util.List;

public class Task5 {

    public static double calculateIn(int n) {
        if (n == 0) {
            double x = 2024.0 / 2023.0;
            double out = Math.log(x);
            return out; // I0 = ln(2024 / 2023)
        }

        double In_1 = calculateIn(n - 1);
        return (1.0 / n) - 2023 * In_1;
    }

    public static double f(double x, int n) {
        return Math.pow(x, n) / (x + 2023);
    }

    public static double calculateInIntegral(int n) {
        double dx = 0.001;
        double suma = 0.0;
        for (double x = 0; x <= 1; x += dx) {
            suma += f(x, n) * dx;
        }
        return suma;
    }

    public static void main(String[] args) {
        List<Double> oddResults = new ArrayList<>(); // Przechowuje wyniki dla I1, I3, ..., I19
        List<Double> evenResults = new ArrayList<>(); // Przechowuje wyniki dla I2, I4, ..., I20
        List<Double> integralResults = new ArrayList<>(); // Przechowuje wyniki dla I1, I2, I3, ..., I20 z całki

        for (int n = 1; n <= 20; ++n) {
            double In_result = calculateIn(n);
            if (n % 2 == 1) {
                oddResults.add(In_result);
            } else {
                evenResults.add(In_result);
            }
            integralResults.add(calculateInIntegral(n));
        }

        System.out.println("Wyniki dla podciągu I1, I3, ..., I19:");
        for (int i = 0; i < oddResults.size(); ++i) {
            System.out.println("I" + (2 * i + 1) + "         = " + oddResults.get(i));
            System.out.println("I" + (2 * i + 1) + " z całki = " + integralResults.get(i));
        }

        System.out.println("Wyniki dla podciągu I2, I4, ..., I20:");
        for (int i = 0; i < evenResults.size(); ++i) {
            System.out.println("I" + (2 * i + 2) + "         = " + evenResults.get(i));
            System.out.println("I" + (2 * i + 2) + " z całki = " + integralResults.get(i));
        }
    }
}