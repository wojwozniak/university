package List02;

import java.util.ArrayList;
import java.util.List;

public final class LiczbyPierwsze {
    public static boolean czyPierwsza(long x) {
        if (x <= 1) {
            return false;
        }
        for (int i = 2; i * i <= x; i++) {
            if (x % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static List<Long> naCzynnikiPierwsze(long x) {
        List<Long> factors = new ArrayList<>();

        if (x < 0) {
            factors.add(-1L);
            x = Math.abs(x);
        }

        if (x == 0 || x == 1) {
            factors.add(x);
            return factors;
        }

        for (long i = 2; i <= x; i++) {
            while (x % i == 0) {
                factors.add(i);
                x /= i;
            }
        }

        return factors;
    }

    public static void main(String[] args) {
        if (args.length == 0) {
            System.err.println("Użycie: java LiczbyPierwsze [liczby całkowite]");
            return;
        }

        for (String arg : args) {
            try {
                long liczba = Long.parseLong(arg);
                List<Long> czynniki = naCzynnikiPierwsze(liczba);

                System.out.print(liczba + " = ");
                for (int i = 0; i < czynniki.size(); i++) {
                    System.out.print(czynniki.get(i));
                    if (i < czynniki.size() - 1) {
                        System.out.print(" * ");
                    }
                }
                System.out.println();
            } catch (NumberFormatException e) {
                System.err.println("Błąd: " + arg + " nie jest liczbą całkowitą.");
            }
        }
    }
}